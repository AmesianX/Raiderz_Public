-- �ҷ����̺�Ʈ �̵����� �ڹ�

function NPC_3315:OnDialogExit(Player, DialogID, ExitID)
	if (1212 == DialogID) then
		if (1 == ExitID) then
			Player:GateToMarker(3, 30606)			
		end	
	end
end



