#pragma once

#include "GModule.h"
#include "MMemPool.h"
#include "MReferenceCounted.h"
#include "CSTalentInfoEnum.h"
#include "CSTalentInfo.h"
#include "GBuffUser.h"

// ���� Ÿ��
enum DISPEL_TYPE
{
	DISPEL_NONE	= 0,

	DISPEL_MAGIC,			// BuffID 100 ~ 199
	DISPEL_POISON,			// BuffID 200 ~ 299
	DISPEL_DISEASE,			// BuffID 300 ~ 399
	DISPEL_CURSE,			// BuffID 400 ~ 499
	DISPEL_MESMERIZE,		// BuffID 500 ~ 599
	DISPEL_DEATH_PENALTY,	// BuffID 600 ~ 699
	
	DISPEL_BUFF,
	DISPEL_FOCUS,		// ������ - Focus�� ���� ����
	DISPEL_BPART,

	MAX_DISPEL_TYPE	
};


class GTalentInfo;
class GBuffInfo;
class GEntitySync;
class GEntityActor;
class GBuff;
class GField;

struct BUFF_ACTIVE_EXTRA_PARAM;

TEST_FORWARD_FT(Buff_Stack, FBuff, IsStackable);

/// ���� ���
class GModuleBuff : public GModule, public MMemPool<GModuleBuff>
{
TEST_FRIEND_FT(Buff_Stack, FBuff, IsStackable);

	friend GEntityActor;

	DECLARE_ID(GMID_BUFF);

	struct LazyGainInfo
	{
		LazyGainInfo()
			: pBuffInfo(NULL)
			, fDurationTime(0.f)
			, fPeriodTime(0.f)
			, User(GBuffUser())
			, nStack(1) {}

		GBuffInfo* pBuffInfo;
		float fDurationTime;
		float fPeriodTime;
		GBuffUser User;
		int nStack;
	};
public:
	GModuleBuff(GEntity* pOwner=NULL);
	virtual ~GModuleBuff(void);

	// ������ �ϳ��� ������ �ִ��� ����
	bool			HasBuff() const;
	// ������ ���� (���� üũ)
	bool			GainBuff( GBuffInfo* pBuffInfo, const CSBuffEnchantInfo& BuffInvokeInfo, GTalentInfo* pTalentInfo/*=NULL*/, GEntityActor* pUser );
	// ������ ���� (���� üũ)
	bool			GainBuffDetail( GBuffInfo* pBuffInfo, const CSBuffEnchantInfo& BuffInvokeInfo, GTalentInfo* pTalentInfo/*=NULL*/, GEntityActor* pUser, float fDuration, float fPeriod );
	// ������ ���� ���� ����
	bool			GainBuffForced(GBuffInfo* pBuffInfo, float fDurationTime, float fPeriodTime, GTalentInfo* pTalentInfo=NULL, const GBuffUser& User=GBuffUser(), int nStack=1);
	// ���� ƽ�� ������ ����
	void			LazyGainBuff( GBuffInfo* pBuffInfo, float fDurationTime, float fPeriodTime, const GBuffUser& User=GBuffUser(), int nStack=1 );
	// Ư�� ������ ����
	void			CancelBuff(int nBuffID);
	// CancelBuff(), but by Buff Line.
	void			CancelBuffByLine(int nBuffLine);
	// Gain all buff in vector container, successfully gained buff count will returned as return value.
	int				GainBuff(const vector<int>& vecBuffIDs);
	// Cancel all buff in vector container
	void			CancelBuff(const vector<int>& vecBuffIDs);
	// �̷ο� ���� ���� ��ȯ
	int				GetBuffQty();
	// �طο� ���� ���� ��ȯ
	int				GetDebuffQty();
	// �ش� �������ý��Կ� �´� ��� ���� ��ü�� ��ȯ
	GBuff*			FindBuffBySlot(int BuffStackSlot);
	// �ش� �������ý��Կ� �´� ��� ���� ��ü�� ��ȯ
	GBuff*			FindBuffByID(int BuffID);
	// Find by Buff Line
	GBuff*			FindBuffByLine(int BuffLine);
	// ��� ���� ���̵� ����Ʈ ��ȯ
	vector<int>		GetAllBuffs();
	// Ư�� ������ �ɷ��ִ� ���θ� ��ȯ
	bool			IsGained(int nBuffID);
	// IsGained(), but by Buff Line.
	bool			IsGainedLine(int nBuffLine);
	// �����ֱ� ������ ����� ����
	void			Dispel(int nLimitPower);
	// �����ֱ� �� ����� ����
	void			CurePoison(int nLimitPower);
	// �����ֱ� ������ ����� ����
	void			CureDisease(int nLimitPower);
	// �����ֱ� ���� ����� ����
	void			CureCurse(int nLimitPower);
	// �����ֱ� �̵��Ұ��� ����� ����
	void			DispelMesmerize(int nLimitPower);
	// �����ֱ� ��Ȱ ���Ƽ ����� ����
	void			DispelDeathPenalty(int nLimitPower);
	// �����ֱ� ��Ȱ ���Ƽ ����� ����
	void			DispelBPart();
	// ������� �̷ο� ���� ����
	void			DispelBuff(int nLimitPower);
	// ������� ��� ��Ŀ�� ����
	void			DispelFocus();
	// ������� Ż �� ���� ����
	void			DismountRideBuff();

	// dispel caused by Active Extra DISPEL_BUFF Attrib.
	void			ActiveExtraAttrib_DispelBuff(const vector<BUFF_ACTIVE_EXTRA_PARAM>& vecParam1, const vector<BUFF_ACTIVE_EXTRA_PARAM>& vecParam2);
	// cancel all immobilization debuff - for immobilization release skill.
	void			DispelImmobilization();
	


	// ������ ���� �ð� ��ȯ
	float			GetBuffRemainTime(int nBuffID);
	// ��� ������ ���̵�� ���� �ð� ��ȯ
	void			GetBuffRemainTimes(vector<REMAIN_BUFF_TIME>& outvecBuffRemainTime, bool bExceptFocusBuff = false, bool bExceptNoSaveDB = false);
	// ��� ������ ���̵�� ���� �ð� ��ȯ�� �ߺ��Ǵ� ������ �ִ��� �˻�.
	void			CheckDuplicatedRemainBuff(GEntity* pOwner, vector<REMAIN_BUFF_TIME>& outvecBuffRemainTime, const int nBuffID, const float fRemainTime);
	// ���� ���� �ð� �߰��ϱ�
	void			InsertBuffRemainTimes(const vector<REMAIN_BUFF_TIME>& vecBuffRemainTime);
	// ���� �ɷ��ִ� ������ �������� ����
	bool			IsNowInvincibility()					{ return m_bInvincibility; }
	// Has avoid effect buff or not.
	bool			IsNowAvoid()							{ return m_bAvoid; }
	// ���� �ɷ��ִ� ������ ��� �ŷ�Ʈ�� ��� �Ұ��� ���� Ȯ��
	bool			IsDisableAllTalent()					{ return m_bDisableAllTalent; }
	// ���� �ɷ��ִ� ������ ��� �ŷ�Ʈ�� ��� �Ұ��� ���� Ȯ��
	bool			IsDisableTalent(TALENT_CATEGORY nCategory)	{ return m_bDisableTalent[nCategory]; }
	// ���� �ɷ��ִ� ������ �ָ�������� ���� Ȯ��
	bool			IsMesmerize()							{ return m_bMesmerize; }
	// ���� �ɷ��ִ� ������ ����ȭ���� ����
	bool			IsNowInvisibility()						{ return m_bInvisibility; }
	// ���� �ɷ��ִ� ������ NPC���� �������� ����
	bool			IsNowInvisibilityToNPC()				{ return m_bInvisibilityToNPC; }
	// ���� �ɷ��ִ� ������ ����� �������� ����
	bool			IsNowAbsoluteGuard()					{ return m_bAbsoluteGuard; }
	// ���� �ɷ��ִ� ������ QuestPVP�� �׾����� �������� ����ȵǴ��� ����
	bool			IsNowDisableQuestPVPDrop()				{ return m_bDisableQuestPVPDrop; }
	
	// Ư�� ���� �������� ����
	void			DispelBuff(int nDispellQty, int nLimitPower);	

	// ���� ������ ����
	bool			GainInvincibleBuff_Rebirth();
	bool			GainInvincibleBuff_EnterField();
	bool			GainInvincibleBuff_Infinity();
	bool			GainInvisibleToNPCBuff_Infinity();

	// ����ƽ�� ��� ���� ����
	void			LazyLostAll(bool bForce=false);
	// ���� ������ ����
	bool			LostInvincibleBuff();
	// NPC���� ���� ������ ����
	bool			LostInvisibleToNPCBuff();

	// ��Ƽ�� Ư���Ӽ� Ȱ��ȭ
	void			EnableActiveExtraAttrib(GBuff* pBuff);
	// Ư�� �������ý��Կ� �´� ��� ������ ����
	void			LostBuffStack(int BuffStackSlot);
	
	// ��� ������� ������ ����
	void RemoveAllDebuff();

	// ���/�ȷ�Ʈ���� ���� ������ ����
	void RemoveAllChangeEquipmentBuffs(int nExceptBuff);
	bool IsGained_ForTest( int nBuffID );
private:	
	// ��� ������ ���� (�ܺη� ����Ǹ� �ȵ�, ũ���� ����)
	void			LostAll(bool bRoute, bool bForce=false);
	// �ֱ��� ƽ ó��
	virtual void	OnUpdate(float fDelta);	
	// �������� ���� ���� ȿ�� ó��
	bool			GainEffect( GBuff* pBuff );
	// �������� ���� ���� ȿ�� ó��
	void			DestroyBuff(GBuff* pBuff, bool bRoute);	
	// �ش� �������Ժ��� �� ���� ������ �ɷ��ִ��� ���θ� ��ȯ
	bool			IsGainedPowerfulBuff(int nNewBuffSlot, int nNewBuffPower);
	// Ư�� ���� 1���� ����
	void			RemoveSingleBuff(int nBuffID);
	// �����ֱ� ����� �ϳ� ����
	void			DispelLatestBuff(DISPEL_TYPE dispelType, int nLimitPower );
	// ���� ���� ���� Ȯ��
	bool			IsDispelTypeBuff(DISPEL_TYPE dispelType, int nStackSlot);
	// ���ð����� �������� ����
	bool			IsStackable(int nBuffID);
private:	
	// �нú� Ư���Ӽ� ����
	void			RefreshPassiveExtraAttrib();
	// �нú� Ư���Ӽ� Ȱ��ȭ
	void			EnablePassiveExtraAttrib(GBuff* pBuff);
	// ��� �нú� Ư���Ӽ� ��Ȱ��ȭ
	void			DisablePassiveExtraAttrib();
	
	// Ȱ��ȭ�� ��Ƽ�� Ư���Ӽ� ����
	void			ApplyActiveExtraAttrib();	
	// Ȱ��ȭ�� �нú� Ư���Ӽ� ����
	void			ApplyPassiveExtraAttrib(GBuff* pBuff);
	// ��� ��Ƽ�� Ư���Ӽ� ��Ȱ��ȭ
	void			DisableActiveExtraAttrib();		
	// ���� ��� ������Ʈ, ��ȯ���� ����ƴ��� ����
	void BuffUpdate( vector<GBuff*>& vecBuff, float fDelta );
	// lazy�ϰ� ���� ������ �߰�
	void UpdateLazyGainBuffs();
	// ���� ��⿡ ���� ����ó��
	bool ProcessGainResist( const CSBuffEnchantInfo &BuffInvokeInfo, GEntityActor* pUser, GTalentInfo* pTalentInfo );
	
private:
	// �̵��ӵ� �������� ��
	float					m_fMoveSpeedMod;
	// Ȱ��ȭ�� �������
	vector<GBuff*>			m_vecBuff;
	// ���۷��� ī���� �Ŵ���
	MRefMgr					m_RefMgr;
	// ������ ���� �������� ����
	bool					m_bInvincibility;
	// has avoid buff or not
	bool					m_bAvoid;
	// ������ ���� �ŷ�Ʈ ��밡�� ����
	bool					m_bDisableTalent[TC_MAX];
	bool					m_bDisableAllTalent;
	// ������ ���� �ָ� �������� ����
	bool					m_bMesmerize;
	// ������ ���� �׾�� �ϴ��� ����
	bool					m_bDieable;
	// ������ ���� �Ҹ�Ǿ� �ϴ��� ���� (�罺��O)
	bool					m_bDespawnOnceable;
	// ������ ���� �Ҹ�Ǿ� �ϴ��� ���� (�罺��X)
	bool					m_bDespawnEternalable;
	// ������ ���� �������� ����
	bool					m_bInvisibility;
	// ������ ���� NPC���� �������� ����
	bool					m_bInvisibilityToNPC;
	// ������ ���� ������ ���°������� ����
	bool					m_bAbsoluteGuard;
	// ������ QuestPVP�� �׾����� �������� ����ȵǴ��� ����
	bool					m_bDisableQuestPVPDrop;
	// ������Ʈ ƽ
	MRegulator				m_rgrTick;
	// ������ ƽ Ÿ��
	float					m_fSumTickTime;
	// ���� ƽ�� ���� ���� ���
	vector<LazyGainInfo>	m_vecLazyGainBuffs;

public:
	// Immunity to Mesmerize Debuff
	void EnableMesmerizeImmunity(float fDuration);
	void DisableMesmerizeImmunity();
	bool IsNowImmuneToMesmerize() const { return m_bIgnoreMesmerize; }

private:
	void UpdateMesmerizeImmunity(float fDelta);

	bool					m_bIgnoreMesmerize;
	float					m_fIgnoreMesmerize_RemainTime;

};
