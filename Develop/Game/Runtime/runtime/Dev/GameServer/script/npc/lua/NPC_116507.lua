-- �����׸� : Ʈ���̾� �ʵ� ����

function NPC_116507:OnDialogExit(Player, DialogID, Exit)
	if (1160092 == DialogID) then
		if (1 == Exit) then
			Player:GateToMarker(116,2)
		end
	end
end




