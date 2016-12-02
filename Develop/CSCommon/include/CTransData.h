#ifndef _CTRANS_DATA_H
#define _CTRANS_DATA_H

#include "MTypes.h"
#include "CSDef.h"
#include "CSDef_Interaction.h"
#include "CSChrInfo.h"
#include "MUtil.h"
#include "CSItemData.h" // for ITEMSLOT_MAX
#include "CSTalentInfo.h"
#include "CSDef_Quest.h"
#include "CSPalette.h"
#include "CSGuild.h"
#include "CSDef_Loot.h"
#include "CSDef_Party.h"
#include <tchar.h>
#include <atlconv.h>
#include <atlexcept.h>
#include <IPTypes.h>


 
enum NPC_ATTACKABLE_TYPE;
enum TALENT_STYLE;

// ### ���� ###
//
// 1byte�� byte alignment�� �����Ǿ� �ֱ� ������
// �� �Ʒ� ���ķ� include ���� �ϸ� �ȵ˴ϴ�. 
// - birdkr(2007-06-29)
//
// ### ���� ###

#pragma pack(push, old)
#pragma pack(1)


struct TD_INSERT_CHARACTER_INFO
{
	TCHAR szName[PLAYER_NAME_LEN+1];// ĳ���� �̸�
	int16 nSex, nHair, nFace, nVoice;// ����, �Ӹ�, ��, ��Ҹ�
	int16 nHairColor, nSkinColor;	// �Ӹ���, �Ǻλ�
	int16 nEyeColor, nMakeUp, nTattooType;	// ����, ȭ��, ����
	int16 nTattooPosX, nTattooPosY;	// ���� ��ǥ
	uint8 nTattooScale;				// ���� ũ��
	int16 nTattooColor;
	TALENT_STYLE nTalentStyle;	// �ŷ�Ʈ ��Ÿ��
	int8 nEquipmentIndex;		// �⺻ ��� ��Ʈ
	int8 nEquipmentColorIndex;	// �⺻ ��� ��Ʈ ����	

	
	TD_INSERT_CHARACTER_INFO()
	: nSex(0)
	, nHair(0)
	, nFace(0)
	, nVoice(0)
	, nHairColor(0)
	, nSkinColor(0)
	, nEyeColor(0)
	, nMakeUp(0)
	, nTattooType(0)
	, nTattooPosX(0)
	, nTattooPosY(0)
	, nTattooScale(0)
	, nTattooColor(0)
	, nTalentStyle(TS_NONE)
	, nEquipmentIndex(0)
	, nEquipmentColorIndex(0)	
	{
		szName[0] = _T('\0');
	}
};

struct TD_ITEM_ATTRIBUTE
{
	TD_ITEM_ATTRIBUTE() : nEnchantGrade(0), nElementType(ITEMELEMENT_NONE) {}

	TD_ITEM_ATTRIBUTE(int nEnchantGrade, SH_ITEM_ELEMENT_TYPE nElementType)
		: nEnchantGrade(nEnchantGrade)
		, nElementType(nElementType)
	{}

	int						nEnchantGrade;		// attribute enchant level: 0 ~ 6.
	SH_ITEM_ELEMENT_TYPE	nElementType;		// element type: None, Fire, Ice, Lightning, Poison, Holy, Darkness
};

struct TD_PLAYER_FEATURE
{
	SEX		nSex;
	int16	nHair;
	int16	nFace;
	int16	nHairColor;
	int16	nSkinColor;
	int16	nEyeColor;
	int16	nMakeUp;	
	int16	nVoice;
	int8	nWeaponSet;

	// nItemID determines character look. e.g. equipped item ID, or costume item ID
	int		nItemID[FEATURE_ITEMSLOT_MAX];

	int		nItemID_DyedColor[FEATURE_ITEMSLOT_MAX];
	int		nItemID_EnchantBuff[FEATURE_ITEMSLOT_MAX];

	/* TODO: Unknown Item Values: need to figure out what these are... (all values were almost zero) */
	int		nItemID_Unknown1[FEATURE_ITEMSLOT_MAX];
	int		nItemID_Unknown2[FEATURE_ITEMSLOT_MAX];
	int		nItemID_Unknown3[FEATURE_ITEMSLOT_MAX];

	int		nItemID_Equipped[FEATURE_ITEMSLOT_MAX];		// actual equipped items
	int		nItemID_EnchantGrade[FEATURE_ITEMSLOT_MAX];

	TD_ITEM_ATTRIBUTE ItemAttribute[FEATURE_ITEMSLOT_MAX];

	TCHAR	szGuildName[GUILD_NAME_LEN+1];

	TD_PLAYER_FEATURE()
		: nSex(SEX_NA)
		, nHair(0)
		, nFace(0)
		, nHairColor(0)
		, nSkinColor(0)
		, nEyeColor (0)
		, nMakeUp(0)		
		, nWeaponSet(0)
	{		
		memset(nItemID_DyedColor, 0, sizeof(nItemID_DyedColor));
		memset(nItemID_EnchantGrade, 0, sizeof(nItemID_EnchantGrade));

		memset(nItemID_Unknown1, 0, sizeof(nItemID_Unknown1));
		memset(nItemID_Unknown2, 0, sizeof(nItemID_Unknown2));
		memset(nItemID_Unknown3, 0, sizeof(nItemID_Unknown3));

		memset(ItemAttribute, 0, sizeof(ItemAttribute));

		for (int i=0; i<FEATURE_ITEMSLOT_MAX; ++i)
		{
			nItemID[i] = nItemID_Equipped[i] = -1;
			nItemID_EnchantBuff[i] = ENCHANT_UNUSED_SLOT;
		}

		szGuildName[0] = _T('\0');
	}
};

// ���� Feature
struct TD_PLAYER_FEATURE_TATTOO
{	
	UIID	nUIID;
	int16	nTattooType;
	int16	nTattooColor;
	int16	nTattooPosX;
	int16	nTattooPosY;
	uint8	nTattooScale;

	TD_PLAYER_FEATURE_TATTOO() : nUIID(0), nTattooType(0), nTattooColor(0), nTattooPosX(0), nTattooPosY(0), nTattooScale(0) {	}
	bool IsValid()
	{
		return (0 != nUIID);
	}
};

// ������ ������ �ִ� ĳ���� ����Ʈ
struct TD_AccountCharInfo
{	
	TCHAR						szName[PLAYER_NAME_LEN + 1];
	int8						nLevel;
	int							nUnknown1;	// TODO: Added on 2014, but don't know how it's used.
	int							nFieldID;
	TD_PLAYER_FEATURE			Feature;
	TD_PLAYER_FEATURE_TATTOO		Tattoo;
};

// ������
struct TD_MYINFO

{
	int8	nSex;
	int16	nFeatureHair;
	int16	nFeatureFace;
	int16	nFeatureHairColor;
	int16	nFeatureSkinColor;
	int16	nEyeColor;
	int16	nMakeUp;
	int16	nVoice;
	int16	nTattooType;
	int16	nTattooColor;
	short	nTattooPosX;
	short	nTattooPosY;
	uint8	nTattooScale;
	short	nLevel;
	float	fExpPercent;
	short	nMaxHP;
	short	nMaxEN;
	short	nMaxSTA;
	short	nCurHP;
	short	nCurEN;
	short	nCurSTA;
	int		nMoney;	
	int		nUnknown1;	// TODO: unknown
	uint8	nWeaponSet;
	TCHAR	szName[PLAYER_NAME_LEN + 1];
	TCHAR	szSurname[PLAYER_NAME_LEN + 1];
	int		nXP;
	uint8	nSTR;
	uint8	nDEX;
	uint8	nINT;
	uint8	nCHA;
	uint8	nCON;
	int				nFatigueType;
	int				nRemainTP;
	int				nRemainTP_Backup;
	int				nTotalTP;
	SKILL_SET_TYPE	eSkillSet;
	int				nCheckPointFieldID;
	int8			nPlayerGrade;	///< �÷��̾� ���	

	int		nUnknown2;

	struct
	{
		int		nWins;
		int		nLoses;
		int		nScore;
	} BattleArena_Score;

	struct
	{
		int		_1;		// 00 00 00 00
		char	_2[16];	// 00 A0 8A 6C A9 90 57 63 00 00 00 00 00 00 00 00
		int		_3;		// 0A 00 00 00
		int		_4;		// E8 03 00 00
		char	_5[16];	// 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	} Unknown3;

	/// ���� UI �� ���� ������ ���콺�� �÷��� �� ������ ����
	bool	bExistUnreadMail;
	bool	bIsFullMailbox;

	TD_MYINFO()
	{
		nFeatureHair = 0;
		nFeatureFace = 0;
		nFeatureHairColor = 0;
		nFeatureSkinColor = 0;
		nMakeUp = 0;
		nVoice = 0;
		nTattooType = 0;
		nTattooColor = 0;
		nTattooPosX = 0;
		nTattooPosY = 0;
		nTattooScale = 0;
		nWeaponSet = 0;
		nSex = 0;
		nFatigueType = 0;
		memset(szName, 0, sizeof(szName));
		memset(szSurname, 0, sizeof(szSurname));
		nPlayerGrade = 0;
		eSkillSet = SST_COMMON;
		nCheckPointFieldID = 0;
		bExistUnreadMail = false;
		bIsFullMailbox = false;
		nMoney = 0;
		nRemainTP = 0;
		nRemainTP_Backup = 0;
		nTotalTP = 0;

		memset(&BattleArena_Score, 0, sizeof(BattleArena_Score));

		nUnknown1 = 0;
		nUnknown2 = 0;
		memset(&Unknown3, 0, sizeof(Unknown3));
	}
};

struct TD_TALENT
{
	int					nID;
	SKILL_SET_TYPE		eSkillSet;
};

struct TD_TRADE_ITEM_PUTUP_REQ
{
	TD_TRADE_ITEM_PUTUP_REQ()
	: m_nSlotID(INVALID_ID), m_nAmount(0)
	{}
	TD_TRADE_ITEM_PUTUP_REQ(int nSlotID, int nAmount)
	: m_nSlotID(nSlotID), m_nAmount(nAmount)
	{}

	int	m_nSlotID;
	int	m_nAmount;
};

struct TD_TRADE_ITEM_PUTUP
{
	TD_TRADE_ITEM_PUTUP()
	: m_nSlotID(INVALID_ID), m_nID(INVALID_ID), m_nAmount(0), m_nDurability(0), m_nColor(0)
	{}
	TD_TRADE_ITEM_PUTUP(int nSlotID, int nID, int nAmount, int nDurability, int nColor)
	: m_nSlotID(nSlotID), m_nID(nID), m_nAmount(nAmount), m_nDurability(nDurability), m_nColor(nColor)
	{}

	int	m_nSlotID;
	int	m_nID;
	int	m_nAmount;
	int	m_nDurability;
	int	m_nColor;
};

struct TD_TRADE_ITEM_PUTDOWN
{
	TD_TRADE_ITEM_PUTDOWN()
	: m_nSlotID(INVALID_ID), m_nAmount(0)
	{}

	TD_TRADE_ITEM_PUTDOWN(int nSlotID, int nAmount)
	: m_nSlotID(nSlotID), m_nAmount(nAmount)
	{}

	int	m_nSlotID;
	int	m_nAmount;
};

struct TD_LOOT_MASTERLOOT_UI
{
	TD_LOOT_MASTERLOOT_UI(MUID nDropItemUID, int nItemID, int nItemAmount)
	: m_nDropItemUID(nDropItemUID)
	, m_nItemID(nItemID)
	, m_nItemAmount(nItemAmount)
	{}

	TD_LOOT_MASTERLOOT_UI()
	: m_nDropItemUID(MUID::ZERO)
	, m_nItemID(0)
	, m_nItemAmount(0)	
	{}

	bool operator==(const TD_LOOT_MASTERLOOT_UI& other)
	{
		if (m_nDropItemUID != other.m_nDropItemUID) return false;
		if (m_nItemID != other.m_nItemID) return false;
		if (m_nItemAmount != other.m_nItemAmount) return false;
		
		for (int i=0; i<MAX_PARTY_MEMBER_COUNT; i++)
		{
			if (m_Beneficiarys[i] != other.m_Beneficiarys[i]) return false;
		}

		return true;
	}

	MUID	m_nDropItemUID;
	int		m_nItemID;
	int		m_nItemAmount;
	MUID	m_Beneficiarys[MAX_PARTY_MEMBER_COUNT];
};

struct TD_LOOT_MASTERLOOT_NOTIFY
{
	TD_LOOT_MASTERLOOT_NOTIFY(int nItemID, int nItemAmount)
	: m_nItemID(nItemID)
	, m_nItemAmount(nItemAmount)
	{}

	TD_LOOT_MASTERLOOT_NOTIFY()
	: m_nItemID(0)
	, m_nItemAmount(0)
	{}

	bool operator==(const TD_LOOT_MASTERLOOT_NOTIFY& other)
	{
		if (m_nItemID != other.m_nItemID) return false;
		if (m_nItemAmount != other.m_nItemAmount) return false;

		return true;
	}

	int		m_nItemID;
	int		m_nItemAmount;
};

struct TD_LOOT_ROLL_ITEM
{
	TD_LOOT_ROLL_ITEM()
	: m_nIndex(0)
	, m_nItemID(0)
	, m_nItemAmount(0)
	{

	}

	TD_LOOT_ROLL_ITEM(int nIndex, int nItemID, int nItemAmount)
	: m_nIndex(nIndex)
	, m_nItemID(nItemID)
	, m_nItemAmount(nItemAmount)
	{

	}

	bool operator==(const TD_LOOT_ROLL_ITEM& other)
	{
		if (m_nIndex != other.m_nIndex) return false;
		if (m_nItemID != other.m_nItemID) return false;
		if (m_nItemAmount != other.m_nItemAmount) return false;

		return true;
	}

	int	m_nIndex;
	int m_nItemID;
	int m_nItemAmount;
};

struct TD_LOOT_ROLL_RESULT
{
	TD_LOOT_ROLL_RESULT()
	: m_nIndex(0)
	, m_nPlayerUID(0)
	, m_nRollResult(0)
	{
	}

	TD_LOOT_ROLL_RESULT(int nIndex, MUID nPlayerUID, int nRollResult)
	: m_nIndex(nIndex)
	, m_nPlayerUID(nPlayerUID)
	, m_nRollResult(nRollResult)
	{
	}

	bool operator==(const TD_LOOT_ROLL_RESULT& other)
	{
		if (m_nIndex != other.m_nIndex) return false;
		if (m_nPlayerUID != other.m_nPlayerUID) return false;
		if (m_nRollResult != other.m_nRollResult) return false;

		return true;
	}

	int		m_nIndex;
	MUID	m_nPlayerUID;
	int		m_nRollResult;
};

struct TD_LOOT_GETTABLE_ITEM_ADD
{
	TD_LOOT_GETTABLE_ITEM_ADD()
	: m_nItemID(0)
	, m_nItemAmount(0)
	, m_nCGR(UIR_NONE)
	{
	}

	TD_LOOT_GETTABLE_ITEM_ADD(int nItemID, int nItemAmount, UNGETTABLE_ITEM_REASON nCGR)
	: m_nItemID(nItemID)
	, m_nItemAmount(nItemAmount)
	, m_nCGR(nCGR)
	{
	}

	bool operator==(const TD_LOOT_GETTABLE_ITEM_ADD& other)
	{
		if (m_nItemID != other.m_nItemID) return false;
		if (m_nItemAmount != other.m_nItemAmount) return false;
		if (m_nCGR != other.m_nCGR) return false;

		return true;
	}

	int		m_nItemID;
	int		m_nItemAmount;
	UNGETTABLE_ITEM_REASON m_nCGR;
};

struct TD_LOOT_OTHERGAIN_ITEM
{
	TD_LOOT_OTHERGAIN_ITEM() : m_nItemID(0), m_nAmount(0) {}
	TD_LOOT_OTHERGAIN_ITEM(int nItemID, int nAmount): m_nItemID(nItemID), m_nAmount(nAmount) {}
	bool operator==(const TD_LOOT_OTHERGAIN_ITEM& other)
	{
		if (m_nItemID != other.m_nItemID) return false;
		if (m_nAmount != other.m_nAmount) return false;

		return true;
	}

	int				m_nItemID;
	int				m_nAmount;
};

struct TD_ITEM
{
	TD_ITEM()
	: m_nItemID(0)
	, m_nSlotID(INVALID_ID)
	, m_nQuantity(0)
	, m_nDurability(0)
	, m_nDyedColor(0)
	, m_bBind(false)
	, m_nSoulQuantity(0)
	{
		for (int i=0; i<ENCHANT_MAX_COUNT; ++i)
		{
			m_nEnchants[i] = ENCHANT_UNUSED_SLOT; 
		}

		m_Attribute.nElementType	= ITEMELEMENT_NONE;
		m_Attribute.nEnchantGrade	= 0;

		nUnknown1 = nUnknown2[0] = nUnknown2[1] = 0;
	}

	bool operator==(const TD_ITEM& other) const
	{
		if (m_nItemID != other.m_nItemID) return false;
		if (m_nSlotID != other.m_nSlotID) return false;
		if (m_nQuantity != other.m_nQuantity) return false;
		if (m_nDurability != other.m_nDurability) return false;
		if (m_nDyedColor != other.m_nDyedColor) return false;
		if (m_bBind != other.m_bBind) return false;
		if (m_nSoulQuantity != other.m_nSoulQuantity) return false;
		if (m_Attribute.nElementType != other.m_Attribute.nElementType) return false;
		if (m_Attribute.nEnchantGrade != other.m_Attribute.nEnchantGrade) return false;

		for (int i=0; i<ENCHANT_MAX_COUNT; ++i)
		{
			if (m_nEnchants[i] != other.m_nEnchants[i])
				return false;
		}

		return true;
	}

	int					m_nItemID;	
	int					m_nSlotID;
	int					m_nQuantity;				// ���� (��ġ�� ������ ���)
	int					m_nDurability;
	int					m_nDyedColor;				// ������ ��
	bool				m_bBind;					// �ͼ� �Ǿ�����
	int					nUnknown1; // TODO: Unknown
	uint8				m_nSoulQuantity;			// �ҿ� �����
	int					m_nEnchants[ENCHANT_MAX_COUNT];		// ��æ ��� (ù��°�� Ȱ��ȭ ��æƮ)
	TD_ITEM_ATTRIBUTE	m_Attribute;
	int					nUnknown2[2];	
};

struct TD_ITEM_DROP
{
	TD_ITEM_DROP()
	: m_nDropItemUID(MUID::ZERO)
	, m_nDropItemType(DIT_NONE)
	, m_nItemID(0)
	, m_nAmount(0)
	{
	}

	TD_ITEM_DROP(MUID nDropItemUID, int nItemID, int nAmount, DROP_ITEM_TYPE nDropItemType)
	: m_nDropItemUID(nDropItemUID)
	, m_nItemID(nItemID)
	, m_nAmount(nAmount)
	, m_nDropItemType(nDropItemType)
	{
	}

	bool operator==(const TD_ITEM_DROP& other)
	{
		if (m_nDropItemUID != other.m_nDropItemUID) return false;
		if (m_nDropItemType != other.m_nDropItemType) return false;
		if (m_nItemID != other.m_nItemID) return false;
		if (m_nAmount != other.m_nAmount) return false;

		return true;
	}

	MUID			m_nDropItemUID;
	DROP_ITEM_TYPE	m_nDropItemType;
	int				m_nItemID;
	int				m_nAmount;	
};

struct TD_ITEM_INSERT
{
	TD_ITEM_INSERT()
	: m_nID(0)					// ������ ID
	, m_nSlotID(INVALID_ID)
	, m_nAmount(0)				// �߰��� ����
	, m_nDurability(0)			// ������
	, m_nColor(0)				// ����
	, m_nSoulAmount(0)			// �ҿ� ����
	, m_nEnchantGrade(0)		// Beycium Enchantment Grade
	{
		// Jewel Enchantments
		for (int i = 0; i < ENCHANT_MAX_COUNT; i++)
			m_nEnchants[i] = 0;

		memset(unknown, 0, sizeof(unknown));
	}

	TD_ITEM_INSERT(
		int nID, 
		int nSlotID, 
		int nAmount, 
		int nDurability, 
		int nColor, 
		int nSoulAmount, 
		const int* nEnchants, 
		int nEnchantGrade, 
		const TD_ITEM_ATTRIBUTE& Attribute)
	: m_nID(nID)
	, m_nSlotID(nSlotID)
	, m_nAmount(nAmount)
	, m_nDurability(nDurability)
	, m_nColor(nColor)
	, m_nSoulAmount(nSoulAmount)
	, m_nEnchantGrade(nEnchantGrade)
	{
		for (int i = 0; i < ENCHANT_MAX_COUNT; i++)
			m_nEnchants[i] = nEnchants ? nEnchants[i] : 0;

		m_Attribute = Attribute;

		memset(unknown, 0, sizeof(unknown));
	}

	int					m_nID;	
	int					m_nSlotID;
	int					m_nAmount;
	int					m_nDurability;
	int					m_nColor;
	int					m_nSoulAmount;
	int					m_nEnchants[ENCHANT_MAX_COUNT];
	int					m_nEnchantGrade;
	TD_ITEM_ATTRIBUTE	m_Attribute;
	int					unknown[2];	// TODO: unknown
};

struct TD_ITEM_INCREASE
{
	TD_ITEM_INCREASE()
	: m_nSlotID(INVALID_ID)
	, m_nAmount(0)				// ������ ����
	{}

	TD_ITEM_INCREASE(int nSlotID, int nAmount)
	: m_nSlotID(nSlotID)
	, m_nAmount(nAmount)
	{}
	
	int		m_nSlotID;
	int		m_nAmount;
};

struct TD_ITEM_DELETE
{
	TD_ITEM_DELETE()
	: m_nSlotType(0)
	, m_nSlotID(INVALID_ID)
	{}

	TD_ITEM_DELETE(int nSlotType, int nSlotID)
	: m_nSlotType(nSlotType)
	, m_nSlotID(nSlotID)
	{}

	int		m_nSlotType;
	int		m_nSlotID;	
};

struct TD_ITEM_DECREASE
{
	TD_ITEM_DECREASE()
	: m_nSlotType(0)
	, m_nSlotID(INVALID_ID)
	, m_nAmount(0)
	{}

	TD_ITEM_DECREASE(int nSlotType, int nSlotID, int nAmount)
	: m_nSlotType(nSlotType)
	, m_nSlotID(nSlotID)
	, m_nAmount(nAmount)
	{}

	int		m_nSlotType;
	int		m_nSlotID;
	int		m_nAmount;
};

struct TD_ITEM_INVENTORY_SORT
{
	TD_ITEM_INVENTORY_SORT()
	: m_nFromSlotID(0), m_nToSlotID(0)
	{}

	TD_ITEM_INVENTORY_SORT(int nFromSlotID, int nToSlotID, int nItemType)
	: m_nFromSlotID(nFromSlotID), m_nToSlotID(nToSlotID), m_nItemType(nItemType)
	{}

	int		m_nFromSlotID;
	int		m_nToSlotID;
	int		m_nItemType;
	int		m_nUnknown;	// TODO: unknown
};

struct TD_UPDATE_DURABILITY
{
	TD_UPDATE_DURABILITY()
	: m_nSlotID(INVALID_ID)
	, m_nSlotType(SLOTTYPE_NONE)
	, m_nDurability(0)
	{
	}

	TD_UPDATE_DURABILITY(int nSlotID, int nSlotType, int nDurability)
	: m_nSlotID(nSlotID)
	, m_nSlotType(nSlotType)
	, m_nDurability(nDurability)
	{
	}

	int				m_nSlotID;
	int				m_nSlotType;				// SH_ITEM_SLOT_TYPE
	int				m_nDurability;				// ������
};

struct TD_PARTY_SETTING
{	
	TD_PARTY_SETTING()
	: m_nLRC(LRC_FREE_FOR_ALL)
	, m_nLRR(LRR_FREE_FOR_ALL)
	, m_nLRRF(LRRF_RARE_OR_HIGHER)
	, m_bPublicParty(false)
	, m_nAutoPartyQuestID(INVALID_ID)
	{
		memset(m_szName, 0, sizeof(m_szName));
	}

	void Export(PARTY_SETTING& PartySetting) const
	{
		PartySetting.m_uidLeader = m_uidLeader;
		
		PartySetting.m_bPublicParty = m_bPublicParty;
		_tcsncpy_s(PartySetting.m_szName, m_szName, _TRUNCATE);

		PartySetting.m_lootingRuleData.m_nLRC = (LOOTING_RULE_COMMON)m_nLRC;
		PartySetting.m_lootingRuleData.m_nLRR = (LOOTING_RULE_RARE)m_nLRR;
		PartySetting.m_lootingRuleData.m_nLRRF = (LOOTING_RULE_RARE_FOR)m_nLRRF;
		PartySetting.m_nAutoPartyQuestID = m_nAutoPartyQuestID;
	}

	void Import(const PARTY_SETTING& PartySetting)
	{
		m_uidLeader = PartySetting.m_uidLeader;
		
		m_bPublicParty = PartySetting.m_bPublicParty;
		_tcsncpy_s(m_szName, PartySetting.m_szName, _TRUNCATE);

		m_nLRC = PartySetting.m_lootingRuleData.m_nLRC;
		m_nLRR = PartySetting.m_lootingRuleData.m_nLRR;
		m_nLRRF = PartySetting.m_lootingRuleData.m_nLRRF;
		m_nAutoPartyQuestID = PartySetting.m_nAutoPartyQuestID;
	}

	MUID			m_uidLeader;
	int8			m_nLRC;				// �Ϲ� ����ǰ ���÷�
	int8			m_nLRR;				// ��� ����ǰ ���÷�
	int8			m_nLRRF;			// ��� ����ǰ ���÷� ���� ���
	bool			m_bPublicParty;
	TCHAR			m_szName[PARTY_NAME_LEN+1];
	int				m_nAutoPartyQuestID;
};

struct TD_PARTY
{
	TD_PARTY()
	{
	}

	TD_PARTY(const MUID& uidParty, const TD_PARTY_SETTING& partySetting)
	: m_uidParty(uidParty)
	, m_partySetting(partySetting)
	{

	}

	MUID					m_uidParty;
	TD_PARTY_SETTING		m_partySetting;
};

// ! ���� ��, CSPartyMember�� �Բ� �����ؾ��Ѵ�.
struct TD_PARTY_MEMBER
{
	TD_PARTY_MEMBER()
	: m_uidPlayer(MUID::ZERO)
	, nStatusFlag(0)
	, nHP(0)
	, nEN(0)
	, nSTA(0)
	, nLevel(0)
	, nFieldID(0)
	, nChannelID(0)
	, nTalentStyle(TS_NONE)
	{
		memset(szName, 0, sizeof(szName));
	}

	MUID			m_uidPlayer;
	TCHAR			szName[PLAYER_NAME_LEN+1];
	uint32			nStatusFlag;
	int8			nHP;
	int8			nEN;
	int8			nSTA;
	int8			nLevel;
	int32			nFieldID;
	int16			nChannelID;
	uint8			nTalentStyle;
};

struct TD_PARTY_MATCHING_PUBLIC_PARTY_LIST_ITEM
{
	TD_PARTY_MATCHING_PUBLIC_PARTY_LIST_ITEM()
		: m_uidParty(MUID::ZERO)
		, m_uidLeader(MUID::ZERO)
		, m_nMemberCount(0)
	{
		memset(m_szPartyName, 0, sizeof(m_szPartyName));
		memset(m_szLeaderName, 0, sizeof(m_szLeaderName));
	}

	TD_PARTY_MATCHING_PUBLIC_PARTY_LIST_ITEM(
		const MUID& uidParty,
		const MUID& uidLeader,
		const TCHAR* szPartyName,
		const TCHAR* szLeaderName,
		const int8 nMemberCount)
		: m_uidParty(uidParty)
		, m_uidLeader(uidLeader)
		, m_nMemberCount(nMemberCount)
	{
		_tcsncpy_s(m_szPartyName, szPartyName, _TRUNCATE);
		_tcsncpy_s(m_szLeaderName, szLeaderName, _TRUNCATE);
	}

	MUID		m_uidParty;
	MUID		m_uidLeader;
	TCHAR		m_szPartyName[PARTY_NAME_LEN / 2 + 1];	// half-truncated party name.
	TCHAR		m_szLeaderName[PLAYER_NAME_LEN + 1];
	int8		m_nMemberCount;
};

enum UPDATE_PC_STATUS
{
	UPS_NONE					=0,
	UPS_DEAD					=1,
	UPS_OFFLINE					=2,
	UPS_SWIMMING				=4,	///< ������
	UPS_LOOTING					=5,	///< ������
	UPS_FIELDPVP_TEAM1			=6,	///< �ʵ�PVP �Ѽ�1 ��
	UPS_FIELDPVP_TEAM2			=7,	///< �ʵ�PVP �Ѽ�1 ��
	UPS_SITTING					=8,	///< �ɾ� �ִ���
	UPS_CUTSCENING				=9,	///< �ƽ���
	UPS_AFK						=10,///< �ڸ����
	UPS_PARTYLEADER				=11,///< ��Ƽ��
	// �ִ� 15����
};

/*
struct TD_UPDATE_CACHE_PLAYER
{
	MUID		uid;
	UIID		nUIID;
	vec3		vPos;
	svec2		svDir;
	CHAR_STANCE	nStance;
	uint16		nStatusFlag;
	uint16		nMFWeight;	// �ɷ��ִ� ������� ����ġ
	MF_STATE	nMF;		// �ɷ��ִ� �������

	TD_PLAYER_FEATURE	Feature;

	int			Buffs[MAX_OWN_BUFF_NUMBER];
	TCHAR		szName[PLAYER_NAME_LEN+1];	

	TD_UPDATE_CACHE_PLAYER()
		: uid(MUID::Invalid())
		, nUIID(0)
		, vPos(vec3::ZERO)
		, svDir(0.0f, 1.0f)
		, nStance(CS_NORMAL)
		, nStatusFlag(0)
		, nMF(MF_NONE)
		, nMFWeight(0)
	{
		memset(Buffs, 0, sizeof(Buffs));
		memset(szName, 0, sizeof(szName));
	}
};
*/

struct TD_SIMPLE_UPDATE_CACHE_PLAYER
{
	MUID			uid;
	UIID			nUIID;
	vec3			vPos;
	svec2			svDir;
	CHAR_STANCE		nStance;
	uint16			nStatusFlag;
	uint16			nMFWeight;
	MF_STATE		nMF;

	// TODO: unknown (may contain brune info here...)
	uint8			nUnknown[18];

	TD_SIMPLE_UPDATE_CACHE_PLAYER()
		: uid(MUID::Invalid())
		, nUIID(0)
		, vPos(vec3::ZERO)
		, svDir(0.0f, 1.0f)
		, nStance(CS_NORMAL)
		, nStatusFlag(0)
		, nMF(MF_NONE)
		, nMFWeight(0)
	{
		memset(nUnknown, 0, sizeof(nUnknown));
	}
};

struct TD_EXTRA_UPDATE_CACHE_PLAYER
{
	TCHAR				szName[PLAYER_NAME_LEN+1];
	TD_PLAYER_FEATURE	Feature;

	TD_EXTRA_UPDATE_CACHE_PLAYER()
	{
		memset(szName, 0, sizeof(szName));
	}
};

struct TD_UPDATE_CACHE_PLAYER
{
	TD_SIMPLE_UPDATE_CACHE_PLAYER	SimpleInfo;
	TD_EXTRA_UPDATE_CACHE_PLAYER	ExtraInfo;

	TD_UPDATE_CACHE_PLAYER() {}
	TD_UPDATE_CACHE_PLAYER(
		const TD_SIMPLE_UPDATE_CACHE_PLAYER& SimpleInfo,
		const TD_EXTRA_UPDATE_CACHE_PLAYER& ExtraInfo
		) : SimpleInfo(SimpleInfo), ExtraInfo(ExtraInfo) {}
};

struct TD_PLAYER_BUFF_LIST
{
	UIID	nUIID;
	int		nBuffID[MAX_OWN_BUFF_NUMBER];

	TD_PLAYER_BUFF_LIST()
		: nUIID(UIID_INVALID)
	{
		memset(nBuffID, 0, sizeof(nBuffID));
	}

	bool IsValid()
	{
		return (0 != nUIID);
	}
};

enum UPDATE_NPC_STATUS
{
	UNS_BREAKPART1			= 1,		///< �극��Ŀ�� ����1�� ����
	UNS_BREAKPART2			= 2,		///< �극��Ŀ�� ����2�� ����
	UNS_BREAKPART3			= 3,		///< �극��Ŀ�� ����3�� ����
	UNS_BREAKPART4			= 4,		///< �극��Ŀ�� ����4�� ����

	UNS_DEAD				= 5,
	UNS_MODE1				= 6,
	UNS_MODE2				= 7,
	UNS_MODE3				= 8,
	UNS_MODE4				= 9,
	UNS_MODE5				= 10,

	UNS_LOOTABLE			= 11,
	UNS_RUN					= 12,
	UNS_WALK				= 13,

	// Attackable - NPC_ATTACKABLE_TYPE
	UNS_ATTACKABLE_ALWAYS	= 14,
	UNS_ATTACKABLE_FACTION	= 15

};

struct TD_UPDATE_CACHE_NPC
{
	MUID	uid;			// �ڽ��� UID
	UIID	nUIID;			// �ڽ��� UIID
	MUID	uidTarget;		// ������ ��ǥ�� UID -> Ȯ������ �̵�
	int		nNPCID;
	vec3	vPos;
	
	svec2	svDir;
	int8	nLevel;
	uint32	nStatusFlag;	// NPC�� ����(�� : ���ð���, ����, �극��ũ����, ü�� ���)


	// �̵�����
	vec3	vTarPos;		// ������	
	uint16	nSpeed;			// �̵� �ӵ�
	int		Buffs[MAX_OWN_BUFF_NUMBER];

	int		nTalentID;		// -> Ȯ������ �̵�


	TD_UPDATE_CACHE_NPC()
		: uid(MUID::Invalid())
		, nUIID(UIID_INVALID)
		, uidTarget(MUID::Invalid())
		, nNPCID(-1)
		, vPos(vec3::ZERO)
		, svDir(0.0f, 0.0f)
		, nLevel(0)
		, nStatusFlag(0)
		, vTarPos(0.0f, 0.0f, 0.0f)
		, nSpeed(0)
		, nTalentID(INVALID_TALENT_ID)
	{
		memset(Buffs, 0, sizeof(Buffs));
	}
};

/// TD_UPDATE_CACHE_NPC�� Ȯ��
struct TD_UPDATE_CACHE_NPC_EX : public TD_UPDATE_CACHE_NPC
{
	TD_UPDATE_CACHE_NPC_EX() : TD_UPDATE_CACHE_NPC()
	{

	}
};

struct TD_UPDATE_CACHE_PBART
{
	int		nNPCID;
	int nBPartID;
	int nBPartFlag;

	MUID	uid;			// �ڽ��� UID
	UIID	nUIID;			// �ڽ��� UIID
	
	vec3	vPos;
	svec2	svDir;
	uint32	nStatusFlag;	// NPC�� ����(�� : ���ð���, ����, �극��ũ����, ü�� ���)
	
	TD_UPDATE_CACHE_PBART()
	{
		nNPCID = INVALID_ID;
		nBPartID = INVALID_ID;
		nBPartFlag = INVALID_ID;
		nStatusFlag = 0;
	}
};


struct TD_UPDATE_CACHE_BUFFENTITY
{
	MUID	UID;
	int		nBuffID;
	vec3	vPos;
	float	fReaminTime;
	MUID	UserUID;

	TD_UPDATE_CACHE_BUFFENTITY()
		: nBuffID(INVALID_BUFF_ID)
		, vPos(vec3::ZERO)
		, fReaminTime(0.0f)
	{

	}
};

struct TD_UPDATE_SIMPLE_STATUS
{
	uint16	nHP;
	uint16	nEN;
	uint16	nSTA;
};

enum TD_MoveAniMotionType
{
	AM_NONE = 0,
	AM_MOVE_FORWARD,
	AM_MOVE_BACKWARD,
	AM_MOVE_LEFT,
	AM_MOVE_RIGHT,
};


struct TD_PC_MOVE
{
	vec3			vTarPos;
	svec2			svDir;
	unsigned short	nFlags;		// MOVEMENT_FLAG �÷���
};

struct TD_NPC_MOVE
{
	UIID			nUIID;					// NPC�� UIID
	vec3			vTarPos;				// ������
	svec2			svDir;
	uint16			nSpeed;
};

struct TD_REQUEST_ATTACK
{
	TALENT_NORMAL_ATTACK_TYPE	nAttackType;
	vec3						vPos;
	svec3						svDir;
};

struct TD_TALENT_HIT
{
	UIID		nAttackerUIID;
	UIID		nVictimUIID;

	int			nTalentID;
	uint16		nDamage;
	uint16		nMFWeight;
	int8		nMFState;


	uint16		nHitTime;		///< �ŷ�Ʈ�� ������ �� ������ �����Ǵ� �ð�(1000 == 1��)
	uint16		nFlags;			///< COMBAT_TURN_RESULT ����
};

struct TD_TALENT_HIT_EX_KNOCKBACK
{
	svec2		vKnockbackDir;			// �˹�/���ο�� �Ǿ� �ڷ� ���ư��� ����
	vec3		vKnockbackVictimPos;	// �˹�/���ο���Ǵ� �ǰ��� ������ġ
	vec3		vKnockbackTargetPos;	// �˹�/���ο���Ǵ� �ǰ��� �Ϸ���ġ
};

struct TD_TALENT_GUARD
{
	UIID		nAttackerUIID;
	UIID		nGuardUIID;

	GUARD_TYPE	nType;
	int			nTalentID;
	uint32		nHitTime;
};

struct TD_TALENT_PARTIAL_GUARD : TD_TALENT_GUARD
{
	int			nGuardedDamage;	// ���� ������
	vec3		vGuarderDir; // ������ ����
};

struct TD_BUFF_HIT
{
	UIID		nVictimUIID;
	int			nBuffID;
	uint16		nDamage;
	uint16		nMFWeight;
	int8		nMFState;
	uint32		nFlags;		// COMBAT_TURN_RESULT ����
};

// ����Ʈ ���� ���� ����
struct TD_PLAYERQOBJECTIVE
{
	TD_PLAYERQOBJECTIVE()
	: nQObjectiveID(0)
	, nQOT(QOT_NONE)
	, nProgress(0)
	, bComplete(false)
	{
	}

	int				nQObjectiveID;		// ���� ID
	QOBJECTIVE_TYPE	nQOT;				// ���� Ÿ��
	int				nProgress;			// ������ �޼� ���� ���� ����ϱ� ���� ���Ǵ� ����
	bool			bComplete;			// ���� �Ϸ� ����
};

// ����Ʈ ���� ����
struct TD_PLAYERQUEST
{
	int		nQuestID;					// ����Ʈ ID
	QUEST_STATE_TYPE nState;			// ����Ʈ ����
	int32	nAcceptTime;				// ����Ʈ ���� �ð� 
	int32	nLimitTime;					// ����Ʈ ���� �ð�
	TD_PLAYERQOBJECTIVE playerQObjectives[MAX_PLAYERQOBJECTIVE];	// ����Ʈ ���� ���� ����	
	bool	bChallengerQuest;			// ����������Ʈ���� ���� (���� ������ ������ �˰� ����)
	bool	bDailyQuest;
	vec3	vRewardPos;					// ���� �޴� ��ġ (���� ������ ������ �˰� ����)
};

// ����Ʈ ���� ������Ʈ
struct TD_UPDATE_PLAYERQOBJECTIVE
{
	int nQuestID;						// ����Ʈ ID
	int nQObjectiveID;					// ���� ID
	int nProgress;						// ������ �޼� ���� ���� ����ϱ� ���� ���Ǵ� ����
	bool bComplete;						// ���� �Ϸ� ����

	TD_UPDATE_PLAYERQOBJECTIVE()
	:nQuestID(0), nQObjectiveID(0), nProgress(0), bComplete(false)
	{
	}

	TD_UPDATE_PLAYERQOBJECTIVE(int nQuestID, int nQObjectiveID, int nProgress, bool bComplete)
	:nQuestID(nQuestID), nQObjectiveID(nQObjectiveID), nProgress(nProgress), bComplete(bComplete)
	{
	}
};

struct TD_DIALOG_SELECT_NODE
{
	TD_DIALOG_SELECT_NODE(int nSelectID, int nTextID)
	: nSelectID(nSelectID), nTextID(nTextID) {}
	TD_DIALOG_SELECT_NODE() {}

	int nSelectID;						// ������ ID
	int nTextID;
};

struct TD_TALENT_TARGET_DETAIL
{
	MUID uidTarget;
	int8 nCapsuleGroupIndex;
	int8 nCapsuleIndex;
	// vec3 vTargetTerrain;

	TD_TALENT_TARGET_DETAIL()
		: uidTarget(MUID::Invalid()), nCapsuleGroupIndex(-1), nCapsuleIndex(-1)
	{
	}
};

struct TD_INTERACTION_ELEMENT
{	
	int					nIElementID;	
	INTERACTION_TYPE	nIActType;
	QUEST_STATE_TYPE	nQuestState;
	TCHAR				szIEText[MAX_STRINGID_LEN];

	TD_INTERACTION_ELEMENT()
		: nIElementID(INVALID_ID)
		, nIActType(IT_NONE)
		, nQuestState(QST_NOEXIST)
	{
		memset(szIEText, 0, sizeof(szIEText));
	}
};

struct TD_QREWARD
{
	TD_QREWARD()
	: nType(QRT_NONE)
	, nParam1(0)
	, nParam2(0)
	{
	}

	QUEST_REWARD_TYPE nType;
	int nParam1;
	int nParam2;
};

struct TD_ENEMY_INFO
{
	UIID	nUIID;		// ��ǥ ��� UIID
	int		nMaxHP;		// �ִ� hp
	uint8	nHPPercent;	// hp(�ۼ�Ʈ)
	uint8	nLevel;		// npc level
	uint8	nState;

	TD_ENEMY_INFO()
	:nUIID(UIID_INVALID)
	, nMaxHP(0)
	, nHPPercent(0)
	, nLevel(0)
	, nState(0)
	{}
};

struct TD_TARGET_INFO
{
	UIID			m_nUIID;		// ��ǥ ��� UIID
	int				m_nMaxHP;		// �ִ� hp
	uint8			m_nHPPercent;	// hp(�ۼ�Ʈ)
	uint8			m_nLevel;		// npc level
	bool			m_bComabt;		// ������
	NPC_ICON_TYPE	m_nNPCIConType;	// �ο������� ���ؼ� �����ش�. ������ ���ñ�ȹ �Ƚ��Ǹ� �׶� ����

	TD_TARGET_INFO()
	{
	}

	TD_TARGET_INFO(UIID nUIID, int nMaxHP, int nHPPercent, int nLevel, bool bCombat, NPC_ICON_TYPE nNPCIConType)
	: m_nUIID(nUIID)
	, m_nMaxHP(nMaxHP)
	, m_nHPPercent(nHPPercent)
	, m_nLevel(nLevel)
	, m_bComabt(bCombat)
	, m_nNPCIConType(nNPCIConType)
	{}
};

struct TD_USABLE_BPART
{
	MUID uid;
	UIID uiid;
	vec3 vPos;
	int nFlag;
};

// ��� ����
struct TD_GUILD
{
	TD_GUILD()
	{
	}

	TCHAR	szName[GUILD_NAME_LEN + 1];
	TCHAR	szMasterName[PLAYER_NAME_LEN + 1];
};

// ��� ��� ����
struct TD_GUILD_MEMBER
{
	TD_GUILD_MEMBER()
	: nLevel(0)
	, nGrade((GUILD_MEMBER_GRADE)0)
	, bOnline(false)
	, nFieldID(0)
	, nChannelID(0)
	{
		szName[0] = _T('\0');
	}
	
	TCHAR				szName[PLAYER_NAME_LEN+1];
	int					nLevel;
	GUILD_MEMBER_GRADE	nGrade;

	bool	bOnline;
	int		nFieldID;
	int		nChannelID;
};

// �ȷ�Ʈ ����
struct TD_PALETTE_ITEM
{
	TD_PALETTE_ITEM()
	: nItemIDorTalentID(0)
	, nType((PALETTE_ITEM_TYPE) 0)
	{
	}

	PALETTE_ITEM_TYPE	nType;
	int					nItemIDorTalentID;	
};


// �ȷ�Ʈ
struct TD_PALETTE
{
	TD_PALETTE()
	: nSelectedNum(PALETTENUM_1)
	, nPrimaryNum(PALETTENUM_MAX)
	, nSecondaryNum(PALETTENUM_MAX)
	, eSkillSet(SST_MAIN)
	{
		memset(paletteItems, 0, sizeof(paletteItems));
	}

	bool IsEmpty()
	{
		for (int i = 0; i < PALETTENUM_MAX; ++i)
		{
			if (0 != paletteItems[i].nItemIDorTalentID) return false;
			if (0 != paletteItems[i].nType) return false;			
		}

		return true;		
	}

	TD_PALETTE_ITEM paletteItems[PALETTENUM_MAX*PALETTESLOT_MAX];
	PALETTE_NUM nSelectedNum;
	PALETTE_NUM nPrimaryNum;
	PALETTE_NUM nSecondaryNum;	

	SKILL_SET_TYPE eSkillSet;
};

// �ŷ�Ʈ ��Ÿ��
struct TD_TALENT_REMAIN_COOLTIME
{
	TD_TALENT_REMAIN_COOLTIME()
	: nTalentID(0)
	, fRemainCoolTime(0.0f)
	{}

	int		nTalentID;
	float	fRemainCoolTime;	
};

// ���� ���� �ð�
struct TD_BUFF_REMAIN_TIME
{
	TD_BUFF_REMAIN_TIME()
	: nBuffID(0)
	, fRemainTime(0.0f)
	{}

	int		nBuffID;
	float	fRemainTime;	
};

// �Ѽ�
struct TD_FACTION
{
	TD_FACTION(uint32 nID, uint16 nQuantity)
	: nID(nID)
	, nQuantity(nQuantity)
	{}

	uint32	nID;
	uint16	nQuantity;
};


// ���Ǿ� ������
struct TD_NPC_ICON
{
	TD_NPC_ICON()
	: m_nUIID(UIID_INVALID), m_nIcon(NIT_NONE), m_nNPCID(0) {}
	TD_NPC_ICON(UIID nNPCUIID, NPC_ICON_TYPE nIcon, int nNPCID)
	: m_nUIID(nNPCUIID), m_nIcon(nIcon), m_nNPCID(nNPCID) {}

	UIID			m_nUIID;
	NPC_ICON_TYPE	m_nIcon;
	int				m_nNPCID;
};

struct TD_ESSENTIAL_NPC_ICON
{
	TD_ESSENTIAL_NPC_ICON()
	: m_nUIID(UIID_INVALID), m_nIcon(NIT_NONE), m_nNPCID(0), m_vPos(vec3::ZERO) {}
	TD_ESSENTIAL_NPC_ICON(UIID nNPCUIID, NPC_ICON_TYPE nIcon, int nNPCID, vec3 vPos)
	: m_nUIID(nNPCUIID), m_nIcon(nIcon), m_nNPCID(nNPCID), m_vPos(vPos) {}

	UIID			m_nUIID;
	NPC_ICON_TYPE	m_nIcon;
	int				m_nNPCID;
	vec3			m_vPos;
};


//
// �α��μ����� ���� �α��� ó����
//

// ���� ���Ӽ��� ����
struct TD_LOGIN_GAME_SERVER_INFO
{
	TCHAR	strHostName[MAX_HOSTNAME_LEN+1];
	uint32	nPort;
	MUID	uidConnectionKey;

	TD_LOGIN_GAME_SERVER_INFO()
	: nPort(0)
	, uidConnectionKey(MUID::ZERO)
	{
		memset(strHostName, 0, sizeof(strHostName));
	}
};

enum TD_SENSOR_GATE_TYPE
{
	SENSOR_GATE_TYPE_NA = 0,	// gate type�� �ƴ�
	SENSOR_GATE_TYPE_AUTO = 1,	// ������ ������ �ڵ������� ����
	SENSOR_GATE_TYPE_MANUAL = 2	// ���ͷ����� ���ļ� ����
};

/// ���� ����
struct TD_TRIGGER_SENSOR_INFO
{
	int						nSensorID;
	TD_SENSOR_GATE_TYPE		nGateType;

	TD_TRIGGER_SENSOR_INFO(int sensor_id, TD_SENSOR_GATE_TYPE gate_type) : nSensorID(sensor_id), nGateType(gate_type) {}
	TD_TRIGGER_SENSOR_INFO() {}
};

/// ä�� ä�� ����
struct TD_CHAT_CHANNEL_INFO
{
	uint8		nChannelType;
	MUID		uidChannel;
	TCHAR		strChannelName[MAX_CHATTING_CHANNEL_NAME_LEN+1];
	bool		isOwner;
};


/// ������
struct TD_ITEM_SLOT_INFO
{
	uint8		nSlotType;		// CSItemSlotType
	int			nSlotID;
};

/// ������ ����Ʈ
struct TD_CHALLENGER_QUEST
{
	int			nQuestID;
	ChallengerQuestUnableType		nUnableType;
};

/// ����Ʈ ���� ���
struct TD_QUEST_SHARE_RESULT
{
	MUID				uidPlayer;
	int					nQuestID;	
	QUEST_SHARE_RESULT	nResult;

	TD_QUEST_SHARE_RESULT(MUID uidPlayer, int nQuestID, QUEST_SHARE_RESULT nResult)
	: uidPlayer(uidPlayer), nQuestID(nQuestID), nResult(nResult) {}
	TD_QUEST_SHARE_RESULT()
	: uidPlayer(MUID::ZERO), nQuestID(0), nResult(QSR_NONE) {}

	bool operator == (const TD_QUEST_SHARE_RESULT& other) const
	{
		if (uidPlayer != other.uidPlayer)		return false;
		if (nQuestID != other.nQuestID)		return false;
		if (nResult != other.nResult)		return false;

		return true;
	}
};


/// ����
struct TD_MAIL_RESERVE_ITEM
{
	int		nInventorySlotID;
	int		nItemAmount;

	TD_MAIL_RESERVE_ITEM(): nInventorySlotID(INVALID_ID), nItemAmount(0)	
	{
		// do nothing
	}

	// Unittest ��
	bool operator == (const TD_MAIL_RESERVE_ITEM& other) const
	{
		if (nInventorySlotID != other.nInventorySlotID)		return false;
		if (nItemAmount != other.nItemAmount)				return false;

		return true;
	}
};

struct TD_MAIL_MAILBOX_MAIL_INFO
{
	int64	uidMail;
	uint8	nType;
	TCHAR	strSenderName[PLAYER_NAME_LEN+1];
	TCHAR	strMailTitle[MAX_MAIL_TITLE_LEN+1];
	uint32	nAppendedItemID;	///< 0 �̸� ÷�ξ����� ����.
	bool	bIsRead;
	uint32	nExpiringTimeSec;
	bool	bHasText;
	int		nAppendedMoney;

	// Unittest ��
	bool operator == (const TD_MAIL_MAILBOX_MAIL_INFO& other) const
	{
		if (uidMail != other.uidMail)	return false;
		if (nType != other.nType)		return false;
		if (0 != _tcsncmp(strSenderName, other.strSenderName, _countof(strSenderName)))	return false;
		if (0 != _tcsncmp(strMailTitle, other.strMailTitle, _countof(strMailTitle)))	return false;
		if (nAppendedItemID != other.nAppendedItemID)	return false;
		if (bIsRead != other.bIsRead)					return false;
		if (nExpiringTimeSec != other.nExpiringTimeSec)	return false;
		if (bHasText != other.bHasText)					return false;
		if (nAppendedMoney != other.nAppendedMoney)		return false;
		
		return true;		
	}
};

struct TD_MAIL_POST_REQ_INFO
{
	TCHAR	strReceiverName[PLAYER_NAME_LEN+1];
	TCHAR	strMailTitle[MAX_MAIL_TITLE_LEN+1];	
	int		nAppendedMoney;
	/// ����, ÷�� ������ ������ ���� Ŀ�ǵ��� ���� �Ķ���ͷ� ������.

	TD_MAIL_POST_REQ_INFO()
	{
		strReceiverName[0] = _T('\0');
		strMailTitle[0] = _T('\0');
		nAppendedMoney = 0;
	}

	// Unittest ��
	bool operator == (const TD_MAIL_POST_REQ_INFO& other) const
	{
		if (0 != _tcsncmp(strReceiverName, other.strReceiverName, _countof(strReceiverName)))	return false;
		if (0 != _tcsncmp(strMailTitle, other.strMailTitle, _countof(strMailTitle)))			return false;
		if (nAppendedMoney != other.nAppendedMoney)												return false;

		return true;
	}
};

struct TD_MAIL_CONTENT_INFO
{
	MUID	uidMail;
	int		nAppendedMoney;
	/// ���� Text �� ���� Ŀ�ǵ��� ���� �Ķ���ͷ� ������.
	/// ÷�� ������ ������ ���� Ŀ�ǵ��� ���� �Ķ���ͷ� ������.

	bool operator == (const TD_MAIL_CONTENT_INFO& other) const
	{
		if (uidMail != other.uidMail)	return false;
		if (nAppendedMoney != other.nAppendedMoney)	return false;

		return true;
	}
};

struct TD_MAIL_NEW_NOTIFICATION_INFO
{
	TCHAR	strSenderName[PLAYER_NAME_LEN+1];

	TD_MAIL_NEW_NOTIFICATION_INFO()
	{
		strSenderName[0] = _T('\0');
	}
};


//////////////////////////////////////////////////////////////////////////
//	���� ����
//
struct TD_WORLD_INFO
{
	int			nID;
	TCHAR		strName[WORLD_NAME_LEN + 1];
	TCHAR 		strIP[IP_STRING_LEN + 1];
	int			nCurrentPlayerCount;
	int			nMaxPlayerCount;
	int			nType;	
	int			nOrderNum;
};	


//////////////////////////////////////////////////////////////////////////
//	������
//

struct TD_DEBUG_SPHERE
{
	vec3	vPoint;
	int		nRange;
};

struct TD_DEBUG_POS
{
	vec3	vPoint;
	vec3	vDir;
	MUID	uidTarget;
	MUID	uidOwner;

};

struct TD_DEBUG_NPCLOG
{
	TCHAR		szText[70];
};

struct TD_CAPSULE
{
	MVector3	bottom;
	MVector3	top;
	float		height;
	float		radius;
};

struct TD_TRADEMARKETITEM
{
	TD_TRADEMARKETITEM(int64 dbSerialID,int itemTypeID,int itemCount,int itemPrice)
		: dbid(dbSerialID), typeID(itemTypeID), count(itemCount), price(itemPrice) {}

	bool operator == (const TD_TRADEMARKETITEM& other) const
	{
		if (dbid != other.dbid) return false;
		if (typeID != other.typeID) return false;
		if (count != other.count) return false;
		if (price != other.price) return false;
		return true;
	}

	bool operator < (const TD_TRADEMARKETITEM& other) const
	{
		return price < other.price;
	}

	int64	dbid;
	int		typeID;
	int		count;
	int		price;
};

#pragma pack(pop, old)


#endif