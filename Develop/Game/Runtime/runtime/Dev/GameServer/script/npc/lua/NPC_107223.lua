-- �̶��� 

-- 107063 �ø�ǲ Ʈ���̾� ����Ʈ ����
function NPC_107223:OnDialogExit(Player, DialogID, ExitID)
	if (DialogID == 1070631) then
		if (1 == ExitID) then
			Player:GateToTrial(1070530, false)
		end
	end
end


