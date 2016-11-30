function Field_1170191:OnSensorEnter_110(Actor)			
	this:SpawnByID(11750400)
	this:DisableSensor(110)
	
	local GuardSoldier = this:GetSpawnNPC(11750400)	
	local Session = this:MakeSession("FindMarini",{GuardSoldier})			
	Session:AddBookmark("Player", Actor)
	GLog("Enter110")	
	
end

function Field_1170191:OnSessionScene_FindMarini_Begin(Session)		
	local GuardSoldier = this:GetSpawnNPC(11750400)	
	GuardSoldier:SetAlwaysRun(true)
		
	GuardSoldier:FaceTo(Session:FindBookmark("Player"))
	GuardSoldier:Say("$$Field_1170191_1")	-- ����. �� �̸��� �ʰ� ����.
	GuardSoldier:Say("$$Field_1170191_2")	-- ���̵� �̰��� �������ٴ� ������ �Լ��߳�. �� ��ó ��򰡿� ������ �и���. �� �������. �!
	GuardSoldier:Patrol({11000, 11001, 11002, 11003}, PT_ONCE)
	
	Session:ChangeScene("Find_1")	
	GLog("Find_1")	
end


function Field_1170191:OnSessionScene_FindMarini_Find_1(Session)				
	local GuardSoldier = this:GetSpawnNPC(11750400)
	
	GuardSoldier:FaceTo(Session:FindBookmark("Player"))
	GuardSoldier:Say("$$Field_1170191_3")	-- ��. ���� ���� �� ����. ����ü ��� ���� �ִ� ����? ��� �����غ���.
	GuardSoldier:Patrol({11004, 11005, 11006}, PT_ONCE)
	Session:ChangeScene("Find_2")
	GLog("Find_2")
end

function Field_1170191:OnSessionScene_FindMarini_Find_2(Session)
	
	local GuardSoldier = this:GetSpawnNPC(11750400)
	
	GuardSoldier:FaceTo(Session:FindBookmark("Player"))
	GuardSoldier:Say("$$Field_1170191_4")	-- �� �αٵ� �ƴϱ�. ���� ���� �� ���ʻ��ΰ�? �ϴ� ������. ���� ���� �ʾ��� �ž�.
	GuardSoldier:Patrol({11007,11008, 11009}, PT_ONCE)
	Session:ChangeScene("Find_3")
	GLog("Find_3")
end

function Field_1170191:OnSessionScene_FindMarini_Find_3(Session)	
	local GuardSoldier = this:GetSpawnNPC(11750400)	
	GuardSoldier:Say("$$Field_1170191_5")	-- ���� �ִ� ���ڴ� Ȥ��?!			
	Session:EndSession()
	GLog("EndSession1")	
end


function Field_1170191:OnSensorEnter_300(Actor)	
	if (Actor:IsNPC() == false) then	
		return 		
	end		
	
	this:DisableSensor(300)	
	this:EnableSensor(299)
	
	this:SpawnByID(11750400)	
	this:SpawnByID(117501)	
end

function Field_1170191:OnSensorEnter_299(Actor)	
	this:DisableSensor(299)
	
	local EscapeLady = this:GetSpawnNPC(117501)											
	local GuardSoldier = this:GetSpawnNPC(11750400)					
			
	local Session = this:MakeSession("ArrestMarini", {EscapeLady, GuardSoldier})								
	Session:AddBookmark("Player", Actor)	
end


function Field_1170191:OnSessionScene_ArrestMarini_Begin(Session)

	local EscapeLady = this:GetSpawnNPC(117501)									
	local GuardSoldier = this:GetSpawnNPC(11750400)				
	
	EscapeLady:FaceTo(GuardSoldier) 			
	GuardSoldier:Say("$$Field_1170191_6",2.9)	-- ���� ã�ұ�! �� �̳� ��ü�� ������!
	EscapeLady:Say("$$Field_1170191_7",2.1)		-- ��!? ���� ���� ã�Ƴ� �ǰ�?
	EscapeLady:Say("$$Field_1170191_8",3.6)		-- ������, ���� ���� ������ �� ���� �� ������? �޾ƶ�!!
	Session:CombatSession()
	EscapeLady:UseTalentSelf(140702)
	
	Session:ChangeScene("Escape1")
	GLog("Escape1")
end

function Field_1170191:OnSessionScene_ArrestMarini_Escape1(Session)
	
	local EscapeLady = this:GetSpawnNPC(117501)
	local GuardSoldier = this:GetSpawnNPC(11750400)
	
	EscapeLady:SetAlwaysRun(true)	
	-- Session:NonBlocking()
	-- Session:MakePeace()				
	EscapeLady:MoveToMarker(11750100)	
	GuardSoldier:SayNow("$$Field_1170191_9",2.8)	-- ũ��!! ��� ���� �����϶�!!		
	this:SpawnByID(11736000)	
	this:SpawnByID(50121200)
	Session:ChangeScene("Escape2")
	GLog("Escape2")	
end


function Field_1170191:OnSessionScene_ArrestMarini_Escape2(Session)
	
	local EscapeLady = this:GetSpawnNPC(117501)											
	local GuardSoldier = this:GetSpawnNPC(11750400)	
	local ActivateDoor = this:GetSpawnNPC(11736000)					
	
	-- Session:Blocking()			
	this:SpawnByID(50121200)		
	ActivateDoor:Say("$$Field_1170191_10")			--guard:Say("����...���� �ݾҽ��ϴ�!!!")
	
			
	EscapeLady:FaceTo(ActivateDoor)
	EscapeLady:Say("$$Field_1170191_11",5.5)			-- ��� �ⱸ�� ������ �ǰ�? ��?! ����, �������.
	EscapeLady:FaceTo(GuardSoldier) 			
	
	Session:ChangeScene("Escape3_0")
	GLog("Escape3")
end


function Field_1170191:OnSessionScene_ArrestMarini_Escape3_0(Session)
	
	local EscapeLady = this:GetSpawnNPC(117501)												
	local GuardSoldier = this:GetSpawnNPC(11750400)			
	local WarpPos = this:GetMarkerPos(11750101)
	local WarpEffect1 = this:GetSpawnNPC(30100)
	local WarpEffect2 = this:GetSpawnNPC(30101)
	
	WarpEffect1:GainBuff(111104)
	WarpEffect2:GainBuff(111104)
	
	GuardSoldier:Say("$$Field_1170191_12")			-- �ƴ�!
	EscapeLady:FaceTo(GuardSoldier)
	EscapeLady:Warp(WarpPos)
	EscapeLady:FaceTo(GuardSoldier)	
	EscapeLady:Say("$$Field_1170191_13",5.2)			-- �̷��� ����ϰ� �ڸ� ���ѱ�µ�, ���⸦ �Ѵٰ� ���� �ҿ��̳�, �ּ��ϱ���.		
	-- EscapeLady:UseTalentSelf(140705)
	
	Session:ChangeScene("Escape4")
	GLog("Escape4")
end

function Field_1170191:OnSessionScene_ArrestMarini_Escape4(Session)
	local EscapeLady = this:GetSpawnNPC(117501)
	local GuardSoldier = this:GetSpawnNPC(11750400)				
	
	Session:CombatSession()
	-- Session:NonBlocking()	
	GuardSoldier:SayNow("$$Field_1170191_14")		-- ����!		
	-- GuardSoldier:Die(GuardSoldier)			
	EscapeLady:UseTalent(140705, GuardSoldier)		
	-- Session:Blocking()	
	
	Session:ChangeScene("Escape4_0")	
	GLog("Escape4_0")
end

function Field_1170191:OnSessionScene_ArrestMarini_Escape4_0(Session)	
	local EscapeLady = this:GetSpawnNPC(117501)
	-- local GuardSoldier = this:GetSpawnNPC(11750400)			
	
	EscapeLady:FaceTo(Session:FindBookmark("Player"))			
	EscapeLady:Say("$$Field_1170191_15",2.7)			-- �ƴ�? ��...... �� ��ȹ�� ������ �뺴�̱���."
	EscapeLady:FaceTo(Session:FindBookmark("Player"))
	EscapeLady:Say("$$Field_1170191_16",5.6)			-- ȣȣ...... ������ �ܿ� �� �Ƿ����� ���� �� ��ȹ�� �����߱�.
	EscapeLady:FaceTo(Session:FindBookmark("Player"))
	EscapeLady:Say("$$Field_1170191_17",4.1)			-- �� �˾ƺ��� �� �տ��� �� �̻� �� ������� ���� �ʿ�� ����.
	
	
	Session:ChangeScene("Escape5")
	
	--����Ʈ ���� NPC�� ������
	for i = 30000, 30006 do
		this:SpawnByID(i)
	end	
	
	GLog("Escape5")
end

	
function Field_1170191:OnSessionScene_ArrestMarini_Escape5(Session)
	this:DespawnByID(117501, false)	
	this:SpawnByID(117502)

	local Marini = this:GetSpawnNPC(117502)
	Session:AddNPC(Marini)		
	
	Marini:FaceTo(Session:FindBookmark("Player"))	
	
	local WarpEffect1 = this:GetSpawnNPC(30100)
	local WarpEffect2 = this:GetSpawnNPC(30101)
	WarpEffect1:RemoveBuff(111104)
	WarpEffect2:RemoveBuff(111104)
	
	Marini:FaceTo(Session:FindBookmark("Player"))
	Marini:Say("$$Field_1170191_18",3.0)			-- �� �ĳ� ������ ���ķδ� ����������?	
	
	Marini:FaceTo(Session:FindBookmark("Player"))	
	Marini:Say("$$Field_1170191_19",4.7)			-- �� �̻� �ʿ� ����ϴ� ���� ��������. �� ���̵�� ����ϰŶ�.			
	
	Session:ChangeScene("Escape6")
	
	GLog("Escape6")
end


function Field_1170191:OnSessionScene_ArrestMarini_Escape6(Session)
	--Ÿ�̸Ӱ� ���͸� �����ϰ� ����Ʈ�� �������ش�
	this:SetTimer(11701910, 1, false)
	
	local Marini = this:GetSpawnNPC(117502)
	Marini:GainBuff(111105)
	
	Session:EndSession()
	GLog("TimerOn")	
end


function Field_1170191:OnSensorEnter_400(Actor)
	this:DisableSensor(400)
	-- this:KillTimer(11701912)
	
	local Marini = this:GetSpawnNPC(117502)		
	local Session = this:MakeSession("Finish", {Marini})									
	
	AsPlayer(Actor):UpdateQuestVar(117019, 1)
	
	Session:AddBookmark("Player", Actor)					
	GLog("Enter400")
end

function Field_1170191:OnSessionScene_Finish_Begin(Session)	
	local Marini = this:GetSpawnNPC(117502)	
	Marini:RemoveBuff(111105)
	Marini:FaceTo(Session:FindBookmark("Player"))
	Marini:Say("$$Field_1170191_20",6.3)			-- �Ƹ��ɳ� �������� ��ȭ�� ���̵��� ���� ���ܿ��ϴٴ�. ���� �̰� �޾Ƴ� �� ������?			
	Marini:UseTalent(140703, Session:FindBookmark("Player")) --���̾								
	
	Marini:FaceTo(Session:FindBookmark("Player"))
	Marini:Say("$$Field_1170191_21",4.7)			-- ...... ���� �޾Ƴ±�. �ð��� ������ ������� ����ְڴ�.
	Marini:Say("$$Field_1170191_22",6.0)			-- ������ ������ ���� ��ȹ�� ��� �����ϸ� �׶����� �� �̻� �ں� ���� ���� ���̴�.								
	
	Session:ChangeScene("End0")	
		
end

function Field_1170191:OnSessionScene_Finish_End0(Session)		
	this:DespawnByID(117502, false)		
	this:SetTimer(117502, 1, false)
	Session:EndSession()
	GLog("Finish")		
end

function Field_1170191:OnDie(DespawnInfo)		
	
	if (DespawnInfo.NPCID == 117510) then 	
		if (this:GetNPCCount(117510) == 0 ) and (this:GetNPCCount(117511) == 0 ) then
			this:EnableSensor(400)			
			GLog("DespawnGetAllMon")
		end
	end
	
	if (DespawnInfo.NPCID == 117511) then
		if (this:GetNPCCount(117510) == 0 ) and (this:GetNPCCount(117511) == 0 ) then
			this:EnableSensor(400)			
			GLog("DespawnGetAllMon")
		end	
	end
	
	-- if (DespawnInfo.NPCID == 117502) then		
		-- this:SetTimer(117502, 10 , false)	
	-- end
end


-- function Field_1170191:OnSensorEnter_500(Actor)	
	-- AsPlayer(Actor):GateToMarker(117, 3)	
	-- GLog("Enter 500")
-- end
	
function Field_1170191:OnTimer(TimerID)
	
	-- if (TimerID == 11701912) then		
	
		-- local dice = math.random(0,2)		 
		-- local Marini = this:GetSpawnNPC(117502)
		
		-- if dice == 0 then					
			-- Marini:Say("$$Field_1170191_015") 		--marini:Say("���� ���� ������ �ƴϾ�!") 		
		-- end
	
		-- if dice == 1 then				
			-- Marini:Say("$$Field_1170191_016") 			--marini:Say("� �� ��ƺ����� �׷�!") 			
		-- end					
	-- end
	
	if (TimerID == 11701910) then		
		
		local effect1 = this:GetSpawnNPC(30000)
		local effect2 = this:GetSpawnNPC(30001)
		local effect3 = this:GetSpawnNPC(30002)
		local effect4 = this:GetSpawnNPC(30003)
		local effect5 = this:GetSpawnNPC(30004)
		local effect6 = this:GetSpawnNPC(30005)
		local effect7 = this:GetSpawnNPC(30006)
		
		effect1:GainBuff(40904)
		effect2:GainBuff(40904)
		effect3:GainBuff(40904)
		effect4:GainBuff(40904)
		effect5:GainBuff(40904)
		effect6:GainBuff(40904)
		effect7:GainBuff(40904)		
				
		for i = 20000, 20011 do			
			this:SpawnByID(i)	
		end		
		
		this:SetTimer(11701911, 5, false)				
	end	
	
	if (TimerID == 11701911 ) then
	
		local effect1 = this:GetSpawnNPC(30000)
		local effect2 = this:GetSpawnNPC(30001)
		local effect3 = this:GetSpawnNPC(30002)
		local effect4 = this:GetSpawnNPC(30003)
		local effect5 = this:GetSpawnNPC(30004)
		local effect6 = this:GetSpawnNPC(30005)
		local effect7 = this:GetSpawnNPC(30006)
		
		-- local wall = this:GetSpawnNPC(11724302)		
		-- local guard1 = this:GetSpawnNPC(11736000)					
		-- local door = this:GetSpawnNPC(50121200)		
		
		effect1:RemoveBuff(40904)
		effect2:RemoveBuff(40904)
		effect3:RemoveBuff(40904)
		effect4:RemoveBuff(40904)
		effect5:RemoveBuff(40904)
		effect6:RemoveBuff(40904)
		effect7:RemoveBuff(40904)		
		
		-- this:DespawnByID(wall, false)
		-- this:DespawnByID(guard1, false)
		-- this:DespawnByID(door, false)			
		-- this:EnableSensor(100)			
		-- this:EnableSensor(101)			
		
		-- this:EnableSensor(400)
		
	end
	
	if (TimerID == 117502) then				
		-- this:Despawn(117502, false)
		this:EnableSensor(500)		
	end
end

 
 function Field_1170191:OnSpawn(SpawnInfo)	
	if (SpawnInfo.NPCID == 117226) then	
		local cursed_water1 = this:GetNPC(117226)
		cursed_water1:GainBuff(111100)
	end
	
	--�����ȹ��� 	
	if (SpawnInfo.NPCID == 117227) then	
		local cursed_water2 = this:GetNPC(117227)
		cursed_water2:GainBuff(111101)
	end
end

