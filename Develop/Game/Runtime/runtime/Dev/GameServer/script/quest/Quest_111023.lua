-- ������ ���� ���� ����

function Quest_111023:OnBegin(Player, NPC)
	local Field = Player:GetField()
	local Ghost = Field:GetSpawnNPC(111211)
	local Pos = Ghost:GetPos()
	Ghost:Balloon("$$Field_111_30",2.5)			-- ������ �ִ� ������ �ε��� �帮����.
	Field:SpawnDelay(111212, Pos, 4)
	Ghost:Balloon("$$Field_111_28",2.0)			-- �� �Һ��� ���󰡽ʽÿ�.
end
