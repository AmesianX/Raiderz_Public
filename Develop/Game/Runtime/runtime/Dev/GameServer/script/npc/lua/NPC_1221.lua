-- ���� ���� �ֵ����

function NPC_1221:OnDialogExit(Player, DialogID, Exit)
	if (9911011 == DialogID and 1 == Exit) then -- ����� ���� ���
		Player:GainBuff(700007)	
	end
end
