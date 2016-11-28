#pragma once

class GEntityPlayer;

class GPlayerLevelUpdater
{
public:
	GPlayerLevelUpdater(GEntityPlayer* pPlayer);	
	void LevelUp(const int nGainXP, const int nNpcID = INVALID_NPC_ID);
	void LevelUp(const int nNewLevel, const int nNewExp, const int nGainExp, const int nNpcID = INVALID_NPC_ID);
	void LevelUpForDBTask(int nLevel, int nExp, int nGainExp);

	void SetLevelForGM(int nNewLevel, int nNewExp);		///< ������ ���� ����	

private:
	GEntityPlayer*		m_pPlayer;
};