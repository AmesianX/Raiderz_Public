-- ���� ���� ����



function NPC_116603:OnSpawn(SpawnInfo)
	SpawnInfo.NPC:GainBuff(501206) -- ���� ���� ����
end


function NPC_116603:OnDie(DespawnInfo)
	local Field = this:GetField()
	local QuestPVP = Field:GetQuestPVP()
	QuestPVP:EndEvent(8010, 2)
end
