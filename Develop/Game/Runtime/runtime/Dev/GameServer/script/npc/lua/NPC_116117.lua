-- ������ ���� ����
function NPC_116117:OnSpawn(SpawnInfo)
	SpawnInfo.NPC:GainBuff(88550) -- ��(�ӽ�)
	SpawnInfo.NPC:GainBuff(88554) -- ����(�ӽ�)
end

function NPC_116117:OnHitCapsule_1_0(HitInfo)
	if (HitInfo.TalentID == 140555) then	
		local Field = HitInfo.Victim:GetField()
		HitInfo.Attacker:GainBuff(110068)
		HitInfo.Victim:Die(HitInfo.Victim)
	end
end
