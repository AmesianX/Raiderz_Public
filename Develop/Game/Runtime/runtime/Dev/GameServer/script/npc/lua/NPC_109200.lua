-- ������ ���� (Ƽ���� ���� ����Ʈ���� ����ϴ� �༮ 2)
--[[
function NPC_109200:OnSpawn(SpawnInfo)
	this:Say("����� ������ ��!")
	this:SetTimer(1, 40, false)
end

function NPC_109200:OnTimer(TimerID)
	this:Despawn(false)
end
--]]


