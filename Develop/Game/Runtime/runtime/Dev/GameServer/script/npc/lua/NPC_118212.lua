function NPC_118212:OnSpawn(SpawnInfo)		
	this:DisableInteraction()
	this:GainBuff(111410)
end

function NPC_118212:OnDialogExit(Player, DialogID, nExit)		
	-- local Field = Player:GetField()
	-- local Scope = Field:GetSpawnNPC(118212)
	
	-- if (1180112 == DialogID) and (1 == nExit) then								
		-- Player:Tip("Ű�޶� �ֺ��� �ɵ��� �ִ� ���� Ȯ���Ͽ����ϴ�!")
		-- this:BehaviorMode(118212)		
		-- local Field = Player:GetField()
		-- local Scope = Field:GetSpawnNPC(118212)	
		this:DisableInteraction()		
		local Field = Player:GetField()		
		Field:EnableSensor(140711)				
		Player:Tip("$$NPC_118212_001")
		
	-- end
end

-- function NPC_118212:OnInteractionEnd(Player, InteractionID)			
	-- local Field = Player:GetField()
	-- local Scope = Field:GetSpawnNPC(118212)	
	-- this:Die(Scope)	
-- end