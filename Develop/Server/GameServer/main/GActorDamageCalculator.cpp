#include "stdafx.h"
#include "GActorDamageCalculator.h"
#include "GEntityActor.h"
#include "GCombatCalculator.h"
#include "GCommandCenter.h"
#include "GBuffInfo.h"
#include "GServer.h"
#include "GTestSystem.h"
#include "GDefenseFactorCalculator.h"
#include "GAttackDamageCalculator.h"
#include "GConst.h"
#include "GNPCBParts.h"
#include "GCriticalCalculator.h"
#include "GBuff.h"

GCombatTurnResult GActorDamageCalculator::CalcDamage( const Desc& desc, float* pfoutMotionFactor )
{
	GEntityActor* pAttacker = desc.pAttacker;
	GEntityActor* pVictim = desc.pVictim;
	GTalentInfo* pTalentInfo = desc.pTalentInfo;
	GDamageRangedInfo DamageInfo = desc.DamageInfo;
	GHealRangedInfo HealInfo = desc.HealInfo; 
	GRiposte& victimRiposte = pVictim->m_Riposte;
	GCombatTurnResult ret(0, 0, false);

	VALID_RET(pAttacker, ret);
	VALID_RET(pVictim, ret);
	VALID_RET(pTalentInfo, ret);

	// BPart ���� ����
	if (pVictim->IsNPC())
	{
		GEntityNPC* pVictimNPC = ToEntityNPC(pVictim);
		GActorMeshInfo* pMeshInfo = pVictim->GetMeshInfo();
		if (pMeshInfo &&
			desc.nHitCapGroup != INVALID_HITCAPSULEGROUP_ID &&
			desc.nHitCapIndex >= 0 &&
			desc.nHitCapGroup >= 0 &&
			pMeshInfo->HasHitGroup(desc.nHitCapGroup)) 
		{
			const CSHitGroup& CapsuleGroup = pMeshInfo->GetHitGroup(desc.nHitCapGroup);
			if (desc.nHitCapIndex < (int)CapsuleGroup.m_vecHitCapsules.size())
			{
				const CSHitCapsule& hitCapsule = CapsuleGroup.m_vecHitCapsules[desc.nHitCapIndex];

				// �̹� �μ��� BPart�� ����
				GNPCBParts* pBPart = pVictimNPC->GetNPCBParts();
				if (pBPart &&
					!pBPart->IsBroken(hitCapsule.nLinkedBPart))
				{
					switch (hitCapsule.nLinkedBPart)
					{
					case 1: SetBitSet(ret.nResultFlags, CTR_HIT_BPART1); break;
					case 2: SetBitSet(ret.nResultFlags, CTR_HIT_BPART2); break;
					case 3: SetBitSet(ret.nResultFlags, CTR_HIT_BPART3); break;
					case 4: SetBitSet(ret.nResultFlags, CTR_HIT_BPART4); break;
					}
				}
			}
		}
	}
	

	// ȸ�� ���� --------------
	/*
	if (gsys.pCombatCalculator->CheckMiss(pAttacker, pVictim, pTalentInfo) == true)
	{
		SetBitSet(ret.nResultFlags, CTR_MISS);

		if (IsRunForTest())
		{
			if (gsys.pServer->GetServerInfo().bDamageTest)
			{
				wchar_t text[256];

				swprintf_s(text, L"[������]");
				gsys.pCommandCenter->NetDebugString(L"damage", 0, text);
			}
		}

		ret.nDamage = 0;
		ret.nHealAmount = 0;
		return ret;
	}
	*/

	// �ǹ޾�ġ�� ���� --------
	if (victimRiposte.HasRiposte(pTalentInfo->m_nCategory))
	{
		SetBitSet(ret.nResultFlags,CTR_RIPOSTE);
		
		// ��ȹ����(pyo): RIPOSTE�� ����� �Բ� �ڱ��ڽŵ� �µ��� ������ => GEntityActor::doTryHit ���� ó����
		// float fRiposteRate = victimRiposte.GetRiposteRate(pTalentInfo->m_nCategory);
		//ret.nDamage = (int)(gsys.pCombatCalculator->CalcDamage(pAttacker, pVictim, pTalentInfo, false, 1.0f, DamageInfo, pfoutMotionFactor) * fRiposteRate);

		if (IsRunForTest())
		{
			if (gsys.pServer->GetServerInfo().bDamageTest)
			{
				wchar_t text[256];

				swprintf_s(text, L"[�ǹ޾�ġ��]");
				gsys.pCommandCenter->NetDebugString(L"damage", 0, text);
			}
		}

		// ��ȹ����(pyo): RIPOSTE�� ����� �Բ� �ڱ��ڽŵ� �µ��� ������
		//SetBitIfDead(ret, pVictim);
		//return ret;
	}



	// ���� ���� --------------
	float fResistRatePercent = 100.0f;

	if (pTalentInfo->m_nCategory == TC_MAGIC &&
		gsys.pCombatCalculator->CheckResist(fResistRatePercent, pAttacker, pVictim, pTalentInfo->m_Resist) == true)
	{
		if (pTalentInfo->m_Resist.m_nMethod == TRM_BINARY)
		{
			SetBitSet(ret.nResultFlags,CTR_RESIST_PERFECT);

			if (IsRunForTest())
			{
				if (gsys.pServer->GetServerInfo().bDamageTest)
				{
					wchar_t text[256];

					swprintf_s(text, L"[��������]");
					gsys.pCommandCenter->NetDebugString(L"damage", 0, text);
				}
			}

			SetBitIfDead(ret, pVictim);

			return ret;
		}
		else 
		{
			SetBitSet(ret.nResultFlags,CTR_RESIST_PARTIAL);
		}
	}
	float fResistFactor = GMath::PercentToFactor(fResistRatePercent);

	// ġ��Ÿ ���� ------------
	bool bCritical = false;
	if (gsys.pCombatCalculator->CheckCritical(pAttacker, pVictim, pTalentInfo) == true)
	{
		SetBitSet(ret.nResultFlags,CTR_CRITICAL);
		bCritical = true;
	}

	bool bBackHit = false;
	if (pTalentInfo->IsPhysicalAttack() && pVictim->IsBack(pAttacker->GetPos()))
	{
		bBackHit = true;
	}

	// ������ ���(���� ������, ���潺 ����, ���׿� ���� ������ ����ġ) --------
	ret.nDamage = gsys.pCombatCalculator->CalcDamage(pAttacker, pVictim, pTalentInfo, bCritical, fResistFactor, DamageInfo, bBackHit, pfoutMotionFactor);
	ret.nHealAmount = gsys.pCombatCalculator->CalcHealAmount(pAttacker, pVictim, pTalentInfo, HealInfo);

	if (pTalentInfo->m_nUsableType == TUT_HEAL)
	{
		ret.nHealAmount += ret.nDamage;
		ret.nDamage = 0;
	}


	if (ret.nDamage == 0 && pTalentInfo->m_WeaponApplyRate.fApplyRate < 0.001f)
	{
		SetBitSet(ret.nResultFlags, CTR_ZERO_TALENT_DAMAGE);
	}

	// ��� ������ ------------
	if (pTalentInfo->m_Drain.IsDrainTalent())
	{
		SetBitSet(ret.nResultFlags, CTR_DRAIN);
	}

	ret.bBackHit = bBackHit;

	SetBitIfDead(ret, pVictim);

	gsys.pTestSystem->RouteDamageDebug(pAttacker, pVictim, pTalentInfo, bCritical, DamageInfo, ret, fResistRatePercent);

	return ret;

}

GCombatTurnResult GActorDamageCalculator::CalcBuffDamage(GEntityActor* pAttacker, GEntityActor* pVictim, const GBuff* pBuff )
{
	GCombatTurnResult ret(0, 0);
	VALID_RET(pVictim, ret);

	const GBuffInfo* pBuffInfo = pBuff->GetInfo();
	VALID_RET(pBuffInfo, ret);

	// TODO: �̷ο� ������ �������� ����

	// ���� ���� --------------
	float fResistRatePercent = 100.0f;

	if (gsys.pCombatCalculator->CheckResist(fResistRatePercent, pAttacker, pVictim, pBuffInfo->m_Resist) == true)
	{
		if (pBuffInfo->m_Resist.m_nMethod == TRM_BINARY)
		{
			SetBitSet(ret.nResultFlags,CTR_RESIST_PERFECT);

			if (IsRunForTest())
			{
				if (gsys.pServer->GetServerInfo().bDamageTest)
				{
					wchar_t text[256];

					swprintf_s(text, L"[����_��������]");
					gsys.pCommandCenter->NetDebugString(L"damage", 0, text);
				}
			}

			SetBitIfDead(ret, pVictim);

			return ret;
		}
		else 
		{
			SetBitSet(ret.nResultFlags,CTR_RESIST_PARTIAL);
		}
	}
	float fResistFactor = GMath::PercentToFactor(fResistRatePercent);

	// �Ƹӿ� ���� ������ ����ġ
	/*
	GDefenseFactorCalculator defenseFactorCalc;
	float fDefenseFactor = defenseFactorCalc.CalcDefenseFactor_ForBuff(pAttacker, pVictim, pBuffInfo);
	GAttackDamageCalculator attackDadmageCalc;
	float fTalentFactor1 = attackDadmageCalc.CalcTalentFactor1(pAttacker, pBuffInfo->m_nDamageAttrib, pBuffInfo->m_WeaponApplyRate.fApplyRate);

	float fSpellPower = pAttacker ? pAttacker->GetSpellPower() : 1.0f;
	*/

	const GBuffUser& User = pBuff->GetUser();

	bool bCritical = User.CheckCritical();//gsys.pCombatCalculator->CheckBuffCritical(pAttacker, pVictim, pBuffInfo);
	if (bCritical)
	{
		SetBitSet(ret.nResultFlags, CTR_CRITICAL);
	}

	// ������ ���(���� ������, ���潺 ����, ���׿� ���� ������ ����ġ) --------
	/*
	float fDamage = gsys.pAttackDamageCalculator->CalcBuffAttackDamage(pAttacker, pVictim, pBuffInfo, bCritical, GDamageRangedInfo(pBuffInfo->m_nMaxDamage, pBuffInfo->m_nMinDamage));
	int nHealAmount = int(GMath::RandomNumber(pBuffInfo->m_nMinHeal, pBuffInfo->m_nMaxHeal) * fSpellPower);

	ret.nDamage = GMath::TruncateToInt(max(fDamage * fDefenseFactor * fResistFactor * fSpellPower * fTalentFactor1, 0));
	ret.nHealAmount = nHealAmount;

	if (pBuffInfo->m_nUsableType == TUT_HEAL)
	{
		ret.nHealAmount += ret.nDamage;
		ret.nDamage = 0;
	}
	*/
	if (pBuffInfo->m_nUsableType == TUT_HEAL)
	{
		ret.nHealAmount = GMath::TruncateToInt(User.CalcHeal(bCritical) * fResistFactor);
		ret.nDamage = GMath::TruncateToInt(GMath::RandomNumber(pBuffInfo->m_nMinDamage, pBuffInfo->m_nMaxDamage) * fResistFactor);
	}
	else
	{
		ret.nDamage = GMath::TruncateToInt(User.CalcDamage(bCritical) * fResistFactor);
		ret.nHealAmount = GMath::TruncateToInt(GMath::RandomNumber(pBuffInfo->m_nMinHeal, pBuffInfo->m_nMaxHeal) * fResistFactor);
	}

	if (pBuffInfo->m_fDamagePercentHP > 0.f)
		ret.nDamage += int((pBuffInfo->m_fDamagePercentHP / 100.f) * pVictim->GetMaxHP());

	if (pBuffInfo->m_fRestorePercentHP > 0.f)
		ret.nHealAmount += int((pBuffInfo->m_fRestorePercentHP / 100.f) * pVictim->GetMaxHP());

	if (pBuffInfo->m_fRestorePercentEN > 0.f)
		ret.nRestoreENAmount += int((pBuffInfo->m_fRestorePercentEN / 100.f) * pVictim->GetMaxEN());

	if (ret.nDamage == 0 && pBuffInfo->m_WeaponApplyRate.fApplyRate < 0.001f)
	{
		SetBitSet(ret.nResultFlags, CTR_ZERO_TALENT_DAMAGE);
	}

	SetBitIfDead(ret, pVictim);

	return ret;

}

void GActorDamageCalculator::SetBitIfDead( GCombatTurnResult& outResult, GEntityActor* pVictim )
{
	if (pVictim->GetHP() <= outResult.nDamage)
	{
		SetBitSet(outResult.nResultFlags, CTR_DEAD);
	}
}