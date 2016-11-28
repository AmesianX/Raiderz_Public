#pragma once

#include "CSCommonLib.h"
#include "CSModifier.h"
#include "CSTalentInfo.h"
#include "MTypes.h"
#include "MXml.h"
#include <string>
#include "MTstring.h"
#include "CSPalette.h"

using namespace::std;

enum BUFF_TYPE
{
	BUFT_NONE=0,
	BUFT_BUFF,
	BUFT_DEBUFF,
	BUFT_AURA,
	BUFT_AURA_EFFECT_BUFF,
	BUFT_AURA_EFFECT_DEBUFF,
	BUFT_ENCHANT,
	BUFT_QUEST,
	BUFT_MAX,
};

static const TCHAR* BUFF_TYPE_STR[] = 
{
	_T("NONE"),
	_T("BUFF"),
	_T("DEBUFF"),
	_T("AURA"),
	_T("AURA_EFFECT_BUFF"),
	_T("AURA_EFFECT_DEBUFF"),
	_T("ENCHANT"),
	_T("QUEST"),
};

enum BUFF_PASSIVE_EXTRA_ATTRIB_
{
	BUFPEA_NONE = 0,
	BUFPEA_DISABLE_TALENTS,
	BUFPEA_DISABLE_TALENT_MELEE,
	BUFPEA_DISABLE_TALENT_RANGE,
	BUFPEA_DISABLE_TALENT_MAGIC,
	BUFPEA_INVINCIBILITY,
	BUFPEA_ROOT,
	BUFPEA_SLEEP,
	BUFPEA_INVISIBILITYTONPC,
	BUFPEA_INVISIBILITY,
	BUFPEA_ABSOLUTE_GUARD,
	BUFPEA_DISABLE_QUESTPVP_DROP,
	BUFPEA_RIDE,
	BUFPEA_AVOID,
	BUFPEA_MAX
};

static const TCHAR* BUFF_PASSIVE_EXTRA_ATTRIB_STR[] = 
{
	_T("NONE"),
	_T("DISABLE_TALENTS"),
	_T("DISABLE_TALENT_MELEE"),
	_T("DISABLE_TALENT_RANGE"),
	_T("DISABLE_TALENT_MAGIC"),
	_T("INVINCIBILITY"),
	_T("ROOT"),
	_T("SLEEP"),
	_T("INVISIBILITYTONPC"),
	_T("INVISIBILITY"),
	_T("ABSOLUTE_GUARD"),
	_T("DISABLE_QUESTPVP_DROP"),
	_T("RIDE"),
	_T("AVOID")
};

enum BUFF_ACTIVE_EXTRA_ATTRIB_
{
	BUFAEA_NONE = 0,
	BUFAEA_DIE,
	BUFAEA_DESPAWN_ONCE,
	BUFAEA_DESPAWN_ETERNAL,
	BUFAEA_DISMOUNT,
	BUFAEA_DISPEL_BUFF,
	BUFAEA_ADJUST_COOLTIME,
	BUFAEA_MAX
};

static const TCHAR* BUFF_ACTIVE_EXTRA_ATTRIB_STR[] = 
{
	_T("NONE"),
	_T("DIE"),
	_T("DESPAWN_ONCE"),
	_T("DESPAWN_ETERNAL"),
	_T("DISMOUNT"),
	_T("DISPEL_BUFF"),
	_T("ADJUST_COOLTIME"),
};

struct BUFF_ACTIVE_EXTRA_PARAM
{
#define MAX_ACTIVE_EXTRA_PARAM_VALUE_COUNT	2
	int nValue[MAX_ACTIVE_EXTRA_PARAM_VALUE_COUNT];

	BUFF_ACTIVE_EXTRA_PARAM() {
		for (int i = 0; i < MAX_ACTIVE_EXTRA_PARAM_VALUE_COUNT; i++)
			nValue[i] = 0;
	}
};

enum BUFF_DISPEL_TYPE
{
	BDT_ROOT,
	BDT_SLOW,
	BDT_BLEEDING,
	BDT_FRAGILE,
	BDT_SLEEP,
	BDT_SILENCE,
	BDT_MAGIC,
	BDT_HASTE,
	BDT_FREEZE,
	BDT_HEAL,
	BDT_BRUN,
	BDT_WEAKEN,
	BDT_SHADOWART,
	BDT_DISEASE,
	BDT_POISON,
	BDT_WEB,
	BDT_RAGE,
	BDT_FEAR,
	BDT_BPARTS,
	BDT_FIRE,
	BDT_ICE,
	BDT_MAX,
};

static const TCHAR* BUFF_DISPEL_TYPE_STR[] =
{
	_T("root"),
	_T("slow"),
	_T("bleeding"),
	_T("fragile"),
	_T("sleep"),
	_T("silence"),
	_T("magic"),
	_T("haste"),
	_T("freeze"),
	_T("heal"),
	_T("brun"),
	_T("weaken"),
	_T("shadowart"),
	_T("disease"),
	_T("poison"),
	_T("web"),
	_T("rage"),
	_T("fear"),
	_T("bparts"),
	_T("fire"),
	_T("ice"),
};

enum BUFF_STACK_TYPE
{
	BUFFSTACK_NONE,	// ��ø���� ����
	BUFFSTACK_STACK, // ��ø�ǰ� �� �������� �ٸ� �����ֱ⸦ ����
	BUFFSTACK_STACK_UPDATE, // ��ø�ǰ� ���� ������ duration/period �ð� �ʱ�ȭ
	BUFFSTACK_MAX,
};

static const TCHAR* BUFF_STACK_TYPE_STR[] = 
{
	_T("none"),
	_T("stack"),
	_T("stack_n_update"),
};




class CSCOMMON_API CSBuffInfo
{
public:
	int						m_nID;						// id (���)
	BUFF_TYPE				m_nType;
	TALENT_DAMAGE_TYPE		m_nDamageType;
	TALENT_USABLE_TYPE		m_nUsableType;
	set<BUFF_DISPEL_TYPE>	m_setDispelType;
	BUFF_STACK_TYPE			m_nStackType;				// ����Ÿ��
	tstring					m_strName;					// ���� �̸�(���)
	int						m_nStackMaxCount;			// ���� �ִ� ����

	int						m_nBuffLine;

	bool					m_bUseChangeEquipmentSlot;
	int						m_nEquipItemIDs[ITEMSLOT_MAX];				// ����� ��� ������

	bool					m_bUseChangePalette;		// �ȷ�Ʈ �������� ����
	int						m_arrPalettes[PALETTESLOT_MAX]; // ����� �ȷ�Ʈ
	
	int						m_nStackSlot;				// (���)
	int						m_nStackPower;				// (���)

	CSTalentWeaponApplyRate	m_WeaponApplyRate;			// ���� ����� ���� (1 = 100%)
	DAMAGE_ATTRIB			m_nDamageAttrib;			// ������ ���� (����)
	int						m_nMinDamage;				// �ּ� ������
	int						m_nMaxDamage;				// �ִ� ������
	int						m_nMinHeal;					// �ּ� ȸ����
	int						m_nMaxHeal;					// �ִ� ȸ����
	BUFF_PASSIVE_EXTRA_ATTRIB_		m_nPassiveExtraAttrib;
	BUFF_PASSIVE_EXTRA_ATTRIB_		m_nPassiveExtraAttrib2;
	float							m_fPassiveExtraAttribValue;
	float							m_fPassiveExtraAttribValue2;
	BUFF_ACTIVE_EXTRA_ATTRIB_		m_nActiveExtraAttrib;
	vector<BUFF_ACTIVE_EXTRA_PARAM>	m_vecActiveExtraParam1;
	vector<BUFF_ACTIVE_EXTRA_PARAM>	m_vecActiveExtraParam2;

	CSInstantModifier		m_InstantModifier;
	CSActorModifier			m_ActorModifier;
	CSPlayerModifier		m_PlayerModifier;
	
	tstring					m_strEffectName;			// ����Ʈ �̸�
	tstring					m_strBoneName;				// �� �̸�

	tstring					m_strUseAniName;			// �ִϸ��̼� �̸�
	tstring					m_strAniPostfix;			// �ִϸ��̼� ���̻�

	CSRiposte				m_Riposte;		// Riposte ���� ����
	GTalentResist			m_Resist;

	bool					m_bCancelable;			// ����� ���� ������ ����� ȿ���� ������� ����	

	RequireBuff				m_RequireBuff;

	float					m_fDamagePercentHP;
	float					m_fRestorePercentHP;
	float					m_fRestorePercentEN;

	int						m_nIncludePassiveTalent;	// This buff requires this passive talent to be activated.
	int						m_nRideNPCID;

	bool					m_bReleaseOnDead;
	bool					m_bFreezeFrame;
	
	struct TriggeredBuff
	{
		// �� ȿ���� ����� ������ UID
		int				 nBuffID;	
		// �ߵ� ����
		TALENT_CONDITION nTiming;	
		// ȿ�� ����
		CSEffectInfo	 infoEffect;
		// �ߵ� Ȯ��
		float	    	 fRate;

		TriggeredBuff();
	} m_TriggeredBuff;

	virtual void CopyAll(CSBuffInfo* pTarget) = 0;
protected:
	bool			IsMatchPassiveExtraAttrib(BUFF_PASSIVE_EXTRA_ATTRIB_ nAttrib) const;
	bool			IsMatchActiveExtraAttrib(BUFF_ACTIVE_EXTRA_ATTRIB_ nAttrib) const;
public:
	CSBuffInfo();

	bool IsStackable() const;
	bool HasDamage() const;
	bool IsMagicDamage() const;
	bool HasHealEffect() const;
	bool HasRestoreEffect() const;
	bool IsAuraEffectBuff() const;
	bool IsBuff() const;
	bool IsDebuff() const;
	bool IsQuestBuff() const;
	bool IsMesmerize() const;
	bool IsEnchant() const;
	bool IsRideBuff() const;
	bool HasProcEffect() const;
	bool IsDispel(BUFF_DISPEL_TYPE nType) const;
	bool IsEqualLine(int nBuffLine) const;
};


class CSCOMMON_API CSBuffInfoMgr : public map<int , CSBuffInfo* > 
{
private:
	CSBuffInfoMgr(CSBuffInfoMgr& other);
protected:
	void ParseBuffCommon(CSBuffInfo* pBuffInfo, MXmlElement* pElement, MXml* pXml);
private:
	bool _ParseDispelType(const string& strDispelType, BUFF_DISPEL_TYPE& out);
	bool _ParseActiveExtraParam1(BUFF_ACTIVE_EXTRA_ATTRIB_ nAttrib, const vector<string>& vecstrValue, vector<BUFF_ACTIVE_EXTRA_PARAM>& outvecParam);
	bool _ParseActiveExtraParam2(BUFF_ACTIVE_EXTRA_ATTRIB_ nAttrib, const vector<string>& vecstrValue, vector<BUFF_ACTIVE_EXTRA_PARAM>& outvecParam);
public:
	CSBuffInfoMgr() {}
	virtual ~CSBuffInfoMgr() {}
};
