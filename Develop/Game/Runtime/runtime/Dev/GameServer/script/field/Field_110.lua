-- ����Ʈ �ζ�
function Field_110:OnSpawn(SpawnInfo)
	if (SpawnInfo.SpawnID == 67) or (SpawnInfo.SpawnID == 68) or (SpawnInfo.SpawnID == 77) then -- ����Ʈ �ϱ� ������
		
		SpawnInfo.NPC:Patrol({10,11,12,13,14,15,16,17,18}, PT_LOOP)
	elseif (SpawnInfo.SpawnID == 9004) then -- ����Ʈ �������ò�1 ����
		
		SpawnInfo.NPC:Patrol({28,20,21,22,23,24,25,26,27}, PT_LOOP_BACKORDER)
	elseif (SpawnInfo.SpawnID == 9005) then -- ����Ʈ �������ò�2 ����
		
		SpawnInfo.NPC:Patrol({27,26,25,24,23,22,21,20,28}, PT_LOOP_BACKORDER)	
	elseif (SpawnInfo.SpawnID == 616) or (SpawnInfo.SpawnID == 617) or (SpawnInfo.SpawnID == 618) or (SpawnInfo.SpawnID == 621) then -- ����Ʈ ������ ������
		
		SpawnInfo.NPC:Patrol({30,31,32,33,34,35,36,37,38,39}, PT_LOOP_BACKORDER)	
	elseif (SpawnInfo.SpawnID == 390) then -- ����Ʈ ��������1 ����
		
		SpawnInfo.NPC:Patrol({40,41,42,43,44}, PT_LOOP_BACKORDER)		
	elseif (SpawnInfo.SpawnID == 391) then -- ����Ʈ ��������2 ����
		
		SpawnInfo.NPC:Patrol({54,55,56,57}, PT_LOOP_BACKORDER)	
	elseif (SpawnInfo.SpawnID == 392) then -- ����Ʈ ��������3 ����
		
		SpawnInfo.NPC:Patrol({60,61,62,63,64}, PT_LOOP_BACKORDER)			
	elseif (SpawnInfo.SpawnID == 1300) then -- ����Ʈ ��ɲ�1 ����
		
		SpawnInfo.NPC:Patrol({13001,13002,13003,13004,13005}, PT_LOOP_BACKORDER)		
	elseif (SpawnInfo.SpawnID == 1301) then -- ����Ʈ ��ɲ�2 ����
		
		SpawnInfo.NPC:Patrol({13011,13012,13013,13014,13015,13016}, PT_LOOP_BACKORDER) -- ����Ʈ ��ɲ�2 ����
	elseif (SpawnInfo.SpawnID == 1302) then -- ����Ʈ ��ɲ�3 ����
		
		SpawnInfo.NPC:Patrol({13021,13022,13023,13024,13025}, PT_LOOP_BACKORDER)		
	elseif (SpawnInfo.SpawnID == 1303) then -- ����Ʈ ��ɲ�4 ����
		
		SpawnInfo.NPC:Patrol({13031,13032,13033,13034,13035,13036}, PT_LOOP_BACKORDER)		
	elseif (SpawnInfo.SpawnID == 1304) then -- ����Ʈ ��ɲ�5 ����
		
		SpawnInfo.NPC:Patrol({13041,13042,13043,13044}, PT_LOOP_BACKORDER)	
	elseif (SpawnInfo.SpawnID == 1305) then -- ����Ʈ ��ɲ�6 ����
		
		SpawnInfo.NPC:Patrol({13051,13052,13053,13054,13055}, PT_LOOP_BACKORDER)			
	elseif (SpawnInfo.SpawnID == 1306) then -- ����Ʈ ��ɲ�7 ����
		
		SpawnInfo.NPC:Patrol({13061,13062,13063,13064,13065,13066,13067,13068}, PT_LOOP)			
	elseif (SpawnInfo.SpawnID == 110223) then -- ������ ������(����)
		SpawnInfo.NPC:GainBuff(110110)	
	end
end
