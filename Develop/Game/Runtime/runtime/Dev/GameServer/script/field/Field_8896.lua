-- 8896 ������ 10���� -> ���簡

function Field_8896:OnDie(DespawnInfo)
	if (DespawnInfo.NPCID == 8896011) and (this:GetNPCCount(8896011) == 0) then
		this:SpawnByID(1)
	end
end