#pragma once

/// �����
class ZConst
{
public:
	static int GAME_SERVER_DYNAMIC_FIELD_COUNT_LIMIT;	///< ���� ������ ������ �� �ִ� �����ʵ��� �ִ� ����
	static int GAME_SERVER_PLAYER_COUNT_LIMIT;			///< ���� ������ ������ �� �ִ� �÷��̾��� �ִ� ����
	
	static int FITNESS_ADDITIONAL_VALUE_TO_ALLOC_FIELD;	///< ���� �ʵ带 �Ҵ��� ������ �� �� Ư�� �������� �ִ� ������
	static float TIME_UPDATE_CHANNEL_BEHOLDER_SEC;		///< ChannelBeholder �� ������Ʈ �ֱ� (��)
	static unsigned int TICK_EXPIRE_SILENT_CHANNEL;		///< ChannelBeholder ���� ������� �ʴ� ä���� �����ϱ���� ��� �ð� (ms)
	static int RATIO_CHANNEL_CROWD_FOR_NEW_CHANNEL;		///< ��� ä���� ��% �̻� ��ȭ�����̸� ���ο� ä���� �������� ���� ����

	static bool		INCLUDE_DEV_FIELD_LIST;					///< �������� �ʵ嵵 �ε��� �� ����
	static bool INSERT_WORLD_INFO;						///< ���� �߰� - ���� �׽�Ʈ��

	// beginning field of newly made character.
	static int		FIRST_ENTER_FIELD_ID;
	static int		FIRST_TUTORIAL_FIELD_ID;


	/// ����׿�------------------------------------------------------------------

	

	static bool	SHOW_LUA_ERROR_LOG;
	static bool ALLOC_DYNAMIC_SERVER_ANOTHER_SERVER;

	static bool		DEBUG_CONSOLE_SHOW_GAMETICK;
	static int		DEBUG_CONSOLE_GAMETICK_TICK;

	static bool		TEST_ENABLE_TUTORIAL;				///< Ʃ�丮�� �Ѱ����

	static void Init();

	static int GetFirstEnterFieldID();
};
