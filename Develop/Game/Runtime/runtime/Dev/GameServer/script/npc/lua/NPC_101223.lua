function NPC_101223:OnDialogExit(Player, DialogID, nExit)	
	-- 101057 ��ü�Ҹ��� ����
	if (1010572 == DialogID) and (1 == nExit) then
		Player:UpdateQuestVar(101057, 1)
	end
	
	-- 101026 ����õ�� ���𿤱�  / ��ȭ
	if (1010263 == DialogID) and (1 == nExit) then
		Player:UpdateQuestVar(101026, 2)
	end
end
