function NPC_501203:OnDialogExit(Player, DialogID, Exit)
	if (5010001 == DialogID and 1 == Exit) then -- �����ι����� ����
		Player:GateToMarker(501001, 109101)
	end
end
