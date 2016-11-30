-- ����� ��
function Field_1070541:OnSensorEnter_3(Actor)
	if (Actor:IsPlayer() == true) then
		-- local Field = AsPlayer(Actor):GetField()		
		local Maid = this:GetSpawnNPC(8)
		local Session = this:MakeSession("TalkMaid",{Maid})
		Session:AddBookmark("Player", Actor)		
	end
end

function Field_1070541:OnSessionScene_TalkMaid_Begin(Session)		
		this:DisableSensor(3)	
		Session:Blocking()
		
		local Maid = this:GetSpawnNPC(8)
		
		Maid:FaceTo(Session:FindBookmark("Player"))
		Maid:Say("$$Field_1070541_8") -- �������. �� �˰ԵǾ��׿�.
		Maid:FaceTo(Session:FindBookmark("Player"))		
		Maid:Say("$$Field_1070541_10") -- ���δ� �������δ� ã�� ������ ������� ��ɲ��̶� �����̶�鼭��?
		Maid:FaceTo(Session:FindBookmark("Player"))		
		Maid:Say("$$Field_1070541_12") -- �ϴ��� ���翡������ ã�ƺ����� ����.
		Maid:NonDelaySay("$$Field_1070541_13") -- �����̿���.
		Maid:Patrol({11,12,13}, PT_ONCE)
		Maid:Say("$$Field_1070541_15")	 -- ��� ����.. ���⿡�� ���°� ����..
		Maid:MoveToMarker(17)
		
		
		Maid:Say("$$Field_1070541_19") -- ����.. ���翡�� ���� �� ���׿�.
		Maid:FaceTo(Session:FindBookmark("Player"))
		Maid:Say("$$Field_1070541_21") -- ��, ���������.
		Maid:Say("$$Field_1070541_22") -- �� �������� �� ���� å�� ��� â��� �Űܵξ��� �ɷ� ����ؿ�. �и��� �ű� ���� �ſ���.
		Maid:NonDelaySay("$$Field_1070541_23") -- �� ���������.	
		Maid:Patrol({11,14,15}, PT_ONCE)
		
		-- AsPlayer(Actor):UpdateQuestVar(107054, 1)
		Session:ChangeScene("SensorEnable")
			
end

function Field_1070541:OnSessionScene_TalkMaid_SensorEnable(Session)
		this:EnableSensor(4)	
		Session:EndSession()
end
		

function Field_1070541:OnSensorEnter_4(Actor)
	-- local Field = AsPlayer(Actor):GetField()
	local Maid = this:GetSpawnNPC(8)	
	local Session = this:MakeSession("MaidTalk2",{Maid})
	Session:AddBookmark("Player", Actor)		
	this:DisableSensor(4)	
	-- AsPlayer(Actor):UpdateQuestVar(107054, 2)	
end

	
function Field_1070541:OnSessionScene_MaidTalk2_Begin(Session)
		local Maid = this:GetSpawnNPC(8)	
		
		Maid:FaceTo(Session:FindBookmark("Player"))		
		Maid:Say("$$Field_1070541_36") -- �� ������ ���� ���Ͽ� �ִ� â��� ������ �� �־��.
		Maid:FaceTo(Session:FindBookmark("Player"))				
		Maid:Say("$$Field_1070541_38") -- ���� ���������� �ϼ���. ���� �� ���Ѿư��ڽ��ϴ�.				
		
		Session:ChangeScene("EnableSensor")		
end
		
function Field_1070541:OnSessionScene_MaidTalk2_EnableSensor(Session)
	Session:Blocking()
	this:EnableSensor(5)
	Session:EndSession()
end

--[[
function Field_1070541:OnDie(DespawnInfo)
	-- GLog("DespawnInfo.SpawnID = "..DespawnInfo.SpawnID.."\n")

	if (DespawnInfo.NPCID == 3057) then
		GLog("DespawnInfo.NPCID = "..DespawnInfo.NPCID.."\n")

		if (self:IsReadyToSpawnBoss(this) == true) then
			self:SpawnBoss(this)
		end

	elseif (DespawnInfo.NPCID == 3058) then
		GLog("DespawnInfo.NPCID = "..DespawnInfo.NPCID.."\n")
	end
end
--]]