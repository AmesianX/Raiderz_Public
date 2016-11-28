#pragma once

#include "GCalculator.h"
#include "GTalentInfo.h"
#include "GEntityPlayer.h"
#include "GEntityNPC.h"
#include "GBuffInfo.h"

/// ũ��Ƽ�� ��� ����
/// Factor�� 1 == 1, Percent�� 100(%) == 1
class GCriticalCalculator : public MTestMemPool<GCriticalCalculator>
{
protected:
	virtual int _GetSpecializationRankForDamageAttrib(GEntityPlayer* pPlayer, DAMAGE_ATTRIB nDamageAttrib);

	// ġ��Ÿ��
	virtual float CalcActorCriticalPercent(const GEntityActor* pActor, TALENT_DAMAGE_TYPE nDamageType, TALENT_SKILL_TYPE nSkillType);	// ���̽� ���� ũ���� ���
	virtual float _CalcPlayerCriticalPercent( TALENT_DAMAGE_TYPE nDamageType, const GEntityPlayer* pPlayer );	// PC�� ĳ���� ġ��Ÿ ��
	virtual float _CalcNPCCriticalPercent( TALENT_SKILL_TYPE nSkillType, GNPCInfo* pNPCInfo );

	virtual float CalcTalentPercent(GEntityActor* pAttacker, GEntityActor* pVictim, TALENT_DAMAGE_TYPE nDamageType, float fCriticalApplyRate = 1.f);
	virtual float CalcDamageAttribPercent(GEntityPlayer* pPlayer, DAMAGE_ATTRIB nDamageAttrib);
	virtual float _CalcDamageAttribPercent( DAMAGE_ATTRIB nDamageAttrib, int nSpecializationRank );

	// ������ ����
	virtual float CalcBuffDamagePercent(GEntityActor* pActor, TALENT_DAMAGE_TYPE nDamageType, TALENT_SKILL_TYPE nSkillType);
	virtual int CalcDamageBonusPercent(GEntityPlayer* pPlayer, DAMAGE_ATTRIB nDamageAttrib);
	virtual int _CalcDamageBonusPercent(DAMAGE_ATTRIB nDamageAttrib, int nSpecializationRank);

public:
	virtual float CalcCriticalPercent(GEntityActor* pAttacker, GEntityActor* pVictim, DAMAGE_ATTRIB nDamageAttrib, TALENT_DAMAGE_TYPE nDamageType, TALENT_SKILL_TYPE nSkillType, float fCriticalApplyRate = 1.f);
	virtual float CalcCriticalDamageFactor(GEntityActor* pAttacker, DAMAGE_ATTRIB nDamageAttrib, TALENT_DAMAGE_TYPE nDamageType, TALENT_SKILL_TYPE nSkillType);
};

