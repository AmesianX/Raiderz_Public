-- ���ɽ���

function Quest_116030:OnEnd(Player, NPC) -- ����Ʈ�� �Ϸ��� �� Ʈ���̾� �ʵ忡 �ִٸ� ���� �ʵ�� �����ش�.
	if (Player:GetFieldID() == 1160301) then
		Player:GateToMarker(116004, 2)
	end
end

