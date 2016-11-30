-- �������� ����(1�ο�)

function Field_1030221:OnDie(DespawnInfo) -- �䰡Ʈ ��ȣ�� ������ ������ ��Ż�� ������.
	if (DespawnInfo.SpawnID == 7) then
		this:EnableSensor(4)
	end
end

function Field_1030221:OnSpawn(SpawnInfo) -- ���� ��ȣ�� 3,4�� ��Ʈ��
	if (SpawnInfo.SpawnID == 3) then
		GLog("3�� ���� ��Ʈ��/n")
		--SpawnInfo.NPC:Patrol({32,31}, PT_LOOP)
		SpawnInfo.NPC:Patrol({31,32}, PT_LOOP)		
	end
	if (SpawnInfo.SpawnID == 4) then
		GLog("4�� ���� ��Ʈ��/n")	
		--SpawnInfo.NPC:Patrol({42,41}, PT_LOOP)
		SpawnInfo.NPC:Patrol({41,42}, PT_LOOP)
	end			
end
function Field_1030221:OnSensorEnter_10(Actor) -- ��Ż �̺�Ʈ
	if (Actor:IsPlayer() == true) then	
		this:DisableSensor(10)	
		this:PlayBGM("bgm_Scenetalk_2") 	
		local Treasure = this:GetSpawnNPC(103414)		
		local Fighter = this:GetSpawnNPC(103515)	
		local Archer = this:GetSpawnNPC(103516)
		local Magician = this:GetSpawnNPC(103517)	
		local Berserker = this:GetSpawnNPC(103518)		
		local Session = this:MakeSession("Theft", {Treasure, Fighter, Archer, Magician, Berserker})
		Session:AddBookmark("Player", Actor)
	end
end

function Field_1030221:OnSessionScene_Theft_Begin(Session)
		local Fighter = this:GetSpawnNPC(103515)	
		local Archer = this:GetSpawnNPC(103516)
		local Magician = this:GetSpawnNPC(103517)	
		local Berserker = this:GetSpawnNPC(103518)
		
		Berserker:FaceTo(Session:FindBookmark("Player"))
		Archer:FaceTo(Session:FindBookmark("Player"))
		Berserker:Say("����, �� ���׸� �༮����?")
		Archer:Say("�� ������ ��Ű�� �ڵ��ΰ� ���ϴ�.")
		Magician:FaceTo(Session:FindBookmark("Player"))
		Magician:Say("���� ���غ����� �ʴµ�?")
		Berserker:Say("���ǿ�, �װ� �̳���� ó���ض�.")
		Berserker:Say("�츰 �� ���ڸ� ������ �����ϴԲ� �������ڴ�.")
		Fighter:Say("�ðܸ� �ֽʽÿ�.")
		
		Session:ChangeScene("Combat")
end

function Field_1030221:OnSessionScene_Theft_Combat(Session)
		local Fighter = this:GetSpawnNPC(103515)	
		local Archer = this:GetSpawnNPC(103516)
		local Magician = this:GetSpawnNPC(103517)	
		local Berserker = this:GetSpawnNPC(103518)
		local Treasure = this:GetSpawnNPC(103414)
		
		Session:CombatAll()
		this:PlayBGM("bgm_Scenewar_2") 
		
		Treasure:GainBuff(110051)
		Fighter:FaceTo(Session:FindBookmark("Player"))
		Fighter:EnableCombat()
		Fighter:ChangeAA(AA_ALWAYS)
		Fighter:Attack(Session:FindBookmark("Player"))

		Session:ChangeScene("Portal")
end

function Field_1030221:OnSessionScene_Theft_Portal(Session)
		local Fighter = this:GetSpawnNPC(103515)	
		local Archer = this:GetSpawnNPC(103516)
		local Magician = this:GetSpawnNPC(103517)	
		local Berserker = this:GetSpawnNPC(103518)
		local Treasure = this:GetSpawnNPC(103414)
		
		Archer:Despawn(false)
		Magician:Despawn(false)
		Berserker:Despawn(false)
		Treasure:RemoveBuff(110051)
		this:DespawnByID(103414)
		
		Session:EndSession()
end