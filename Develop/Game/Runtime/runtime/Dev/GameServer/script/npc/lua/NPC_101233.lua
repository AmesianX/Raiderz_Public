function NPC_101233:OnDialogExit(Player, DialogID, nExit)
	--�ݺ� �̸���óġ �� 101079
	if (1010791	== DialogID) and (2 == nExit) then		
		Player:GateToTrial(1010790, false)
	end	
end

