function NPC_3019:OnDialogExit(Player, DialogID, Exit)
	if (9920011 == DialogID and 1 == Exit) then -- ��Ÿ ���� ���
		Player:GainBuff(111506)		
	end
end
