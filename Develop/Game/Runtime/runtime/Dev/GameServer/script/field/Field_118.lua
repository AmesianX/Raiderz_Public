--[[
function Field_118:OnEndCutscene(Player, CutsceneID)
	if (CutsceneID == 118001) then
		Player:GateToTrial(1180080, true)
	end
end
--]]


function Field_118:OnTimer(TimerID) 
	
	--118002 ���� �������� 
	if (TimerID == 118002) then
		
		local tiredsoldier0 = Field:GetSpawnNPC(11821000)
		local tiredsoldier1 = Field:GetSpawnNPC(11821001)
		local tiredsoldier2 = Field:GetSpawnNPC(11821002)
		local tiredsoldier3 = Field:GetSpawnNPC(11821003)
		local tiredsoldier4 = Field:GetSpawnNPC(11821004)
		local tiredsoldier5 = Field:GetSpawnNPC(11821005)
		local tiredsoldier6 = Field:GetSpawnNPC(11821006)
		local tiredsoldier7 = Field:GetSpawnNPC(11821007)
		
		if tiredsoldier0:CheckBuff(111400) == false then
			tiredsoldier0:EnableInteraction()			
		end				
		if tiredsoldier0:CheckBuff(111400) == false then
			tiredsoldier0:EnableInteraction()			
		end		
		if tiredsoldier0:CheckBuff(111400) == false then
			tiredsoldier0:EnableInteraction()			
		end		
		if tiredsoldier0:CheckBuff(111400) == false then
			tiredsoldier0:EnableInteraction()			
		end		
		if tiredsoldier0:CheckBuff(111400) == false then
			tiredsoldier0:EnableInteraction()			
		end		
		if tiredsoldier0:CheckBuff(111400) == false then
			tiredsoldier0:EnableInteraction()			
		end		
		if tiredsoldier0:CheckBuff(111400) == false then
			tiredsoldier0:EnableInteraction()			
		end		
		if tiredsoldier0:CheckBuff(111400) == false then
			tiredsoldier0:EnableInteraction()			
		end
	end
	
	--â���� ����
	
	if (TimerID == 118008) then			
	end
	
	
	-- if (TimerID == 118009) then	
		
	-- end
		-- ���� �ִ� ����
		-- local injuredsoldier0 = this:GetSpawnNPC(140)
		-- local injuredsoldier1 = this:GetSpawnNPC(141)
		-- local injuredsoldier2 = this:GetSpawnNPC(142)
		-- local injuredsoldier3 = this:GetSpawnNPC(143)
		-- local injuredsoldier4 = this:GetSpawnNPC(144)
		-- local injuredsoldier5 = this:GetSpawnNPC(145)
		-- local injuredsoldier6 = this:GetSpawnNPC(146)
		-- local injuredsoldier7 = this:GetSpawnNPC(147)
		
		
		-- if (injuredsoldier0:CheckBuff(111401) == false) then
			-- injuredsoldier0:EnableInteraction()			
			
		-- end		
		
		-- if (injuredsoldier1:CheckBuff(111401) == false) then
			-- injuredsoldier1:EnableInteraction()						
			
		-- end
		
		-- if (injuredsoldier2:CheckBuff(111401) == false) then
			-- injuredsoldier2:EnableInteraction()		
			
		-- end
		
		-- if (injuredsoldier3:CheckBuff(111401) == false) then
			-- injuredsoldier3:EnableInteraction()		
			
		-- end
		
		-- if (injuredsoldier4:CheckBuff(111401) == false) then
			-- injuredsoldier4:EnableInteraction()			
			
		-- end
		
		-- if (injuredsoldier5:CheckBuff(111401) == false) then
			-- injuredsoldier5:EnableInteraction()	
			
		-- end
		
		-- if (injuredsoldier6:CheckBuff(111401) == false) then
			-- injuredsoldier6:EnableInteraction()			
			
		-- end
		
		-- if (injuredsoldier7:CheckBuff(111401) == false) then
			-- injuredsoldier7:EnableInteraction()			
			
		-- end
	-- end
end

-- ����Ʈ ������ �� ���� ������ ����
-- function Field_118:OnSensorEnter_118008(Actor)	
	-- -- if (AsPlayer(Actor):CheckCondition(1180082) == true) or (AsPlayer(Actor):CheckCondition(1180083) == true) then
		-- -- if (AsPlayer(Actor):GetQuestVar(118008) == 1) then
			-- -- AsPlayer(Actor):UpdateQuestVar(118008, 2)
			-- --AsPlayer(Actor):Cutscene(118001) ���� ������ ���� �� ��ü
			-- -- AsPlayer(Actor):GateToTrial(1180080, true)
		-- -- end
	-- -- end

	-- -- if (AsPlayer(Actor):CheckCondition(1180081) == true) then
		-- -- local Player = AsPlayer(Actor)
		-- -- Player:Tip("$$Field_118_001")						--Player:Tip("������ �����ϴ� �����̸� ����ϼ���.")						
	-- -- -- end
	
	-- -- if (AsPlayer(Actor):CheckCondition(1180081) == true) and  (AsPlayer(Actor):GetQuestVar(118008) ~= 1) then						
		-- -- --���� NPC�� �����Ͽ�						
		-- -- --����Ʈ�� �ѷ��ش�		
		-- -- -- GLog("UseTalent")				
		
		-- -- local Player = AsPlayer(Actor)
		-- -- Player:UpdateQuestVar(118008, 1)				
		
		-- -- -- GLog("DoneUseTalent")
		-- -- -- this:SetTimer(118008, 10, false)			
	-- -- end 

	-- -- --�ݺ�����Ʈ��
	-- -- if (AsPlayer(Actor):CheckCondition(1180111) == true) and  (AsPlayer(Actor):GetQuestVar(118011) ~= 1) then
		-- -- local Player = AsPlayer(Actor)
		-- -- Player:UpdateQuestVar(118011, 1)				
	-- -- end 
-- end

-- function Field_118:OnCreate()
	-- -- local effector = this:GetNPC(118250)
	-- -- effector:UseTalentSelf(140800)		
-- end

--[[
function Field_118:OnSensorTalent_118008(Actor, TalentID) 
	--����ޱⰡ �������� �� �ŷ�Ʈ�� ���� ���̵�
	if (AsPlayer(Actor):CheckCondition(1180081) == true) and (TalentID == 140803 ) then					
		--�ƾ��� �ִٸ� �ƾ��� ������ �̺�Ʈ �߰��ؾ���		
		AsPlayer(Actor):GateToMarker(119, 11800800)
	end
end
--]]
--���̵��� ������ӹ��Ϸ����� ó��
function Field_118:OnSensorEnter_118201(Actor)	
	if (AsPlayer(Actor):CheckCondition(1180039) == true) then					
		AsPlayer(Actor):UpdateQuestVar(118003,1)		
	end
end