function Field_107:OnCreate()
	this:Spawn(107026, vec3(12153.0, 42434.0, 2460.0))
	this:SetTimer(1, 20, true) -- ��� ���� ���� ����
	this:SetTimer(2, 60, true) -- �̽��ڰ� ����� ������
end

function Field_107:OnTimer(TimerID)
	if (TimerID == 1) then
		if (this:GetNPCCount(107026) <= 0) then -- ������ ������ ����
			this:Spawn(107026, vec3(12153.0, 42434.0, 2460.0))
		end
	end
	
	if (TimerID == 2) then  -- 60�ʸ��� �̽��ڰ� ������� �Բ� ����
		if (this:GetNPCCount(107220) == 0) then
			this:SpawnByID(10150)
			this:SpawnByID(73)
			this:SpawnByID(74)		
		end
	end
	
	--������ �����Ǹ� �����ð� �ڿ� ������Ų��.
	if (TimerID == 3) then 			
		-- GLog("���� ����")
		local messenger = this:GetNPC(107026)
		messenger:ClearJob()
		this:Despawn(107026, false)					
	end
	
end

-- ////////////////////////// Ʈ���̾� ���� ���� ///////////////////////////
function Field_107:OnSensorEnter_6(Actor) -- ���̵彺���� �׽�Ʈ
	if (Actor:IsPlayer() == true) and (AsPlayer(Actor):CheckCondition(1070081) == true) then
		AsPlayer(Actor):UpdateQuestVar(107008,1)		
	end
end




function Field_107:OnSensorEnter_8(Actor) -- ����� �� �Ա� �ȳ���
	if Actor:IsPlayer() == true then
		if AsPlayer(Actor):CheckCondition(1070541) == true then
			AsPlayer(Actor):Tip("$$Field_107_34")
		end
	end
end

function Field_107:OnSensorEnter_9(Actor) -- ������ ����
	if Actor:IsPlayer() == true then
		if AsPlayer(Actor):CheckCondition(1070512) == true then
			this:SpawnByID(75)
			this:SpawnByID(76)		
			local Field = Actor:GetField()	
			local Rafale = Field:GetSpawnNPC(10151)			
			local Wolf1 = Field:GetSpawnNPC(75)
			local Wolf2 = Field:GetSpawnNPC(76)
			AsPlayer(Actor):Tip("$$Field_107_48")
			Rafale:GainBuff(110013)
			--Wolf1:Wait(1)
			--Wolf2:Wait(1)				
			--Wolf1:Attack(Actor)
			--Wolf2:Attack(Actor)			
		end
	end
end

function Field_107:OnSensorEnter_10(Actor) -- �̽����� ����
	if Actor:IsPlayer() == true then
		if AsPlayer(Actor):CheckCondition(1070513) == true then
			this:SpawnByID(10150)		
			this:SpawnByID(73)
			this:SpawnByID(74)	
			local Field = Actor:GetField()			
			local Maid = Field:GetSpawnNPC(10150)
			local Wolf1 = Field:GetSpawnNPC(73)
			local Wolf2 = Field:GetSpawnNPC(74)
			Maid:NonDelaySay("$$Field_107_68")
			--Wolf1:Wait(1)
			--Wolf2:Wait(1)		
			--Wolf1:Attack(Actor)
			--Wolf2:Attack(Actor)
		end
	end
end

function Field_107:OnSensorEnter_13(Actor) -- ��ε����� ���� â�� �Ա� �ȳ���
	if Actor:IsPlayer() == true and AsPlayer(Actor):CheckCondition(1070161) == true then
		AsPlayer(Actor):Tip("$$Field_107_34")		
	end
end

function Field_107:OnSpawn(SpawnInfo)

	if (SpawnInfo.NPCID == 107210) then     -- ������ ��ǰ���� 107210		
		SpawnInfo.NPC:GainBuff(111300)				
	end
	
	if (SpawnInfo.NPCID == 107026) then -- ����Ʈ ����
		SpawnInfo.NPC:GainBuff(110013)
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:Patrol({102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117}, PT_ONCE)
		SpawnInfo.NPC:ScriptSelf("Field_107_DespawnSelf")	-- ���� �Ǳ�			
		-- SpawnInfo.NPC:SayNow("���� ���Դ�")
		-- GLog("���� ����")
		
		
		--������ �����Ǹ� 5�� �ڿ� �����ȴ�
		this:SetTimer(3, 300, false)

	elseif (SpawnInfo.SpawnID == 73) or (SpawnInfo.SpawnID == 74) then
		SpawnInfo.NPC:Balloon("$$Field_107_106")
	elseif (SpawnInfo.SpawnID == 75) then
		SpawnInfo.NPC:Balloon("$$Field_107_108")		
	elseif (SpawnInfo.SpawnID == 76) then
		SpawnInfo.NPC:Balloon("$$Field_107_110")			
		
	elseif (SpawnInfo.SpawnID == 10150) then -- �̽��� �����
		SpawnInfo.NPC:Say("$$Field_107_113")
		SpawnInfo.Field:SpawnByID(73)
		SpawnInfo.Field:SpawnByID(74)	 

	elseif (SpawnInfo.NPCID == 107054) then -- �������� ��� �̵�
		
		SpawnInfo.NPC:Say("$$Field_107_134")
		SpawnInfo.NPC:Patrol({501, 502}, PT_ONCE)
		SpawnInfo.NPC:Say("$$Field_107_136")
		SpawnInfo.NPC:Patrol({502, 503}, PT_ONCE)
		SpawnInfo.NPC:Say("$$Field_107_138")
		SpawnInfo.NPC:Patrol({503, 504}, PT_ONCE)
		SpawnInfo.NPC:Say("$$Field_107_140")
		SpawnInfo.NPC:Patrol({504, 505}, PT_ONCE)
		SpawnInfo.NPC:Say("$$Field_107_142")
		SpawnInfo.NPC:Patrol({505, 506}, PT_ONCE)
		SpawnInfo.NPC:Say("$$Field_107_144")
		SpawnInfo.NPC:Patrol({506, 507}, PT_ONCE)
		SpawnInfo.NPC:Say("$$Field_107_146")
		SpawnInfo.NPC:Patrol({507, 508}, PT_ONCE)
		SpawnInfo.NPC:Say("$$Field_107_148")
		SpawnInfo.NPC:Patrol({508, 507}, PT_ONCE)
		SpawnInfo.NPC:Say("$$Field_107_150")
		SpawnInfo.NPC:Patrol({507, 506}, PT_ONCE)
		SpawnInfo.NPC:Say("$$Field_107_152")
		SpawnInfo.NPC:Patrol({506, 505}, PT_ONCE)
		SpawnInfo.NPC:Say("$$Field_107_154")
		SpawnInfo.NPC:Patrol({505, 504}, PT_ONCE)
		SpawnInfo.NPC:Say("$$Field_107_156")
		SpawnInfo.NPC:Patrol({504, 503}, PT_ONCE)
		SpawnInfo.NPC:Say("$$Field_107_158")
		SpawnInfo.NPC:Patrol({503, 502, 501}, PT_ONCE)
		SpawnInfo.NPC:Say("$$Field_107_160")
		
	elseif (SpawnInfo.NPCID == 107007) then -- �׷��ý� �ι�
		SpawnInfo.NPC:Patrol({301,302,303,304,305,306,307,308,309}, PT_LOOP)	
	end
end

function Field_107_DespawnSelf(Self, Opponent)
	Self:Despawn(true)	-- ������ �����ϰ� ����
end


function Field_107:OnDie(DespawnInfo)
	--������ ������ ųŸ�̸Ӹ� �Ѵ�
	if (DespawnInfo.NPCID == 107026) then				
		this:KillTimer(3)
	end 
end
