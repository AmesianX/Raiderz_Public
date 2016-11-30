-- Buff
--[[
	* OnGain : ������ �ɸ� ����
	* OnLost : RemoveBuff ������ ������ ������ �߰��� �������� ����
	* OnExpired : ������ �ð��� �ڿ������� ������ ����
--]]
function Buff_110022:OnGain(Caster, Owner) -- ���ٻ� : �������� ���� �ް� ����
	if (Owner:IsPlayer() == true) then
		local Field = AsPlayer(Owner):GetField()
		--AsPlayer(Owner):GateToMarker(102, 2)
		AsPlayer(Owner):Narration("$$BUFF_110022_1") -- '����� �ǽ��� �Ҿ����ϴ�.'
		AsPlayer(Owner):UpdateQuestVar(102020,2)
		Field:SetTimer(1, 8, false)
	end
end
function Buff_110023:OnGain(Caster, Owner) -- ��ȯ�� ���� : �ʽ��ڿ� ��ȯ�� ���
	if (Owner:IsPlayer() == true) then
		AsPlayer(Owner):UpdateQuestVar(107100, 3)
	end
end
--[[
function Buff_110023:OnGain(Caster, Owner)
	if (Owner:IsNPC() == true) then
		if (AsNPC(Owner):GetID() == 109205) then

			local SpawnPos = Owner:GetPos()
			local Field = Owner:GetField()
			AsNPC(Owner):Despawn(true)
			local SpawnNpc = Field:Spawn( 109223, SpawnPos )
			SpawnNpc:FaceTo( Caster )

		end
		if (AsNPC(Owner):GetID() == 109206 ) then

			local SpawnPos = Owner:GetPos()
			local Field = Owner:GetField()
			AsNPC(Owner):Despawn(true)
			local SpawnNpc = Field:Spawn( 109224, SpawnPos )
			SpawnNpc:FaceTo( Caster )

		end
		if (AsNPC(Owner):GetID() == 109320) then

			local SpawnPos = Owner:GetPos()
			local Field = Owner:GetField()
			AsNPC(Owner):Despawn(true)
			local SpawnNpc = Field:Spawn( 109225, SpawnPos )
			SpawnNpc:FaceTo( Caster )

		end
		if (AsNPC(Owner):GetID() == 109321) then

			local SpawnPos = Owner:GetPos()
			local Field = Owner:GetField()
			AsNPC(Owner):Despawn(true)
			local SpawnNpc = Field:Spawn( 109226, SpawnPos )
			SpawnNpc:FaceTo( Caster )

		end
	end
end
--]]
--[[
function Buff_110027:OnGain(Caster, Owner)  -- ����� �ູ ����. PC�� �ƴ� �����̳� NPC�� �ɸ��� �ڵ� ����. PC�� ������ �ɸ��� �ٲ㼭 �ʿ� ������
	if (Owner:IsPlayer() == false) then
		Owner:RemoveBuff(110027)
	end
end
--]]

function Buff_110028:OnLost(Caster, Owner) -- ���ٻ� : ����� ���� - �ñ� �ϵ�� ���� ���� ���ͷ����� ����
	if (AsNPC(Owner):GetID() == 102128) then
		AsNPC(Owner):EnableInteraction()
	end
end

function Buff_110039:OnGain(Caster, Owner)  -- ����ũ�� ���� �����ϴ� �κ�(��� ó���ؾ� �ϳ�)
	if (Owner:IsPlayer() == true) then
		if (AsPlayer(Owner):CheckCondition(1110261) == true) then -- 110026 ����Ʈ ���� ��
			AsPlayer(Owner):UpdateQuestVar(111026, 3)
			AsPlayer(Owner):Tip("$$BUFF_110039_1") -- "�̷� ������ ������ ���� ���Դϴ�. �츣�´����� �����Ͻʽÿ�."
		end
		if (AsPlayer(Owner):CheckCondition(1110261) == false) and (AsPlayer(Owner):CheckCondition(1110411) == true) then -- 110041 ����Ʈ ���� ��
			local Field = Owner:GetField()
			local Pos = Owner:GetPos()		
			Field:SpawnLimited(111303, Pos, 60)
			AsPlayer(Owner):Tip("$$BUFF_110039_2") -- "��� ���� ������� �������ִ� �ݼ����� �������ϴ�!"
		end		
	end
end

function Buff_110041:OnGain(Caster, Owner)  -- ����ũ�� ���� �����ϴ� �κ�(����� ����)
	if (Owner:IsPlayer() == true) then
		local Count = tonumber(AsPlayer(Owner):GetQuestVar(111041))
		Count = Count +1
		AsPlayer(Owner):UpdateQuestVar(111041, Count)
	end
end

function Buff_110045:OnLost(Caster, Owner)  -- ����Ʈ �ζ� : 110007 ����Ʈ - ���׾Ƹ��� �� Ÿ��
	if (AsNPC(Owner):GetID() == 110040) then
		AsNPC(Owner):Despawn(true)
	end
end

--[[
function Buff_130046:OnGain(Owner) -- TEST�� 
	if (Owner:IsPlayer() == true) then
		AsPlayer(Owner):Tip("$$BUFF_130046_1")
	end
end

function Buff_130046:OnExpired(Owner)
	if (Owner:IsPlayer() == true) then
		AsPlayer(Owner):Tip("$$BUFF_130046_2")
	end
end
--]]

function Buff_110047:OnGain(Caster, Owner)  -- ������ ���ø� ����Ʈ �Ϸ�
	if (Owner:IsPlayer() == true) then
		if (AsPlayer(Owner):CheckCondition(1010261) == true) then
			AsPlayer(Owner):UpdateQuestVar(101026, 4)
			AsPlayer(Owner):Tip("$$BUFF_110047_1") 
		end
	end
end

function Buff_110065:OnGain(Caster, Owner)  -- ���� ������ : ��ġ�� ������ ����
	if (Owner:IsPlayer() == false) then
		local OwnerID = AsNPC(Owner):GetID()
	
		if (OwnerID == 103111) then
			if (AsPlayer(Caster):CheckCondition(1030131) == true) or (AsPlayer(Caster):CheckCondition(1030141) == true) then
				AsNPC(Owner):Die(Owner)
				Caster:GainBuff(110066)
			end
		end
		if (OwnerID == 103128) then
			Owner:GainBuff(110060)
		end
	end
end

function Buff_110067:OnGain(Caster, Owner)  -- �������� óġ 10���� �޼�(110066���� 10�� ������ 110067������ ��ȭ)
	if (Owner:IsPlayer() == true) then
		if (AsPlayer(Owner):CheckCondition(1030131) == true) then	-- ����Ʈ�� �Ϸ��Ŵ
			AsPlayer(Owner):UpdateQuestVar(103013, 10)
		end
		if (AsPlayer(Owner):CheckCondition(1030141) == true) then	-- ����Ʈ�� �Ϸ��Ŵ
			AsPlayer(Owner):UpdateQuestVar(103014, 10)
		end		
	end
end
function Buff_110069:OnGain(Caster, Owner)  -- ��ȣ�������� ���� ���� ��� 10���� �޼�(110068���� 10�� ������ 110069������ ��ȭ)
	if (Owner:IsPlayer() == true) then
		AsPlayer(Owner):UpdateQuestVar(116036, 10)	
	end
end

function Buff_110058:OnExpired(Caster, Owner)  -- ���� ������ : ���� ���� ȯ�� 3�ܰ�
	if (Owner:IsPlayer() == true) then
		AsPlayer(Owner):GateToTrial(1030210, true)
	end
end

function Buff_110061:OnExpired(Caster, Owner)  -- 103004 ����Ʈ ���۽� �������� ���η� ����
	if (Owner:IsPlayer() == true) then
		AsPlayer(Owner):GateToTrial(1030040, true)
	end
end

function Buff_110072:OnExpired(Caster, Owner)  -- �ϼ��� ���ɽ��� : �ɷ��ִ� 30�� ������ ������� ������Ʈ�� �����
	if (AsNPC(Owner):GetID() == 116414) then
		AsNPC(Owner):Despawn(false)
	end
end
--[[
function Buff_110093:OnExpired(Caster, Owner)  -- �η��� ���� : Ƽ���� ���� ������ �����Ǹ� ������ ������ ����
	if (Owner:IsPlayer() == true) then
		local Field = Owner:GetField()
		local Tian = Field:GetSpawnNPC(109001)
		local MyPos = Owner:GetPos()
		local MyDir = Owner:GetDir()		
		local TianPos = Tian:GetPos()
		if (Math_GetDistance(MyPos, TianPos) > 5000) then
			Owner:GainBuff(110094)
			local SummonTable = Math_GetPolygonPoints(MyPos, MyDir, 300, 8)
			local PiratePos1 = SummonTable["1"]
			local PiratePos2 = SummonTable["2"]
	
			Field:Spawn(109199, PiratePos1)
			Field:Spawn(109200, PiratePos2)				
		end
	end
end
--]]
function Buff_110095:OnExpired(Caster, Owner)  -- �η��� ���� : 109008 ����Ʈ - ���� ������� �ƽ� ����
	if (Owner:IsPlayer() == true) then
		AsPlayer(Owner):Cutscene(109008)
	end
end

-- 40991 ���� �ٸ����� ������
function Buff_40991:OnGain(Caster, Owner)  
	if (Owner:IsPlayer() == true) then
		AsPlayer(Owner):NarrationNow("$$COLT_0520010_8")
	end
end

-- 41010 ���� �ٸ����� ����
function Buff_41010:OnGain(Caster, Owner)  
	if (Owner:IsPlayer() == true) then
		AsPlayer(Owner):NarrationNow("$$COLT_0520010_5")
	end
end

-- ���� ��ȣ�� ����
function Buff_40770:OnLost( Caster, Owner )
--	GLog("Buff_40770:OnLost")
	if not Owner:IsNPC() then return end
	local ThisNPC = AsNPC(Owner)
--	ThisNPC:SayNow("Buff_40770:OnLost")
	if ThisNPC:GetCurrentTalent() == NPC_501003.TALENT_BreakShield2 then return end
	ThisNPC:ClearJob()
	ThisNPC:UseTalentSelf( NPC_501003.TALENT_BreakShield1 )
end
--function Buff_40770:OnExpired ( Caster, Owner )
--	GLog("Buff_40770:OnExpired")
--end

function Buff_40771:OnLost( Caster, Owner )
--	GLog("Buff_40771:OnLost")
	if not Owner:IsNPC() then return end
	local ThisNPC = AsNPC(Owner)
--	ThisNPC:SayNow("Buff_40771:OnLost")
	if ThisNPC:GetCurrentTalent() == NPC_501003.TALENT_BreakShield2 then return end
	ThisNPC:ClearJob()
	ThisNPC:UseTalentSelf( NPC_501003.TALENT_BreakShield1 )
end

function Buff_40183:OnExpired( Caster, Owner ) -- Ʃ�丮�� : (�ü� ����)ũ��﷯ ���� ��, ��� ������ ������� ����Ʈ �Ϸ�ǰ� ���� �ʵ��. �ƽ� ����
	AsPlayer(Owner):OutTutorialField()
end


-- ���� 104010 ����Ʈ 
function Buff_110073:OnGain(Caster, Owner)
	if (Owner:IsPlayer() == false) then
		local OwnerID = AsNPC(Owner):GetID()
	
		if (OwnerID == 104113) and (AsPlayer(Caster):CheckCondition(1040101) == true) then			
			Owner:GainBuff(110073)		
			GLog("104113")			
		end
		
		if (OwnerID == 104114) and (AsPlayer(Caster):CheckCondition(1040101) == true) then			
			Owner:GainBuff(110073)			
			GLog("104114")
		end
		
		if (OwnerID == 104114) and (AsPlayer(Caster):CheckCondition(1040101) == true) then			
			Owner:GainBuff(110073)			
			GLog("104115")
		end
		
	end
end

 -- 104024 ����Ʈ 
function Buff_110078:OnGain(Caster, Owner)
	if (Owner:IsPlayer() == false) then
		local OwnerID = AsNPC(Owner):GetID()		
		if (OwnerID == 104152) and (AsPlayer(Caster):CheckCondition(1040241) == true) then					
			
		end		
	end		
end

 -- 111022 ����Ʈ 
function Buff_110104:OnLost(Caster, Owner)
	if (Owner:IsPlayer() == true) then
		AsPlayer(Owner):Cutscene(111022)
	end		
end

--- 118002 ����Ʈ
function Buff_111400:OnLost(Caster, Owner) 
	if (AsNPC(Owner):GetID() == 118002) or (AsNPC(Owner):GetID() == 118003) then
		AsNPC(Owner):EnableInteraction()
	end
end	


--- 118009 ����Ʈ
function Buff_111401:OnLost(Caster, Owner) 
	if (AsNPC(Owner):GetID() == 118004) or (AsNPC(Owner):GetID() == 118005) then
		AsNPC(Owner):EnableInteraction()
	end
end	

--- 119017 ����Ʈ -- �ð��� ������ despawn �Ǵ� ����
function Buff_111406:OnLost(Caster, Owner) 
	if (AsNPC(Owner):GetID() == 118252) then						
		AsNPC(Owner):Despawn(false)		
	end
end	

--- 119017 ����Ʈ -- �����Ϳ� ���� �ɾ��ִ� ��
function Buff_111403:OnLost(Caster, Owner) 
	if (AsNPC(Owner):GetID() == 118252) then
		AsNPC(Owner):Despawn(false)
	end
end	

-- 130511 �ѱ� ����� ��ɲ� �̺�Ʈ (OBT ���)
function Buff_130511:OnGain(Caster, Owner)  
	if (Owner:IsPlayer() == true) then
		AsPlayer(Owner):NarrationMe("$$Eventitem_monsterhunter")
	end
end