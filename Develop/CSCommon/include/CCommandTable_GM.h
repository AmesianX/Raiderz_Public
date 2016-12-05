#ifndef _CCOMMAND_TABLE_GM_H
#define _CCOMMAND_TABLE_GM_H

#include "CSCommonLib.h"

enum CGMCommandTable
{
// ����(GM) ------------------------------------------------------------------------------------------
/*
	MC_GM_REQUEST_SPAWN				= 9001,		///< (C->S) NPC ���� ��û
	MC_GM_REQUEST_DESPAWN			= 9002,		///< (C->S) NPC ���� ��û
	MC_GM_MOVE_REQ					= 9003,		///< (C->S) GM �̵� ��û
	MC_GM_MOVE_TO_PLAYER_REQ		= 9004,		///< (C->S) Ư�� PC���Է� �̵� ��û
	MC_GM_MOVE_TO_MYSPOT_REQ		= 9005,		///< (C->S) �� �� ��ġ�� �̵� ��û(����� ó�� ������ ��)
	MC_GM_REBIRTH_REQ				= 9006,		///< (C->S) GM ��Ȱ ��û
	MC_GM_GOD_REQ					= 9007,		///< (C->S) GM ���� ��û
	MC_GM_CHANGE_WEATHER_REQ		= 9008,		///< (C->S) ���� ���� ��û
	MC_GM_CHANGE_TIME_REQ			= 9009,		///< (C->S) �ð� ���� ��û
	MC_GM_QUEST_GIVE_REQ			= 9010,		///< (C->S) ����Ʈ ������ ��û
	MC_GM_ITEM_GIVE_REQ				= 9011,		///< (C->S) ������ ���� ��û
	MC_GM_GOD						= 9012,		///< (S->C) GM ���� ����
	MC_GM_AI_RUNNING_REQ			= 9013,		///< (C->S) AI ���۾��ϰ� ���ּ���.
	MC_GM_AI_USE_TALENT_REQ			= 9014,		///< (C->S) �ش� NPC���� Ư�� �ŷ�Ʈ ����϶�� ���
	MC_GM_AI_SET_MONITOR_TARGET		= 9015,		///< (C->S) �׽�Ʈ �뵵�� ����͸��� Ÿ�� NPC ����
	MC_GM_GET_PLAYERUID_REQ			= 9016,		///< (C->S) �÷��̾� ID�� UID ��û
	MC_GM_GET_PLAYERUID				= 9017,		///< (S->C) �÷��̾� ID�� UID ��û ����
	MC_GM_REPORT_TARGET_ENTITY		= 9020,		///< (C->S) NPC Report
	MC_GM_KILL_ENTITY_REQ			= 9021,		///< (C->S) ����Ƽ ���̱� ��û
	MC_GM_RANGE_KILL_NPC_REQ		= 9022,		///< (C->S) ������ NPC ���̱� ��û
	MC_GM_SET_ME_REQ				= 9026,		///< (C->S) �� ���� ���� ��û
	MC_GM_QUEST_RESET_REQ			= 9027,		///< (C->S) ������ ����Ʈ �ʱ�ȭ ��û
	MC_GM_QUEST_RESET				= 9028,		///< (S->C) ������ ����Ʈ �ʱ�ȭ	
	MC_GM_SET_ITEM_REQ				= 9029,		///< (C->S) ������ ���� ���� ��û
	MC_GM_NPC_AI_RUNNING_REQ		= 9030,		///< (C->S) Ư�� NPC AI ��� ��û		
	MC_GM_INSERT_BUFF_REQ			= 9035,		///< (C->S)	���� �߰� ��û
	MC_GM_DELETE_BUFF_REQ			= 9036,		///< (C->S)	���� ���� ��û
	MC_GM_RESET_COOLTIME_REQ		= 9037,		///< (C->S)	���� ���� ��û
	MC_GM_SHOW_ENEMY_UID_REQ		= 9038,		///< (C->S)	��׷θ� ���� NPC UID ��û
	MC_GM_SHOW_ENEMY_UID			= 9039,		///< (S->C)	��׷θ� ���� NPC UID
	MC_GM_MOVE_TO_NPC_REQ			= 9040,		///< (C->S) Ư�� NPC���Է� �̵� ��û
	MC_GM_BREAK_PART_REQ			= 9041,		///< (C->S) Ư�� NPC�� Ư�� bpart �νñ�
	MC_GM_RANGE_BREAK_PART_REQ		= 9042,		///< (C->S) �ֺ� NPC�� ��� bpart �νñ�
	MC_GM_QUEST_COMPLETE_REQ		= 9043,		///< (C->S) ����Ʈ �Ϸ�
	MC_GM_QUEST_VAR_REQ				= 9044,		///< (C->S) quest_var ��û
	MC_GM_QUEST_VAR					= 9045,		///< (C->S) quest_var
	MC_GM_QUEST_FAIL_REQ			= 9046,		///< (C->S) ����Ʈ ���� ��û
	MC_GM_CLEAR_INVENTORY_REQ		= 9047,		///< (C->S) �κ��丮 ������ ��� ����
	MC_GM_QUEST_REWARD_REQ			= 9048,		///< (C->S) ����Ʈ ����ޱ�

	MC_GM_LOG_CRT_INSERT_REQ		= 9050,		///< (C->S) FailCRT �α� ����� �߰�
	MC_GM_LOG_CRT_DELETE_REQ		= 9051,		///< (C->S) FailCRT �α� ����� ����
	MC_GM_LOG_CRT_LIST				= 9052,		///< (S->C) FailCRT �α� ����� ���
	MC_GM_QUERY_MULTILOGIN_REQ		= 9053,		///< (C->S) ��Ƽ�α��� ���� ��û
	MC_GM_QUERY_MULTILOGIN			= 9054,		///< (S->C) ��Ƽ�α��� ���� ����


	MC_GM_FACTION_INCREASE_REQ		= 9060,		///< (C->S) �Ѽ� ����
	MC_GM_FACTION_DECREASE_REQ		= 9061,		///< (C->S) �Ѽ� ����
	MC_GM_SERVER_DUMP_REQ			= 9062,		///< (C->S) ���� ���� ��û
	MC_GM_SERVER_DUMP_RESP			= 9063,		///< (C->S) ���� ���� ����
	MC_GM_GHOST_REQ					= 9064,		///< (C->S) GM ��Ʈ ��û
	MC_GM_GHOST						= 9065,		///< (S->C) GM ��Ʈ

	MC_GM_SPAWN						= 9066,		///< (S->C) GM NPC ���� ó�� ���
	MC_GM_QUEST_RESET_ALL_REQ		= 9067,		///< (C->S) ������ ����Ʈ �� ������ �ִ� ����Ʈ �ʱ�ȭ ��û

	MC_GM_ENABLE_ICHECK_REQ			= 9068,		///< (C->S) ���ͷ��� üũ �ѱ�
	MC_GM_DISABLE_ICHECK_REQ		= 9069,		///< (C->S) ���ͷ��� üũ ����



	MC_GM_SET_NPC_REQ				= 9071,		///< (C->S) NPC�� ���°� ���� ��û

	MC_GM_DYE_REQ					= 9072,		///< (C->S) ���� ��û

	MC_GM_SUMMON_REQ				= 9073,		///< (S->C) Ư�� PC�� ��ȯ

	MC_GM_FACTION_RESET_REQ			= 9074,		///< (C->S) �Ѽ� �ʱ�ȭ
	MC_GM_REGEN_REQ					= 9075,		///< (C->S) �����/���ŷ�/���[�ڵ�ȸ��] ��� ��û
	MC_GM_DESPAWNBYID_REQ			= 9076,		///< (C->S) NPCID�� ����

	MC_GM_CHANGE_SERVER_MODE_REQ	= 9077,		///< (C->S) ���� ��� ���� ��û
	MC_GM_CHANGE_SERVER_MODE		= 9078,		///< (S->C) ���� ��� ����

	MC_GM_RESET_EXPO_CHARACTERS_REQ	= 9079,		///< (C->S) Expo �� ĳ���� Reset
	*/

	MC_GM_GET_PLAYERUID_REQ					= 8001,		///< (C->S) �÷��̾� ID�� UID ��û
	MC_GM_GET_PLAYERUID						= 8002,		///< (S->C) �÷��̾� ID�� UID ��û ����
	MC_GM_SHOW_ENEMY_UID_REQ				= 8003,		///< (C->S)	��׷θ� ���� NPC UID ��û
	MC_GM_SHOW_ENEMY_UID					= 8004,		///< (S->C)	��׷θ� ���� NPC UID
	MC_GM_SET_ME_REQ						= 8005,		///< (C->S) �� ���� ���� ��û
	MC_GM_FULL_REQ							= 8006,
	MC_GM_GOD_REQ							= 8007,		///< (C->S) GM ���� ��û
	MC_GM_GOD								= 8008,		///< (S->C) GM ���� ����
	MC_GM_GHOST_REQ							= 8009,		///< (C->S) GM ��Ʈ ��û
	MC_GM_GHOST								= 8010,		///< (S->C) GM ��Ʈ
	MC_GM_REBIRTH_REQ						= 8011,		///< (C->S) GM ��Ȱ ��û
	MC_GM_REGEN_REQ							= 8012,		///< (C->S) �����/���ŷ�/���[�ڵ�ȸ��] ��� ��û
	MC_GM_RESET_COOLTIME_REQ				= 8013,		///< (C->S)	���� ���� ��û
	MG_GM_CONDITIONCHECK					= 8014,
	MC_GM_KILL_ENTITY_REQ					= 8015,		///< (C->S) ����Ƽ ���̱� ��û
	MC_GM_KICK_PLAYER_REQ					= 8016,
	MC_GM_REQUEST_SPAWN						= 8017,		///< (C->S) NPC ���� ��û
	MC_GM_REQUEST_DESPAWN					= 8018,		///< (C->S) NPC ���� ��û
	MC_GM_DESPAWNBYID_REQ					= 8019,		///< (C->S) NPCID�� ����
	MC_GM_RANGE_KILL_NPC_REQ				= 8020,		///< (C->S) ������ NPC ���̱� ��û
	MC_GM_RANGE_AGGRO_NPC_REQ				= 8021,
	MC_GM_RANGE_WEAKEN_NPC_REQ				= 8022,
	MC_GM_RANGE_DESPAWN_CORPSE_REQ			= 8023,
	MC_GM_RANGE_BREAK_PART_REQ				= 8024,		///< (C->S) �ֺ� NPC�� ��� bpart �νñ�
	MC_GM_BREAK_PART_REQ					= 8025,		///< (C->S) Ư�� NPC�� Ư�� bpart �νñ�
	MC_GM_CHANGE_WEATHER_REQ				= 8026,		///< (C->S) ���� ���� ��û
	MC_GM_CHANGE_TIME_REQ					= 8027,		///< (C->S) �ð� ���� ��û
	MC_GM_QUESTPVPEVENT_BEGIN_REQ			= 8028,
	MC_GM_MOVE_REQ							= 8029,		///< (C->S) GM �̵� ��û
	MC_GM_MOVE_TO_PLAYER_REQ				= 8030,		///< (C->S) Ư�� PC���Է� �̵� ��û
	MC_GM_MOVE_TO_NPC_REQ					= 8031,		///< (C->S) Ư�� NPC���Է� �̵� ��û
	MC_GM_SUMMON_REQ						= 8032,		///< (S->C) Ư�� PC�� ��ȯ
	MC_GM_ITEM_GIVE_REQ						= 8033,		///< (C->S) ������ ���� ��û
	MC_GM_ENCHANT_ITEM_GIVE_REQ				= 8034,
	MC_GM_ITEM_REPAIR_ALL					= 8035,
	MC_GM_CLEAR_INVENTORY_REQ				= 8036,		///< (C->S) �κ��丮 ������ ��� ����
	MC_GM_DYE_REQ							= 8037,		///< (C->S) ���� ��û
	MC_GM_INSERT_BUFF_REQ					= 8038,		///< (C->S)	���� �߰� ��û
	MC_GM_DELETE_BUFF_REQ					= 8039,		///< (C->S)	���� ���� ��û
	MC_GM_FACTION_INCREASE_REQ				= 8040,		///< (C->S) �Ѽ� ����
	MC_GM_FACTION_DECREASE_REQ				= 8041,		///< (C->S) �Ѽ� ����
	MC_GM_FACTION_RESET_REQ					= 8042,		///< (C->S) �Ѽ� �ʱ�ȭ
	MC_GM_QUEST_GIVE_REQ					= 8043,		///< (C->S) ����Ʈ ������ ��û
	MC_GM_QUEST_RESET_REQ					= 8044,		///< (C->S) ������ ����Ʈ �ʱ�ȭ ��û
	MC_GM_QUEST_RESET						= 8045,		///< (S->C) ������ ����Ʈ �ʱ�ȭ
	MC_GM_QUEST_RESET_ALL_REQ				= 8046,		///< (C->S) ������ ����Ʈ �� ������ �ִ� ����Ʈ �ʱ�ȭ ��û
	MC_GM_QUEST_COMPLETE_REQ				= 8047,		///< (C->S) ����Ʈ �Ϸ�
	MC_GM_QUEST_VAR_REQ						= 8048,		///< (C->S) quest_var ��û
	MC_GM_QUEST_VAR							= 8049,		///< (C->S) quest_var
	MC_GM_QUEST_FAIL_REQ					= 8050,		///< (C->S) ����Ʈ ���� ��û
	MC_GM_QUEST_REWARD_REQ					= 8051,		///< (C->S) ����Ʈ ����ޱ�
	MC_GM_VALIDATOR_REQ						= 8052,
	MC_GM_VALIDATOR							= 8053,
	MC_GM_CHANGE_SERVER_MODE_REQ			= 8054,		///< (C->S) ���� ��� ���� ��û
	MC_GM_CHANGE_SERVER_MODE				= 8055,		///< (S->C) ���� ��� ����
	MC_GM_RESET_EXPO_CHARACTERS_REQ			= 8056,		///< (C->S) Expo �� ĳ���� Reset
	MC_GM_PC_CAFE_SERVICE_ENABLE_REQ		= 8057,
	MC_GM_PC_CAFE_SERVICE_DISABLE_REQ		= 8058,
	MC_GM_GUIDEBOOK_RESET_REQ				= 8059,
	MC_GM_GUIDEBOOK_RESET					= 8060,
	MC_GM_TMARKET_ON						= 8061,
	MC_GM_TMARKET_OFF						= 8062,
	MC_GM_EVENT_RELOAD_REQ					= 8063,
	MC_GM_EVENT_RELOAD						= 8064,
	MC_GM_WHITELIST_ON						= 8065,
	MC_GM_WHITELIST_OFF						= 8066,
	MC_GM_SHUTDOWN_REQ						= 8067,
	MC_GM_PENALTY_INSERT_REQ				= 8068,
	MC_GM_PENALTY_DELETE_REQ				= 8069,
	MC_GM_BATTLE_ARENA_SERVICE_REQ			= 8070,
	MC_GM_BATTLE_ARENA_SERVICE_RES			= 8071,
	MC_DEBUG_BATTLE_ARENA_GUILD_MEMBER		= 8072,

// �׽�Ʈ(TEST) -----------------------------------------------------------------------------------------
	MC_DEBUG_STRING							= 9001,		///< (S->C) ����� ��Ʈ���� Ŭ���̾�Ʈ�� �����ش�.
	MC_DEBUG_STRING_REQ						= 9002,		///< (C->S) ����� ��Ʈ���� ������ �����ش�.
	MC_AI_DEBUG_MESSAGE						= 9003,		///< (S->C) AI ����� ������ Ŭ���̾�Ʈ�� �����ش�.
	MC_DEBUG_COMBATCALC						= 9004,		///< (S->C) ���� ���� ����� ������ Ŭ���̾�Ʈ�� �����ش�.
	MC_GM_REPORT_TARGET_ENTITY				= 9005,		///< (C->S) NPC Report
	MC_GM_SERVER_DUMP_REQ					= 9006,		///< (C->S) ���� ���� ��û
	MC_GM_SERVER_DUMP_RESP					= 9007,		///< (C->S) ���� ���� ����
	MC_DEBUG_START_COMMAND_PROFILE			= 9008,		///< (C->S) Ŀ�ǵ� �������ϸ� ����
	MC_DEBUG_DUMP_COMMAND_PROFILE			= 9009,		///< (C->S) Ŀ�ǵ� �������� ����
	MC_DEBUG_END_COMMAND_PROFILE			= 9010,		///< (C->S) Ŀ�ǵ� �������ϸ� ��
	MC_TEST_SPAWN							= 9011,
	MC_GM_AI_OFF_REQ						= 9012,
	MC_GM_AI_RUNNING_REQ					= 9013,		///< (C->S) AI ���۾��ϰ� ���ּ���.
	MC_GM_NPC_AI_RUNNING_REQ				= 9014,		///< (C->S) Ư�� NPC AI ��� ��û		
	MC_GM_AI_USE_TALENT_REQ					= 9015,		///< (C->S) �ش� NPC���� Ư�� �ŷ�Ʈ ����϶�� ���
	MC_GM_AI_SET_MONITOR_TARGET				= 9016,		///< (C->S) �׽�Ʈ �뵵�� ����͸��� Ÿ�� NPC ����
	MC_GM_SET_NPC_REQ						= 9017,		///< (C->S) NPC�� ���°� ���� ��û
	MC_TEST_DYNAMIC_FIELD_ENTER_REQ			= 9018,
	MC_GM_SET_ITEM_REQ						= 9019,		///< (C->S) ������ ���� ���� ��û
	MC_DEBUG_TRADEMARKET_ADD_HOUR			= 9020,
	MC_DEBUG_TRADEMARKET_TIME_RESET			= 9021,
	MC_GG_AUTH_ENABLE						= 9022,		///< (C->S) ���� ���� ���� ����
	MC_DEBUG_ECHO_REQ						= 9023,		///< (C->S) ���� ��û
	MC_DEBUG_ECHO							= 9024,		///< (S->C) ���� ����
	MC_GM_ENABLE_ICHECK_REQ					= 9025,		///< (C->S) ���ͷ��� üũ �ѱ�
	MC_GM_DISABLE_ICHECK_REQ				= 9026,		///< (C->S) ���ͷ��� üũ ����
	MC_GM_QUERY_MULTILOGIN_REQ				= 9027,		///< (C->S) ��Ƽ�α��� ���� ��û
	MC_GM_QUERY_MULTILOGIN					= 9028,		///< (S->C) ��Ƽ�α��� ���� ����

};

CSCOMMON_API void AddGMCommandTable();

#endif
