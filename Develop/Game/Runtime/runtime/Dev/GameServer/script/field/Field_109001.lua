-- �η��� ���� (war)

--[[
function Field_109001:OnSensorLeave_109059(Actor) -- 109018 ����Ʈ �Ϸ�� Ƽ�Ȱ� ������� ������ �� 
	if (Actor:IsPlayer() == true) then
		if (AsPlayer(Actor):CheckCondition(1090189) == true) then
			AsPlayer(Actor):GateToMarker(109, 1090189)
		end
	end
end
--]]
function Field_109001:OnSensorLeave_500(Actor)	-- ���� ������ ������ ���� ȿ���� �������.
	if (Actor:IsPlayer() == true) then
		if (AsPlayer(Actor):CheckBuff(110097) == true) then
			AsPlayer(Actor):RemoveBuff(110097)
		end
	end
end

---������ ���� �Ʒ����� NPC���� Ÿ�̸� �̺�Ʈ�� ���� �׼��߰� // �����

function Field_109001:OnTimer(TimerID)
	
	--�����غ��ϴ� ������� Į���ϴ� Ÿ�̸�
	if (TimerID == 1) then
		-- 1300 ~ 7 ���� �غ�����		
		local TalentDice = math.random(140900,140901)				
		local array = {109495,109496,109497,109498,109499,109500,109501,109502}
		
		for i,v in ipairs(array) do 
			local pirate = this:GetNPC(v)
			pirate:UseTalentSelf(TalentDice)			
		end
	
	-- ������ ���ϴ� Ÿ�̸�
	elseif (TimerID == 2 ) then	
		local SeniorTrainer = this:GetNPC(109056)		
		SeniorTrainer:Say("$$Field_109_139")				
		this:SetTimer(1, 1, false)
	end
end

function Field_109001:OnCreate()
	this:SetTimer(2, 60, true)
end

function Field_109001:OnDie(DespawnInfo)
	if (DespawnInfo.NPCID == 109235) then -- �������� ������ ������ ������ �� ���ڸ� ����Ѵ�.
		local Deadbody = DespawnInfo.NPC
		local localAdjPos = vec3(0, 50, 0)
		local worldPos = Math_LocalToWorld(Deadbody:GetDir(), Deadbody:GetPos(), localAdjPos)
		local Chest = this:SpawnLimited (109124, worldPos, 40)
		Chest:GainBuff(110013)
	end
end