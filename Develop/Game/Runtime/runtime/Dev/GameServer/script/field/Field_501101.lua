-- �� �ĳ� ������


function Field_501101:OnCreate()

	Field_501101.NPC_Nator = 501000
	Field_501101.NPC_Nator_Man = 501001

	Field_501101.NPC_Executioner1 = 501002
	
	Field_501101.NPC_Saintvirgin = 501003
	Field_501101.NPC_Executioner2 = 7501004 -- npc id
	
	Field_501101.NPC_Doorman1 = 101001
	Field_501101.NPC_Doorman2 = 102001
	Field_501101.NPC_Researcher = 112601
	
	Field_501101.NPC_Door1 = 101000
	Field_501101.NPC_Door2 = 102000
	Field_501101.NPC_Statue = 103000 -- ����
	Field_501101.NPC_Door_Lounge = 108000 
	Field_501101.NPC_Door_TortureChamber = 109000
	Field_501101.NPC_Door_Oratory = 113001 -- �⵵��
	Field_501101.NPC_Door_Saintvirgin = 114001 -- �����
	
	Field_501101.MARKER_ShapeShifting = 103000 -- ������ ���� ��ġ
	Field_501101.Talent_ShapeShifting = 250100102 -- ������ ���� ��ų
	
	Field_501101.Talent_OpenTheDoor = 250120001
	Field_501101.Talent_OpenTheStatue = 250120101
	Field_501101.Talent_OpenTheStoneDoor = 250120501
	Field_501101.Talent_CloseTheDoor = 250120002
	Field_501101.Talent_OpenTheRoomDoor = 250121401
	Field_501101.Talent_CloseTheRoomDoor = 250121402
	
	Field_501101.NPC_Say9 = 9 -- �ҹ� �����? �ϴ��� ���� õ�簡 �� �������� �ִٳ�./��, ������ ��. ���� �˸� �ȵ�.
	Field_501101.NPC_Say10 = 10 -- ���𿤱��� �� ���� ������ ������.
	Field_501101.NPC_Say11 = 11 -- �޸������� �����϶�!
	Field_501101.NPC_Say12 = 12 -- �� �ĳ� ������� ���� ������� ��ü�� �ƴ϶� �޸��� ������.
	Field_501101.NPC_Say13 = 13 -- ��� �ĸ� �޸������� ������ ���� �� ���� ���Դϴ�.
	Field_501101.NPC_Say14 = 14 -- ���𿤱� ����!
	Field_501101.NPC_Say15 = 15 -- ���� �����ʹԲ��� ���� ���Դϴ�. ������ �� �� �����ϴ�.
	--Field_501101.NPC_Say16 = 16 -- �����׸� �������ٽ� ��ũ������.. �޸������� �����ϴ� ���𿤱����� ������ �����̴�.
	Field_501101.NPC_Say17 = 17 -- �ھַο�� �޸������� �������� ����� ���� ���� �ϸ���.
	Field_501101.NPC_Say18 = 18 -- �� ���� Ÿ ���� �� ����.
	Field_501101.NPC_Say19 = 19 -- �޸�����. ���� ����ּ���.
	Field_501101.NPC_Say20 = 20 -- ��������
	--Field_501101.NPC_Say21 = 21 -- ���𿤺��� 5�� 12���� ��� ���ֽʽÿ�./�޸��� �������..~~
	--Field_501101.NPC_Say22 = 22 -- ���� ������ ��ȣ�� �ܶ�� ���� �Ǹ� �̾� ���� ������ ��ȣ���̴�.! 
	--Field_501101.NPC_Say23 = 23 -- ���״����� �ᱹ ������ �հ� ���������ȱ�.
	Field_501101.NPC_Say24 = 24 -- ��..�����.
	Field_501101.NPC_Say25 = 25 -- �ᱹ ���״����� ���� �ռ�ü�� ��ᰡ �ǰ� ���ž�..
	Field_501101.NPC_Say26 = 26 -- ���� ���� �־�.
	Field_501101.NPC_Say27 = 27 -- ���� ���� 2�� 5��.. �޸����� â�����̸�, ������ ���Ͻ��̴�.
	Field_501101.NPC_Say28 = 28 -- ��ü ����� ���� �����̴�!
	Field_501101.NPC_Say29 = 29 -- �츮�� ����� ���� �޸����� ���̴�!
	--Field_501101.NPC_Say30 = 30 -- ������������ ���� ������ �ϰ� �ִ°���? �ĳ� ����� ������ ���� �ּҼ�!
	
	--[[
	this:ActivateSpawnGroup(200) -- 2���� ������ȸ��
	this:ActivateSpawnGroup(300) -- 3�� ������ �����
	this:ActivateSpawnGroup(400) -- 4�� ���ϴ���, 5�� ġ�����
	this:ActivateSpawnGroup(600) -- 6��/7�� ġ���	
	this:ActivateSpawnGroup(800) -- 8�� ����, 9�� ����
	this:ActivateSpawnGroup(1000) -- 10��/11�� ������Ȱ��
	this:ActivateSpawnGroup(1200) -- 12�� ����
	this:ActivateSpawnGroup(1300) -- 13�� �⵵��	
	--]]
end

function Field_501101:OnSpawn(SpawnInfo)
	--GLog("Field_501101:OnSpawn("..SpawnInfo.SpawnID..")\n")
	
	-- Session
	if SpawnInfo.SpawnID == Field_501101.NPC_Executioner1 then
		local Session = this:MakeSession("Executioner", {SpawnInfo.NPC})
		if not Session then
			GLog("Session:Executioner is nil.\n")
		end
		Session:AddBookmark("NPC_Executioner", SpawnInfo.NPC)
		
	elseif SpawnInfo.SpawnID == Field_501101.NPC_Saintvirgin then
		local Session = this:MakeSession("Saintvirgin", {SpawnInfo.NPC})
		if not Session then
			GLog("Session:Saintvirgin is nil.\n")
		end
		Session:AddBookmark("NPC_Saintvirgin", SpawnInfo.NPC)
		
	elseif SpawnInfo.SpawnID == Field_501101.NPC_Nator_Man then
		local Session = this:MakeSession("Nator", {SpawnInfo.NPC})
		if not Session then
			GLog("Session:Nator is nil.\n")
		end
		Session:AddBookmark("NPC_Nator", SpawnInfo.NPC)
		
	-- Patrol
	elseif (SpawnInfo.SpawnID == 101107) then -- 1���� ���𿤱���
		SpawnInfo.NPC:Patrol({101001,101002,101003,101004,101005}, PT_LOOP_BACKORDER)	
	elseif (SpawnInfo.SpawnID == 102109) then -- 2���� ���𿤱���
		SpawnInfo.NPC:Patrol({102001,102002,102003,102004}, PT_LOOP_BACKORDER)
	elseif (SpawnInfo.SpawnID == 104105) then -- 4���� ���𿤻���
		SpawnInfo.NPC:Patrol({104001,104002,104003,104002,104001,104004, 104005}, PT_LOOP_BACKORDER)	
	elseif (SpawnInfo.SpawnID == 105115) then -- 5���� ���𿤼���
		SpawnInfo.NPC:Patrol({105001,105002,105003,105004,105005}, PT_LOOP_BACKORDER)	
	elseif (SpawnInfo.SpawnID == 108014) then -- 8���� ���𿤰���
		SpawnInfo.NPC:Patrol({108001,108002,108003,108004,108005}, PT_LOOP_BACKORDER)	
	elseif (SpawnInfo.SpawnID == 108015) then -- 8���� ������ ����
		SpawnInfo.NPC:Patrol({108006,108007,108008,108009,108010}, PT_LOOP_BACKORDER)
	elseif (SpawnInfo.SpawnID == 113127) then -- 13���� ������ ���� ����
		SpawnInfo.NPC:Patrol({113001,3,113002,113003}, PT_LOOP_BACKORDER)

	-- Say
	elseif (SpawnInfo.SpawnID == 101104) then -- 1���� ���� �������
		this:SetTimer(Field_501101.NPC_Say10, 40, true)
	elseif (SpawnInfo.SpawnID == 101103) then -- 1���� ���� �������
		this:SetTimer(Field_501101.NPC_Say11, 45, true)
	elseif (SpawnInfo.SpawnID == 102111) then -- 2���� ���� �������
		this:SetTimer(Field_501101.NPC_Say12, 40, true)
	elseif (SpawnInfo.SpawnID == 102106) then -- 2���� ���� �������
		this:SetTimer(Field_501101.NPC_Say9, 60, true)
	elseif (SpawnInfo.SpawnID == 103025) then -- 3���� ���� ����
		this:SetTimer(Field_501101.NPC_Say13, 40, true)
	elseif (SpawnInfo.SpawnID == 103010) then -- 3���� ���� ����
		this:SetTimer(Field_501101.NPC_Say14, 40, true)
	elseif (SpawnInfo.SpawnID == 102001) then -- 2���� ���� ������
		this:SetTimer(Field_501101.NPC_Say15, 50, true)
	--elseif (SpawnInfo.SpawnID == 501001) then -- 3���� �������� ������
	--	this:SetTimer(Field_501101.NPC_Say16, 30, true)
	elseif (SpawnInfo.SpawnID == 104101) then -- 4���� ���� ����
		this:SetTimer(Field_501101.NPC_Say17, 40, true)
	elseif (SpawnInfo.SpawnID == 106115) then -- 6���� ���� ����
		this:SetTimer(Field_501101.NPC_Say18, 30, true)
	elseif (SpawnInfo.SpawnID == 106116) then -- 6���� ���� ����
		this:SetTimer(Field_501101.NPC_Say19, 45, true)
	elseif (SpawnInfo.SpawnID == 107117) then -- 7���� ���� ����
		this:SetTimer(Field_501101.NPC_Say20, 60, true)
	--elseif (SpawnInfo.SpawnID == 108013) then -- 8���� ���� ���
	--	this:SetTimer(Field_501101.NPC_Say21, 35, true)
	--elseif (SpawnInfo.SpawnID == 501002) then -- 9���� �����۽�
	--	this:SetTimer(Field_501101.NPC_Say22, 30, true)
	--elseif (SpawnInfo.SpawnID == 112601) then -- 12�� 
	elseif (SpawnInfo.SpawnID == 113111) then -- 13���� ������ ���� ��������
		this:SetTimer(Field_501101.NPC_Say27, 40, true)
	elseif (SpawnInfo.SpawnID == 113109) then -- 13���� ������ ���� ����
		this:SetTimer(Field_501101.NPC_Say28, 80, true)
	elseif (SpawnInfo.SpawnID == 113125) then -- 13���� ������ ���� �̴ܽ��ǰ�
		this:SetTimer(Field_501101.NPC_Say29, 60, true)
	--elseif (SpawnInfo.SpawnID == 501003) then -- 13���� ����
	--	this:SetTimer(Field_501101.NPC_Say30, 25, true)
	end	
end

function Field_501101:OnTimer( Index )
	local Door1 = this:GetSpawnNPC( Field_501101.NPC_Door1 )
	local Door2 = this:GetSpawnNPC( Field_501101.NPC_Door2 )
	local gaddiel1_1 = this:GetSpawnNPC( 101104 )	-- 1���� ���� �������
	local gaddiel1_2 = this:GetSpawnNPC( 101103 )	-- 1���� ���� �������
	local gaddiel2_1 = this:GetSpawnNPC( 102111 )	-- 2���� ���� �������
	local gaddiel2_2 = this:GetSpawnNPC( 102104 )	-- 2���� ���� �������
	local gaddiel2_3 = this:GetSpawnNPC( 102106 )	-- 2���� ���� �������
	local gaddiel2_4 = this:GetSpawnNPC( 102108 )	-- 2���� ���� �������
	local gaddiel2_5 = this:GetSpawnNPC( 102001 )	-- 2���� ���� ������
	local gaddiel3_1 = this:GetSpawnNPC( 103025 )	-- 3���� ���� ����
	local gaddiel3_2 = this:GetSpawnNPC( 103010 )	-- 3���� ���� ����
	local gaddiel3_3 = this:GetSpawnNPC( 103018 )	-- 3���� ���� ����
	--local gaddiel3_4 = this:GetSpawnNPC( 501001 )	-- 3���� �������� ������
	local gaddiel4_1 = this:GetSpawnNPC( 104101 )	-- 4���� ���� ����
	local gaddiel6_1 = this:GetSpawnNPC( 106115 )	-- 6���� ���� ����
	local gaddiel6_2 = this:GetSpawnNPC( 106116 )	-- 6���� ���� ����
	local gaddiel7_1 = this:GetSpawnNPC( 107117 )	-- 7���� ���� ����
	--local gaddiel8_1 = this:GetSpawnNPC( 108013 )	-- 8���� ���� ���
	--local gaddiel9_1 = this:GetSpawnNPC( 501002 )	-- 9���� �����۽�
	--local gaddiel12_1 = this:GetSpawnNPC( 112601 )	-- 12���� ���� ����
	local gaddiel12_2 = this:GetSpawnNPC( 112603 )	-- 12���� �λ���� ����
	local gaddiel12_3 = this:GetSpawnNPC( 112605 )	-- 12���� �λ���� ����
	local gaddiel12_4 = this:GetSpawnNPC( 112604 )	-- 12���� �λ���� ���
	local gaddiel13_1 = this:GetSpawnNPC( 113111 )	-- 13���� ������ ���� ��������
	local gaddiel13_2 = this:GetSpawnNPC( 113109 )	-- 13���� ������ ���� ����
	local gaddiel13_3 = this:GetSpawnNPC( 113125 )	-- 13���� ������ ���� �̴ܽ��ǰ�
	--local gaddiel13_4 = this:GetSpawnNPC( 501003 )	-- 13���� ����


	if Index == Field_501101.NPC_Door1 then
		Door1:UseTalentSelf( Field_501101.Talent_CloseTheDoor )		-- ù��° �� ������
	elseif Index == Field_501101.NPC_Door2 then
		Door2:UseTalentSelf( Field_501101.Talent_CloseTheDoor )		-- �ι�° �� ������
	elseif Index == Field_501101.NPC_Say10 then
		local dice = math.random(0,2)
		if (dice == 0) then
			gaddiel1_1:Balloon("$$Field_501001_4")
		elseif (dice == 1) then
			gaddiel1_1:Balloon("$$Field_501001_5")
		else 
			gaddiel1_1:Balloon("$$Field_501001_8")
		end
	elseif Index == Field_501101.NPC_Say11 then
		gaddiel1_2:Balloon("$$Field_501001_5")
		gaddiel2_2:Balloon("$$Field_501001_5")
	elseif Index == Field_501101.NPC_Say12 then
		gaddiel2_1:Balloon("$$Field_501001_6")
	elseif Index == Field_501101.NPC_Say13 then
		gaddiel3_1:Balloon("$$Field_501001_7")
	elseif Index == Field_501101.NPC_Say14 then
		gaddiel3_2:Balloon("$$Field_501001_8")
		gaddiel3_3:Balloon("$$Field_501001_8")
	elseif Index == Field_501101.NPC_Say15 then
		gaddiel2_5:Balloon("$$Field_501001_9")
	--elseif Index == Field_501101.NPC_Say16 then
	--	gaddiel3_4:Say("$$Field_501001_10", 5)
	--	gaddiel3_4:Say("$$Field_501001_11", 5)
	elseif Index == Field_501101.NPC_Say17 then
		gaddiel4_1:Balloon("$$Field_501001_12")
	elseif Index == Field_501101.NPC_Say18 then
		gaddiel6_1:Balloon("$$Field_501001_13")
	elseif Index == Field_501101.NPC_Say19 then
		gaddiel6_2:Balloon("$$Field_501001_14")
	elseif Index == Field_501101.NPC_Say20 then
		gaddiel7_1:Balloon("$$Field_501001_15")
	elseif Index == Field_501101.NPC_Say9 then
		gaddiel2_3:Balloon("$$Field_501001_16")
		gaddiel2_4:Wait(3)
		gaddiel2_4:Balloon("$$Field_501001_17")
	--elseif Index == Field_501101.NPC_Say21 then
	--	gaddiel8_1:Balloon("$$Field_501001_18")
	--	gaddiel8_1:Wait(5)
	--	gaddiel8_1:Balloon("$$Field_501001_19")
	--elseif Index == Field_501101.NPC_Say22 then
	--	gaddiel9_1:Balloon("$$Field_501001_20")
	--elseif Index == Field_501101.NPC_Say23 then
	--	gaddiel12_1:Balloon("$$Field_501001_21")
	elseif Index == Field_501101.NPC_Say24 then
		gaddiel12_2:Balloon("$$Field_501001_22")
	elseif Index == Field_501101.NPC_Say25 then
		gaddiel12_3:Balloon("$$Field_501001_23")
	elseif Index == Field_501101.NPC_Say26 then
		gaddiel12_4:Balloon("$$Field_501001_24")
	elseif Index == Field_501101.NPC_Say27 then
		gaddiel13_1:Balloon("$$Field_501001_25")
	elseif Index == Field_501101.NPC_Say28 then
		gaddiel13_2:Balloon("$$Field_501001_26")
	elseif Index == Field_501101.NPC_Say29 then
		gaddiel13_3:Balloon("$$Field_501001_27")
	--elseif Index == Field_501101.NPC_Say30 then
	--	gaddiel13_4:Balloon("$$Field_501001_28")
	end
end

function Field_501101:OnDie(DespawnInfo)
--	GLog("Field_501101:OnDie("..DespawnInfo.SpawnID..")\n")
	if (DespawnInfo.SpawnID == Field_501101.NPC_Doorman1 ) then
		local Door = this:GetSpawnNPC( Field_501101.NPC_Door1 )		
		Door:UseTalentSelf( Field_501101.Talent_OpenTheDoor )		
		--this:SetTimer( Field_501101.NPC_Door1, 600, false )	
		this:ActivateSpawnGroup(200) -- 2���� ������ȸ��
		
	elseif (DespawnInfo.SpawnID == Field_501101.NPC_Doorman2) then
		local Door = this:GetSpawnNPC( Field_501101.NPC_Door2 )		
		Door:UseTalentSelf( Field_501101.Talent_OpenTheDoor )		

		--this:SetTimer( Field_501101.NPC_Door2, 600, false )
		this:ActivateSpawnGroup(300) -- 3�� ������ �����

	elseif (DespawnInfo.SpawnID == Field_501101.NPC_Nator) then
		--GLog("naterdie")
		local Door = this:GetSpawnNPC( Field_501101.NPC_Statue )		
		Door:Wait(10)
		Door:Narration("$$Field_501001_29")
		Door:UseTalentSelf( Field_501101.Talent_OpenTheStatue )		
		this:ActivateSpawnGroup(400) -- 4�� ���ϴ���, 5�� ġ�����
		
		--this:SetTimer( 1, 10, false )
		--this:ActivateSpawnGroup(5)
		--DespawnInfo.NPC:NarrationNow( "$$Field_121001_124"  )
	elseif (DespawnInfo.SpawnID == Field_501101.NPC_Researcher ) then
		local Door = this:GetSpawnNPC( Field_501101.NPC_Door_Oratory )
		--Door:Wait(60)
		local Enemy = DespawnInfo.NPC:GetKillerPlayer()
		Enemy:PartyCutscene(501001)
		Door:Narration("$$Field_501001_29")
		Door:UseTalentSelf( Field_501101.Talent_OpenTheStoneDoor )

		this:ActivateSpawnGroup(1300) -- 13�� �⵵��
	end
end

-- �� Ȱ��ȭ ����.
function Field_501101:OnSensorEnter_106001(Actor)
	this:ActivateSpawnGroup(600) -- 6��/7�� ġ���
	this:DisableSensor(106001)
end
	
function Field_501101:OnSensorEnter_108001(Actor)
	this:ActivateSpawnGroup(800) -- 8�� ����, 9�� ����
	this:DisableSensor(108001)
end

function Field_501101:OnSensorEnter_110001(Actor)
	
	for i = 110101, 110104 do
		local Knight = this:GetSpawnNPC( i )
		if Knight ~= nil then Knight:Attack(Actor) end
	end
	this:DisableSensor(110001)
end

function Field_501101:OnSensorEnter_111001(Actor)

	for i = 111101, 111104 do
		local Knight = this:GetSpawnNPC( i )
		if Knight ~= nil then Knight:Attack(Actor) end
	end
	this:DisableSensor(111001)
	this:ActivateSpawnGroup(1200) -- 12�� ����
end

-- ���� â�� ����

function Field_501101:OnSensorEnter_112001(Actor)
	this:ActivateSpawnGroup(1211)
	this:ActivateSpawnGroup(1221)
	
	local IronBar1 = this:GetSpawnNPC( 112001 )
	local IronBar2 = this:GetSpawnNPC( 112008 )
	IronBar1:UseTalentSelf( 250121201 )
	IronBar2:UseTalentSelf( 250121201 )
	IronBar1:Despawn(false)
	IronBar2:Despawn(false)
	
	for i = 112201, 112209 do
		local Knight = this:GetSpawnNPC( i )
		if Knight ~= nil then Knight:Attack(Actor) end
	end
	
	this:DisableSensor(112001)
end

function Field_501101:OnSensorEnter_112002(Actor)
	this:ActivateSpawnGroup(1212)
	this:ActivateSpawnGroup(1222)
	
	local IronBar1 = this:GetSpawnNPC( 112002 )
	local IronBar2 = this:GetSpawnNPC( 112007 )
	IronBar1:UseTalentSelf( 250121201 )
	IronBar2:UseTalentSelf( 250121201 )
	IronBar1:Despawn(false)
	IronBar2:Despawn(false)
	

	for i = 112301, 112309 do
		local Knight = this:GetSpawnNPC( i )
		if Knight ~= nil then Knight:Attack(Actor) end
	end

	this:DisableSensor(112002)
end

function Field_501101:OnSensorEnter_112003(Actor)
	this:ActivateSpawnGroup(1213)
	this:ActivateSpawnGroup(1223)

	local IronBar1 = this:GetSpawnNPC( 112003 )
	local IronBar2 = this:GetSpawnNPC( 112006 )
	IronBar1:UseTalentSelf( 250121201 )
	IronBar2:UseTalentSelf( 250121201 )
	IronBar1:Despawn(false)
	IronBar2:Despawn(false)

	for i = 112401, 112409 do
		local Knight = this:GetSpawnNPC( i )
		if Knight ~= nil then Knight:Attack(Actor) end
	end

	this:DisableSensor(112003)
end

function Field_501101:OnSensorEnter_112004(Actor)
	this:ActivateSpawnGroup(1214)
	this:ActivateSpawnGroup(1224)
	
	local IronBar1 = this:GetSpawnNPC( 112004 )
	local IronBar2 = this:GetSpawnNPC( 112005 )
	IronBar1:UseTalentSelf( 250121201 )
	IronBar2:UseTalentSelf( 250121201 )
	IronBar1:Despawn(false)
	IronBar2:Despawn(false)

	for i = 112501, 112509 do
		local Knight = this:GetSpawnNPC( i )
		if Knight ~= nil then Knight:Attack(Actor) end
	end

	this:DisableSensor(112004)
	this:EnableSensor(112001)
	this:EnableSensor(112003)
end


-- [ NPC_Session ] ������ ���� : ���� �� HP�� �������� ��Ű���� �����Ѵ�.

function Field_501101:OnSessionScene_Nator_Begin(Session)

	local Nator = AsNPC( Session:FindBookmark("NPC_Nator") )

	Session:CombatAll()
	Session:AddChangeSceneRule("ShapeShifting", Nator, "hp", {0, 10})
end

function Field_501101:OnSessionScene_Nator_ShapeShifting(Session)
	--GLog("Field_501101:OnSessionScene_Nator_ShapeShifting\n")
	local Nator = AsNPC( Session:FindBookmark("NPC_Nator") )
	
-- ������ �̵� : ��Ŀ 103000
-- ������ ��� : �ŷ�Ʈ 250100102
-- ������ ��� : 
-- ��Ű�� ���� : ���� 501000
-- ��Ű�� ��� : ��Ű�� ���� ���

	Nator:SetAlwaysRun( true )
	Nator:MoveToMarker( Field_501101.MARKER_ShapeShifting )
	Nator:NonDelayBalloon("$$NaiterDAggroChat")
	Nator:UseTalentSelf( Field_501101.Talent_ShapeShifting )
	--Nator:Wait(3)
	
	Session:ChangeScene("Complete")
end

function Field_501101:OnSessionScene_Nator_Complete(Session)
	--GLog("Field_501101:OnSessionScene_Nator_Combat\n")
	local Nator = AsNPC( Session:FindBookmark("NPC_Nator") )
	
	this:SpawnByID( Field_501101.NPC_Nator )
	Nator:Despawn(false)

	Session:EndSession()
end

function Field_501101:OnSessionScene_Nator_Finish(Session)
--	GLog("Field_501101:OnSessionScene_Nator_Finish\n")
end



-- [ NPC_Session ] ���� ���� : ���� �� ó��������2 �����Ѵ�.

function Field_501101:OnSessionScene_Saintvirgin_Begin(Session)
--	GLog("Field_501101:OnSessionScene_Saintvirgin_Begin\n")
	local Saintvirgin = AsNPC( Session:FindBookmark("NPC_Saintvirgin") )
	
	Session:CombatAll()
	Session:AddChangeSceneRule("Combat", Saintvirgin, "combat", {})
	Session:AddChangeSceneRule("Dead", Saintvirgin, "dead", {})
--	Session:AddChangeSceneRule("HelpMe", Saintvirgin, "hp", {0, 60})
end

function Field_501101:OnSessionScene_Saintvirgin_Combat(Session)
--	GLog("Field_501101:OnSessionScene_Saintvirgin_Combat\n")
	local Saintvirgin = AsNPC( Session:FindBookmark("NPC_Saintvirgin") )
	
	-- �����
	local Door = this:GetSpawnNPC( Field_501101.NPC_Door_Saintvirgin )
	Session:AddNPC( Door )
	Session:AddBookmark("Door", Door)
	
	-- ����
	this:SpawnByID( Field_501101.NPC_Door_Oratory + 1 )
	this:SpawnByID( Field_501101.NPC_Door_Oratory + 2 )

	Session:CombatAll()	
	Session:AddChangeSceneRule("HelpMe", Saintvirgin, "hp", {0, 60})
end

function Field_501101:OnSessionScene_Saintvirgin_HelpMe(Session)
--	GLog("Field_501101:OnSessionScene_Saintvirgin_HelpMe\n")
	local Saintvirgin = AsNPC( Session:FindBookmark("NPC_Saintvirgin") )
	local Door = AsNPC( Session:FindBookmark("Door") )
	--local Executioner = this:SpawnByID( Field_501101.NPC_Executioner2 )
	local Executioner = Saintvirgin:SummonNow( Field_501101.NPC_Executioner2, this:GetMarkerPos( Field_501101.NPC_Executioner2 ) )
	Session:AddNPC(Executioner)
	Session:AddBookmark("NPC_Executioner", Executioner)
	
	
	if Saintvirgin:GetMode() == NPC_501003.MODE_Blink then
--		Saintvirgin:SayNow("Scene - Mode Change")
		Saintvirgin:UseTalentSelf( NPC_501003.TALENT_Blink )
	end
	Saintvirgin:MoveToMarker(113201)
	Saintvirgin:NonDelaySay("$$LicheChat2")
	
	Door:UseTalentSelf( Field_501101.Talent_OpenTheRoomDoor )	

	Executioner:MoveToMarker(113202)
	Executioner:FaceTo(Saintvirgin)
	Saintvirgin:FaceTo(Executioner)
	Executioner:NonDelaySay("$$LicheChat3")
	--Saintvirgin:NonDelaySay("$$LicheChat4")
	--Session:ChangeScene("Combat")
	Session:ChangeScene("CombatWithExecutioner")
end

function Field_501101:OnSessionScene_Saintvirgin_CombatWithExecutioner(Session)
--	GLog("Field_501101:OnSessionScene_Saintvirgin_CombatWithExecutioner\n")
	local Saintvirgin = AsNPC( Session:FindBookmark("NPC_Saintvirgin") )
	local Executioner = AsNPC( Session:FindBookmark("NPC_Executioner") )
	
	Session:CombatAll()	
	Executioner:Assist(Saintvirgin)
	
--	Session:AddChangeSceneRule("Peace", Saintvirgin, "peace", {})
	Session:AddChangeSceneRule("Peace", Saintvirgin, "hp", {99, 101})
end

-- ���� ����� ���� ó��.
function Field_501101:OnSessionScene_Saintvirgin_Peace(Session)
--	GLog("Field_501101:OnSessionScene_Saintvirgin_Peace\n")
	local Saintvirgin = AsNPC( Session:FindBookmark("NPC_Saintvirgin") )
	local Door = AsNPC( Session:FindBookmark("Door") )
	
	-- ������ ��.. �� �ݱ�.
	Door:UseTalentSelf( Field_501101.Talent_CloseTheRoomDoor )
	
	-- ���� ���ֱ�.
	Door = this:GetSpawnNPC( Field_501101.NPC_Door_Oratory + 1 )
	Door:Despawn(false)
	Door = this:GetSpawnNPC( Field_501101.NPC_Door_Oratory + 2 )
	Door:Despawn(false)
	
	Session:CombatAll()
	Session:AddChangeSceneRule("Combat", Saintvirgin, "combat", {})
end

function Field_501101:OnSessionScene_Saintvirgin_Dead(Session)
--	GLog("Field_501101:OnSessionScene_Saintvirgin_Dead\n")
--	local Executioner = AsNPC( Session:FindBookmark("NPC_Executioner") )
--	Executioner:Die(Executioner)
	
	-- ������ ��.. ���� Ȥ�� ���� ������ ����.
	local Door = this:GetSpawnNPC( Field_501101.NPC_Door_Saintvirgin )		
	if Door:GetMode() ~= 1 then
		Door:UseTalentSelf( Field_501101.Talent_OpenTheRoomDoor )
	end
	
	-- ���� ���ֱ�.
	Door = this:GetSpawnNPC( Field_501101.NPC_Door_Oratory + 1 )
	Door:Despawn(false)
	Door = this:GetSpawnNPC( Field_501101.NPC_Door_Oratory + 2 )
	Door:Despawn(false)
	Door = this:GetSpawnNPC( Field_501101.NPC_Door_Saintvirgin + 1 )
	Door:Despawn(false)

	Session:EndSession()
end

function Field_501101:OnSessionScene_Saintvirgin_Finish(Session)
--	GLog("Field_501101:OnSessionScene_Saintvirgin_Finish\n")
end




-- [ NPC_Session ] ó�������� ���� : ���� �� ��������.

function Field_501101:OnSessionScene_Executioner_Begin(Session)
--	GLog("Field_501101:OnSessionScene_Executioner_Begin\n")
	local Executioner = AsNPC(Session:FindBookmark("NPC_Executioner"))

	Session:CombatAll()
	Session:AddChangeSceneRule("Combat", Executioner, "combat", {})
	Session:AddChangeSceneRule("Flee", Executioner, "hp", {0, 20})
	Session:AddChangeSceneRule("Dead", Executioner, "dead", {})
end

function Field_501101:OnSessionScene_Executioner_Combat(Session)
--	GLog("Field_501101:OnSessionScene_Executioner_Combat\n")
	Session:CombatAll()
	this:SpawnByID( Field_501101.NPC_Door_TortureChamber )
	this:SpawnByID( Field_501101.NPC_Door_TortureChamber + 1 )
end

function Field_501101:OnSessionScene_Executioner_Flee(Session)
--	GLog("Field_501101:OnSessionScene_Executioner_Flee\n")
	
	local DoorLounge = this:GetSpawnNPC( Field_501101.NPC_Door_Lounge )
	Session:AddNPC(DoorLounge)
	
	-- ���� ���ֱ�.
	local Door = this:GetSpawnNPC( Field_501101.NPC_Door_TortureChamber )		
	Door:Despawn(false)
	Door = this:GetSpawnNPC( Field_501101.NPC_Door_TortureChamber + 1 )
	Door:Despawn(false)
	--Door:UseTalentSelf( Field_501101.Talent_OpenTheStoneDoor )	

	local Executioner = AsNPC(Session:FindBookmark("NPC_Executioner"))
	if not Executioner then return end
	
	local modeEndTalent = {250100223, 250100232, 0, 250100219}
	local execMode = Executioner:GetMode()
	if execMode ~= 0 then
		Executioner:UseTalentSelf( modeEndTalent[execMode])
	end
	
	--Executioner:UseTalentSelf( 250100205 ) -- ��ħ
	--Executioner:NonDelaySay("$$NaipersRunChat")
	Executioner:Say("$$NaipersRunChat", 7)
	
	Executioner:SetAlwaysRun(true)
	
	this:ActivateSpawnGroup(1000) -- 10��/11�� ������Ȱ��
	
	Executioner:Patrol({50100201,50100202,50100203}, PT_ONCE)
	DoorLounge:UseTalentSelf( Field_501101.Talent_OpenTheStoneDoor )	
	Executioner:Patrol({50100204,50100205,50100206,50100207}, PT_ONCE)
	Executioner:Despawn(false)
	Session:EndSession()
end

function Field_501101:OnSessionScene_Executioner_Dead(Session)
	GLog("Field_501101 ��ũ��Ʈ�� ������ ����. Field_501101:OnSessionScene_Executioner_Dead\n")
	Session:EndSession()
end


