-- �������� : Ʈ���̾� �ʵ� -> ħ�ĵ�����

function NPC_116504:OnDialogExit(Player, DialogID, Exit)
	if (1160212 == DialogID) then
		if (1 == Exit) then
			Player:GateToMarker(116001,20)
		end
	end
end




