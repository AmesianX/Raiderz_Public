-- ����� ���� 3��


function Field_520003:OnDie(DespawnInfo)

	local Field = DespawnInfo.Field	
	
	if (DespawnInfo.SpawnID == 5) then -- 3�� ���簡 �׾��� ��
		
		local Door1 = Field:GetSpawnNPC(9)
		local Door2 = Field:GetSpawnNPC(8)	-- ��Ż�� ����� ������Ʈ		
		
		--Door1:UseTalentSelf( 212102201 )	-- ������ ������ ������		
		--Door2:GainBuff( 110051 ) -- ��Ż ����Ʈ ������ �ŷ�Ʈ		
		
		--DespawnInfo.NPC:NarrationNow( "$$Field_520001_2"  ) -- ����� ���� �����ϴ�
		
	end
end

function Field_520003:OnSensorTalent_2(Actor, TalentID)
	local Field = AsPlayer(Actor):GetField()
	if(TalentID == 199210 ) then
		local Door1 = Field:GetSpawnNPC(9)
		local Door2 = Field:GetSpawnNPC(8)	-- ��Ż�� ����� ������Ʈ	
		Door1:UseTalentSelf( 212102201 )	-- ������ ������ ������		
		Door2:GainBuff( 110051 ) -- ��Ż ����Ʈ ������ �ŷ�Ʈ		
		
		Door1:NarrationNow( "$$Field_520001_2"  ) -- ����� ���� �����ϴ�
	end
end

function Field_520003:OnSpawn(SpawnInfo)
	
	if ( SpawnInfo.SpawnID == 10 ) then
			SpawnInfo.NPC:Patrol({3,4,5,6}, PT_LOOP)
	end
	if ( SpawnInfo.SpawnID == 7 ) then
			SpawnInfo.NPC:Patrol({7,8,9,10}, PT_LOOP)
	end
	
end

