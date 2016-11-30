-- ������ȭ��2

function Field_701001:OnSensorTalent_15(Actor, TalentID) -- 15�� �������� ������ ���� 
	
	if ( TalentID == 212104401 ) then 
		
		Actor:NarrationNow( "$$Field_121002_13"  ) -- ������ ������ �Ҹ��� �鸳�ϴ�.
		
	end	
	
end

function Field_701001:OnSensorTalent_16(Actor, TalentID) -- 16�� �������� ������ ���� 
	
	if ( TalentID == 212104401 ) then 
		
		Actor:NarrationNow( "$$Field_121002_13"  ) -- ������ ������ �Ҹ��� �鸳�ϴ�.
		
	end	
	
end

function Field_701001:OnSensorTalent_21(Actor, TalentID) -- 21�� �������� ������ ����
	
	if ( TalentID == 212104401 ) then 
		
		Actor:NarrationNow( "$$Field_121002_13"  ) -- ������ ������ �Ҹ��� �鸳�ϴ�.
		
	end	
	
end


function Field_701001:OnSensorEnter_1(Actor)
	if (Actor:IsPlayer() == true) then
		local Field = AsPlayer(Actor):GetField()
		
		--Field:SpawnByID(62)  -- ���õ��� ����3
		--Field:SpawnByID(64)  -- ���õ��� ����3
		--Field:SpawnByID(66)  -- ���õ��� ����3		
		
		Field:ActivateSpawnGroup(2)
		Field:DisableSensor(1)		
	end
end

function Field_701001:OnSensorEnter_2(Actor) -- ���õ��� ���� ���� 
	if (Actor:IsPlayer() == true) then
		local Field = AsPlayer(Actor):GetField()
		local Aruka = Field:GetSpawnNPC(75)		
		
		Aruka:NarrationNow("$$Field_121001_20")
		--Aruka:UseTalentSelf( 212100930 )
		--Aruka:UseTalentSelf( 212100931 )		
		--Aruka:UseTalentSelf( 212100932 )
		--Aruka:UseTalentSelf( 212100933 )
		
		Field:DespawnByID(51)
		Field:DespawnByID(52)  		
		Field:DespawnByID(114)  		
		Field:DespawnByID(115)  		
		Field:DespawnByID(116)  		
		Field:DespawnByID(117)
		
		Field:DisableSensor(2)	
	end
end

function Field_701001:OnSensorEnter_3(Actor) 
	if (Actor:IsPlayer() == true) then
		local Field = AsPlayer(Actor):GetField()
		
		Field:ActivateSpawnGroup(3)
		Actor:NarrationNow("$$Field_121001_42")		
		Field:DisableSensor(3)	
		
	end
end

function Field_701001:OnSensorEnter_4(Actor) -- ���� �ڿ��� ���� 
	if (Actor:IsPlayer() == true) then
		local Field = AsPlayer(Actor):GetField()
		
		Field:SpawnByID(88)  		
		Field:SpawnByID(89)  		
		Field:SpawnByID(90)  
		Actor:NarrationNow("$$Field_121001_55")
		Field:DisableSensor(4)	
		
	end
end



function Field_701001:OnSensorEnter_6(Actor) -- room on
	if (Actor:IsPlayer() == true) then
		local Field = AsPlayer(Actor):GetField()		
		Field:ActivateSpawnGroup(1)
		
		--Field:SpawnByID(139) -- �뼳�� �ȸ����� ���� ���带 ���� �ʱ� ���� �濡 ������ ������Ų��
		--Field:SpawnByID(164)  
		--Field:SpawnByID(27)
		--Field:SpawnByID(28)  
		--Field:SpawnByID(136)  
		--Field:SpawnByID(165)  
		
		Field:DisableSensor(6)		
	end
end

function Field_701001:OnSensorEnter_7(Actor) -- 1��° room on
	if (Actor:IsPlayer() == true) then
		local Field = AsPlayer(Actor):GetField()		
		
		Field:ActivateSpawnGroup(6)
		Field:DisableSensor(7)		
	end
end

function Field_701001:OnSensorEnter_10(Actor) 
	if (Actor:IsPlayer() == true) then
		local Field = AsPlayer(Actor):GetField()		
		
		Field:ActivateSpawnGroup(4)
		Field:DisableSensor(10)		
	end
end

function Field_701001:OnSensorEnter_11(Actor) 
	if (Actor:IsPlayer() == true) then
		local Field = AsPlayer(Actor):GetField()		
		
		--Field:ActivateSpawnGroup(5)
		Actor:NarrationNow("$$Field_121001_102")
		Field:DisableSensor(11)		
	end
end

function Field_701001:OnSensorEnter_12(Actor) 
	if (Actor:IsPlayer() == true) then
		local Field = AsPlayer(Actor):GetField()		
		
		Field:ActivateSpawnGroup(7)						
		
		Field:DisableSensor(12)		
	end
end

function Field_701001:OnDie(DespawnInfo)
	local Field = DespawnInfo.Field
	
	if (DespawnInfo.SpawnID == 75) then -- �Ʒ�ī ����� ��
		local Door1 = Field:GetSpawnNPC(48)		
		Door1:UseTalentSelf( 212102201 )		
		Field:ActivateSpawnGroup(5)
		DespawnInfo.NPC:NarrationNow( "$$Field_121001_124"  )				
	end
	
	if (DespawnInfo.SpawnID == 56) then -- ù��° �Ŵ��� ���� �׾��� ��
		local Door1 = Field:GetSpawnNPC(47)		
		Door1:UseTalentSelf( 212102201 )		
		DespawnInfo.NPC:NarrationNow( "$$Field_121001_130"  )				
		
		Field:DespawnByID(140) 
		Field:DespawnByID(141) 
		Field:DespawnByID(142) 
		Field:DespawnByID(143)
		Field:DespawnByID(144)
		Field:DespawnByID(160) 
		Field:DespawnByID(161)
		Field:DespawnByID(162) 		
		Field:DespawnByID(163) 
		
	end
	
	if (DespawnInfo.SpawnID == 83) then -- ������ �Ŵ��� ����

		local Door1 = Field:GetSpawnNPC(159)		
		Door1:UseTalentSelf( 212102201 )		
		
		Field:DespawnByID(148)  		
		Field:DespawnByID(149)  		
		Field:DespawnByID(150)  		
		Field:DespawnByID(151)  		
		Field:DespawnByID(152)  		
		Field:DespawnByID(153)
		Field:DespawnByID(154) 
		Field:DespawnByID(155)  
		Field:DespawnByID(156)  				
		Field:DespawnByID(157)
		Field:DespawnByID(158) 		
		
		DespawnInfo.NPC:NarrationNow( "$$Field_121001_161"  )				
	
	end
end

function Field_701001:OnSpawn(SpawnInfo)
	
 
	if (SpawnInfo.SpawnID == 26) then -- ù��° ����
		SpawnInfo.NPC:EnableSensorCheck(15)
	end
	if (SpawnInfo.SpawnID == 34) then -- �ι�° ����
		SpawnInfo.NPC:EnableSensorCheck(16)
	end
	if (SpawnInfo.SpawnID == 111) then -- ������ ����
		SpawnInfo.NPC:EnableSensorCheck(21)
	end
	
	if (SpawnInfo.NPCID == 121212) then -- ���� ��Ʈ��
		if (SpawnInfo.SpawnID == 84) then
		-- SpawnInfo.NPC:SetAlwaysRun(true)
		--GLog("Move\n") 
		SpawnInfo.NPC:Patrol({6,7}, PT_LOOP)
		end
	end
	
	if (SpawnInfo.NPCID == 121212) then -- �������� ��Ʈ��
		if (SpawnInfo.SpawnID == 113) then
			SpawnInfo.NPC:Patrol({8,9,10}, PT_LOOP)
		end
	end
	
	if (SpawnInfo.NPCID == 121201) then -- ���� �ڿ��� �Ѿƿ���
		
		SpawnInfo.NPC:SetAlwaysRun(true)
		--GLog("BongBong Move\n") 
		
		if (SpawnInfo.SpawnID == 88) then
			SpawnInfo.NPC:MoveToMarker(5)
		end
		if (SpawnInfo.SpawnID == 89) then
			SpawnInfo.NPC:MoveToMarker(5)
		end
		if (SpawnInfo.SpawnID == 90) then
			SpawnInfo.NPC:MoveToMarker(5)
		end
		
	end
	

end



function Field_701001:OnTimer(TimerID)

	if (TimerID == 12110200) then
	
		local mushroom1 = this:GetSpawnNPC(170)
		local mushroom2 = this:GetSpawnNPC(171)
		local mushroom3 = this:GetSpawnNPC(172)
		local mushroom4 = this:GetSpawnNPC(173)
		local mushroom5 = this:GetSpawnNPC(174)
		local mushroom6 = this:GetSpawnNPC(175)
		local mushroom7 = this:GetSpawnNPC(177)
		local mushroom8 = this:GetSpawnNPC(178)				

		if (mushroom1:CheckBuff(116701) == true) then		
			this:DespawnByID(mushroom1)
		elseif (mushroom2:CheckBuff(116701) == true) then		
			this:DespawnByID(mushroom2)
		elseif (mushroom3:CheckBuff(116701) == true) then		
			this:DespawnByID(mushroom3)	
		elseif (mushroom4:CheckBuff(116701) == true) then		
			this:DespawnByID(mushroom4)
		elseif (mushroom5:CheckBuff(116701) == true) then		
			this:DespawnByID(mushroom5)
		elseif (mushroom6:CheckBuff(116701) == true) then		
			this:DespawnByID(mushroom6)
		elseif (mushroom7:CheckBuff(116701) == true) then		
			this:DespawnByID(mushroom7)
		elseif (mushroom8:CheckBuff(116701) == true) then				
			this:DespawnByID(mushroom8)
		end	
	end
end