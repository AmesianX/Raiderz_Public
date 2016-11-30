--���� 101057 ó��
function Field_101:OnSensorEnter_101217(Actor) 	
	if (AsPlayer(Actor):CheckCondition(1010572) == true) then		
		local victor = this:GetSpawnNPC(101217)		
		
		victor:UseTalentSelf(140050)
		AsPlayer(Actor):UpdateQuestVar(101057, 3)		
	end	
end


--�� �ĳ� ���������� --> ������ ������ ó��
function Field_101:OnSensorEnter_101218(Actor) 
	if (AsPlayer(Actor):CheckCondition(1010372) == true) then
		AsPlayer(Actor):UpdateQuestVar(101037, 2)					
	end
end


-- ////////////////////////// Ʈ���̾� ���� ���� ///////////////////////////

function Field_101:OnSensorEnter_101025(Actor) -- ������ ���� �Ұ� ����
	if Actor:IsPlayer() == true then
		if AsPlayer(Actor):CheckCondition(5010011) == true then
			AsPlayer(Actor):Tip("$$Field_101_3")
		end
		if AsPlayer(Actor):CheckCondition(5010012) == true then  -- ���� ������ ���� �Ұ� ����
			AsPlayer(Actor):Tip("$$Field_101_4")
		end
	end
end



-- ħ���� �庮���� ���� ���� ���� üũ - ħ���� �庮 �Ǵ� �μ��� �庮
-- function Field_101:OnSensorEnter_3(Actor)	
	
	-- if (AsPlayer(Actor):CheckCondition(1180089) == true) then
		-- AsPlayer(Actor):GateToMarker(119, 1)
	-- else 
		-- AsPlayer(Actor):GateToMarker(118, 1)
	-- end
-- end

function Field_101:OnTimer(TimerID)

	-- ���� �� ����Ű���� ó��
	-- if (TimerID == 10106000) then
		-- local Effector = this:GetSpawnNPC(10150104)
		-- Effector:RemoveBuff(111204)
	-- end
	---101017 �濪��å --101225 
	if (TimerID == 10101700) then
		local npc1 = this:GetSpawnNPC(101225)			
		npc1:RemoveBuff(111201)			
	end	
	
	---101017 �濪��å --101226
	if (TimerID == 10101701) then
		local npc2 = this:GetSpawnNPC(101226)			
		npc2:RemoveBuff(111201)			
	end	
	
	---101017 �濪��å --101227 
	if (TimerID == 10101702) then
		local npc3 = this:GetSpawnNPC(101227)			
		npc3:RemoveBuff(111201)			
	end	
	
	---101017 �濪��å --101228 
	if (TimerID == 10101703) then
		local npc4 = this:GetSpawnNPC(101228)			
		npc4:RemoveBuff(111201)			
	end	
	
	------------------------------------------
	
	---101018 ȣ���� ����
	if (TimerID == 10101800) then
	
		local wheel01 = this:GetSpawnNPC(10150100)					
		local wheel02 = this:GetSpawnNPC(10150101)
		local wheel03 = this:GetSpawnNPC(10150102)
		local wheel04 = this:GetSpawnNPC(10150103)
		
		wheel01:RemoveBuff(111202)				
		wheel02:RemoveBuff(111202)
		wheel03:RemoveBuff(111202)
		wheel04:RemoveBuff(111202)
	end	
	---101018 ȣ���� ����
	if (TimerID == 10101802) then
		local wheel1 = this:GetSpawnNPC(101501)			
		wheel1:RemoveBuff(111202)			
	end	
	
	
	--���������ϴ� ���𿤱������� ��ȭ
	
	if (TimerID == 101407) then
	
		local dice = math.random(0,1)	
		
		local AnnounceGadiel01 = this:GetSpawnNPC(10140900)
		
		if dice == 0 then 
			AnnounceGadiel01:SayNow("$$Field_10140901")
		elseif dice == 1 then		
			AnnounceGadiel01:SayNow("$$Field_10140902")
		end
	end	
	
	
	--���Ÿ ġ�� ���డ�� Ż��Ʈ
	if (TimerID == 101415) then
		
		local dice = math.random(0,2)
		local guitarHero = this:GetSpawnNPC(10141500)
		
		if dice == 0 then
			guitarHero:UseTalentSelf(140060)			
		elseif dice == 1 then
			guitarHero:UseTalentSelf(140061)
		elseif dice == 2 then
			guitarHero:UseTalentSelf(140062)
		end
	end 
end

--101018 ȣ���� ����  - ���� // 1015010
function Field_101:OnSensorEnter_1015010(Actor) 
	
	if (AsPlayer(Actor):CheckCondition(1010181) == true) then
	
		local wheel01 = this:GetSpawnNPC(10150100)					
		local wheel02 = this:GetSpawnNPC(10150101)		
		local wheel03 = this:GetSpawnNPC(10150102)
		local wheel04 = this:GetSpawnNPC(10150103)
		
		wheel01:GainBuff(111202)				
		wheel02:GainBuff(111202)
		wheel03:GainBuff(111202)
		wheel04:GainBuff(111202)
		
		this:SetTimer(10101800, 60, false)			
	end
end

function Field_101:OnSensorTalent_1015010(Actor, TalentID) 
	if (AsPlayer(Actor):CheckCondition(1010181) == true ) and (TalentID == 140021 ) then		
		local wheel01 = this:GetSpawnNPC(10150100)					
		local wheel02 = this:GetSpawnNPC(10150101)		
		local wheel03 = this:GetSpawnNPC(10150102)
		local wheel04 = this:GetSpawnNPC(10150103)
		
		wheel01:RemoveBuff(111202)
		wheel02:RemoveBuff(111202)
		wheel03:RemoveBuff(111202)
		wheel04:RemoveBuff(111202)
		
		AsPlayer(Actor):UpdateQuestVar(101018, 1)			
	end
end

--101018 ȣ���� ����  - �帣�� ��
function Field_101:OnSensorEnter_1015020(Actor) 
	if (AsPlayer(Actor):CheckCondition(1010181) == true) then
		local wheel2 = this:GetSpawnNPC(101502)			
		wheel2:GainBuff(111203)		
		this:SetTimer(10101802, 60, false)	
	end
end

function Field_101:OnSensorTalent_1015020(Actor, TalentID) 
	if (AsPlayer(Actor):CheckCondition(1010181) == true ) and (TalentID == 140021 ) then
		local wheel2 = this:GetSpawnNPC(101502)			
		wheel2:RemoveBuff(111203)		
		AsPlayer(Actor):UpdateQuestVar(101018, 2)	
	end
end


--101017 �濪��å  101225 �ֹ� �������
function Field_101:OnSensorEnter_101225(Actor) 
	if (AsPlayer(Actor):CheckCondition(1010171) == true) then		
		local npc1 = this:GetSpawnNPC(101225)
		npc1:GainBuff(111201)
		this:SetTimer(10101700, 30, false)
	end
end

--101017 �濪��å  101226 �ֹ� ũ��������
function Field_101:OnSensorEnter_101226(Actor) 
	if (AsPlayer(Actor):CheckCondition(1010171) == true) then
		local npc2 = this:GetSpawnNPC(101226)
		npc2:GainBuff(111201)
		this:SetTimer(10101701, 30, false)
	end
end

--101017 �濪��å  101227 �ֹ� �ص�
function Field_101:OnSensorEnter_101227(Actor) 
	if  (AsPlayer(Actor):CheckCondition(1010171) == true) then
		local npc3 = this:GetSpawnNPC(101227)
		npc3:GainBuff(111201)
		this:SetTimer(10101702, 30, false)
	end
end

--101017 �濪��å  101228 �ֹ� ���Ͼ�
function Field_101:OnSensorEnter_101228(Actor) 
	if (Actor:IsPlayer() == true) and (AsPlayer(Actor):CheckCondition(1010171) == true) then
		local npc4 = this:GetSpawnNPC(101228)
		npc4:GainBuff(111201)
		this:SetTimer(10101703, 30, false)
	end
end

-- --���� �� ����Ű���� ���� ����
-- function Field_101:OnSensorEnter_101060(Actor) 	
	-- if (AsPlayer(Actor):CheckCondition(1010261) == true) then
		-- local Effector = this:GetSpawnNPC(10150104)		
		-- local Jina = this:GetSpawnNPC(101211)
		
		-- --������ ������ �������� ����� �� �ְ� �ϴ� ����
		-- AsPlayer(Actor):UpdateQuestVar(101026,5)
		
		-- Effector:GainBuff(111204)				
		-- this:SetTimer(10106000,30, false)				
		-- Jina:Say("$$Field_10140904")		
		
		
	-- end
-- end

-- function Field_101:OnSensorLeave_101060(Actor) 	
	-- if (AsPlayer(Actor):CheckCondition(1010261) == true) then
	
		-- --������ ����� Ż��Ʈ�� ����� �� ����� ���� ����
		-- AsPlayer(Actor):UpdateQuestVar(101026,4)
	
	-- end
-- end
-- function Field_101:OnSensorTalent_101060(Actor, TalentID) 
	-- if (TalentID == 140022 ) then		
		-- AsPlayer(Actor):UpdateQuestVar(101026,3)
		-- AsPlayer(Actor):GainBuff(111205)
		-- AsPlayer(Actor):GainBuff(111206)		
	-- end
-- end




-- --����Ű ��ó���� ���� ���� ��
-- function Field_101:OnSensorTalent_10102600(Actor, TalentID) 
	-- if (AsPlayer(Actor):CheckCondition(1010261) == true ) and (TalentID == 140022 ) then		
		
		-- AsPlayer(Actor):Tip("$$Field_10140903")				
		
		-- AsPlayer(Actor):UpdateQuestVar(101026,3)
	-- end
-- end

-- --����Ű ��ó������ ���� �� 
-- function Field_101:OnSensorLeave_10102600(Actor)
	-- if (AsPlayer(Actor):CheckCondition(1010261) == true ) then		
		-- AsPlayer(Actor):Tip("$$Field_10140903")
	-- end
-- end





--��ư� �� �ִ� ��

function Field_101:OnSensorEnter_101020(Actor) 
	if (Actor:IsPlayer() == true) and (AsPlayer(Actor):CheckCondition(1010201) == true) then
			
		-- soldier1 = this:GetSpawnNPC(145)	
		-- soldier2 = this:GetSpawnNPC(159)	
		-- soldier3 = this:GetSpawnNPC(144)	
		-- soldier4 = this:GetSpawnNPC(143)	
		-- soldier5 = this:GetSpawnNPC(188)	
		-- soldier6 = this:GetSpawnNPC(189)	
		
		-- soldier1:BalloonNow("ũ���")
		-- soldier2:BalloonNow("ļ��!!")
		-- soldier3:BalloonNow("���")
		-- soldier4:BalloonNow("����")
		-- soldier5:BalloonNow("ũ��")
		-- soldier6:BalloonNow("ũũī")							
	end
end


-- ������ ����
-- function Field_101:OnSensorEnter_11(Actor) 
	-- if (AsPlayer(Actor):CheckCondition(1010561) == true) then
		-- AsPlayer(Actor):Tip("$$Field_101_001")  --AsPlayer(Actor):Tip("���״����� ������ �߰��Ͽ����ϴ�")
		-- AsPlayer(Actor):UpdateQuestVar(101056, 1)	
	-- end
-- end


-- function Field_101:OnSessionScene_Merinsha_Start(Session)
	
	-- local Merinsha = this:GetNPC(101240)			
		
	-- Merinsha:Balloon("ũ����������") 
	-- Merinsha:Wait(10)			
	
	-- this:EnableSensor(22)
	-- Session:ChangeScene("fight")	
-- end

-- function Field_101:OnSessionScene_Merinsha_fight(Session)	
	
	-- local Merinsha = this:GetNPC(101240)					
	
	-- GLog("5".."/n")	

	-- Merinsha:GainBuff(40904)		
	
	-- this:SpawnByID(128) --���� ���� 1
	-- this:SpawnByID(129) --���� ���� 2
	-- this:SpawnByID(130) --���� ���� 3
	
	-- local Gadiel1 = this:GetSpawnNPC(128)			
	-- local Gadiel2 = this:GetSpawnNPC(129)
	-- local Gadiel3 = this:GetSpawnNPC(130)
	
	-- GLog("6".."/n")	
	
	-- Gadiel1:WaitFor(Merinsha)
	-- Gadiel2:WaitFor(Merinsha)
	-- Gadiel3:WaitFor(Merinsha)
	
	-- Merinsha:Say("�����ض�!!!")
	
	-- Merinsha:NextAction()	
	-- Merinsha:SetTarget(AsPlayer(Actor))	
	
	-- Gadiel1:ClearJob()
	-- Gadiel2:ClearJob()
	-- Gadiel3:ClearJob()
		
	-- Gadiel1:Attack(AsPlayer(Actor))
	-- Gadiel2:Attack(AsPlayer(Actor))
	-- Gadiel3:Attack(AsPlayer(Actor))
	

-- end

-- function Field_101:OnSensorEnter_22(Actor)	
	-- if (Actor:IsPlayer() == true) and (AsPlayer(Actor):CheckCondition(1010591) == true) then
		-- AsPlayer(Actor):Tip("�����Դϴ�!! ��ȭ�� �����̸� ����ϼ���!")		
	-- end
-- end

-- ������ �޸����� ��ü
-- function Field_101:OnSensorTalent_22(Actor, TalentID) 
	-- if AsPlayer(Actor):CheckCondition(101059) == true and (TalentID == 140020 ) and (Actor:IsPlayer() == true) then	
	
		-- AsPlayer(Actor):UpdateQuestVar(101059, 2)		
		-- local Field = AsPlayer(Actor):GetField()
		
		-- local Merinsha = this:GetSpawnNPC(127)						
		-- local Gadiel1 = this:GetSpawnNPC(128)			
		-- local Gadiel2 = this:GetSpawnNPC(129)
		-- local Gadiel3 = this:GetSpawnNPC(130)
		
		-- Field:DisableSensor(22)	
		
		-- Merinsha:Balloon("ļ��~!!") 			
		-- Merinsha:GainBuff(40904)
		
		-- Gadiel1:GainBuff(40904)
		-- Gadiel2:GainBuff(40904)
		-- Gadiel3:GainBuff(40904)	
		
		-- Field:DespawnByID(127) --�޸���		
		-- Field:DespawnByID(128) --���� ���� 1
		-- Field:DespawnByID(129) --���� ���� 2
		-- Field:DespawnByID(130) --���� ���� 3				
		
		-- Field:SpawnByID(142) --������						
		
		-- local Marini = Field:GetSpawnNPC(142)
		-- Marini:Balloon("�ƴ� ������?! ��� ������?") 	
		-- Marini:Balloon("ũ��..�̷�..�� ������� ���̰� �ϴٴ�...�������� �������� �Ȱڴ�! ") 		
		-- Marini:ScriptSelf("Field_101_Marini_Despawn")
	-- end
-- end
	
-- function Field_101_Marini_Despawn(Self)
	-- local Field = Self:GetField()	
	-- local Marini = Field:GetSpawnNPC(142)
	
	-- Marini:GainBuff(40904)
	-- Field:DespawnByID(142)
-- end
	
-- ���� ����
function Field_101:OnSensorEnter_101011(Actor) 
	if (Actor:IsPlayer() == true) and (AsPlayer(Actor):CheckCondition(1010111) == true) and (AsPlayer(Actor):GetQuestVar(101011) ~= 1) then
		-- local magiczone = this:GetSpawnNPC(10150600)
		AsPlayer(Actor):GainBuff(111200)
		AsPlayer(Actor):UpdateQuestVar(101011, 1)		
	end	
end

-- 101018 ������ �濪
function Field_101:OnSensorTalent_1010181(Actor, TalentID) 	
	local Field = AsPlayer(Actor):GetField()	
	local dust1 = Field:GetNPC(101268)
	
	if(TalentID == 140021 ) then		
		AsPlayer(Actor):UpdateQuestVar(101018, 1)
		dust1:RemoveBuff(40904)
	end
end

function Field_101:OnSensorTalent_1010182(Actor, TalentID) 

	local Field = AsPlayer(Actor):GetField()
	local dust2 = Field:GetNPC(101269)
	
	if(TalentID == 140021 ) then
		AsPlayer(Actor):UpdateQuestVar(101018, 2)
		dust2:RemoveBuff(40904)
	end
end


--�������߸� �ϴ� ����
function Field_101:OnSensorTalent_101038(Actor, TalentID) 
	if(TalentID == 140024 ) then
		AsPlayer(Actor):UpdateQuestVar(101043, 1)
	end
end


function Field_101:OnSensorTalent_9(Actor, TalentID) -- �η��� ��
	if Actor:IsPlayer() == true then
		if AsPlayer(Actor):CheckCondition(1010201) == true then
			this:SpawnByID(1) -- ���𿤱���
			this:SpawnByID(2)
			this:SpawnByID(3)
			local Field = Actor:GetField()
			local Rorence = Field:GetSpawnNPC(101212)		
			local Gadieal1 = Field:GetSpawnNPC(1)			
			local Gadieal2 = Field:GetSpawnNPC(2)
			local Gadieal3 = Field:GetSpawnNPC(3)
			-- �η����� ���� �ٲ۴�.(���� -> ����)
			Rorence:NonDelaySay("$$Field_101_1")
			Gadieal1:Wait(3)
			Gadieal2:Wait(3)
			Gadieal3:Wait(3)
			Gadieal1:NonDelaySay("$$Field_101_2")
			Gadieal1:Attack(Actor)
			Gadieal2:Attack(Actor)	
			Gadieal3:Attack(Actor)					
			-- ���Ǿ� ������� �ϴ°� ������¡ ������ �ؾ��ϳ�?
			-- ���� �ֵ��� �� ������ �η����� �ٽ� ���� -> ����
		end
	end
end





function Field_101:OnSpawn(SpawnInfo)		
	
	-- if (SpawnInfo.NPCID == 101126) then -- ����Ű
		-- SpawnInfo.NPC:Patrol({1010241,1010242,1010243,1010244,1010245,1010246,1010247, 1010248}, PT_LOOP)	
	-- end
	
	if (SpawnInfo.SpawnID == 10140000) then -- �ι��ϴº���00
	
		SpawnInfo.NPC:Patrol({
		1014000000,1014000001,1014000002,1014000003,1014000004,1014000005,1014000006,1014000007,1014000008,1014000009,
		1014000010,1014000011,1014000012,1014000013,1014000014,1014000015,1014000016,1014000017,1014000018,1014000019,
		1014000020,1014000021,1014000022,1014000023,1014000024,1014000025,1014000026,1014000027,1014000028,1014000029,
		1014000030,1014000031,1014000032,1014000033,1014000034},PT_LOOP_BACKORDER)
		
	end
	
	if (SpawnInfo.SpawnID == 10140001) then -- �ι��ϴº���01
		
		SpawnInfo.NPC:Patrol({
		1014000100,1014000101,1014000102,1014000103,1014000104,1014000105,1014000106,1014000107,1014000108,1014000109,
		1014000110,1014000111,1014000112,1014000113,1014000114,1014000115,1014000116,1014000117,1014000118,1014000119,
		1014000120,1014000121,1014000122,1014000123,1014000124,1014000125,1014000126,1014000127,1014000128,1014000129,
		1014000130,1014000131,1014000132,1014000133,1014000134,1014000135,1014000136,1014000137},PT_LOOP_BACKORDER)
		
	end
	
	if (SpawnInfo.SpawnID == 10140300) then -- �ι��ϴ¿ձ�����00
	
		SpawnInfo.NPC:Patrol({
		1014030000,1014030001,1014030002,1014030003,1014030004,1014030005,1014030006,1014030007,1014030008,1014030009,
		1014030010,1014030011,1014030012,1014030013,1014030014,1014030015,1014030016,1014030017},PT_LOOP_BACKORDER)
	
	end
	
		
	if (SpawnInfo.NPCID == 101409) then -- ���������ϴ±����� �ι�
		this:SetTimer(101407,30, true)			
		
		SpawnInfo.NPC:Patrol({
		10140700,10140701,10140702,10140703,10140704,10140705,10140706,10140707,10140708,10140709,
		10140710,10140711,10140712,10140713,10140714,10140715,10140716,10140717,10140718,10140719,
		10140720,10140721,10140722,10140723,10140724,10140725,10140726,10140727,10140728,10140729,
		10140730,10140731,10140732,10140733,10140734,10140735,10140736,10140737,10140738,10140739,
		10140740,10140741,10140742,10140743,10140744,10140745,10140746,10140747,10140748,10140749,
		10140750},PT_LOOP_BACKORDER)		
		
		SpawnInfo.NPC:ScriptSelf("Field_101_AnnouncerRoaming")	
	end	
	
	if (SpawnInfo.NPCID == 101415) then
		this:SetTimer(101415, 30, true)	
	end 
end

--���������ϴ� ���𿤽��ڸ� �����Ѵ�
function Field_101_AnnouncerRoaming(Self)
	Self:Despawn(true)	-- ������ �����ϰ� ����
end


