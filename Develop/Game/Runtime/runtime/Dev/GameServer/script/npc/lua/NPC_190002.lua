-- ��Ʋ�Ʒ��� ������ ������

function NPC_190002:OnDialogExit(Player, DialogID, Exit)
	if (1900020 == DialogID) then
		if (1 == Exit) then
			Player:GateToMarker(190, 11)
			
		end
	end		
end
