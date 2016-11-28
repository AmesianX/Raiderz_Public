#ifndef _CCOMMAND_RESULT_TABLE_H
#define _CCOMMAND_RESULT_TABLE_H

inline bool IsCommandResult_Party(int nResult);
inline bool IsCommandResult_Guild(int nResult);
inline bool IsCommandResult_Msg(int nResult);

enum CCommandResultTable
{
	CR_FAIL										= 0,		// �����Ͽ����ϴ�.
	CR_SUCCESS									= 1,		// �����Ͽ����ϴ�.
	
	// SYSTEM
	CR_FAIL_SYSTEM_INVALID_PC_UID				= 11,		// �߸��� �÷��̾� UID �Դϴ�.
	CR_FAIL_SYSTEM_INVALID_NPC_UID				= 12,		// �߸��� NPC UID �Դϴ�.
	CR_FAIL_SYSTEM_INVALID_TALENT_ID			= 13,		// �߸��� �ŷ�Ʈ ID �Դϴ�.
	CR_FAIL_SYSTEM_INVALID_ITEM_ID				= 14,		// �߸��� ������ ID �Դϴ�.
	CR_FAIL_SYSTEM_NOT_PLUS_QUANTITY			= 15,		// ��� ������ �ƴմϴ�.
	CR_FAIL_SYSTEM_INVALID_SOULBINDING_ID		= 17,		// �߸��� �ҿ� ���ε� ID �Դϴ�.
	CR_FAIL_SYSTEM_INVALID_FIELD_ID				= 18,		// �߸��� �ʵ� ID �Դϴ�.
	CR_FAIL_SYSTEM_INVALID_MARKER_ID			= 19,		// �߸��� ��Ŀ ID �Դϴ�.
	CR_FAIL_SYSTEM_INVALID_QUEST_ID				= 20,		// �߸��� ����Ʈ ID �Դϴ�.
	CR_FAIL_SYSTEM_CANT_HAVE_TWO_UNIQUE_ITEM	= 21,		// ����ũ �������� �� ���� ������ �� �ֽ��ϴ�.
	CR_FAIL_SYSTEM_EMPTY_DURABILITY				= 22,		// �������� 0�Դϴ�.
	CR_FAIL_SYSTEM_NOT_LEARNED_TALENT			= 24,		// ����� ���� �ŷ�Ʈ�Դϴ�.
	CR_FAIL_SYSTEM_TARGET_IS_INTERACTING		= 25,		// ������ ���ͷ������Դϴ�.
	CR_FAIL_SYSTEM_TARGET_IS_TRADING			= 26,		// ������ �ŷ� ���Դϴ�.
	CR_FAIL_SYSTEM_TARGET_IS_LOOTING			= 27,		// ������ ���� ���Դϴ�.
	CR_FAIL_SYSTEM_TARGET_IS_CUTSCENING			= 28,		// ������ �ƽ� ���Դϴ�.
	CR_FAIL_SYSTEM_TARGET_IS_DUELING			= 29,		// ������ ���� ���Դϴ�.
	CR_FAIL_SYSTEM_TARGET_IS_NOWCOMBAT			= 30,		// ������ ���� ���Դϴ�.
	CR_FAIL_SYSTEM_FEW_INVENTORY				= 31,		// ���濡 ���� ������ �����մϴ�.
	CR_FAIL_SYSTEM_OVER_MONEY					= 32,		// �ݾ��� ���� �ѵ��� �ʰ��� �����Դϴ�.
	CR_FAIL_SYSTEM_NOT_EXIST_ITEM				= 33,		// �������� �ʴ� ������ �Դϴ�.
	CR_FAIL_SYSTEM_TOO_SHORT_NAME_LEN			= 34,		// �̸��� �ʹ� ª���ϴ�.
	CR_FAIL_SYSTEM_TOO_LONG_NAME_LEN			= 35,		// �̸��� �ʹ� ��ϴ�.
	CR_FAIL_SYSTEM_CONTAIN_NUMBER_OR_SPACE		= 36,		// �̸��� ���ڳ� ������ �� �� �����ϴ�.
	CR_FAIL_SYSTEM_CONTAIN_INVALID_CHARACTER	= 37,		// �̸��� ����� ���ڳ� Ư�����ڰ� �� �� �����ϴ�.
	CR_FAIL_SYSTEM_MIXING_LANGUAGE				= 38,		// �̸��� ����� �ѱ��� ȥ���ؼ� ����� �� �����ϴ�.
	CR_FAIL_SYSTEM_NUMBER_ONLY					= 39,		// �̸��� ���ڸ����� ������ �� �����ϴ�.
	CR_FAIL_SYSTEM_NAME_INCLUDE_INVALID_STRING	= 40,		// �̸��� ����� �� ���� ���ڰ� ���ԵǾ� �ֽ��ϴ�.
	CR_FAIL_SYSTEM_CONTAIN_ALPHABETLESS			= 41,		// �̸��� Ư����ȣ�� ����� �� �����ϴ�.
	CR_FAIL_SYSTEM_NOT_ENOUGH_MONEY				= 42,		// �������� �����մϴ�.
	CR_FAIL_SYSTEM_NOT_ENOUGH_STORAGEMONEY		= 43,		// �����Կ� �ִ� ���� �����մϴ�.
	CR_FAIL_SYSTEM_OVER_DEPOSIT_MONEY			= 44,		// �Ա� �ϱ⿡ �ʹ� ū ���Դϴ�.
	CR_FAIL_SYSTEM_OVER_WITHDRAW_MONEY			= 45,		// ��� �ϱ⿡ �ʹ� ū ���Դϴ�.

	/*
	<RESULT key="46" string="That player is currently using the Makeover Salon." />
	*/


	// COMMON
	CR_FAIL_CONNECT								= 999,		// ������ ������ ���������ϴ�.


	// LOGIN
	CR_FAIL_LOGIN_COMMAND_INVALID_VERSION					= 1001,		// ������ Ŭ���̾�Ʈ�� ������ �ٸ��ϴ�.
	CR_FAIL_LOGIN											= 1002,		// �α��ο� �����߽��ϴ�.
	CR_FAIL_MOVE_GAME_SERVER								= 1003,		// ���� �̵��� �����߽��ϴ�.
	CR_SUCCESS_LOGIN_GAME_SERVER_RETRY						= 1004,		// (��õ� ó��)
	CR_FAIL_LOGIN_GAME_SERVER_NOT_FOUND						= 1005,		// ���� ���ӿ� �����߽��ϴ�. ������ ã�� �� �����ϴ�.
	CR_FAIL_LOGIN_POST_DB									= 1006,		// �α��� DB ��û�� �����߽��ϴ�.
	CR_FAIL_LOGIN_NOT_EXIST_USER							= 1007,		// �������� �ʴ� ������Դϴ�.
	CR_FAIL_LOGIN_INVALID_CHAR_INFO							= 1008,		// ������ ĳ���� ������ ��ȿ���� �ʽ��ϴ�.
	CR_FAIL_LOGIN_SERVERS_ARE_STARTING						= 1009,		// ������ ���� ���Դϴ�. ��� �� �ٽ� ������ �ֽñ� �ٶ��ϴ�.
	CR_FAIL_DUPLICATED_PLAYER_LOGIN							= 1010,		// �ٸ� ������ �ߺ����� �α����Ͽ� ������ �����մϴ�.
	CR_INFO_LOGIN_KICKING_DUPLICATED_PLAYER					= 1011,		// �ߺ����� ������ �÷��̾ ó�� ���Դϴ�. ��� ��ٸ��ø� �ڵ� �α��� ó�� �˴ϴ�. �� �� ���� �ɸ� �� �ֽ��ϴ�. ������ �����Ͻ÷��� �Ʒ� [�ݱ�] ��ư�� Ŭ���Ͻñ� �ٶ��ϴ�.
	CR_FAIL_LOGIN_WORLD_IS_FULL								= 1012,		// ���尡 ��ȭ �����Դϴ�. ��� �� �ٽ� ������ �ֽñ� �ٶ��ϴ�.
	CR_FAIL_LOGIN_INVALID_PLAYER_WORLD_INFO					= 1013,		// �÷��̾��� ���� ������ �ùٸ��� �ʽ��ϴ�. �ٽ� ������ �ֽñ� �ٶ��ϴ�.
	CR_FAIL_LOGIN_NOT_STAND_ALONE_SERVER					= 1014,		// Stand-alone ������ �ƴմϴ�. ���� ���ڸ� Ȯ���� �ֽñ� �ٶ��ϴ�.
	CR_FAIL_LOGIN_INVALID_ID_OR_PASSWORD					= 1015,
	CR_FAIL_LOGIN_PROHIBITED_ACCOUNT						= 1016,
	CR_FAIL_LOGIN_REGION_OFF_LIMIT							= 1017,
	CR_FAIL_LOGIN_REQUIRE_TESTER_KEY						= 1018,
	CR_FAIL_LOGIN_PROCESS_DUPLICATED_PLAYER_1ST_ATTEMPT		= 1019,
	CR_FAIL_LOGIN_PROCESS_DUPLICATED_PLAYER_2ND_ATTEMPT		= 1020,
	CR_FAIL_LOGIN_PROCESS_DUPLICATED_PLAYER_3RD_ATTEMPT		= 1021,
	CR_FAIL_LOGIN_PROCESS_DUPLICATED_PLAYER					= 1022,
	CR_FAIL_LOGIN_CHAR_LIST_ERROR							= 1023,

	/*
	<RESULT key="1024" string="The login server is busy. Please try again." />
	<RESULT key="1025" string="Block players from logging in 5 minutes before shutting down game server." />
	<RESULT key="1026" string="Invalid parameter." />
	<RESULT key="1027" string="Invalid token." />
	<RESULT key="1028" string="Too frequent login attempts." />
	*/


	// FIELD
	CR_FAIL_ENTER_FIELD							= 1101,		// �ش� �ʵ�� �̵��� �����߽��ϴ�.
	CR_FAIL_ENTER_FIELD_PROCEED_COMBAT			= 1102,		// �ش� �ʵ�� ������ ���� ���̶� ������ �� �����ϴ�.
	CR_FAIL_ENTER_FIELD_PROCEED_INTERMISION		= 1103,		// �ش� �ʵ�� ���� �Ұ����� ���¶� ������ �� �����ϴ�.
	CR_FAIL_EXIT_FIELD_PROCEED_COMBAT			= 1104,		// ���� �߿� �ʵ带 ���� �� �����ϴ�.


	// CHAR
	CR_FAIL_CHAR_EXIST_CHAR_NAME				= 1201,		// �̹� ���� �̸��� �ֽ��ϴ�.	
	CR_FAIL_CHAR_LIMIT_CHAR_SLOT_COUNT			= 1202,		// ���� ĳ���͸� ���� �� �����ϴ�.
	CR_FAIL_CHAR_ALEADY_RESERVED_CONNECTION		= 1203,		// �̹� ���Ӽ��� ���� ������ �Ǿ� �ֽ��ϴ�.
	CR_FAIL_CHAR_TIMEOUT						= 1204,		// ĳ���� ���� ó�� ��û�� ���� ������ �ʾ��� ����ó�� �Ǿ����ϴ�.	
	CR_FAIL_CHAR_INVALID_PARAMETER				= 1205,		// ����� �� ���� ĳ���� ������ �ֽ��ϴ�.
	CR_FAIL_CHAR_POST_INSERT_DB					= 1206,		// ĳ���͸� �߰��ϴµ� DB�� ������ �� �����ϴ�.	
	CR_FAIL_CHAR_CANNOT_DELETE_GUILDMASTER_CHAR	= 1207,		// ��帶���� ĳ���ʹ� ���� �� �� �����ϴ�. ��� ������ ������ �絵 �ϼ���.


	// EQUIP
	CR_FAIL_EQUIP_NEED_CONDITION				= 1301,		// �� �������� ������ �� �ִ� ������ �������� �ʽ��ϴ�.	|system_male_7
	CR_FAIL_EQUIP_NEED_LICENSE					= 1302,		// �����Ϸ��� ���̼����� �ʿ��մϴ�.	|system_male_7
	CR_FAIL_EQUIP_INVALID_ITEMSLOT				= 1303,		// �߸��� ������ �������Դϴ�.
	CR_FAIL_EQUIP_ALREADY						= 1304,		// �̹� ������ �������Դϴ�.


	// TRAINING
	CR_FAIL_TRAINING_CONDITION_CHECK_FAIL		= 1401,		// �ش� �ŷ�Ʈ�� ��� �� �ִ� ������ ���� ��Ű�� ���߽��ϴ�.
	CR_FAIL_TRAINING_ALREADY_LEARNED			= 1402,		// �̹� ��� �ŷ�Ʈ�Դϴ�.
	CR_FAIL_TRAINING_NOT_ENOUGH_TP				= 1403,		// TP�� �����ؼ� ��� �� �����ϴ�.
	CR_FAIL_TRAINING_NEED_LEVEL					= 1404,		// ������ �����ؼ� ��� �� �����ϴ�.
	CR_FAIL_TRAINING_NEED_LINE					= 1405,		// ���� �ŷ�Ʈ ������ ����� �ʾƼ� ��� �� �����ϴ�.
	CR_FAIL_TRAINING_NEED_STYPE_TP				= 1406,		// ��Ÿ�Ͽ� ���ڵ� TP�� ��� ��� �� �����ϴ�.
	CR_FAIL_TRAINING_NOT_LEARNED_TALENT			= 1407,		// �н��� �ŷ�Ʈ�� �ƴմϴ�.
	CR_FAIL_TRAINING_EXIST_TNEED_TALENT			= 1408,		// �ش� �ŷ�Ʈ�� �������� �ʿ��� �ŷ�Ʈ�� �ֽ��ϴ�.
	CR_FAIL_TRAINING_EXIST_HIGH_RANK_TALENT		= 1409,		// ���� ��ũ�� �ŷ�Ʈ�� �ֽ��ϴ�.
	CR_FAIL_TRAINING_NEED_USEITEM				= 1410,		// ������ ����� ���ؼ��� ��� �� �ֽ��ϴ�.
	CR_FAIL_TRAINING_CONSUMETP_ZERO_NOT_UNTRAIN	= 1411,		// TP�� �Ҹ����� �ʴ� �ŷ�Ʈ�� ���� �� �����ϴ�.
	CR_FAIL_TRAINING_NOT_UNTRAINABLE_TALENT		= 1412,		// �ʱ�ȭ�� �� ���� �ŷ�Ʈ�Դϴ�.
	CR_FAIL_TRAINING_NEED_EXTRAPASSIVE_HYBRID	= 1413,

	/*
	<RESULT key="1414" string="Only the newly created characters can learn the this style" />
	*/
	
	
	// TRADE
	CR_FAIL_TRADE_PUTUP_OVER_ITEM				= 1501,		// �����ϰ� �ִ� �����ۺ��� �� ���� �������� �ø� �� �����ϴ�.
	CR_FAIL_TRADE_PUDOWN_OVER_ITEM				= 1502,		// �ŷ�â�� �ִ� �����ۺ��� �� ���� �������� ���� �� �����ϴ�.
	CR_FAIL_TRADE_PUTUP_OVER_MONEY				= 1503,		// ������ �ִ� ������ �� ���� ���� �ŷ�â�� �ø� �� �����ϴ�.
	CR_FAIL_TRADE_NOT_TRADING					= 1504,		// ���� �ŷ� ���� �ƴմϴ�.
	CR_FAIL_TRADE_OVER_MAX_TRADE_SAPCE			= 1505,		// �ŷ�â�� �ø� �� �ִ� �ִ� �������� �������� �� ���� �ø� �� �����ϴ�.
	CR_FAIL_TRADE_TARGET_DISTANCE				= 1506,		// �ŷ� �Ϸ��� �÷��̾�� �� �� ������ ���� �ŷ� �� �� �ֽ��ϴ�.
	CR_FAIL_TRADE_OPPONENT_IS_BUSY				= 1507,		// ������ �ŷ� ��û�� ���� �� ���� �����Դϴ�.
	CR_FAIL_TRADE_PUTUP_NOT_TRADABLE_ITEM		= 1508,		// �ŷ� �Ұ����� �������� �ŷ�â�� �ø� �� �����ϴ�.
	CR_FAIL_TRADE_TARGET_CANT_TAKE_THISITEM		= 1509,		// ������ ������ �����ϰų�, ������ ���� �� ���� �������Դϴ�.
	CR_FAIL_TRADE_TARGET_CANT_TAKE_THISMONEY	= 1510,		// ������ �ݾ׺��� �ѵ��� �ʰ��ϴ� ���Դϴ�.

	// NPCSHOP
	CR_FAIL_NPCSHOP_NOT_BUYABLE_ITEM			= 1601,		// ���ο��Լ� �� �� ���� �������Դϴ�.
	CR_FAIL_NPCSHOP_SELL_OVER_ITEM				= 1602,		// ���ο��� �������� ������ ���� �� ���� �������� �� �� �����ϴ�.
	CR_FAIL_NPCSHOP_TARGET_DISTANCE				= 1603,		// ���ο��� �� �� ������ ���� �ŷ� �� �� �ֽ��ϴ�.
	CR_FAIL_NPCSHOP_NOT_EXIST_ITEM_IN_INVEN		= 1604,		// �κ��丮�� ���� �������� �� �� �����ϴ�.
	CR_FAIL_NPCSHOP_NOT_ENOUGH_MONEY			= 1605,		// ���� �����մϴ�.					|system_male_1
	CR_FAIL_NPCSHOP_NOT_NPCTRADING				= 1606,		// ���ΰ� �ŷ� ���� �ƴմϴ�.
	CR_FAIL_NPCSHOP_NOT_MERCHANT				= 1607,		// ������ �ƴ� NPC�� �ŷ� �� �� �����ϴ�.
	CR_FAIL_NPCSHOP_CONDITION_CHECK_FAIL		= 1608,		// �ŷ� ������ ������ ���� ��Ű�� ���߽��ϴ�.
	CR_FAIL_NPCSHOP_NOT_REPAIRER				= 1609,		// ���� �� �� �ִ� ������ �ƴմϴ�.
	CR_FAIL_NPCSHOP_NOT_SELLABLE_ITEM			= 1610,		// ���ο��� �� �� ���� �������Դϴ�.
	CR_FAIL_NPCSHOP_NOT_REPAIRABLE_ITEM			= 1611,


	// PARTY
	CR_BOUNDARY_PARTY_BEGIN,

	CR_FAIL_PARTY_FULL_PARTY							= 1701,		// ��Ƽ�� �� á���ϴ�.
	CR_FAIL_PARTY_NOT_PARTY_LEADER						= 1702,		// ��Ƽ ������ �ƴմϴ�.
	CR_FAIL_PARTY_INVALID_PARTY							= 1703,		// ��ȿ���� ���� ��Ƽ�Դϴ�.
	CR_FAIL_PARTY_NOT_IN_PARTY							= 1704,		// ����� ��Ƽ�� �������� �ʽ��ϴ�.
	CR_FAIL_PARTY_TARGET_NOT_IN_PARTY					= 1705,		// ������ ��Ƽ�� �������� �ʽ��ϴ�.
	CR_FAIL_PARTY_ALEADY_HAS_PARTY						= 1706,		// ����� �̹� ��Ƽ�� �ֽ��ϴ�.
	CR_FAIL_PARTY_TARGET_ALEADY_HAS_PARTY				= 1707,		// ������ �̹� ��Ƽ�� �ֽ��ϴ�.
	CR_FAIL_PARTY_NOT_INVITE_SELF						= 1708,		// �ڱ� �ڽ��� �ʴ��� �� �����ϴ�.
	CR_FAIL_PARTY_NOT_SAME_PARTY						= 1709,		// ���� ��Ƽ�� �ƴմϴ�.
	CR_FAIL_PARTY_REFUSE_INVITATION						= 1710,		// ������ ��Ƽ ��û�� �����Ͽ����ϴ�.
	CR_FAIL_PARTY_REFUSE_INVITATION_FOR_ME				= 1711,		// ������ ��Ƽ ��û�� �����Ͽ����ϴ�.
	CR_FAIL_PARTY_KICK_SELF								= 1712,		// �ڱ� �ڽ��� �߹��ų �� �����ϴ�.
	CR_FAIL_PARTY_CHANGE_SAME_LEADER					= 1713,		// ���� ������ ���ο� ������ �Ӹ��� �� �����ϴ�.
	CR_FAIL_PARTY_OPPONENT_IS_BUSY						= 1714,		// ������ ��Ƽ ��û�� ���� �� ���� ���� �Դϴ�.

	CR_FAIL_PARTY_OPPONENT_IS_DUEL						= 1715,		// ���� ���� ����� ��Ƽ �ʴ��� �� �����ϴ�.
	CR_FAIL_PARTY_OPPONENT_IN_PVPAREA					= 1716,		// PVP������ �ִ� ����� ��Ƽ �ʴ��� �� �����ϴ�.
	CR_FAIL_PARTY_OPPONENT_IN_BATTLEARENA				= 1717,		// ���忡 �ִ� ����� ��Ƽ �ʴ��� �� �����ϴ�.

	CR_FAIL_PARTY_REQUESTER_IS_DUEL						= 1718,		// ���� ���� ���� ��Ƽ �ʴ븦 �� �� �����ϴ�.
	CR_FAIL_PARTY_REQUESTER_IN_PVPAREA					= 1719,		// PVP������ �������� ��Ƽ �ʴ븦 �� �� �����ϴ�.
	CR_FAIL_PARTY_REQUESTER_IN_BATTLEARENA				= 1720,		// ���忡 �������� ��Ƽ �ʴ븦 �� �� �����ϴ�.

	CR_FAIL_PARTY_RESPONDER_IS_DUEL						= 1721,		// ���� ���� ���� ��Ƽ �ʴ뿡 ������ �� �����ϴ�.
	CR_FAIL_PARTY_RESPONDER_IN_PVPAREA					= 1722,		// PVP������ �������� ��Ƽ �ʴ뿡 ������ �� �����ϴ�.
	CR_FAIL_PARTY_RESPONDER_IN_BATTLEARENA				= 1723,		// ���忡 �������� ��Ƽ �ʴ뿡 ������ �� �����ϴ�.


	CR_FAIL_PARTY_PLAYER_IS_BUSY						= 1724,		// ��Ƽ ��û�� �� �� ���� �����Դϴ�.
	CR_FAIL_PARTY_RESPOND_PLAYER_IS_BUSY				= 1725,		// �ٸ� ���� �߿� ��Ƽ ��û�� ������ �� �����ϴ�.
	CR_FAIL_PARTY_NOT_INVITE_TO_PLAYER_IN_TRIALFIELD	= 1726,		// ���� �ʵ忡 �ִ� �÷��̾�� �ʴ��� �� �����ϴ�.
	CR_FAIL_PARTY_INVALID_SETTING						= 1727,		// �߸��� ��Ƽ �����Դϴ�.

	CR_FAIL_PARTY_INVALID_INVITEE						= 1728,
	CR_FAIL_PARTY_CANNOT_LEAVE_PARTY_WHILE_DUELING		= 1729,

	/*
	<RESULT key="1730" string="You cannot send a party request when the Battle Arena is in progress." />
	<RESULT key="1731" string="You cannot leave your party during a Guild Battle." />
	<RESULT key="1732" string="You cannot banish a party member during a Guild Battle." />
	<RESULT key="1733" string="You cannot invite the enemy to your party in PvP areas." />
	*/

	CR_BOUNDARY_PARTY_END,


	// LOOT
	CR_FAIL_LOOT_NOT_EXIST_DROPITEM				= 1801,		// ȹ���� ����ǰ�� �����ϴ�.
	CR_FAIL_LOOT_TARGET_DISTANCE				= 1802,		// ����ǰ�� ȹ���� ��󿡰� �� �� ������ ���� �մϴ�.
	CR_FAIL_LOOT_NOT_LOOTING					= 1803,		// ����ǰ ȹ�� ���� �ƴմϴ�.
	CR_FAIL_LOOT_ALREADY_OTHER_INTERACT_LOOTING	= 1804,		// �̹� �ٸ� ����� ����ǰ�� ȹ���ϰ� �ֽ��ϴ�.
	CR_FAIL_LOOT_ALREADY_OTHER_GATHERING		= 1805,		// �̹� �ٸ� ����� ä���ϰ� �ֽ��ϴ�.
	CR_FAIL_LOOT_NOT_EXIST_ITEM					= 1806,		// �������� �ʴ� ����ǰ�Դϴ�.
	CR_FAIL_LOOT_NOT_MASTERLOOTABLE_ITEM		= 1809,		// ������ ������ ������ ����ǰ�� �ƴմϴ�.
	CR_FAIL_LOOT_MASTERLOOT_POSSIBLE_ONLY_MASTER= 1810,		// ������ ������ �����͸� �� �� �ֽ��ϴ�.
	CR_FAIL_LOOT_NOT_MASTERLOOTABLE_PLAYER		= 1811,		// ������ �������� �������� �ǳ��� �� �ִ� �÷��̾ �ƴմϴ�.
	CR_FAIL_LOOT_MASTER_FAR_DISTANCE			= 1812,		// �����Ͱ� �ָ� �־ �������� ����� �� �����ϴ�.
	CR_FAIL_LOOT_GATHER_NEED_GATHERTOOL			= 1814,		// ä���� �Ϸ��� ä�� ������ �ʿ��մϴ�.			|system_male_9
	CR_FAIL_LOOT_GATHER_NEED_TRAINING			= 1815,		// ä���� �Ϸ��� Ž�谡 ������ �о�� �մϴ�.		|system_male_10
	CR_FAIL_LOOT_GATHER_NEED_HIGHER_TRAINING	= 1816,		// ���� ������ Ž�谡 ������ �о�� �մϴ�.			|system_male_10

	/*
	<RESULT key="1817" string="Failed to loot items since you have waited too long before looting the gathered items." />
	*/
		
	
	// MSG
	CR_BOUNDARY_MSG_BEGIN,

	CR_FAIL_MSG_NO_WHISPER_RECEIVER				= 1901,		// ����� �������� �ʾҰų� �߸��� �̸��Դϴ�.
	CR_FAIL_MSG_ALREADY_EXIST_CHANNEL_NAME		= 1902,		// �̹� ���� �̸��� ä���� �ֽ��ϴ�.
	CR_FAIL_MSG_NOT_PRIVATE_CHANNEL				= 1903,		// ���� ä�ο����� ����� �� ���� ����Դϴ�.
	CR_FAIL_MSG_NOT_HOST						= 1904,		// ������ �ƴմϴ�.
	CR_FAIL_MSG_NOT_BANED						= 1905,		// �߹���� �÷��̾ �ƴմϴ�.
	CR_FAIL_MSG_BANED_CHANNEL					= 1906,		// ������ �� �����ϴ�. �߹���� ä���Դϴ�.
	CR_FAIL_MSG_NOT_EXIST_PLAYER				= 1907,		// �ش� �÷��̾ �����ϴ�.
	CR_FAIL_MSG_NOT_EXIST_CHANNEL				= 1908,		// �ش� ä���� �����ϴ�.
	CR_FAIL_MSG_ALREADY_ENTERED_CHANNEL			= 1909,		// �̹� ������ ä���Դϴ�.
	CR_FAIL_MSG_NOT_ENTERED_CHANNEL				= 1910,		// �������� ���� ä���Դϴ�.
	CR_FAIL_MSG_WRONG_TARGET					= 1911,		// ����� �ùٸ��� �ʽ��ϴ�.
	CR_FAIL_MSG_OVER_CHATTING_CHANNEL_NAME		= 1912,		// ä�� �̸��� �ʹ� ��ϴ�.
	CR_FAIL_MSG_LIMIT_ENTER_PRIVATE_CHANNEL		= 1913,		// ���� �缳 ä�ο� ������ �� �����ϴ�.
	CR_FAIL_MSG_ABUSE_MSG						= 1914,		// �������� �ܾ ���ԵǾ� �ֽ��ϴ�.
	CR_FAIL_MSG_LIMIT_AUCTION_MSG_TIME			= 1915,		// �ŷ� ä���� 1�п� �ѹ��� ��� �����մϴ�.

	CR_FAIL_MSG_BANNED_FOR_A_MINUTE				= 1916,
	CR_FAIL_MSG_LIMIT_FIELD_MSG_TIME			= 1917,

	CR_BOUNDARY_MSG_END,


	// ITEM
	CR_FAIL_ITEM_NOT_EXIST_IN_INVENTORY			= 2001,		// �κ��丮�� �������� �����ϴ�.				|system_male_8
	CR_FAIL_ITEM_USE_NOTENOUGH_COOLDOWN			= 2002,		// �������� ����Ϸ��� ���� �� ��ٷ��� �մϴ�.	|system_male_8
	CR_FAIL_ITEM_NOT_REMOVABLE					= 2003,		// ���� �� ���� �������Դϴ�.
	CR_FAIL_ITEM_NOT_ADD_OVER_MAXSTACK			= 2004,		// �ѹ��� �ִ� ���� �������� ���� ȹ�� �� �� �����ϴ�.
	CR_FAIL_ITEM_NEED_CONDITION					= 2005,		// �� �������� ���� ������� ���մϴ�.			|system_male_8
	CR_FAIL_ITEM_SORT_INVENTORY					= 2006,

	/*
	<RESULT key="2008" string="This item is only available in battlefields." />
	*/


	// INTERACTION
	CR_FAIL_INTERACTION_NOT_INTRACTABLE_NPC		= 2101,		// ��ȣ�ۿ��� �� ���� NPC �Դϴ�.
	CR_FAIL_INTERACTION_NOT_LIVING_NPC			= 2102,		// ���� NPC�ʹ� ��ȣ�ۿ� �� �� �����ϴ�.


	// USE_TALENT
	CR_FAIL_USE_TALENT							= 2201,		// �ŷ�Ʈ�� ����� �� �����ϴ�.					|system_male_2
	CR_FAIL_USE_TALENT_NOTENOUGH_COOLDOWN		= 2202,		// �ŷ�Ʈ�� ������ ���� �� ��ٷ��� �մϴ�.		|system_male_3
	CR_FAIL_USE_TALENT_NOTENOUGH_HP				= 2203,		// �ŷ�Ʈ�� ���⿡ ������� ������� �ʽ��ϴ�.	|system_male_4
	CR_FAIL_USE_TALENT_NOTENOUGH_EN				= 2204,		// �ŷ�Ʈ�� ���⿡ ���ŷ��� ������� �ʽ��ϴ�.	|system_male_5
	CR_FAIL_USE_TALENT_NOTENOUGH_STA			= 2205,		// �ŷ�Ʈ�� ���⿡ ����� ������� �ʽ��ϴ�.	|system_male_6
	CR_FAIL_USE_TALENT_PASSIVE					= 2206,		// �нú� �ŷ�Ʈ�� ����� �� �����ϴ�.
	CR_FAIL_USE_TALENT_NOFOCUS					= 2207,		// �ŷ�Ʈ�� ���⿡ �ʿ��� ��Ŀ���� �����ϴ�.
	CR_FAIL_USE_TALENT_ALREADY_RUNNING			= 2208,		// �̹� �ŷ�Ʈ�� ��� ���Դϴ�.
	CR_FAIL_USE_TALENT_DISABLED					= 2209,		// ������ �ŷ�Ʈ�� ����� �� �����ϴ�.
	CR_FAIL_USE_TALENT_NOTENOUGH_SPEED			= 2210,		// �ŷ�Ʈ�� ����ϱ⿡ �̵� �ӵ��� ������� �ʽ��ϴ�.
	CR_FAIL_USE_TALENT_NONCOMBAT_ONLY			= 2211,		// ������ �߿��� ����� �� �ִ� �ŷ�Ʈ�Դϴ�.
	CR_FAIL_USE_TALENT_GM_ONLY					= 2212,		// ��ڸ� ����� �� �ִ� �ŷ�Ʈ�Դϴ�.
	CR_FAIL_USE_TALENT_NOTUSE_IN_THISFIELD		= 2213,		// ���� �ʵ忡�� ����� �� ���� �ŷ�Ʈ�Դϴ�.
	CR_FAIL_USE_TALENT_NEED_BUFF				= 2214,

	// QUEST
	CR_FAIL_QUEST_NOT_REPEATABLE_QUEST			= 2302,		// �ݺ� �� �� ���� ����Ʈ �Դϴ�.
	CR_FAIL_QUEST_NOT_HAVE_QUEST				= 2304,		// ���� ���� ����Ʈ�� �ƴմϴ�.
	CR_FAIL_QUEST_NOT_COMPLETE_QUEST			= 2305,		// �Ϸ��� ����Ʈ�� �ƴմϴ�.
	CR_FAIL_QUEST_NOT_TAKABLE_QUEST				= 2306,		// ���� �� �ִ� ����Ʈ�� �ƴմϴ�.
	CR_FAIL_QUEST_IS_FAILED						= 2308,		// ������ ����Ʈ�Դϴ�.
	CR_FAIL_QUEST_NOT_SELECTABLE_REWARD			= 2310,		// ���� ������ ������ �ƴմϴ�.
	CR_FAIL_QUEST_NOT_CANCELABLE_QUEST			= 2311,		// ����� �� ���� ����Ʈ�Դϴ�.
	CR_FAIL_QUEST_NOT_HAVE_REWARD_NEED_ITEM		= 2312,		// ���� �ʿ��� �������� �����ϴ�.
	CR_FAIL_QUEST_NOT_TAKABLE_SHARE_QUEST		= 2313,		// ������ ����Ʈ�� ���� �� �����ϴ�.
	CR_FAIL_QUEST_TOO_MANY_QUEST_ACCEPTED		= 2314,

	//////////////////////////////////////////////////////////////////////////
	// GUILD
	CR_BOUNDARY_GUILD_BEGIN,

	CR_FAIL_GUILD_ALREADY_JOIN					= 2401,		// �̹� ��忡 ������ �ֽ��ϴ�.
	CR_FAIL_GUILD_EXIST_NAME					= 2402,		// �����ϴ� ���� �Դϴ�.	
	CR_FAIL_GUILD_TOO_LONG_NAME					= 2403,		// ������ �ʹ� ��ϴ�.
	CR_FAIL_GUILD_TOO_SHORT_NAME				= 2404,		// ������ �ʹ� ª���ϴ�.
	CR_FAIL_GUILD_CREATE_NOT_ENOUGH_MONEY		= 2405,		// ��� ������ ���� �մϴ�.
	CR_FAIL_GUILD_NO_JOIN						= 2406,		// ������ ��尡 �����ϴ�.
	CR_FAIL_GUILD_NOT_MASTER					= 2407,		// ��� �����͸� ���� �մϴ�.
	CR_FAIL_GUILD_NOT_INVITED_GUEST				= 2408,		// ��� �ʴ븦 ���� ���� �����ϴ�.
	CR_FAIL_GUILD_MASTER_CANNOT_LEAVE			= 2409,		// Ż���Ϸ��� ��� ������ ������ �ٸ��̿��� �絵�ؾ� �մϴ�.
	CR_FAIL_GUILD_MAX_MEMBER_COUNT				= 2410,		// �ִ� ��� �ο��Դϴ�.
	CR_FAIL_GUILD_NOT_VALID_NAME				= 2411,		// ����� �� ���� �����Դϴ�.
	CR_FAIL_GUILD_GUEST_IS_ENEMY				= 2412,		// �������� ����� ��忡 �ʴ��� �� �����ϴ�.
	CR_FAIL_GUILD_OPPONENT_IS_DUEL				= 2413,		// ���� ���� ����� ��� �ʴ��� �� �����ϴ�.
	CR_FAIL_GUILD_OPPONENT_IN_PVPAREA			= 2414,		// PVP������ �ִ� ����� ��� �ʴ��� �� �����ϴ�.
	CR_FAIL_GUILD_OPPONENT_IN_BATTLEARENA		= 2415,		// ���忡 �ִ� ����� ��� �ʴ��� �� �����ϴ�.
	CR_FAIL_GUILD_SELF_IS_DUEL					= 2416,		// ���� ���� ���� ��� �ʴ뿡 ������ �� �����ϴ�.
	CR_FAIL_GUILD_SELF_IN_PVPAREA				= 2417,		// PVP������ �������� ��Ƽ �ʴ뿡 ������ �� �����ϴ�.
	CR_FAIL_GUILD_SELF_IN_BATTLEARENA			= 2418,		// ���忡 �������� ��Ƽ �ʴ뿡 ������ �� �����ϴ�.
	CR_FAIL_GUILD_NEED_EMPTY_MEMBER				= 2419,		// ������ ���� ������ �ȵ˴ϴ�.
	CR_FAIL_GUILD_CANNOT_MOVE_BINDITEM_TO_STORAGE	= 2420,	// �ͼӵ� �������� ��� ���������� �̵��� �� �����ϴ�.
	CR_FAIL_GUILD_CANNOT_MOVE_PERIODITEM_TO_STORAGE	= 2421,	// �Ⱓ�� �������� ��� ���������� �̵��� �� �����ϴ�.
	CR_FAIL_GUILD_MEMBER_MODIFY_STORAGE			= 2422,		// �ٸ� ������ ��� �������� ���� �߽��ϴ�.

	CR_FAIL_GUILD_INVITEE_IS_BUSY				= 2423,
	CR_FAIL_GUILD_ONLY_GUILDMASTER_CAN_DISBAND_GUILD = 2424,
	CR_FAIL_GUILD_CANNOT_PUT_TWO_UNIQUE_ITEM_INTO_GUILD_STORAGE = 2425,
	CR_FAIL_GUILD_CANNOT_PUT_UNTRADABLE_ITEM	= 2426,

	/*
	<RESULT key="2427" string="You do not have the authority to proceed this command" />
	<RESULT key="2428" string="You cannot promote yourself to guild leader." />
	<RESULT key="2429" string="You cannot promote yourself to a higher rank." />
	<RESULT key="2430" string="You cannot change your own rank." />
	<RESULT key="2431" string="You cannot change to the same rank." />
	<RESULT key="2432" string="You cannot change the rank of an equal or higher rank guild member." />
	<RESULT key="2433" string="You have exceeded the length limit." />
	<RESULT key="2434" string="You cannot remove yourself." />
	<RESULT key="2435" string="You cannot remove an equal or higher rank guild member." />
	<RESULT key="2436" string="You cannot invite that character name." />
	<RESULT key="2437" string="The player has refused the guild invitation." />
	<RESULT key="2438" string="You cannot leave your guild during a Guild Battle." />
	<RESULT key="2439" string="You cannot remove a guild member during a Guild Battle." />
	*/

	CR_BOUNDARY_GUILD_END,
	//////////////////////////////////////////////////////////////////////////

	// DUEL
	CR_FAIL_DUEL_ALREADY_DUELING				= 2501,		// ����� �̹� �������Դϴ�.
	CR_FAIL_DUEL_TARGET_IS_DUELING				= 2502,		// ��밡 �̹� �������Դϴ�.
	CR_FAIL_DUEL_INVALID_FIELD					= 2503,		// ������ �� ���� ����Դϴ�.
	CR_FAIL_DUEL_DONT_DURING_COMBAT				= 2504,		// ���� �߿��� ������ ��û�� �� �����ϴ�.
	CR_FAIL_DUEL_TARGET_IS_COMBATING			= 2505,		// ���� ���� ���Դϴ�.
	CR_FAIL_DUEL_YOUR_BUSY						= 2506,		// �ٸ� �ൿ �߿� ������ ��û�� �� �����ϴ�.
	CR_FAIL_DUEL_OPPONENT_IS_BUSY				= 2507,		// ���� ������ ���� �� ���� �����Դϴ�.
	CR_FAIL_DUEL_OPPONENT_IS_YOU				= 2508,		// �ڱ� �ڽŰ� ���� �� �� �����ϴ�.
	CR_FAIL_DUEL_OPPONENT_IS_ENEMY				= 2509,		// �̹� ���� �������Դϴ�.


	// PALETTE
	CR_FAIL_PALETTE_PUTUP_ONLY_ACTIVE_TALENT	= 2606,		// ��Ƽ�� �ŷ�Ʈ�� �ȷ�Ʈ�� ����� �� �ֽ��ϴ�.
	CR_FAIL_PALETTE_PUTUP_ONLY_USABLE_ITEM		= 2607,		// ��� ������ �����۸� �ȷ�Ʈ�� ����� �� �ֽ��ϴ�.


	// SOUL
	CR_FAIL_SOUL_FULL_AMULET_SOULQUANTITY		= 2650,		// �ֹķ��� ��ȥ�� �� á���ϴ�.


	// BATTLEARENA
	CR_FAIL_BATTLEARENA_NEED_PARTY				= 2701,		// ��Ƽ�� �־�� �����忡 ������ �� �ֽ��ϴ�.
	CR_FAIL_BATTLEARENA_ALREADY_REGISTER		= 2702,		// �̹� ��ϵ� ���� �׷��Դϴ�.
	CR_FAIL_BATTLEARENA_NOT_REGISTER			= 2703,		// ����� ���� ���� ���� �׷��Դϴ�.
	CR_FAIL_BATTLEARENA_ALREADY_PLAYING			= 2704,		// ������ ���� ���� ���� �׷��� ������ ����� �� �����ϴ�.

	/*
	<RESULT key="2705" string="Access hours for Brune's Glory have ended." />
	*/


	// MAIL
	CR_FAIL_MAIL_POST_SELF						= 2801,		// �ڽſ��� ���� ���� �� �����ϴ�.
	CR_FAIL_MAIL_POST_LIMIT_TITLE				= 2802,		// ������ �ʹ� ��ϴ�.
	CR_FAIL_MAIL_POST_LIMIT_TEXT				= 2803,		// ������ �ʹ� ��ϴ�.
	CR_FAIL_MAIL_POST_DB_ERROR					= 2804,		// ���� ������ ������ ���� �� �����ϴ�.
	CR_FAIL_MAIL_POST_DB_FAIL					= 2805,		// �޴� ����� ������ ���� �� �ִ� ���°� �ƴմϴ�.
	CR_FAIL_MAIL_POST_DB_CHECK_FAIL				= 2806,		// �޴� ����� ���¸� �� �� �����ϴ�.
	CR_FAIL_MAIL_POST_DB_CHECK_ERROR			= 2807,		// ���� ������ �޴� ����� ���¸� Ȯ���� �� �����ϴ�.	
	CR_FAIL_MAIL_POST_NOT_FIND_USER				= 2808,		// �޴� ����� �����ϴ�.
	CR_FAIL_MAIL_POST_NOT_SEND_GM				= 2809,		// GM���� ���� ������ ���� �� �����ϴ�.
	CR_FAIL_MAIL_POST_FULL_BOX					= 2810,		// �޴� ����� �������� ��á�ֽ��ϴ�.
	CR_FAIL_MAIL_POST_NOT_ENOUGH_MONEY			= 2811,		// ÷���� ���� �����մϴ�.
	CR_FAIL_MAIL_POST_WRONG_APPENDED_ITEM		= 2812,		// ÷���� �� ���� �������� �߻��߽��ϴ�.

	CR_FAIL_MAIL_APPEND_ITEM_NO_INVENTORY		= 2813,		// �κ��丮�� ���� �������Դϴ�.
	CR_FAIL_MAIL_APPEND_ITEM_NOT_ENOUGH_AMOUNT_UP = 2814,	// ÷���� ������ �����մϴ�.
	CR_FAIL_MAIL_APPEND_ITEM_NOT_ENOUGH_AMOUNT_DOWN = 2815,	// ÷�ε� ������ �����մϴ�.
	CR_FAIL_MAIL_APPEND_ITEM_BIND				= 2816,		// �ͼ� �������� ÷���� �� �����ϴ�.
	CR_FAIL_MAIL_APPEND_ITEM_NOT_TRADABLE		= 2817,		// �ŷ��Ұ� �������� ÷���� �� �����ϴ�.
	CR_FAIL_MAIL_APPEND_ITEM_PERIOD				= 2818,		// �Ⱓ�� �������� ÷���� �� �����ϴ�.
	CR_FAIL_MAIL_APPEND_ITEM_BUSY				= 2819,		// ���� �ٸ� ��ɿ��� ��� ���� �������� ÷���� �� �����ϴ�.
	CR_FAIL_MAIL_APPEND_ITEM_NOT_INTERATION		= 2820,		// ������ ���ͷ��� ���� �ƴմϴ�.
	
	CR_FAIL_MAIL_TAKE_DB_ERROR					= 2821,		// ����� ������ ÷�γ����� �޾ƿ� �� �����ϴ�.
	CR_FAIL_MAIL_NOT_FIND_MAIL					= 2822,		// �ش� ������ ã�� �� �����ϴ�.
	CR_FAIL_MAIL_NO_APPENDED_MONEY				= 2823,		// ÷�ε� ���ӸӴϰ� �����ϴ�.

	CR_FAIL_MAIL_POST_NOT_ENOUGH_POSTAGE		= 2824,		// �������� ���ڸ��ϴ�.
	CR_FAIL_MAIL_APPEND_ITEM_ENCHANT			= 2825,		// ��ȭ�� �������� ÷���� �� �����ϴ�.
	CR_FAIL_MAIL_NOT_ENOUGH_MONEY_STORAGE		= 2826,		// �ִ� ������ �������� ���� ÷�� ���ӸӴϸ� ���� �� �����ϴ�.


	// ENCHANT
	CR_FAIL_ENCHANT_REQ_NOTENOUGH_LEVEL			= 2901,		// ��ȭ����: ������ �����մϴ�.
	CR_FAIL_ENCHANT_REQ_UNABLE_EQUIP_PART		= 2902,		// ��ȭ����: ��ȭ �� �� ���� ��� �����Դϴ�.
	CR_FAIL_ENCHANT_REQ_UNABLE_WEAPON			= 2903,		// ��ȭ����: ��ȭ �� �� ���� �����Դϴ�.
	CR_FAIL_ENCHANT_REQ_NOTENOUGH_SLOT			= 2904,		// ��ȭ����: ��ȭ�� �� �ִ� ������ �����ϴ�.
	CR_FAIL_ENCHANT_REQ_WRONG_AGENT				= 2905,		// ��ȭ����: �˸��� ���� ��ȭ���Դϴ�.
	CR_FAIL_ENCHANT_REQ_ITEM_BUSY				= 2906,		// ��ȭ����: ���� �ٸ� ��ɿ��� ��� ���� �������� ÷���� �� �����ϴ�.

	/*
	<RESULT key="2907" string="Enhancement failed: Cannot enhance this armor." />
	<RESULT key="2908" string="Enchant failed: Enchantment grade low" />
	<RESULT key="2909" string="Enchant failed" />
	<RESULT key="2910" string="Enchant error: There is nothing to enchant." />
	<RESULT key="2911" string="Enchant error: Non-enchantable" />
	<RESULT key="2912" string="Enchant error: There is no enchanting material." />
	<RESULT key="2913" string="Enchant error: This is not an enchanting material." />
	<RESULT key="2914" string="Enchant error: Different level of enchanting material" />
	<RESULT key="2915" string="Enchant error: There is no increasing material." />
	<RESULT key="2916" string="Enchant error: There is no increasing material." />
	<RESULT key="2917" string="Enchant error: This is not an increasing material." />
	<RESULT key="2918" string="Enchant error: Different level of increasing material" />
	<RESULT key="2919" string="Enchant error: There is no stabilizer." />
	<RESULT key="2920" string="Enchant error: This is not a stabilizer." />
	<RESULT key="2921" string="Enchant error: Different level of stabilizer" />
	<RESULT key="2922" string="Enchant error: You do not have enough money for enchanting." />
	<RESULT key="2923" string="Enchant error: Stopping the enchantment. (DB error)" />
	<RESULT key="2924" string="Enchant error: There is nothing to calculate the enchantment rate for." />
	<RESULT key="2925" string="Enchant error: The item to calculate the enchantment rate for is non-enchantable." />
	<RESULT key="2926" string="Enchant error: There is no enchantment rate for the item." />
	<RESULT key="2927" string="Enchant error: There is no enchantment rate for the increasing material." />
	<RESULT key="2928" string="Enchant error: There is no enchantment rate for the stabilizer." />
	<RESULT key="2929" string="Enchant Failed: Incorrect enchant stone." />
	<RESULT key="2930" string="Enchantment error: You have no reducing agent for Enchantment fall" />
	<RESULT key="2931" string="Enchantment error: It is not a reducing agent for Enchantment fall" />
	<RESULT key="2932" string="Enchantment error: The level of reducing agent for Enchantment fall is different" />
	<RESULT key="2941" string="Jewel removal has failed: The item is being used by another feature." />
	<RESULT key="2942" string="Jewel removal has failed: The slot is empty." />
	<RESULT key="2943" string="Jewel removal has failed: Item information of the slot to remove the jewel from is incorrect." />
	<RESULT key="2944" string="Jewel removal has failed: DB request failure." />
	<RESULT key="2945" string="Jewel removal has failed: The item is being used by another feature." />
	<RESULT key="2946" string="Jewel removal has failed: The slot is empty." />
	<RESULT key="2947" string="Jewel removal has failed: Item information of the slot to remove the jewel from is incorrect." />
	<RESULT key="2948" string="Jewel removal has failed: DB request failure." />
	<RESULT key="2950" string="Enhancement Error: Element Stone missing" />
	<RESULT key="2951" string="Enhancement Error: Element Stone missing" />
	*/


	// ENTERING WORLD
	CR_ENTER_WORLD_FIND_GAMESERVER				= 3001,		// ������ ���� ������ ã���ϴ�.
	CR_ENTER_WORLD_START_MOVING_TO_GAMESERVER	= 3002,		// ���� ������ �̵��� �����մϴ�.
	CR_ENTER_WORLD_CONNECT_TO_GAMESERVER		= 3003,		// ���� ������ �����մϴ�.
	CR_ENTER_WORLD_LOGIN_GAMESERVER				= 3004,		// ���� ó�� ���Դϴ�.
	CR_ENTER_WORLD_SUCCESS_LOGIN_GAMESERVER		= 3005,		// ���� ����.
	CR_ENTER_WORLD_GAMESTART					= 3006,		// ���忡 �����մϴ�.


	// MOVE TO SELECT CHAR
	CR_MOVE_TO_SELECT_CHAR_INVALID_STATE		= 3101,		// ĳ���� ���� ȭ������ �̵��� �� ���� �����Դϴ�.
	CR_MOVE_TO_SELECT_CHAR_BUSY					= 3102,		// �ٸ� �ൿ �߿� ĳ���� ���� ȭ������ �������� �� �����ϴ�.
	CR_MOVE_TO_SELECT_CHAR_DONT_DURING_COMBAT	= 3103,		// ���� �߿� ĳ���� ���� ȭ������ �������� �� �����ϴ�.
	CR_MOVE_TO_SELECT_CHAR_TIMEOUT				= 3104,		// ó���ð��� �ʰ��Ǿ� ��û�� ��ҵǾ����ϴ�.
	CR_MOVE_TO_SELECT_CHAR_IN_PROGRESS			= 3105,

	/*
	TODO:
	<RESULT key="3302" string="Failed Item Registration ? Quantity" />
	<RESULT key="3303" string="Failed Item Upload to Market ? DB Error" />
	<RESULT key="3304" string="You've tried to upload an item from the inventory to the market but the item does not exist in the inventory." />
	<RESULT key="3305" string="You've tried to upload an item from the inventory to the market but its quantity is incorrect." />
	<RESULT key="3306" string="It is too cheap to upload to the market (impossible to calculate the Fee)." />
	<RESULT key="3307" string="{ani=talk1}Use a variety of colors to show off your own unique style! How can I help you?" />
	<RESULT key="3308" string="Failed Processing: Item purchase has failed." />
	<RESULT key="3309" string="This item cannot be received. ? It was not uploaded by you." />
	<RESULT key="3310" string="Item quantity has changed. Collect the money for the items sold before canceling this sale." />
	<RESULT key="3311" string="There is not enough room in your inventory." />
	<RESULT key="3312" string="The item was not received because the market was crowded. ? Error in DB" />
	<RESULT key="3313" string="You are carrying too much money" />
	<RESULT key="3314" string="Calculations cannot be done because the market is crowded." />
	<RESULT key="3315" string="You attempted a calculation, but you are carrying too much money." />
	<RESULT key="3316" string="Calculation DB Error" />
	<RESULT key="3317" string="Calculate All DB Error" />
	<RESULT key="3318" string="Cannot be calculated. ? It either does not belong to you or does not match the quantity." />
	<RESULT key="3319" string="The purchase quantity does not match that of the market item." />
	<RESULT key="3320" string="This item cannot be purchased. ? Either its price is out of scope or it expired." />
	<RESULT key="3321" string="This item is no longer available." />
	<RESULT key="3401" string="Timed items cannot be moved to the storage box." />
	<RESULT key="3402" string="Only cash and costume items can be stored." />
	<RESULT key="3501" string="You cannot ride a mount during combat." />
	<RESULT key="3502" string="You cannot transform during a battle." />
	<RESULT key="3601" string="Connection was ended by the Game Master." />
	<RESULT key="3701" string="You can only have up to 50 recipes in your Journal." />
	<RESULT key="3801" string="Invalid character name or user is logged off." />
	<RESULT key="3802" string="Already added as a friend." />
	<RESULT key="3803" string="That user is not registered as a friend." />
	<RESULT key="3804" string="No more friends can be added." />
	<RESULT key="3805" string="Friend function failed due to a database error." />
	<RESULT key="3806" string="You cannot invite yourself as a friend." />
	<RESULT key="3807" string="User not found." />
	<RESULT key="3808" string="Your friend request has been turned down." />
	<RESULT key="3809" string="You cannot delete yourself." />
	<RESULT key="3901" string="Banned from connection." />
	<RESULT key="3902" string="You are banned from trading." />
	<RESULT key="3903" string="That user is banned from trade." />
	<RESULT key="3904" string="You are banned from the Trade Market." />
	<RESULT key="3905" string="You are banned from chatting." />
	<RESULT key="4000" string="Cannot purchase item. Cash inventory is full." />
	<RESULT key="4001" string="Not enough cash. Purchase cash?" />
	<RESULT key="4002" string="The server is experiencing issues. Try again later." />
	<RESULT key="4003" string="Item does not exist. Close the shop and try again." />
	<RESULT key="4004" string="Cannot transfer item. Inventory is full." />
	<RESULT key="4005" string="Cannot send gift. The user's cash inventory is full." />
	<RESULT key="4007" string="User not found" />
	<RESULT key="4008" string="User exists." />
	<RESULT key="4009" string="Select a user to send the gift to." />
	<RESULT key="4010" string="You cannot send a gift to yourself." />
	<RESULT key="4101" string="No such box information." />
	<RESULT key="4102" string="There is an error in the box rate information." />
	<RESULT key="4103" string="No such prize information." />
	<RESULT key="4104" string="Insufficient space in inventory." />
	<RESULT key="4105" string="Database request failed." />
	<RESULT key="4106" string="Disconnected from the database." />
	<RESULT key="4107" string="Key is missing." />
	<RESULT key="4108" string="You need a key." />
	<RESULT key="4201" string="Failed to synchronize the character information with the database." />
	<RESULT key="4202" string="Failed to synchronize the item information with the database." />
	<RESULT key="4203" string="Database processing failed." />
	<RESULT key="4301" string="Already registered at the arena." />
	<RESULT key="4302" string="Unable to cancel, because no registration has been made at the arena." />
	<RESULT key="4303" string="Your Brune's Glory confirmation has timed out." />
	<RESULT key="4304" string="You have declined to enter Brune's Glory." />
	<RESULT key="4305" string="Not enough players have gathered to start a game." />
	<RESULT key="4306" string="Brune can't let you use that item in his arena." />
	<RESULT key="4307" string="You cannot send Brune's Glory requests while in combat." />
	<RESULT key="4308" string="You cannot send Brune's Glory requests while dead." />
	<RESULT key="4401" string="Abnormal player status." />
	<RESULT key="4501" string="Suicide is not allowed in PVP zone" />
	<RESULT key="4309" string="Brune's Glory is not available right now. See the signup window for available times." />
	<RESULT key="4310" string="There is no information about the 1v1 rankings." />
	<RESULT key="4311" string="There is no information about the guild rankings." />
	<RESULT key="4312" string="There is no list for the the Hall of Fame." />
	<RESULT key="4313" string="There is no information about the Hall of Fame rankings." />
	<RESULT key="4314" string="There is no information about the Hall of Fame ranking for this date." />
	<RESULT key="4315" string="You are already using the Battle Arena." />
	<RESULT key="4316" string="You are not in a guild" />
	<RESULT key="4317" string="You are not in a party" />
	<RESULT key="4318" string="Only the leader of the party can request guild war" />
	<RESULT key="4319" string="Only 3 people can request guild war" />
	<RESULT key="4320" string="Currently the party member is not logged in" />
	<RESULT key="4321" string="You cannot check the information of the party member " />
	<RESULT key="4322" string="You can only request when the party member is the same guild member" />
	<RESULT key="4323" string="Only the leader of the party can cancel guild war" />
	<RESULT key="4324" string="Someone in the guild member has logged out" />
	<RESULT key="4325" string="You have exceeded the number of people who can participate in guild war" />
	<RESULT key="4326" string="There is no guild list for the Hall of Fame of Battle Arena." />
	<RESULT key="4327" string="There is no information about the guild's Hall of Fame ranking of Battle Arena" />
	<RESULT key="4328" string="There is no information about the guild's Hall of Fame ranking of Battle Arena in this date" />
	<RESULT key="4329" string="Someone in the party member is already using Battle Arena" />
	<RESULT key="4502" string="You will be withdrawn from the party if you enter the PVP area" />
	<RESULT key="4601" string="You do not have the license." />
	<RESULT key="4602" string="You do not have enough Bellpesos." />
	<RESULT key="4701" string="You cannot use the Makeover Salon now." />
	<RESULT key="4702" string="You are not using the Makeover Salon now." />
	<RESULT key="4703" string="You do not have enough Bellpesos." />
	<RESULT key="4704" string="You do not have a Makeover Coupon." />
	<RESULT key="4705" string="The selected look is not available to you." />
	<RESULT key="4706" string="The selected tattoo is not available to you." />
	<RESULT key="4707" string="Failed to apply the data correctly." />
	<RESULT key="4708" string="You do not have enough funds." />
	<RESULT key="9001" string="Undefined tier grade." />
	*/


	// CHANGE CHANNEL
	CR_FAIL_CHANGE_CHANNEL_INVALID_STATE		= 3201,		// ä���� ������ �� ���� �����Դϴ�.
	CR_FAIL_CHANGE_CHANNEL_BUSY					= 3202,		// �ٸ� �ൿ �߿� ä���� ������ �� �����ϴ�.
	CR_FAIL_CHANGE_CHANNEL_DONT_DURING_COMBAT	= 3203,		// ���� �߿� ä���� ������ �� �����ϴ�.
	CR_FAIL_CHANGE_CHANNEL_IS_FULL				= 3204,		// �ش� ä���� ��ȭ �����Դϴ�.
	CR_FAIL_CHANGE_CHANNEL_IS_INVALID			= 3205,		// �������� �ʴ� ä���Դϴ�.
	CR_FAIL_CHANGE_CHANNEL_SAME_CHANNEL			= 3206,		// ���� �ִ� ä�η� �̵��� �� �����ϴ�.
	CR_FAIL_CHANGE_CHANNEL_UNABLE_PLACE			= 3207,		// ä���̵��� �� �� ���� ����Դϴ�.
	CR_FAIL_CHANGE_CHANNEL_PROCEED				= 3208,		// ä���̵��� ���� ���Դϴ�.
	CR_FAIL_CHANGE_CHANNEL_INVALID_PREPARE_TIME	= 3209,		// ä���̵��� �ϱ⿡ ��ȿ���� ���� ��û�ð��Դϴ�.

	// STORAGE
	CR_FAIL_STORAGE_CANNOT_MOVE_PERIODITEM_TO_STORAGE= 3301,// �Ⱓ�� �������� ���������� �̵��� �� �����ϴ�.

	// DEBUG
	CR_FAIL_DEBUG_MIN							= 10000,	// ���⼭���ʹ� ������� ��� �������� ������ ���� --------------------------------------
	CR_FAIL_TALENTCANCEL_REQUEST				= 10001,	// D)��û�� ���� �ŷ�Ʈ�� ��ҵǾ����ϴ�.
	CR_FAIL_ITEMTALENTCANCEL_REQUEST			= 10002,	// D)��û�� ���� ������ �ŷ�Ʈ�� ��ҵǾ����ϴ�.
	CR_FAIL_TALENTCANCEL_COOLTIMESYNCH			= 10003,	// D)�̵��������̶� �ŷ�Ʈ�� ��ҵǾ����ϴ�.
	CR_FAIL_TALENTCANCEL_MOVE					= 10004,	// D)�ŷ�Ʈ ���� �߿� �̵��Ͽ� ��ҵǾ����ϴ�.

	/*
	<RESULT key="20000" string="Failed" />
	<RESULT key="20001" string="Succeeded" />
	<RESULT key="20100" string="Wrong version of command" />
	<RESULT key="20101" string="Log-in request was not accepted." />
	<RESULT key="20102" string="World ID is incorrect" />
	<RESULT key="20103" string="You're already logged on at the server." />
	*/
};


bool IsCommandResult_Party(int nResult)
{
	return (CR_BOUNDARY_PARTY_BEGIN < nResult && nResult < CR_BOUNDARY_PARTY_END);
}
bool IsCommandResult_Guild(int nResult)
{
	return (CR_BOUNDARY_GUILD_BEGIN < nResult && nResult < CR_BOUNDARY_GUILD_END);
}
bool IsCommandResult_Msg(int nResult)
{
	return (CR_BOUNDARY_MSG_BEGIN < nResult && nResult < CR_BOUNDARY_MSG_END);
}

//////////////////////////////////////////////////////////////////////////

enum CCommandResultTable_MasterServer
{
	CRM_FAIL									= 0,		// �����Ͽ����ϴ�.
	CRM_SUCCESS									= 1,		// �����Ͽ����ϴ�.

	CRM_FAIL_LOGIN_COMMAND_INVALID_VERSION		= 100,		// �߸��� Ŀ�ǵ� �����Դϴ�.
	CRM_FAIL_LOGIN_ACCEPT						= 101,		// �α��ο��� Accept���� ���߽��ϴ�.
	CRM_FAIL_LOGIN_INVALID_WORLD_ID				= 102,		// World ID�� �ٸ��ϴ�.
	CRM_FAIL_LOGIN_ALREADY_EXIST				= 103,		// �̹� �α��� ���ִ� �����Դϴ�.
};

#endif	// _CCOMMAND_RESULT_TABLE_H