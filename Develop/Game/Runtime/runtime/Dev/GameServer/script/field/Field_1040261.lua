function Field_1040261:OnSpawn(SpawnInfo)
	if (SpawnInfo.NPCID == 104260) then
		SpawnInfo.NPC:GainBuff(111005)	
	end
end


function Field_1040261:OnSensorEnter_50(Actor) -- ���� �̺�Ʈ
	local Leg = this:GetSpawnNPC(104010) 
	this:DisableSensor(50)
	
	local Session = this:MakeSession("Leg",{Leg})		
	Session:AddBookmark("Player", Actor)		
	Session:MakePeace()
end

function Field_1040261:OnSessionScene_Leg_Begin(Session)
	local Leg = this:GetSpawnNPC(104010) 	
	
	Session:MakePeace()
	Leg:Say("$$Field_1040261_001",4.5) 			--Leg:����.. ������ �ð��� �� ���� �ʾҴ�. 
	Leg:Say("$$Field_1040261_002",11.2)			--Leg:��û�� ��� �༮�� ���� �������� ������ ������ �ٶ��� ��ٸ��� �ð��� �� ���� �ɸ��� �Ǿ���. 
	Leg:Say("$$Field_1040261_003",5.2) 			--Leg:������ �ᱹ �Ʒ����� ������ ����� �س��� ���Ҵ�.
	Leg:Say("$$Field_1040261_004",7.7)			--Leg:���� �Ƹ��ɳ� �� �ҿ︮���� ��Ȱ�ϰ� ������ �ð��� �����ϰ� �� ���̴�.
	
	Session:ChangeScene("ArelSpawn")
end

function Field_1040261:OnSessionScene_Leg_ArelSpawn(Session)
	Session:Blocking()	
	Session:MakePeace()
	this:SpawnByID(104249)
	local Leg = this:GetSpawnNPC(104010) 		
	local Arel = this:GetSpawnNPC(104249)		
	Arel:GainBuff(40904)		
	Arel:FaceTo(Leg)		
	Leg:Wait(2)
	Leg:FaceTo(Arel)
	Leg:Say("$$Field_1040261_005",5.0) 			--Leg:����.. ������ �ٿ��̽ÿ�.
	Leg:Say("$$Field_1040261_006",8.0)	 		--Leg:�� ���� ������ �ֱ� ������, ���� �������� �����϶�� ����� ������ �� �־����ϴ�. 
	Leg:Say("$$Field_1040261_007",12.5)	 		--Leg:�Ƹ��ɳ� �� �ҿ︮���� ��ȭ�� ������ �ϴ��� ������ �Ǹ� ����� �Ϻΰ� �Ǿ� ������ ���翡 ������ �ֽʽÿ�.	
	
	Arel:Say("$$Field_1040261_008",8.5) 		--Arel:�����ϼ̽��ϴ�. ������ ���� �Ǹ��ϰ� �߱���. ������ �����ڰ� ������ ���� �������� ������ ������ ���� ���� �𸣽ôٴ�. ���� �Ǹ��Դϴ�.		
	
	Leg:FaceTo(Session:FindBookmark("Player"))
	
	Leg:Say("$$Field_1040261_009",16.5)	  		--Leg:�ƴ�?! �Ʒ���. �Ǹ��ϰ� �� ��� �˼��մϴ�. ������ ���� ���ڿ��� �������� ������ ���� ��������� ���÷ν� �Ƹ��ɳ� �� �ҿ︮���� ��Ȱ�� �� ���� ���Դϴ�.
	Leg:Say("$$Field_1040261_010",5)	  		--Leg:���� ���� ������ �ð��� ������ ���Դϴ�.
	Arel:FaceTo(Session:FindBookmark("Player"))	
	Arel:Say("$$Field_1040261_011",14.0) 		--Arel:�졦�� �׷�����. ó�� ���� ������ ���ߴµ�, ���� ����� �ڶ�. Ȯ���� ������ ���ذ� ���±���. ������~ �̷��� ��� �� ����ֽ��ϴ�.		
	Arel:Say("$$Field_1040261_012",2.1) 		--Arel:������.		
	
	Leg:Say("$$Field_1040261_013",12.0)		 	--Leg:���� ���δ��� ������ ����� ������ ���� �Ǿ���. ���� ������ ��ҿ� ���Ķ�!
	
	Session:ChangeScene("Combat")
		
end

function Field_1040261:OnSessionScene_Leg_Combat(Session)
	local Arel = this:GetSpawnNPC(104249)			
	Arel:Despawn(false)	
	
	Session:CombatAll()	
	Session:EndSession()	
end

--[[

function ArelSpawn(Self)

	local Field = Self:GetField()
	local Leg = Field:GetSpawnNPC(104010) 
	local Arel = Field:GetSpawnNPC(50)		
	
	Leg:DisableCombat()
	Arel:DisableCombat()	
	
	Arel:GainBuff(40904)		
	Arel:FaceTo(Leg)	
	Arel:Say("��. �� ���� �װ��ΰ�.. ������ ���� ������ ����̱�")	
	Arel:WaitFor(Leg)
	Leg:FaceTo(Arel)
	Leg:Say("{ani=pain2}����.. ������ �ٿ��̽ÿ�.. ",8)
	Leg:Say("��� ������ �ֱ� ������, �����ڰ� ���� �������� ���� �� �� �Դϴ�. �� ���� �Ǹ�, �츮�� �Ϻΰ� �Ǿ� ������ ���翡 ���� ������ �ֽʽÿ�.",15)
	Leg:NextAction()	
	Leg:WaitFor(Arel)	
	Arel:Say("{ani=walk}�� �׵��� ���� ����. ���� �ϰ� ���� ��� �� ��.",8) --�ӽ�		
	Arel:NextAction()
	Leg:Say("������!!",3)			
	Leg:ScriptSelf("AwarePlayer")				
end

function AwarePlayer(Self)
	local Field = Self:GetField()	
	local Arel = Field:GetSpawnNPC(50)		
	Field:EnableSensor(51)		
end


function Field_1040261:OnSensorEnter_51(Actor)			
	local Leg = this:GetSpawnNPC(104010) 
	local Arel = this:GetSpawnNPC(50)	
	
	this:DisableSensor(51)
	
	Leg:FaceTo(AsPlayer(Actor))
	Arel:FaceTo(AsPlayer(Actor))		
	Arel:WaitFor(Leg)
	Leg:Say("������ �����ڰ� ������ �� ������ �����̱���. ��������~! ������ ������ �ð��� �մ�� ���ڱ���!!", 5)	
	Leg:NextAction()	
	Arel:Say("��.. �׷� ���̾���.. ���� ��� ���� ��մ� ���̾�", 5) --�ӽ�		
	Leg:Say("���� ������ ���Ķ�!", 5)		
	Leg:ScriptSelf("LegCombat")		
end

function LegCombat(Self)		
	local Field = Self:GetField()
	local Leg = Field:GetSpawnNPC(104010)
	local Arel = Field:GetSpawnNPC(50)		
	
	Leg:EnableCombat()
	Leg:ChangeAA(AA_ALWAYS)					
	Arel:Despawn(false)				
end

]]--



