-- ������ ���� (Ƽ���� ���� ����Ʈ���� ����ϴ� �༮ 1)
--[[
function NPC_109199:OnSpawn(SpawnInfo)
	this:Say("������ Ƽ���� �����̴�!")
	this:SetTimer(1, 40, false)
end

function NPC_109199:OnTimer(TimerID)
	this:Despawn(false)
end
--]]