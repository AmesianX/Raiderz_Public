function NPC_104152:OnSpawn(SpawnInfo)
	if	SpawnInfo.NPCID == 104152 then
		SpawnInfo.NPC:SetDieable(false)
		-- this:ChangeAA(AA_NONE)
		SpawnInfo.NPC:GainBuff(111004)
		--��ȣ�޴� ����Ʈ �߰� �ؼ� 
		
	end
end

function NPC_104152:OnTryHit(Actor, TalentID)
	if (TalentID == 140606) then		
		this:SetDieable(true)	
		this:RemoveBuff(111004)
		-- this:ChangeAA(AA_ALWAYS)
		-- this:Die(Actor)		
	end
end