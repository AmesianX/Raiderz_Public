--============================================
-- filename: Const.lua
-- ����: ��ũ��Ʈ�� C++���� ����ϴ� ���
--
--============================================

--======================================================
-- C++���� ����ϴ� ���
-- ��� �̸��� ������ ��� C++���� �Բ� �����ؾ� �Ѵ�.
--======================================================

WORLD_PLAYER_LIMIT = 5000;	-- ������ �ִ� ���� �ο� ��
GAME_SERVER_PLAYER_COUNT_LIMIT = 1000;			-- ���� ������ ������ �� �ִ� �÷��̾��� �ִ� ����
GAME_SERVER_DYNAMIC_FIELD_COUNT_LIMIT = 5000;	-- ���� ������ ������ �� �ִ� �����ʵ��� �ִ� ����
GAME_SERVER_SERVABLE_CPU = 100;				-- ���Ӽ��� ���� ���� �ִ� CPU
GAME_SERVER_SERVABLE_FPS = 5;				-- ���Ӽ��� ���� ���� �ּ� FPS
GAME_SERVER_SERVABLE_MEM = 1700;				-- ���Ӽ��� ���� ���� �ִ� Memory MB

FITNESS_ADDITIONAL_VALUE_TO_ALLOC_FIELD = 10;	-- �ʵ带 �Ҵ��� ������ �� �� Ư�� �������� �ִ� ������
-- �����ʵ� �Ҵ� : Prime Channel �� �ִ� ������ ������
-- �����ʵ� �Ҵ� : ��û�ڰ� �ִ� ������ ������

TIME_UPDATE_CHANNEL_BEHOLDER_SEC = 1.0;			-- ä�� ��Ȧ���� ������Ʈ �ֱ� (��)
TICK_EXPIRE_SILENT_CHANNEL = 300000;			-- ChannelBeholder ���� ������� �ʴ� ä���� �����ϱ���� ��� �ð� (ms)
RATIO_CHANNEL_CROWD_FOR_NEW_CHANNEL = 80;		-- ��� ä���� ��% �̻� ��ȭ�����̸� ���ο� ä���� �������� ���� ����

INCLUDE_DEV_FIELD_LIST 	= false;			-- �������� �ʵ� �ε� ����

INSERT_WORLD_INFO = false;					-- ���� ���۽ø��� �����߰�

TEST_ENABLE_TUTORIAL=false;
FIRST_ENTER_FIELD_ID=109;
FIRST_TUTORIAL_FIELD_ID=109;
MAX_CHANNEL_SIZE = 200;						-- �ʵ�� �ִ� ä��



--======================================================
-- ����׿� ���
--======================================================
SHOW_LUA_ERROR_LOG = true;
TEST_ALLOC_FIELD_ANOTHER_SERVER_ALWAYS = false;

DEBUG_CONSOLE_SHOW_GAMETICK = true;		-- �ֿܼ� ����ƽ�� ����� ���ΰ�
DEBUG_CONSOLE_GAMETICK_TICK = 60;		-- ���ʿ� �ѹ��� ����� ���ΰ�

MSMON_ENABLE = false; -- MasterServer Monitor ����� Ȱ��ȭ �� ���ΰ�