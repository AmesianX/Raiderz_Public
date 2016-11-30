-- ����� ���� 2��

function Field_520002:OnSensorEnter_4(Actor)

	local Field = AsPlayer(Actor):GetField()

	Actor:NarrationNow( "$$Field_520001_3"  ) -- ��ȥ������ �ϲۿ� ���� ���� ����ֽ��ϴ�.
	Field:DisableSensor(4)	

	
end

function Field_520002:OnSensorTalent_3(Actor, TalentID) -- ù��° ���� ���� ��
	
	local Field = Actor:GetField()
	local Event = this:GetSpawnNPC( 69 )	
	local Door1 = Field:GetSpawnNPC(29)	-- ��Ż�� ����� ������Ʈ		
	local Door2 = Field:GetSpawnNPC(43)	-- �ϲ۹��� ��
		
	
	if ( TalentID == 252050201 ) then 
		
		Actor:NarrationNow( "$$Field_520001_2"  ) -- 
		Door1:UseTalentSelf( 212102201 )	-- ���� ������ �������� / ���� NPC.xls�� trigger�� �����ϰ� �ִ�
		Door2:UseTalentSelf( 212102201 )	-- �ϲ� �湮 ����α�(���߿� �̺�Ʈ�� ����)
		
		Event:GainBuff( 110062 ) -- �����̺�Ʈ		
		Field:DisableSensor(3)		
		
	end	
		
end

function Field_520002:OnSensorTalent_2(Actor, TalentID) -- ������ ���� ���� ��
	
	local Field = Actor:GetField()
	local Door1 = Field:GetSpawnNPC(62)	-- ������ ��
	local Door2 = Field:GetSpawnNPC(43)	-- �ϲ� ���� ��
	local Event = this:GetSpawnNPC( 68 )	

	
	if ( TalentID == 252050201 ) then 
		
		Actor:NarrationNow( "$$Field_520001_1"  ) -- �������� Ȱ��ȭ�Ǿ����ϴ�.
		Field:EnableSensor(1)	
		
		Door1:UseTalentSelf( 212102201 )    -- ������ �� ���� 
		Door2:UseTalentSelf( 212102202 )	-- �ϲ� �湮 �ݱ�				
		--Field:DisableSensor(2)		
		
		Field:SpawnByID(5)  	-- ���ڱ� ������ ����� �̺�Ʈ	
		Field:SpawnByID(15)  		
		Field:SpawnByID(16)  		
		Field:SpawnByID(17)  		
		Field:SpawnByID(44)  		
		Field:SpawnByID(45)  		
		
		Event:GainBuff( 110062 ) -- �����̺�Ʈ		
		Field:EnableSensor(4)	
		Field:DisableSensor(3)	
		
	end
	
	
end


function Field_520002:OnDie(DespawnInfo)

	local Field = DespawnInfo.Field	
	local Door1 = Field:GetSpawnNPC(10)	
	local Door2 = Field:GetSpawnNPC(43)	
	local lever1 = Field:GetSpawnNPC(28)
	
	
	
	if (DespawnInfo.SpawnID == 8) then -- 2�� ���� ��ȥ�����簡 �׾��� ��
		
		
		Door1:UseTalentSelf( 212102201 )	-- ������ ������ ������
		
		DespawnInfo.NPC:NarrationNow( "$$Field_520001_2"  ) -- ����� ���� �����ϴ�
		
	end
	
	
	if ( lever1:GetMode() == 1 and Field:GetNPCCount(520208) == 0 ) then
		
		
		Door2:UseTalentSelf( 212102201 )	-- ���ڱ� ������ ������ ��� ��ġ��� ���� ������		
		DespawnInfo.NPC:NarrationNow( "$$Field_520001_2"  ) -- ����� ���� �����ϴ�
		
	end	
	

end

function Field_520002:OnSpawn(SpawnInfo)
	
	local Field = SpawnInfo.Field
	
	local Door1 = Field:GetSpawnNPC(9)	-- ��Ż�� ����� ������Ʈ		
	
	Door1:GainBuff( 110051 ) -- ��Ż ����Ʈ ������ �ŷ�Ʈ		
	

	if (SpawnInfo.SpawnID == 11) then -- ù��° ����
		SpawnInfo.NPC:EnableSensorCheck(3)
	end
	if (SpawnInfo.SpawnID == 28) then -- �ι�° ����
		SpawnInfo.NPC:EnableSensorCheck(2)
	end
	
	if (SpawnInfo.SpawnID == 21 ) then
			SpawnInfo.NPC:Patrol({3,6}, PT_LOOP)	
	end
	if (SpawnInfo.SpawnID == 26 ) then
			SpawnInfo.NPC:Patrol({4,5}, PT_LOOP)	
	end
	
	
	if (SpawnInfo.NPCID == 520207) then -- ���ڱ� ���� ���� �̵���Ű��
	
		SpawnInfo.NPC:SetAlwaysRun(true)
		--GLog("BongBong Move\n") 
		
		if (SpawnInfo.SpawnID == 5) then
			SpawnInfo.NPC:MoveToMarker(8)
		end
		if (SpawnInfo.SpawnID == 16) then
			SpawnInfo.NPC:MoveToMarker(8)
		end	
		--if (SpawnInfo.SpawnID == 45) then
		--	SpawnInfo.NPC:MoveToMarker(8)
		--end	
		
	end
	
	
	
	--if (SpawnInfo.NPCID == 520206) then -- ���ڱ� ���� ���� �̵���Ű��
	
		--SpawnInfo.NPC:SetAlwaysRun(true)
		--GLog("BongBong Move\n") 
		
		--if (SpawnInfo.SpawnID == 15) then
		--	SpawnInfo.NPC:MoveToMarker(8)
		--end
		--if (SpawnInfo.SpawnID == 17) then
		--	SpawnInfo.NPC:MoveToMarker(8)
		--end	
		
	--end
	
	
	
end

