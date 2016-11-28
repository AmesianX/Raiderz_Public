#include "stdafx.h"
#include "GWorld.h"
#include "GGlobal.h"
#include "GEnvManager.h"
#include "GFieldMgr.h"
#include "GEntityPlayer.h"
#include "GItem.h"
#include "GPlayerObject.h"
#include "GCommandTable.h"
#include "GGuildSystem.h"
#include "GPaletteSystem.h"
#include "GTDMaker.h"
#include "GPlayerTalent.h"
#include "GPaletteSystem.h"
#include "GPlayerObjectManager.h"
#include "GCommand.h"
#include "GBattleArenaMgr.h"
#include "GConst.h"
#include "GPlayerRecipe.h"
#include "AStlUtil.h"
#include "GItemHolder.h"
#include "GChallengerQuestMgr.h"
#include "GNPCMgr.h"
#include "GServer.h"
#include "GPlayerGuideBook.h"

void GWorld::Update( float fDelta )
{
	gmgr.pNPCMgr->Update(fDelta);

	// �ʵ� ������Ʈ
	PFC_B("GWorld::Update - GFieldMgr:Run");
	PFI_B(41, "GWorld::Update - GFieldMgr:Run");
	gmgr.pFieldMgr->Update(fDelta);
	PFI_E(41);
	PFC_E;

	// ������ ������Ʈ
	PFC_B("GWorld::Update - BattleArenaMgr->Update");
	gmgr.pBattleArenaMgr->Update(fDelta);

	PFC_B("GWorld::Update - GEnvManager:Update");
	PFI_B(43, "GWorld::Update - GEnvManager:Update");
	// ȯ�� ������Ʈ
	gmgr.pEnvManager->Update(fDelta);
	if (gmgr.pEnvManager->IsChangedTime())
	{
		gmgr.pFieldMgr->OnTimeChanged(gmgr.pEnvManager->GetOldTime(), (gmgr.pEnvManager->GetCurrentTime)());
	}
	if (gmgr.pEnvManager->IsChangedTimeHour())
	{
		gmgr.pFieldMgr->OnTimeChangedDetail(gmgr.pEnvManager->GetCurrentTimeHour());
	}
	PFI_E(43);
	PFC_E;

	PFC_B("GWorld::Update - ChallengerQuestMgr->Update");
	// ����������Ʈ ������Ʈ
	gmgr.pChallengerQuestMgr->Update(fDelta);
	PFC_E;
	
}

void GWorld::SendMyInfo(MUID& uidPlayer)
{
	GPlayerObject* pPlayer = gmgr.pPlayerObjectManager->GetPlayer(uidPlayer);
	if (NULL == pPlayer) return;

	GEntityPlayer* pEntityPlayer = pPlayer->GetEntity();
	if (NULL == pEntityPlayer) return;

	// MC_CHAR_MYINFO�� �α��ζ��� �����ְ�, �����̵����� ������ �ʴ´�.
	if (pEntityPlayer->IsMovedFromOtherGameServer())	return;

	GTDMaker tdMaker;
	// ���ο��� MC_QUEST_INFO Ŀ�ǵ带 ������ �־, �����̵� �˻����� ��ó���Ѵ�.
	vector<TD_PLAYERQUEST> vecTDPlayerQuest;
	tdMaker.MakeTD_PLAYERQUEST(pEntityPlayer, vecTDPlayerQuest);
	

	TD_MYINFO myinfo;
	tdMaker.MakeTD_MyInfo(pPlayer, myinfo);

	vector<TD_ITEM> vecTDInventory;
	tdMaker.MakeTD_ItemFromInventory(pEntityPlayer, vecTDInventory);

	vector<TD_ITEM> vecTDEquipment;
	tdMaker.MakeTD_ItemFromEquipment(pEntityPlayer, vecTDEquipment);

	vector<TD_ITEM_SLOT_INFO> vecTDReservedDummySlotInfo;
	tdMaker.MakeTD_ReservedDummySlot(pEntityPlayer, vecTDReservedDummySlotInfo);

	// TODO: 2nd skill set.
	SET_TALENTID setTalentID = pEntityPlayer->GetTalent().GetContainer();
	// vector<int> vecTalentID;
	// vecTalentID.insert(vecTalentID.end(), setTalentID.begin(), setTalentID.end());
	vector<TD_TALENT> vecTalent;
	for (SET_TALENTID::iterator itr = setTalentID.begin(); itr != setTalentID.end(); itr++)
	{
		TD_TALENT tdTalent = { *itr, SST_MAIN };
		vecTalent.push_back(tdTalent);
	}

	vector<TD_PALETTE> vecTDPalette;
	gsys.pPaletteSystem->MakeTD_PALETTE(pEntityPlayer, vecTDPalette);

	vector<TD_FACTION> vecTDFaction;
	tdMaker.MakeTD_Faction(pEntityPlayer, vecTDFaction);

	vector<int> vecRecipe = SetToVector(pEntityPlayer->GetPlayerRecipe().GetContainer());

	vector<int> vecGuideBook = SetToVector(pEntityPlayer->GetPlayerGuideBook().GetContainer());


	MCommand* pNewCmd = MakeNewCommand(MC_CHAR_MYINFO,
		10,
		NEW_SINGLE_BLOB(myinfo),
		NEW_BLOB(vecTDInventory),
		NEW_BLOB(vecTDEquipment),
		NEW_BLOB(vecTDReservedDummySlotInfo),
		NEW_BLOB(vecTalent),		
		NEW_BLOB(vecTDPlayerQuest),
		NEW_BLOB(vecTDPalette),
		NEW_BLOB(vecTDFaction),
		NEW_BLOB(vecRecipe),
		NEW_BLOB(vecGuideBook));

	pEntityPlayer->RouteToMe(pNewCmd);
}

void GWorld::Create()
{

}

void GWorld::Destroy()
{

}