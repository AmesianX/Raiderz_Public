-- ��Ʋ�Ʒ��� ������ ī���ν�

function NPC_190001:OnDialogExit(Player, DialogID, Exit)
	if (1900010 == DialogID) then
		if (1 == Exit) then
			Player:GateToMarker(190, 1)
			
		end
	end		
end
