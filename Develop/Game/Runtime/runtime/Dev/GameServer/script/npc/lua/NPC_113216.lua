-- ��ȥ�� ����(B)�� ��ȯ�� ������Ʈ Ʈ����

function NPC_113216:OnSpawn(SpawnInfo) -- ��ȯ��
	SpawnInfo.NPC:GainBuff(110090)
	local Pos = SpawnInfo.NPC:GetPos()
	local Dir = SpawnInfo.NPC:GetDir()
	local Point = Math_GetDistancePoint(Pos, Dir, 300)
	SpawnInfo.NPC:Move(Point)
end


