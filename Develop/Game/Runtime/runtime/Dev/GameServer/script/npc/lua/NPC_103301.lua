-- �䰡Ʈ ���� �ν�ũ
function NPC_103301:OnDialogExit(Player, DialogID, nExit)
	if (1030242 == DialogID) then
		if (1 == nExit) then
			Player:UpdateQuestVar(103024, 2)
		end
	end
end