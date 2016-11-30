
-- ////////////////////////// ������ ���� Ʈ���̾� ����Ʈ ///////////////////////////

function Field_1091031:OnSpawn(SpawnInfo) -- ó���� ���� �Ұ�/���� �Ұ��� �����
	if (SpawnInfo.SpawnID == 109021) then
		SpawnInfo.NPC:DisableInteraction()
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:GainBuff(110019)		
	end
	if (SpawnInfo.SpawnID == 109221) then
		SpawnInfo.NPC:DisableCombat()
		SpawnInfo.NPC:ChangeAA(AA_NONE)
		SpawnInfo.NPC:SetAlwaysRun(true)		
		SpawnInfo.NPC:GainBuff(110019)		
	end
	if (SpawnInfo.SpawnID == 7) or (SpawnInfo.SpawnID == 8) then
		SpawnInfo.NPC:DisableCombat()
		SpawnInfo.NPC:ChangeAA(AA_NONE)
	end	
	if (SpawnInfo.SpawnID == 11) then
		SpawnInfo.NPC:SetAlwaysRun(true)	
		local Silver = this:GetSpawnNPC(109021)	
		SpawnInfo.NPC:Attack(Silver)
	end	
	if (SpawnInfo.SpawnID == 12) then
		SpawnInfo.NPC:SetAlwaysRun(true)	
		local Silver = this:GetSpawnNPC(109021)	
		SpawnInfo.NPC:Attack(Silver)
	end		
end

function Field_1091031:OnSensorEnter_2(Actor) -- ���� �̺�Ʈ

	if (Actor:IsPlayer() == true) then
		this:DisableSensor(2)
		local Silver = this:GetSpawnNPC(109021)	
		local Session = this:MakeSession("SilverDash", {Silver})
		Session:AddBookmark("Player", Actor)
	end
end

function Field_1091031:OnSessionScene_SilverDash_Begin(Session)
	local Silver = this:GetSpawnNPC(109021)
	local Viewpoint = this:GetSpawnNPC(1)
		
	Session:Blocking()	
		Silver:Wait(1)
		Silver:FaceTo(Session:FindBookmark("Player"))		
		Silver:Say("$$Field_1091031_33",5.4) -- ���� �Գ�. ��ٸ��� ���ļ� �� ȥ�� ó���Ϸ��� ���̾��ٰ�. �� ���� ����غ���?(����: �ѻ��)
		Silver:FaceTo(Viewpoint)		
		Silver:Say("$$Field_1091031_35",3.0) -- ��, � �̰��� �����ϰ� �� ������ ���ڰ�.
	Session:CombatAll()
		Silver:Patrol({2,3,4}, PT_ONCE)	
		--this:EnableSensor(3)
	Session:ChangeScene("End")
	--Session:EndSession()
end

function Field_1091031:OnSessionScene_SilverDash_End(Session)
	local Silver = this:GetSpawnNPC(109021)
		Silver:Patrol({5,6}, PT_ONCE)	
		this:DespawnByID(100, false) -- �ǹ��� ������ ���� ����(1)�� ����		
		this:EnableSensor(3)
	Session:EndSession()
end

function Field_1091031:OnSensorEnter_3(Actor) 
	local Silver = this:GetSpawnNPC(109021)	
	
	if (Actor:IsPlayer() == true) then
		this:DisableSensor(3)	
		local Session = this:MakeSession("DestroyEgg", {Silver})
		Session:AddBookmark("Player", Actor)		
	end
end

function Field_1091031:OnSessionScene_DestroyEgg_Begin(Session)
	local Silver = this:GetSpawnNPC(109021)
	local Cat = this:GetSpawnNPC(14)		

	Session:Blocking()	
		Silver:FaceTo(Cat)
		Silver:Say("$$Field_1091031_54",4.1) -- �� ���� ������ ���� ����̸� �ٹ̰� �ִ��� �� �� �����µ�. (����: �ѻ��)
		Silver:Say("$$Field_1091031_55",3.3) -- �̷� ���� �ڽ��� ������ ���ܼ� ���� �����ϰ� �־���. (����: �ѻ��)
	Session:CombatAll()		
		--Silver:ChangeAA(AA_FACTION)
		--Silver:Patrol({12}, PT_ONCE)
	--Session:ChangeScene("Destroy")
		Silver:ChangeAA(AA_FACTION)	
		Silver:Patrol({7,8,9,10}, PT_ONCE)
		this:DespawnByID(101, false) -- �ǹ��� ������ ���� ����(2)�� ����		
		--this:EnableSensor(4)
	--Session:EndSession()
	Session:ChangeScene("Sensor")
end

function Field_1091031:OnSessionScene_DestroyEgg_Sensor(Session)
		this:EnableSensor(4)
	Session:EndSession()
end

--[[
function Field_1091031:OnSessionScene_DestroyEgg_Destroy(Session)
	local Silver = this:GetSpawnNPC(109021)

	Session:Blocking()
		Silver:ChangeAA(AA_NONE)	
		Silver:Patrol({4,5,6,7,8,9,10}, PT_ONCE)
		this:EnableSensor(4)
	Session:EndSession()
end
--]]
function Field_1091031:OnSensorEnter_4(Actor) 
	local Field = Actor:GetField()
	local Silver = Field:GetSpawnNPC(109021)
	local Morken = Field:GetSpawnNPC(109221)	
	
	if (Actor:IsPlayer() == true) then
		Field:DisableSensor(4)
		
		local Session = this:MakeSession("SilverMorken", {Silver, Morken})
		Session:AddBookmark("Player", Actor)
	end
end

function Field_1091031:OnSessionScene_SilverMorken_Begin(Session)
	local Silver = this:GetSpawnNPC(109021)
	local Morken = this:GetSpawnNPC(109221)	

	Session:Blocking()
		Silver:FaceTo(Morken)		
		Morken:FaceTo(Silver)		
		Morken:Say("$$Field_1091031_97",4.3) -- �̰����� �̳��� �Ƕ�� �ϴ���, ���Ͻ��� ���� ��� �� ��� ���� �Ա�. (����: �ѻ��)  
		Morken:Say("$$Field_1091031_98",5.8) -- ��������! �׳���� ���⿡ ���� ���п� Ƽ���� �ִ� ��ư���� ����� �Ǿ�����? (����: �ѻ��)
		Silver:Say("$$Field_1091031_102",2.5) -- �� ������ �ڽľ�! ���� ����̳�!! (����: �ѻ��)
		Morken:Say("$$Field_1091031_104",2.1) -- �� ���� ���� �ñ��� �� �� ����. (����: �ѻ��)
		Morken:Say("$$Field_1091031_105",2.1) -- �� �̻� ����ϱ⵵ ������. �׿���!! (����: �ѻ��)
	Session:ChangeScene("Combat")
end

function Field_1091031:OnSessionScene_SilverMorken_Combat(Session)
	local Silver = this:GetSpawnNPC(109021)
	local Morken = this:GetSpawnNPC(109221)	
	local Pirate1 = this:GetSpawnNPC(7)
	local Pirate2 = this:GetSpawnNPC(8)
	
	Session:NonBlocking()
	Session:CombatAll()
		Silver:ChangeAA(AA_FACTION)
		Morken:ChangeAA(AA_ALWAYS)
		Pirate1:ChangeAA(AA_ALWAYS)
		Pirate2:ChangeAA(AA_ALWAYS)
		
		Morken:EnableCombat()
		Pirate1:EnableCombat()
		Pirate2:EnableCombat()
		
		Silver:SetAlwaysRun(false)	
		Pirate1:SetAlwaysRun(true)	
		Pirate2:SetAlwaysRun(true)	
		
		Morken:Patrol({10}, PT_ONCE)
		Pirate1:Attack(Silver)
		Pirate2:Attack(Silver)
	Session:AddChangeSceneRule("Run", Morken, "hp", {0, 40})
end

function Field_1091031:OnSessionScene_SilverMorken_Run(Session)
	local Silver = this:GetSpawnNPC(109021)
	local Morken = this:GetSpawnNPC(109221)	
	
	--Session:RemoveNPC(Silver)
	Session:Blocking()	
	Session:CombatAll()	
		Morken:ChangeAA(AA_NONE)
		Morken:GainBuff(5000051)		
		Morken:UseTalentSelf(210901731)
		Morken:FaceTo(Silver)		
		Morken:NonDelaySay("$$Field_1091031_177",7.0) -- ĩ! �� ����, ������ ���� �̰�����, ���Ŀ� ���� �ڴ� ���� �� ���̴�! ��������! (����: �ѻ��)
	Session:ChangeScene("Escape")		
end

function Field_1091031:OnSessionScene_SilverMorken_Escape(Session)
	local Silver = this:GetSpawnNPC(109021)
	local Morken = this:GetSpawnNPC(109221)	
	
	Session:Blocking()
		Silver:MakePeace()
	Session:RemoveNPC(Silver)
		Morken:MoveToMarker(130)
		Morken:Narration("$$NPC_109221_37")	-- ������ �����ƽ��ϴ�.	
		Morken:Despawn(false)	
		this:SpawnByID(11)
		this:SpawnByID(12)		
		this:SpawnByID(13)			
	Session:EndSession()		
end

function Field_1091031:OnSensorEnter_5(Actor) 
	local Field = Actor:GetField()
	local Silver = Field:GetSpawnNPC(109021)	
	
	if (Actor:IsPlayer() == true) then
		Field:DisableSensor(5)
		--GLog("173 Line")
		Silver:MakePeace()
		Silver:ChangeAA(AA_NONE)
		Silver:FaceTo(Actor)				
		Silver:Say("$$Field_1091031_165",4.5) -- ��, ¥����! ���� �༮ �����Ĺ����ݾ�!! �� ��Ҵµ����� (����: �ѻ��)
		Silver:Say("$$Field_1091031_166",2.8) -- ��ư �� ������ �� ����. � ���ư��ڰ�. (����: �ѻ��)
		Silver:ScriptSelf("Field_1091031_Interaction")		
	end
end

function Field_1091031_Interaction(Self)
	--GLog("183 Line")
	Self:EnableInteraction()
end

function Field_1091031:OnDie(DespawnInfo)
	local Field = DespawnInfo.Field
	--[[
	if (DespawnInfo.SpawnID == 1) then
		local Pirate2 = Field:GetSpawnNPC(2)
		if (Pirate2:IsDead() == true) then
			Field:DespawnByID(100,false)		-- ���� 1,2�� ������ ���� ����
		end
	end	
	if (DespawnInfo.SpawnID == 2) then
		local Pirate1 = Field:GetSpawnNPC(1)
		if (Pirate1:IsDead() == true) then
			Field:DespawnByID(100,false)		-- ���� 1,2�� ������ ���� ����
		end
	end	
	--]]
	if (DespawnInfo.NPCID == 109221) or (DespawnInfo.NPCID == 109209) or (DespawnInfo.NPCID == 109210) then
		--GLog("221Despawn Call\n")
		if (Field:GetNPCCount(1) == 1) and (Field:GetNPCCount(109209) == 0) and (Field:GetNPCCount(109210) == 0) then
			--GLog("EnableSensor_5 On\n")
			Field:EnableSensor(5)
		end
	end
end

