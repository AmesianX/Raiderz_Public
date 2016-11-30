-- ������ȭ�� ������

function Field_121002:OnDie(DespawnInfo)
	
	if (DespawnInfo.SpawnID == 1) then 
		local Field = DespawnInfo.Field
		local Door1 = Field:GetSpawnNPC(2)	
		local Pos = DespawnInfo.Pos		
		local JailsPos = Math_GetDistancePoint(Pos, vec3(0,-1,0), 500)	
		Field:PlayBGM("bgm_Scenetalk_2") 		
		Door1:UseTalentSelf( 212102201 ) -- ����ִ� �� ��������
		Field:SpawnByID(3)  -- ������ �ʴ� �� ����		
		DespawnInfo.NPC:NarrationNow( "$$Field_121002_13"  )				
		Field:SpawnDelay(113232, JailsPos, 10)	
	end	

end

function Field_121002:OnSpawn(SpawnInfo)
	if (SpawnInfo.NPCID == 113232) then -- ���Ͻ��� ��ü�� ������
	   
		SpawnInfo.NPC:GainBuff(110031)
		SpawnInfo.NPC:Narration("$$Field_121002_23",3)		-- ���������� ���Ͻ��� ��ü�� ���� ������ ����ɴϴ�.
		SpawnInfo.NPC:Wait(3)
		SpawnInfo.NPC:Narration("$$Field_121002_25",2.0)	-- ���Ͻ�:� ����̳�!
		SpawnInfo.NPC:Wait(4)		
		SpawnInfo.NPC:Narration("$$Field_121002_27",4.0)	-- ���Ͻ�:ȭ���� ������ ����Ʈ���� �� ��ü�� �ջ��� ���� �����...
		SpawnInfo.NPC:Wait(5)		
		SpawnInfo.NPC:Narration("$$Field_121002_29",5.0)	-- ���Ͻ�:ũ��... ���ڷν��� ���� ���Ѱ� ���� �׳���� ���� ���� ���� ���̴�!	
		SpawnInfo.NPC:Wait(5)		
		SpawnInfo.NPC:Narration("$$Field_121002_31",3)		-- ������ ���� ������ �鸮�� �ʰ� �Ǿ����ϴ�.
		--SpawnInfo.NPC:RemoveBuff(110031)		
	end
end