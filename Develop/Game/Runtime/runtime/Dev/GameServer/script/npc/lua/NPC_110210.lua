-- ��� �ٽ�ƿ

-- 110030 ��� �� Ʈ���̾� ����Ʈ ����
function NPC_110210:OnDialogExit(Player, DialogID, ExitID)
	if (DialogID == 1100301) then
		if (1 == ExitID) then
			Player:GateToTrial(1100300, false)
		end
	end
end


