function Quest_119017:OnObjInteract(Player, ObjectiveID, Trigger, Progress, NPC)
	-- local Field = Player:GetField()			
	GLog("NPC in")							
	NPC:DisableInteraction()									
	-- local effector = Field:GetSpawnID(118252)
	
	NPC:GainBuff(111403)
			
			
	-- ����Ʈ�� ������ ���� �� ���̸� �����Ͱ� ������ �ǰ�						
	-- ����Ʈ�� ������ ���� ���� �� ���̸� �����ʹ� �������� �ʴ´�
			
			
	-- Field:SetTimer(119017,10,false)					
	-- local dice = math.random(1,3)			
	-- if dice == 1 then
	-- Player:Say("������ �͵��� �� ���� ���� �ʴ±�!!")			
	-- end			
	-- if dice == 2 then
		-- Player:Say("���⸸ �ص� �买��������")			
	-- end			
	-- if dice == 3 then
		-- Player:Say("���ڱ� ���� �޽����� ���±�.")			
	-- end			
	-- Field:SetTimer(119017,10,false)				
	-- Field:SetTimer(118252,10,false)							
	-- NPC:SetDecayTime(5)
	-- NPC:Die(Player)
	-- end	
	-- end
end


