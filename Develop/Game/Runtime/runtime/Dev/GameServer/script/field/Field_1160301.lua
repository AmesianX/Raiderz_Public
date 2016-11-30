-- �Ʒ�ũ�� ���� (���ɽ��ָ� ���� ���ֿ���)

function Field_1160301:OnSpawn(SpawnInfo) -- �������� ������ ����
	if (SpawnInfo.NPCID == 116308) then		
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:GainBuff(110075)			
	end	
	if (SpawnInfo.NPCID == 116510) then		
		SpawnInfo.NPC:DisableInteraction()
		SpawnInfo.NPC:GainBuff(110074)	
		SpawnInfo.NPC:SetAlwaysRun(true)
	end		
end

function Field_1160301:OnSensorEnter_116030(Actor) -- ��� �տ��� : ���ɽ��� ��� 
	if (Actor:IsPlayer() == true) then
		if (AsPlayer(Actor):CheckCondition(1160301) == true) then
			AsPlayer(Actor):Tip("�̰����� ���ɽ��ָ� ����Ͻʽÿ�.")
			AsPlayer(Actor):UpdateQuestVar(116030, 2)
		end
	end
end

function Field_1160301:OnSensorLeave_116030(Actor) -- ���� : �־����� ���ɽ��� ��� �Ұ�
	if (Actor:IsPlayer() == true) then	
		AsPlayer(Actor):UpdateQuestVar(116030, 1)
	end
end

function Field_1160301:OnSensorTalent_116030(Actor, TalentID) -- ���ɽ��� ����
	if (TalentID == 140554) then
		AsPlayer(Actor):UpdateQuestVar(116030, 3)
		AsPlayer(Actor):Tip("���� ���ְ� �ٰ����� �ֽ��ϴ�.")
		local FireLord = this:GetSpawnNPC(116308)
		local Halfmain = this:GetSpawnNPC(116510)
		local Session = this:MakeSession("Nectar", {Halfmain, FireLord})
		Session:AddBookmark("Player", Actor)		
	end
end

function Field_1160301:OnSessionScene_Nectar_Begin(Session)
		local FireLord = this:GetSpawnNPC(116308)
		local Halfmain = this:GetSpawnNPC(116510)
	
	Session:Blocking()
		FireLord:Patrol({31,32,33}, PT_ONCE)
		FireLord:Say("{sound=scene14_firelord_1}���� ���ɽ��ְ� �ϼ��Ǿ��� ����.", 2.9)		
		FireLord:Say("{sound=scene14_firelord_2}��ĭ�� ���� �̰� �״뿴��. �״밡 ���ɽ��ָ� ����µ� ū ������ �ߴٰ� �����.", 7.9)
		FireLord:Say("{sound=scene14_firelord_3}�״밡 ���� �� ���ɽ��ָ� ����ϸ� �Ʒ�ũ�� ���� �Ǹ����� ��� �� ���� ���̴�. ������. �ΰ��̿�.", 8.5)
		FireLord:Say("{sound=scene14_firelord_4}���� �� ���ɽ��ָ� ������ �ٿ�.", 3.0)
	Session:ChangeScene("Sneak")		
end

function Field_1160301:OnSessionScene_Nectar_Sneak(Session)
		local FireLord = this:GetSpawnNPC(116308)
		local Halfmain = this:GetSpawnNPC(116510)
		
		Halfmain:RemoveBuff(110074)
		Halfmain:NonDelaySay("{sound=scene14_halfmain_1}�׷��Դ� �ȵ���.", 1.5)
		Halfmain:UseTalentSelf(211651001)		
		FireLord:FaceTo(Halfmain)
		FireLord:NonDelaySay("{sound=scene14_firelord_5}�ʴ�......!", 3.6)	
		Halfmain:FaceTo(FireLord)		
		Halfmain:UseTalentSelf(211651002)			
	Session:ChangeScene("Drain")	
end

function Field_1160301:OnSessionScene_Nectar_Drain(Session)
		local FireLord = this:GetSpawnNPC(116308)
		local Halfmain = this:GetSpawnNPC(116510)
		
		FireLord:GainBuff(110018)	
		Halfmain:UseTalentSelf(211651003)
	Session:ChangeScene("End")
end

function Field_1160301:OnSessionScene_Nectar_End(Session)
		local FireLord = this:GetSpawnNPC(116308)
		local Halfmain = this:GetSpawnNPC(116510)
		
		FireLord:Die(FireLord)
		Halfmain:Wait(5)
		Halfmain:Say("{sound=scene14_halfmain_2}{ani=laugh}�̰��� ���� ������ ���ΰ�! ��û�� ���̱�! ����, ������!", 5.8)			
		Halfmain:Say("{sound=scene14_halfmain_3}{ani=cheer}�� ���� ���̶�� �Ʒ�ũ ���� �ƹ��͵� �ƴϾ�!", 3.5)
	Session:ChangeScene("Interaction")
end

function Field_1160301:OnSessionScene_Nectar_Interaction(Session)
		local Halfmain = this:GetSpawnNPC(116510)
		
		Halfmain:EnableInteraction()		
	Session:EndSession()
end