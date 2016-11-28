#include "StdAfx.h"
#include "GBuffInstantApplier.h"
#include "GBuff.h"
#include "GEntityNPC.h"
#include "GEntityPlayer.h"
#include "GModuleBuff.h"
#include "GHateTable.h"
#include "CCommandTable.h"
#include "GCommand.h"
#include "GBuffInfo.h"
#include "GGlobal.h"
#include "GTalentInfoMgr.h"
#include "GTalentHitRouter.h"
#include "GActorHateTracker.h"
#include "GNPCLoot.h"
#include "GBuffRequirement.h"
#include "GTalentRouter.h"
#include "GCombatCalculator.h"
#include "GCriticalCalculator.h"
#include "GBuffEntity.h"

GBuffInstantApplier::GBuffInstantApplier( GBuff* pOwner )
: m_pOwner(pOwner)
{
}

GBuffInstantApplier::~GBuffInstantApplier(void)
{
}

bool GBuffInstantApplier::OnEvent(TALENT_CONDITION nTiming)
{
	return ApplyEffects();
}

bool GBuffInstantApplier::ApplyEffects()
{
	GBuffInfo* pBuffInfo = m_pOwner->GetInfo();

	GEntitySync* pOwnerEntity = m_pOwner->GetOwner();
	GEntityActor* pOwnerActor = NULL;
	MUID uidUser;

	if (pOwnerEntity->IsActor())
	{
		pOwnerActor = ToEntityActor(pOwnerEntity);
		uidUser = m_pOwner->GetUserUID();
	}
	else if (pOwnerEntity->IsBuffEntity())
	{
		pOwnerActor = static_cast<GBuffEntity*>(pOwnerEntity)->GetOwner();
		uidUser = pOwnerActor->GetUID();
	}

	if (pOwnerActor == NULL)
		return true;

	// requirement buff has been processed in GModuleBuff::GainBuffForced().
	/*
	GBuffRequirement buff_requirement;
	if (!buff_requirement.ProcessRequirement(pOwnerActor, pBuffInfo->m_RequireBuff))
		return true; // ���� �ʿ����� ������
		*/
		
	MUID uidLastHitOrHittedEnemy = pOwnerActor->GetLastHitOrHittedEnemy();
	GEntityActor* pLastHitOrHittedEnemy = pOwnerActor->FindActor(uidLastHitOrHittedEnemy);

	GEffectTargetSelector m_EffecteeTargetSelector;
	GEffectTargetSelector::Desc desc(pBuffInfo->m_EffectInfo);
	desc.pSelf = pOwnerEntity;
	desc.pTarget = pLastHitOrHittedEnemy;
	desc.pCaster = pOwnerActor->FindActor(uidUser);
	vector<GEntityActor*> vecEffecteeTarget = 
		m_EffecteeTargetSelector.Select(desc);

	for each (GEntityActor* pEffecteeTarget in vecEffecteeTarget)
	{
		ApplySingleEffect(pEffecteeTarget, uidUser);
	}	

	return !pOwnerActor->IsDead();
}

void GBuffInstantApplier::ApplySingleEffect(GEntityActor* pEffecteeTarget, MUID uidUser)
{
	VALID(pEffecteeTarget);
	VALID(m_pOwner);
	GBuffInfo* pBuffInfo = m_pOwner->GetInfo();
	VALID(pBuffInfo);

	// pEffecteeTarget->GetModuleBuff()->EnableActiveExtraAttrib(m_pOwner);
	GEntityActor* pUser = pEffecteeTarget->FindActor(uidUser);

	
	int nBeforeHP = pEffecteeTarget->GetHP();

	GModEffector				m_ModEffector;
	CSInstantModifier modifier = pBuffInfo->m_InstantModifier;
	for (int i=0; i<m_pOwner->GetStackCount(); ++i)
	{
		m_ModEffector.ApplyInstantModifier(pEffecteeTarget, modifier);	
	}
	pEffecteeTarget->GetModuleBuff()->EnableActiveExtraAttrib(m_pOwner);

	bool bCritical = pUser && pEffecteeTarget && m_pOwner->GetUser().CheckCritical();//gsys.pCombatCalculator->CheckBuffCritical(pUser, pEffecteeTarget, pBuffInfo);

	if (!pBuffInfo->IsEnchant())
	{
		RouteGainInstantEffect(pEffecteeTarget, m_pOwner, bCritical);
	}
	
	// Modifier �������� HP�� ȸ���Ǿ�����, Hate ���̺� ����
	int nHealHPAmount = pEffecteeTarget->GetHP() - nBeforeHP;
	if (nHealHPAmount > 0)
	{
		if (bCritical)
		{
			GCriticalCalculator criticalCalculator;
			float fCriticalDamageFactor = criticalCalculator.CalcCriticalDamageFactor(pUser, pBuffInfo->m_nDamageAttrib, pBuffInfo->m_nDamageType, ST_NONE);

			nHealHPAmount = int(nHealHPAmount * fCriticalDamageFactor);
		}

		BuffHealed(pEffecteeTarget, pBuffInfo, nHealHPAmount);
	}


	if (IsNeedEffect())
	{
		GainBuffDamageAndHeal(pEffecteeTarget, m_pOwner, uidUser, pUser);
	}

	// �߰� �ŷ�Ʈ ���
	if (pBuffInfo->HasUseTalent())
	{
		GTalentInfo* pTalentInfo = gmgr.pTalentInfoMgr->Find(pBuffInfo->m_nTalentID);
		if (pTalentInfo)
		{
			GTalentEffector::Info info;
			info.pTalentInfo = pTalentInfo;
			info.pUser = pEffecteeTarget;
			info.pTarget = pEffecteeTarget;
			info.nTalentCondition = TC_USE_TALENT;
			GTalentEffector effector;
			effector.ApplyTalent(info);
			//pEffecteeTarget->doUseTalent(pTalentInfo);
		}
	}

	// ExtraActive ó��
	switch(pBuffInfo->m_nActiveExtraAttrib)
	{
	case BUFAEA_DISMOUNT:
		pEffecteeTarget->GetModuleBuff()->DismountRideBuff();
		break;
	}

	// ����Ʈ ����
	if (pEffecteeTarget->IsNPC() &&
		pUser) // Ÿ���� ��ȿ��
	{
		GEntityNPC* pTargetNPC = ToEntityNPC(pEffecteeTarget);
		DCHECK(pTargetNPC);
		pTargetNPC->GetHateTable().AddPoint_EnemyApplyEffect(pUser, pBuffInfo->m_nHateAdj);
	}
}

void GBuffInstantApplier::GainBuffDamageAndHeal(GEntityActor* pEffecteeTarget, GBuff* pBuff, MUID uidUser, GEntityActor* pUser )
{
	VALID(pEffecteeTarget);
	VALID(pBuff);
	GBuffInfo* pBuffInfo = pBuff->GetInfo();
	VALID(pBuffInfo);

	GActorDamageCalculator		m_DamageCalculator;
	GCombatTurnResult combat_result = m_DamageCalculator.CalcBuffDamage(pUser, pEffecteeTarget, pBuff);
	int nDamage = combat_result.nDamage * m_pOwner->GetStackCount();
	int nHealAmount = combat_result.nHealAmount * m_pOwner->GetStackCount();
	int nRestoreENAmount = combat_result.nRestoreENAmount * m_pOwner->GetStackCount();
	int nRestoreSTAAmount = combat_result.nRestoreSTAAmount * m_pOwner->GetStackCount();
	bool bCriticalHit = !!CheckBitSet(combat_result.nResultFlags, CTR_CRITICAL);
	DAMAGE_ATTRIB nDamageAttrib = pBuffInfo->m_nDamageAttrib;

	if (!pEffecteeTarget->IsHittable(pBuffInfo)) 
		return;

	// �鿪 ó��
	//if (pBuff->GetInfo()->m_nType == BUFT_DEBUFF && // ������� ���������� �õ�
	//	pEffecteeTarget->HandleImmune(NULL, pBuffInfo))
	//	return;
	if (pBuffInfo->HasDamage() && // ������ �ִ� ������ ���� ����
		pEffecteeTarget->HandleImmune(NULL, pBuffInfo))
		return;

	// ���� ó��
	if (nDamage > 0)
	{
		pEffecteeTarget->doDamage(uidUser, nDamageAttrib, nDamage, EST_BUFF, pBuffInfo->m_nID);
	}

	// ������� ó��
	GMFApplyArgs mfApplyArgs(&pBuffInfo->m_MotionFactorGroup, pUser);
	GMFApplyReturnValue mfApplyRet = pEffecteeTarget->ApplyMotionFactor(mfApplyArgs);

	// ���� �ǰ� �̺�Ʈ ȣ��
	pEffecteeTarget->OnBuffHit(uidUser, pBuffInfo);

	// ��Ʈ ��Ŷ ����
	if (nDamage > 0 ||
		mfApplyRet.nMotionFactor != MF_FAKE_BEATEN && mfApplyRet.nMotionFactor != MF_NONE)
	{
		GTalentHitRouter talentHitRouter;
		talentHitRouter.RouteBuffHit(pEffecteeTarget, pBuffInfo->m_nID, nDamage, mfApplyRet.nMotionFactor, mfApplyRet.nWeight, combat_result.nResultFlags);
	}

	GTalentRouter talentRouter;

	if (nHealAmount > 0)
	{
		pEffecteeTarget->doHeal(pUser?pUser->GetUID():MUID::Invalid(), 
								nHealAmount);
		BuffHealed(pEffecteeTarget, pBuffInfo, nHealAmount);

		talentRouter.RouteBuffHeal(pUser, pEffecteeTarget, pBuffInfo->m_nID, nHealAmount, bCriticalHit);
	}

	if (nRestoreENAmount > 0)
	{
		pEffecteeTarget->SetEN(pEffecteeTarget->GetEN() + nRestoreENAmount);
		talentRouter.RouteBuffRestoreEN(pUser, pEffecteeTarget, pBuffInfo->m_nID, nRestoreENAmount);
	}

	if (nRestoreSTAAmount > 0)
	{
		pEffecteeTarget->SetSTA(pEffecteeTarget->GetSTA() + nRestoreSTAAmount);
		talentRouter.RouteBuffRestoreSTA(pUser, pEffecteeTarget, pBuffInfo->m_nID, nRestoreSTAAmount);
	}

	// �̵� ó�� �и�
	pEffecteeTarget->DoScheduleMove();

	// ���� ó��
	if (pEffecteeTarget->IsDie()) 
	{
		pEffecteeTarget->SetKiller(pBuff->GetUserUID());
		if (pEffecteeTarget->IsPlayer())
		{
			ToEntityPlayer(pEffecteeTarget)->SetKillTalent(pBuff->GetUserTalentInfo());
		}

		pEffecteeTarget->doDie();
	}
}

void GBuffInstantApplier::BuffHealed(GEntityActor* pEffecteeTarget, GBuffInfo* pBuffInfo, int nHealHPAmount)
{
	pEffecteeTarget->GetActorHateTracker().AddHate_RecoverHP(nHealHPAmount, pBuffInfo->m_fHateFactor);
}

bool GBuffInstantApplier::IsNeedEffect()
{
	VALID_RET(m_pOwner, false);
	GBuffInfo* pBuffInfo = m_pOwner->GetInfo();
	VALID_RET(pBuffInfo, false);
	if (pBuffInfo->HasDamage())			return true;
	if (pBuffInfo->IsModified_MF())		return true;
	if (pBuffInfo->HasHealEffect())			return true;
	if (pBuffInfo->HasRestoreEffect())		return true;
	return false;
}

void GBuffInstantApplier::RouteGainInstantEffect(GEntityActor* pActor, GBuff* pBuff, bool bCriticalHit)
{
	VALID(pActor);
	VALID(pBuff);
	GBuffInfo* pBuffInfo = pBuff->GetInfo();
	VALID(pBuffInfo);		
	if (!pBuffInfo->IsExistModValue())	return;

	MCommand* pNewCommand = MakeNewCommand(MC_BUFF_INSTANT_EFFECT_GAIN, 3, 
		NEW_USHORT(pActor->GetUIID()), 
		NEW_INT(pBuffInfo->m_nID),
		NEW_BOOL(bCriticalHit));

	pActor->RouteToThisCell(pNewCommand);
}