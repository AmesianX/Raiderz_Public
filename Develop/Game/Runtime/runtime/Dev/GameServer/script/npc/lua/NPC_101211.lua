--���ĳ� ���������� 101037
function NPC_101211:OnDialogExit(Player, DialogID, nExit)		
	if (1010372 == DialogID) and (1 == nExit) then
		Player:UpdateQuestVar(101037, 1)
	end
	
	--���� �� ����Ű����
	if (1010262 == DialogID) and (1 == nExit) then
		Player:UpdateQuestVar(101026, 2)		
		Player:GainBuff(111205)
		Player:GainBuff(111206)		
		-- Player:UseTalent(140022, Player)
	end	
end


