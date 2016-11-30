--============================================
-- filename: Const.lua
-- ����E ��ũ��Ʈ�� C++���� �翁Eϴ� ��E
--
--============================================

--======================================================
-- C++���� �翁Eϴ� ��E
-- ��E�̸��� ������ �濁EC++���� �Բ� �����ؾ� �Ѵ�.
--======================================================

INACTIVE_SHAREDFIELD_NPC_CLEARTIME = 60;

-- �Ϲ�
CONST_KEEP_PLAYER_SPAWN = true;				-- �÷��̾��� ������ ��ġ�� �������E����
RUN_RESOURCE_VALIDATOR	= true;				-- �ܺ� ������ ���� ��ȿ�� üũ ����
RUN_FOR_TEST = true;						-- ������ �׽�Ʈ��E��� ��������E����, �ٸ� ����׿�ECONST ���� �����־�ѵ �� ���� false�̸�E�����, �׽�Ʈ �ڵ尡 �۵�����E�ʽ��ϴ�.
--ENABLE_SETME_GRADE = true;					-- setme grade [GRADE] �ܼ� ���ɾ�EȰ��ȭ ���θ� ����Ī �մϴ�. RUN_FOR_TEST �� true �� ���� ��ȿ�մϴ�.
GAME_TICK = 20;								-- ����Eƽ
SERVER_SLEEP = true;
DISMOUNT_BUFFID = 5000220

CONST_NPC_XML_FILES 	= "system/npc.xml";
CONST_ITEM_XML_FILES 	= "system/xitem.xml";
CONST_TALENT_XML_FILES 	= "system/talent.xml";
CONST_BUFF_XML_FILES 	= "system/buff.xml";
CONST_ENCHANT_XML_FILES 	= "system/enchant.xml";
CONST_RECIPE_XML_FILES 	= "system/recipe.xml";
CONST_LOOT_XML_FILES 	= "system/loot.xml";


-- �ʵ�E��E� ---------------------------------
INCLUDE_DEV_FIELD_LIST 	= false;			-- �������� �ʵ�E�ε�E����

-- ȯ��E�ð�, ����) ��E� ---------------------

CONST_LOCALTIME_PER_GAMETIME_ONE_HOUR	= 840;		-- �ǽð� 14���� ���� 1�ð�
CONST_ENV_TIME_UPDATE_TICK_SEC			= 60;		-- �ð�üũ ƽ��(��) - 60��


-- ���ӳ� �ð���E����
CONST_ENV_TIME_DAWN_START_HOUR		= 4;		-- AM 4�ú��� ����(Dawn)
CONST_ENV_TIME_DAYTIME_START_HOUR	= 7;		-- AM 7�ú��� ��(Daytime)
CONST_ENV_TIME_SUNSET_START_HOUR	= 18;		-- PM 6�ú��� ������ESunset)
CONST_ENV_TIME_NIGHT_START_HOUR		= 21;		-- PM 9�ú��� ����(Night)

CONST_ENV_WEATHER_TICK_SEC			= 5040;		-- ���� ��ȭ ƽ 84�� (84 * 60)

--- ����E�ʵ�E��E� ---------------------------------
CONST_DYNAMICFIELD_EXPIRED_TIME	= 800;		-- ����E�ʵ�E�׷�E� ��ȿ�� �÷��̾�̡ ������ ����E�ʵ�E�׷�E� ���������ִ� �����ð�  [����Ʈ 15��] (����: ��)

--CONST_LOCALTIME_PER_GAMETIME_ONE_HOUR	= 5;		-- �ǽð� 5�ʰ� ���� 1�ð�
--CONST_ENV_TIME_UPDATE_TICK_SEC			= 5;	-- �ð�üũ ƽ��(��) - 60��
--CONST_ENV_WEATHER_TICK_SEC			= 5;		-- ���� ��ȭ ƽ(5��)

-- ���� ���� ��E�ǥ


-- ��E�E��E� ------------------------------------
PVP_MODE	= false;								-- �÷��̾�̣ ��E�E���� ����
PVP_DAMAGE_BASE_AMP						= -0.25;		-- PVP ������E����


COMBAT_CHASE_MAX_DURATION_TIME			= 8.0;		-- ��E��� �ŷ�Ʈ�� �������� ������ �ִ�Eð�

STRESS_ADD_INTERRUPT_DURING_ATTACKING	= 10;		-- ���ݽ� ���ͷ�Ʈ ���Ҷ� ��� ��Ʈ���� ��ġ
STRESS_ADD_LIMITED_CHASE_TIME			= 10;		-- �����Ϸ���E������ �ð����� �޴� ��Ʈ���� ��ġ
STRESS_CHASE_INTERVAL					= 1;		-- �����Ϸ���E�����Ͽ� ��Ʈ���� �������� �ð� ����(����: ��)
STRESS_ADD_AVOID_MELEE_ATTACK			= 10;		--  NPC�� ���� ������ ���� ȸ�ǽ� �޴� ��Ʈ���� ��ġ
STRESS_ADD_AVOID_RANGE_ATTACK			= 10;		-- NPC�� ���Ÿ� ������ ���� ȸ�ǽ� �޴� ��Ʈ���� ��ġ

STATE_FACTOR_FOR_DAMAGE_BY_BACK			= 1.5;		--  ���¿� ���� ������E���� �ڿ��� �¾�����
STATE_FACTOR_FOR_DAMAGE_BY_BEATEN		= 1.0;		--  ���¿� ���� ������E���� MF_BEATEN
STATE_FACTOR_FOR_DAMAGE_BY_STUN		    = 1.2;		--  ���¿� ���� ������E���� MF_STUN
STATE_FACTOR_FOR_DAMAGE_BY_DEFLECT		= 1.2;		--  ���¿� ���� ������E���� MF_DEFLECT
STATE_FACTOR_FOR_DAMAGE_BY_STAGGER		= 1.2;		--  ���¿� ���� ������E���� MF_STAGGER
STATE_FACTOR_FOR_DAMAGE_BY_THROWUP		= 1.2;		--  ���¿� ���� ������E���� MF_THROWUP
STATE_FACTOR_FOR_DAMAGE_BY_KNOCKDOWN	= 1.5;		--  ���¿� ���� ������E���� MF_KNOCKDOWN
STATE_FACTOR_FOR_DAMAGE_BY_UPPERED		= 1.2;		--  ���¿� ���� ������E���� MF_UPPERED

STATE_FACTOR_FOR_MF_VALUE_BY_BACK		= 1.5;		--  ���¿� ���� ������� ���� �ڿ��� �¾��� ��
STATE_FACTOR_FOR_MF_VALUE_BY_BEATEN		= 1.0;		--  ���¿� ���� ������� ���� MF_BEATEN	
STATE_FACTOR_FOR_MF_VALUE_BY_STUN		= 1.5;		--  ���¿� ���� ������� ���� MF_STUN
STATE_FACTOR_FOR_MF_VALUE_BY_DEFLECT	= 1.0;		--  ���¿� ���� ������� ���� MF_DEFLECT
STATE_FACTOR_FOR_MF_VALUE_BY_STAGGER	= 1.0;		--  ���¿� ���� ������� ���� MF_STAGGER
STATE_FACTOR_FOR_MF_VALUE_BY_THROWUP	= 1.0;		--  ���¿� ���� ������� ���� MF_THROWUP
STATE_FACTOR_FOR_MF_VALUE_BY_KNOCKDOWN	= 1.0;		--  ���¿� ���� ������� ���� MF_KNOCKDOWN
STATE_FACTOR_FOR_MF_VALUE_BY_UPPERED	= 1.0;		--  ���¿� ���� ������� ���� MF_UPPERED	

VICTORY_DEFAULT_DELAY					= 3.0;		-- NPC�� �¸������� ��Ʈ�� ���õ���E�ʾ����� �⺻������ ��E��ϴ� �ð�
INVINCIBLE_TIME_REVIVE					= 3.0;
INVINCIBLE_TIME_ENTER_FIELD				= 10.0;
INVINCIBLE_BUFF_ID					= 1900;
INVISIBLE_BUFF_ID					= 902;

NO_WEAPON_DAMAGE_LEFT				= 5;			-- �޼� ���⸦ ��������E�ʾ��� �濁E� �⺻ ������E
NO_WEAPON_DAMAGE_RIGHT				= 5;			-- ������ ���⸦ ��������E�ʾ��� �濁E� �⺻ ������E

PRE_HIT_CHECK_TIME					= 0.12;			-- ���� ���� �ð����� ����E�����ϴ� �ð�

-- �Ϲݸ�E��E�E��E� --
DEF_WAIT_INTERVAL = 1;								-- ��E��� �̵��� �߰��߰� ��E��ϴ� �ð���

-- ��E���ȿ�Ÿ� ���� --								-- ��E������� �����Ÿ��� �̵��ϸ�E��E��� Ǯ��E�������·� ��E�E������������ �����Ѵ�.
NPC_DEFAULT_COMBAT_RADIUS = 0;

-- ���� ���� --------------------------------------
REGEN_TICK								= 5;		-- ���� ƽ (��)
HP_REGEN_AMOUNT 						= 20;		-- ƽ��EHP ������
HP_REGEN_RATE_IN_COMBAT 				= 0.0625;	-- ��E��� HP ���� ����ġ (1 = 100%)
EN_REGEN_AMOUNT 						= 60;		-- ƽ��EEN ������
EN_REGEN_RATE_IN_COMBAT 				= 0.4;		-- ��E��� EN ���� ����ġ (1 = 100%)
STA_REGEN_AMOUNT 						= 50;		-- ƽ��ESTA ������
STA_REGEN_RATE_IN_COMBAT 				= 0.6;		-- ��E��� STA ���� ����ġ (1 = 100%)
SITTING_REGEN_RATE						= 1.5;		-- �ɾ����� �� ������ ���� 

-- PVP ��E� --------------
PVP_DURATIONTIME						= 5.0;						-- �÷��̾�̣ �ǰݽ� PVP���� ���ӽð�
PVP_ARENA_FIELD_ID						= 8005;						-- PvP Arena Field ID

-- ������E��E� --------------
MAGICAREA_EFFECTION_PERIOD			= 1.0;				-- ������Eȿ��E�ֱ�E

-- ����� ��E�
INVISIBILITY_DETECT_TICK					= 1.0;				-- ����� Ž��Eó�� ƽ �ֱ�E(second)
INVISIBILITY_DETECT_DISTANCE			= 500; -- ����� Ž���Ÿ� (cm)

-- ǁE�Ʈ���̺�E��E�
HATETABLE_ENTRY_TIMEOUT				= 12;				-- ǁE�Ʈ ���̺�ۡ ���̣ �׸��� �ڵ����� ���ŵǴ� �ð� (����: ��)
HATETABLE_ENTRY_PARTY_SCAN_DISTANCE = 2500;				-- ǁE�Ʈ ���̺�ۡ �߰��� �÷��̾��� ��Ƽ��EŽ��E�Ÿ� (cm)
HATETABLE_LIMIT_AGGRO_RANGE			= 2500;			-- Aggro() �Լ��� ��E�E��E��� �� ����E���� ���� �Ÿ� (cm)
	
-- ��Ŀ�� ��E� --------------
FOCUS_ADVENT_DURATION_TIME = 20.0; -- ���� ��Ŀ���� �ִ�E�󸶳� ���ӵǴ°�
FOCUS_BERSERK_HIT_COUNT = 8;	-- ������ ������ ����ũ�� �ɸ��°�
FOCUS_BERSERK_DURATION_TIME = 15.0;	-- ����ũ ��Ŀ���� �󸶳� ���ӵǴ°�
FOCUS_BERSERK_RELAYHIT_TIME = 9.0;	-- ����ũ ��Ŀ���� ������ �����Ǵ� �ð�
FOCUS_COUNTER_DURATION_TIME = 10.0;	-- ���� ��Ŀ���� �󸶳� ���ӵǴ°�
FOCUS_ENLIGHTEN_DURATION_TIME = 60.0;	-- ���� ��Ŀ���� �󸶳� ���ӵǴ°�
FOCUS_ENLIGHTEN_HIT_COUNT = 3;			-- ������ ������ ������ �ɸ��°�
FOCUS_ENLIGHTEN_MINDSTORM_BUFF_ID = 500;	-- ����Ʈ��ŁE���� ���̵�E
FOCUS_ENLIGHTEN_RELAYHIT_TIME = 5.0;		-- ���� ��Ŀ���� ������ �����Ǵ� �ð�

-- �ڸ���E��E�
AFK_TIMEOUT = 600; -- �ڸ���E�Ǵ� �ð�

-- ���� ������E��E� --------------
FALLING_DEBUFF_LV1_ID = 100003;
FALLING_DEBUFF_LV2_ID = 100004;

-- ������E��E� --------
ARENA_FIELDGROUP_ID = 50010;				-- ������E�ʵ�׷�E���̵�E
ARENA_FIELD_ID = 50011;							-- ������E�ʵ�E���̵�E
ARENA_GAME_COUNT = 10.0;					-- ������E���ӽ��� ��E�ð�
ARENA_SCOREBOARD_COUNT= 10.0;			-- ������E������ ��E�ð�
ARENA_DEATHMATCH_MAX_SCORE = 7;		-- ������E������ġ �ִ�E���E
ARENA_DEATHMATCH_REBIRTH_TIME = 30.0;	-- ������E������ġ ��Ȱ�ð�

-- NPC ��ü�Ҹ�E��E� ------------
function MakeMinute(second)
	return second * 60
end

NPC_DECAY_TIME_NOITEM = 30;				-- NPC�� ������ ������ ��ü�� �Ҹ�EǴ� �ð� (����: ��)
NPC_DECAY_TIME_GRADE_0 = MakeMinute(5);			-- NPC�� �������� ������ ���޺� ��ü�� �Ҹ�EǴ� �ð� (����: ��)
NPC_DECAY_TIME_GRADE_1 = MakeMinute(5);			-- NPC�� �������� ������ ���޺� ��ü�� �Ҹ�EǴ� �ð� (����: ��)
NPC_DECAY_TIME_GRADE_2 = MakeMinute(5);			-- NPC�� �������� ������ ���޺� ��ü�� �Ҹ�EǴ� �ð� (����: ��)
NPC_DECAY_TIME_GRADE_3 = MakeMinute(5);			-- NPC�� �������� ������ ���޺� ��ü�� �Ҹ�EǴ� �ð� (����: ��)
NPC_DECAY_TIME_GRADE_4 = MakeMinute(10);			-- NPC�� �������� ������ ���޺� ��ü�� �Ҹ�EǴ� �ð� (����: ��)
NPC_DECAY_TIME_GRADE_5 = MakeMinute(10);			-- NPC�� �������� ������ ���޺� ��ü�� �Ҹ�EǴ� �ð� (����: ��)
NPC_DECAY_TIME_GRADE_6 = MakeMinute(10);			-- NPC�� �������� ������ ���޺� ��ü�� �Ҹ�EǴ� �ð� (����: ��)
NPC_DECAY_TIME_GRADE_7 = MakeMinute(15);			-- NPC�� �������� ������ ���޺� ��ü�� �Ҹ�EǴ� �ð� (����: ��)
NPC_DECAY_TIME_GRADE_8 = MakeMinute(15);			-- NPC�� �������� ������ ���޺� ��ü�� �Ҹ�EǴ� �ð� (����: ��)
NPC_DECAY_TIME_GRADE_9 = MakeMinute(15);			-- NPC�� �������� ������ ���޺� ��ü�� �Ҹ�EǴ� �ð� (����: ��)
NPC_DECAY_TIME_GRADE_10 = MakeMinute(15);			-- NPC�� �������� ������ ���޺� ��ü�� �Ҹ�EǴ� �ð� (����: ��)
NPC_DESPAWN_TIME_FOR_DINNER = 600;					-- ��ENPC �� �ڵ� �Ҹ�Eð� (����: ��)
	
--  �г�E��E� -----------------
HIT_RAGE_AMOUNT = 10;						-- NPC�� �ǰ��� ���� �� ���� �г�E�
CRIHIT_RAGE_AMOUNT = 10;					-- NPC�� ġ��Ḹ� ���� �� ���� �߰� �г�E� (�⺻ �ǰݺг�E��� �߰�)

-- ��ã��E��E�
NPC_FINDPATH_RADIUS_LEVEL1 = 600 			-- ��ã��E����1 ����E�E�
NPC_FINDPATH_RADIUS_LEVEL2 = 1200			-- ��ã��E����2 ����E�E�
NPC_FINDPATH_RADIUS_LEVEL3 = 2000			-- ��ã��E����3 ����E�E�
NPC_FINDPATH_TICK_LEVEL1 = 0.2				-- ��ã��E����1 ���� ƽ�ð�
NPC_FINDPATH_TICK_LEVEL2 = 0.4				-- ��ã��E����2 ���� ƽ�ð�
NPC_FINDPATH_TICK_LEVEL3 = 0.6				-- ��ã��E����3 ���� ƽ�ð�
NPC_FINDPATH_TICK_OTHER = 1.0				-- ��ã��E��E��� ���� ƽ�ð�
NPC_FINDPATH_MOVESPEED_FACTOR = 400			-- ��ã��E���� ƽ�ð� �ӵ� ����ġ (ƽ�ð� * �̵��ӵ� / ����)

-- ���� ----------------
LOOT_LEVEL_DIFF_PENALTY_1 = "2, 3, 0.8"
LOOT_LEVEL_DIFF_PENALTY_2 = "4, 5, 0.8"
LOOT_LEVEL_DIFF_PENALTY_3 = "6, 11, 0.8"
LOOT_LEVEL_DIFF_PENALTY_4 = "12, 20, 0.2"
LOOT_LEVEL_DIFF_PENALTY_5 = "21, 100, 0.1"

LOOT_PENALTY_TIER = {1, 0.7, 0.5, 0.3, 0.001} -- �г�Ƽ ���� ������E� 1����,2����,3����,4����,5���� ������ ������ �嶁E�г�Ƽ ���� �⼁E


-- ä��Ȱ�� �ҿ�E�ð� ----------------
GATHER_TIME_MINE_TIER_1		= 6.0		-- ä��
GATHER_TIME_MINE_TIER_2		= 6.0
GATHER_TIME_MINE_TIER_3		= 6.0
GATHER_TIME_MINE_TIER_4		= 6.0
GATHER_TIME_MINE_TIER_5		= 6.0
GATHER_TIME_MINE_TIER_6		= 6.0
GATHER_TIME_MINE_TIER_7		= 6.0
GATHER_TIME_MINE_TIER_8		= 6.0
GATHER_TIME_MINE_TIER_9		= 6.0
GATHER_TIME_MINE_TIER_10	= 6.0

GATHER_TIME_HERB_TIER_1		= 6.0		-- �Ĺ�
GATHER_TIME_HERB_TIER_2		= 6.0
GATHER_TIME_HERB_TIER_3		= 6.0
GATHER_TIME_HERB_TIER_4		= 6.0
GATHER_TIME_HERB_TIER_5		= 6.0
GATHER_TIME_HERB_TIER_6		= 6.0
GATHER_TIME_HERB_TIER_7		= 6.0
GATHER_TIME_HERB_TIER_8		= 6.0
GATHER_TIME_HERB_TIER_9		= 6.0
GATHER_TIME_HERB_TIER_10	= 6.0

GATHER_TIME_RELIC_TIER_1	= 6.0		-- �߱�
GATHER_TIME_RELIC_TIER_2	= 6.0
GATHER_TIME_RELIC_TIER_3	= 6.0
GATHER_TIME_RELIC_TIER_4	= 6.0
GATHER_TIME_RELIC_TIER_5	= 6.0
GATHER_TIME_RELIC_TIER_6	= 6.0
GATHER_TIME_RELIC_TIER_7	= 6.0
GATHER_TIME_RELIC_TIER_8	= 6.0
GATHER_TIME_RELIC_TIER_9	= 6.0
GATHER_TIME_RELIC_TIER_10	= 6.0

GATHER_TIME_LUMBER_TIER_1	= 6.0		-- ����EäÁE
GATHER_TIME_LUMBER_TIER_2	= 6.0
GATHER_TIME_LUMBER_TIER_3	= 6.0
GATHER_TIME_LUMBER_TIER_4	= 6.0
GATHER_TIME_LUMBER_TIER_5	= 6.0
GATHER_TIME_LUMBER_TIER_6	= 6.0
GATHER_TIME_LUMBER_TIER_7	= 6.0
GATHER_TIME_LUMBER_TIER_8	= 6.0
GATHER_TIME_LUMBER_TIER_9	= 6.0
GATHER_TIME_LUMBER_TIER_10	= 6.0

-- ä�� ����E�Ʈ ����ƁE�ð� ----------------
GATHER_RESPAWN_TIME_MINE	= 300;		-- 5��(1 = 1��)
GATHER_RESPAWN_TIME_HERB	= 300;
GATHER_RESPAWN_TIME_RELIC	= 300;
GATHER_RESPAWN_TIME_LUMBER	= 300;

-- ��Ȱ ��E�
REBIRTH_VALID_DISTANCE_XY		= 300.0;
REBIRTH_VALID_DISTANCE_Z		= 100.0;
REBIRTH_SOULSTONE_DEBUFF		= 1910;	
REBIRTH_CHECKPOINT_DEBUFF		= 1910;	
REBIRTH_SOULSTONE_RECOVER		= 0.25;
REBIRTH_CHECKPOINT_RECOVER		= 0.25;
REBIRTH_QUESTPVP_RECOVER		= 1.0;
REBIRTH_BATTLEARENA_RECOVER		= 1.0;

REBIRTH_QUESTPVP_BUFF_BONUS1_MYTEAM_PLAYER_RATE = 0.7;		-- ��E� �ο��� 80% �̸��� �� �� ������ ����E�
REBIRTH_QUESTPVP_BUFF_BONUS2_MYTEAM_PLAYER_RATE = 0.5;		-- ��E� �ο��� 50% �̸��� �� �� ������ ����E�
REBIRTH_QUESTPVP_BUFF_BONUS3_MYTEAM_PLAYER_RATE = 0.2;		-- ��E� �ο��� 20% �̸��� �� �� ������ ����E�, �翁E���E���� �濁E0.0���� ����

-- �ʵ�Eȥ�⵵
FIELD_CROWED_BOOST_RESPAWN_TICK_MINIMUM_SECONDS = 10.0; -- �ʵ�Eȥ�⵵�� ���� ����ƁE�ð� ���ҿ� ��E� �ּ� �ð�
FIELD_CROWED_BOOST_DECAY_TICK_MINIMUM_SECONDS = 30.0; -- �ʵ�Eȥ�⵵�� ���� ��ü�Ҹ�E�ð� ���ҿ� ��E� �ּ� �ð�
FIELD_CROWED_BOOST_RATE_MODIFIER = 0.0; -- �ʵ�Eȥ�⵵ ����ġ

-- ����ȭ ��E�
COMMAND_CROWDED_QUEUE_SIZE = 2000;
-- COMMAND_OVERFULL_QUEUE_SIZE = 4000; -- ����E����EĿ��尡 ����ح �����ϴ�.
SECTOR_CROWDED_LEVEL_CAPACITY = 60 -- ���ⷹ���� �Ǳ�E���� �ʿ�E�÷��̾�E��E
SECTOR_PACKET_IGNORE_EACH_COUNT = 4 -- ���ⷹ����E ���õ� ��Ŷ Ƚ��E
SECTOR_PACKET_LIMIT_QUEUE_SIZE = 40 -- ���ʹ�E��E��� �÷��̾�ְ ī���� �ִ�E����E
MOVE_COMMAND_LIMIT_PLAYER_COUNT_LEVEL1 = 10	-- ���� �÷��̾�E���⵵�� ���� �̵���Ŷ �ɷ�����E(����1: ���;���)
MOVE_COMMAND_LIMIT_PLAYER_COUNT_LEVEL2 = 50	-- ���� �÷��̾�E���⵵�� ���� �̵���Ŷ �ɷ�����E(����2: LOD ����E

-- AI Monitor -----------
AIMON_ENABLE = true;
AIMON_AUTO_TARGET = false;
AIMON_SET_FIELDID = 1100001;
AIMON_SET_SPAWNID = 2;
AIMON_UPDATE_INTERVAL = 0.5;

-- �Ƿε� -----------
FATIGUE_DECREASE_PER_MINUTE_ON_HUNTING_GROUND = 0;
FATIGUE_DECREASE_PER_MINUTE_ON_NOT_HUNTING_GROUND = 0;
FATIGUE_INCREASE_PER_HOUR_BY_BLANKTIME = 0;
FATIGUE_SET_ROOM_NORMAL = 0;
FATIGUE_SET_ROOM_SPECIAL = 0;

-- ģ�� ��E� ----------
FRIEND_LIST_CAPACITY = 50;

-- �ŷ�Ʈ -----------
TALENT_GIVED_EXTRA_PASSIVE = {80000, 80001, 80002, 80004, 80005, 80006, 80007, 80008, 80017}
TALENT_NORMAL_ATTACK_COMBO = "101001:5, 102001:5, 103001:3, 104001:3, 105001:4, 107001:3, 109001:5"
TALENT_NORMAL_ATTACK_COMBO_PAIR = "101011:101002, 101030:101002, 102011:102002, 102030:102002, 103011:103002, 103030:103002, 104011:104002, 104030:104002, 105011:105002, 105030:105002, 107011:107002, 107030:107002, 109020:109002, 109030:109002"

-- PC��E-----------
ALWAYS_PC_CAFE_MODE = false; -- PC��E���ó�� ó������E���� (�׽�Ʈ��E
PC_CAFE_BUFF = {8000000} --PC��E��E�E���� ��E���� +10, ������ ȹ��EȮ��E10% ����, ���ӸӴ� ȹ��EȮ��E10% ����, ����ġ ȹ�澁E10% ����, ������ �� ���ŷ� ȸ����E20% ����

-- �流E-----------
GUILD_CREATE_COST = 100000;

--======================================================
-- ��ũ��Ʈ���� �翁Eϴ� ��E
--======================================================
-- Patorl Enum
PATROL_INFINITY		=0;			-- ���� ��E      
PT_ONCE					=0;
PT_ONCE_RETURN		=1;
PT_LOOP					=2;
PT_LOOP_BACKORDER	=3;

ROAM_DEFAULT_IDLE_TIME = 7.0;	-- �ι� �⺻ ��E�ð�

TEST_AI_DEBUG_MESSAGE = false;		-- ��ã��E���� ���� AI �޼���EŬ���̾�Ʈ�� �����ֱ�E
TEST_SHOW_CLIENT_NPC_POS = false;
TEST_SHOW_CLIENT_NPC_MOVE_PATH = false;
TEST_SHOW_CLIENT_NPC_PICKING = 0;
TEST_SHOW_NAVIGATION_MESH = false;
TEST_SHOW_CLIENT_COLT = false;
TEST_SHOW_CLIENT_FORMULA_DAMAGE = false;	-- Ŭ���̾�Ʈ�� ���ذ����� ������E����
TEST_SHOW_CLIENT_FORMULA_GUARD = false;		-- Ŭ���̾�Ʈ�� ��������� ������E����

TEST_MOVE_BY_CONTEXT = false;
TEST_RANDOM_MOVE = false;
ENABLE_COLT_TIMEOUT_CHECKER = false;
SHOW_LUA_ERROR_LOG = false;
SHOW_TALENT_LOG = false;
TEST_MAKE_SOLO_PARTY = false;
TEST_ENABLE_OFFLINE_PARTY_FOR_STAND_ALONE_MODE = false;
DEBUG_CREATE_CONVERT_LUAFILE = false;
TEST_CMD_HANDLER_COMPARER = false;

TEST_ENABLE_TUTORIAL = false;

--======================================================
-- AutoTest���� �翁Eϴ� ��E
--======================================================

AUTO_TEST_ACTIVE = false;
AUTO_TEST_TYPE = "none";
AUTO_TEST_LIMIT_FRAME = 0;
AUTO_TEST_REPEAT = 1
AUTO_TEST_TIME = 1000000000;
AUTO_TEST_SPEED = 1;
AUTO_TEST_FIELD_ID = 5000;
AUTO_TEST_NPC_COUNT = 10;

AITEST_TYPE = 0;			-- AITEST__NONE = 0, AITEST_STRESS_COMBAT_ONE_FIELD = 1; AITEST_STRESS_COMBAT_ALL_FIELD = 2;


INTERACT_QUEST_OBJECTIVE_ANI_TIME = 6

LOG_CRT = 0; -- �α׿� ����ECommandResultTable

ENABLE_COMBAT_FORMULA_VER2 = true;  -- ���ο�E��E�E���� ����E����
--LOG_FORMULA_COMBAT = true; -- ���ο�E��E�E���� �α� E���E����

ENABLE_GLOBAL_LOOT = true;			-- [���� óġ �̺�Ʈ ����] loot_global.xml �� �ִ� ���� ������ ��E� ���ÿ� ����E����

--======================================================
-- ����ȭ ��E� ��E
--======================================================
LIMIT_MAX_LEVEL = 40;  --�ִ�E���� ����
--======================================================
-- ����׿� �ʿ��� ��E
--======================================================
DEBUG_CONSOLE_SHOW_GAMETICK = true;		-- �ֿܼ� ����ƽ�� ����� ���ΰ�
DEBUG_CONSOLE_GAMETICK_TICK = 60;		-- ���ʿ� �ѹ��� ����� ���ΰ�
DEBUG_GAME_TICK_MOD_SPEED = 1.0;		-- ���� ƽ ���
IS_DESPAWN_AFTER_LOOT = false;				-- ���� ���� �ٷ� ������ ��E����

QUESTPVP_AFK_RETURN_TO_INN = 300000