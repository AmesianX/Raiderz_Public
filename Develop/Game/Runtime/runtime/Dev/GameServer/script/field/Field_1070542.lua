-- ����� ��(����)	

function Field_1070542:OnSpawn(SpawnInfo)
	if (SpawnInfo.NPCID == 107237) then
		local Maid = SpawnInfo.NPC	
		local Session = this:MakeSession("MaidTalk3",{Maid})
		Session:AddBookmark("Player", Actor)		
	end
	--[[if (SpawnInfo.NPCID == 107004) then -- ��̰Ź�
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:MoveToMarker(15)
		SpawnInfo.NPC:MoveToMarker(14)
		SpawnInfo.NPC:MoveToMarker(13)
		SpawnInfo.NPC:MoveToMarker(12)	
	end--]]
end


function Field_1070542:OnSessionScene_MaidTalk3_Begin(Session)
	local Maid = this:GetSpawnNPC(13)
	Session:Blocking()	
		Maid:Say("$$Field_1070542_6") -- ������ �� �ǳ��� �濡 �����ſ���.
		Maid:NonDelaySay("$$Field_1070542_7") -- �������� ������ �� �ؼ� �׷��� ���� �������ϳ׿�.		
		Maid:Patrol({6,8,4,5}, PT_ONCE)		
		Maid:Say("$$Field_1070542_9") -- ����! �̰� �� ����?!
		Maid:Say("$$Field_1070542_10") -- � �� �Ź̵� �� ��� �غ���!
	Session:ChangeScene("EscapeSpider")	
end

function Field_1070542:OnSessionScene_MaidTalk3_EscapeSpider(Session)			
		this:EnableSensor(1)		
	Session:EndSession()
end
	
function Field_1070542:OnSensorEnter_1(Actor) -- �Ź̵� ������	
	this:DisableSensor(1)	
	local Maid = this:GetSpawnNPC(13)
	--local Field = AsPlayer(Actor):GetField()	
	if (AsPlayer(Actor):CheckCondition(1070542) == true) then
		local Session = this:MakeSession("MaidTalk4",{Maid})
		Session:AddBookmark("Player", Actor)		
	end
end

function Field_1070542:OnSessionScene_MaidTalk4_Begin(Session)			
	local Maid = this:GetSpawnNPC(13)
	Session:NonBlocking()
	Session:FindBookmark("Player"):Narration("$$Field_1070542_30")
	if (this:GetNPCCount(107034) ~= 0) then
		-- AsPlayer(Actor):UpdateQuestVar(107054, 3)
		local SpiderTable = {14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34}
		local i = 1

		repeat 
			local Spiders = this:GetSpawnNPC(SpiderTable[i])
				--GLog("����:"..i.."ȸ\n")
			Spiders:ClearJob()
			Spiders:SetAlwaysRun(true)
			Spiders:MoveToMarker(15)
			Spiders:Despawn()
			i = i + 1
		until i >= table.getn(SpiderTable)+1
	end
	Session:ChangeScene("Move")		
end

function Field_1070542:OnSessionScene_MaidTalk4_Move(Session)	
	local Bookshelf = this:GetSpawnNPC(11)	
	local Maid = this:GetSpawnNPC(13)	
	
	Session:Blocking()	
		Maid:Wait(2)
		Maid:Say("$$Field_1070542_43") -- ���� �Ƴ׿�.
		Maid:NonDelaySay("$$Field_1070542_44") -- �� �Ź̵��� ���� â�� ƴ�� ���ؼ� ���Գ� ����.
		Maid:Patrol({9,10,11}, PT_ONCE)
		Maid:FaceTo(Session:FindBookmark("Player"))
		Maid:Say("$$Field_1070542_47") -- �ٷ� �̰��̿���. �� ���� å���� �Űܳ��� ����...
		Maid:FaceTo(Bookshelf)		
		Maid:Say("$$Field_1070542_49") -- �ѹ� �� å���� �����غ�����.						
	Session:ChangeScene("investigate")		
end
		
function Field_1070542:OnSessionScene_MaidTalk4_investigate(Session)			
		this:EnableSensor(2)
	Session:EndSession()
end

function Field_1070542:OnSensorEnter_2(Actor)
	if (Actor:IsPlayer() == true) then
		this:DisableSensor(2)			
		this:SpawnByID(10)  -- ��̰Ź� ����
	end
end

function Field_1070542:OnDie(DespawnInfo)
	local Field = DespawnInfo.Field
	--if (DespawnInfo.NPCID == 107034) then
		--if (Field:GetNPCCount(107034) <= 17) then
			--Field:EnableSensor(1)
		--end
	--end
	if (DespawnInfo.NPCID == 107002) or (DespawnInfo.NPCID == 107002) then
		if (Field:GetNPCCount(107002) == 0) and (Field:GetNPCCount(107004) == 0) then
			local Maid = Field:GetSpawnNPC(13)
			Maid:FaceTo(DespawnInfo.NPC)
			Maid:Say("$$Field_1070542_75") -- ��~ �� ������ ������ ū �Ź̴� ó�� �þ��." />
			Maid:Say("$$Field_1070542_76") -- å�� ã������ � �� �������� ������ ������. ���� �� ���ھ��.
		end
	end
end

