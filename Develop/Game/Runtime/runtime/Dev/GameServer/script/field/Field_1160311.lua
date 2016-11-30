-- �ƶ��ٽ� ȭ������ : Ʈ���̾� (�Ʒ�ũ�� ��������)

function Field_1160311:OnSpawn(SpawnInfo) 
	if (SpawnInfo.NPCID == 116502) then		-- �Ʒ�ũ ������ ���� �Ұ� ����
		SpawnInfo.NPC:DisableCombat()
		SpawnInfo.NPC:ChangeAA(AA_NONE)
		SpawnInfo.NPC:SetAlwaysRun(true)	
	end		
	if (SpawnInfo.NPCID == 116511) then		-- �������� ������ ����
		SpawnInfo.NPC:ChangeAA(AA_NONE)	
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:DisableInteraction()		
	end		
	if (SpawnInfo.NPCID == 116516) then		-- ��� �����̳��� ����
		SpawnInfo.NPC:ChangeAA(AA_NONE)	
		SpawnInfo.NPC:DisableCombat()		
	end			
end

function Field_1160311:OnSensorEnter_10(Actor)
	if (Actor:IsPlayer() == true) then
		local Arek = this:GetSpawnNPC(116502)
		local Halfmain = this:GetSpawnNPC(116511)
		local Session = this:MakeSession("Revenge", {Halfmain, Arek})
		Session:AddBookmark("Player", Actor)
	end
end  

function Field_1160311:OnSessionScene_Revenge_Begin(Session)
		local Arek = this:GetSpawnNPC(116502)
		local Halfmain = this:GetSpawnNPC(116511)
	
	Session:Blocking()
		Halfmain:NonDelaySay("{sound=scene15_halfmain_1}�̹����߸��� ������ �ϼ��ϰڴ�.",2.6)	
		Halfmain:Patrol({11,12,13}, PT_ONCE)
		Halfmain:Say("{sound=scene15_halfmain_2}�����? ���� ��� �ִ� �ž�?",2.1)		
		Arek:UseTalentSelf(211603016)
		Halfmain:FaceTo(Arek)
		Arek:UseTalentSelf(211603041)
		Arek:MoveToMarker(20)		
		Arek:UseTalentSelf(211603040)
		Arek:SaveHomePoint()
	Session:ChangeScene("Combat")		
end

function Field_1160311:OnSessionScene_Revenge_Combat(Session)
		local Arek = this:GetSpawnNPC(116502)
		local Halfmain = this:GetSpawnNPC(116511)
	
	Session:Blocking()
	Session:CombatAll()	
		Arek:EnableCombat()
		Arek:ChangeAA(AA_FACTION)
		Halfmain:ChangeAA(AA_FACTION)		
		Arek:Attack(Halfmain)	
	Session:AddChangeSceneRule("ArekBreath", Arek, "hp", {0, 30}) -- �Ʒ�ũ ü���� 30% ���ϰ� �Ǹ�
end

function Field_1160311:OnSessionScene_Revenge_ArekBreath(Session) 
		local Arek = this:GetSpawnNPC(116502)
		local Halfmain = this:GetSpawnNPC(116511)
		local Another = this:GetSpawnNPC(116516)
		
	Session:NonBlocking()		
		this:EnableSensor(116031)
		this:SpawnByID(116516)
		Arek:MoveToMarker(30)
		Halfmain:MoveToMarker(31)
	Session:Blocking()	
	Session:CombatSession()	
		Arek:UseTalentSelf(211603056) -- �������ΰ� �Ÿ��� ������.
		Halfmain:FaceTo(Arek)	
		Arek:UseTalent(211603030, Halfmain)
		Halfmain:NonDelaySay("{sound=scene15_halfmain_3}�׳��� �Ҳ��� �� �̻� ������ ������ �ʴ´�!",3.6)
		Halfmain:MoveToMarker(32)
		Halfmain:UseTalent(211651108, Arek)
	Session:ChangeScene("ArekDrain")
end

function Field_1160311:OnSessionScene_Revenge_ArekDrain(Session)
		local Arek = this:GetSpawnNPC(116502)
		local Halfmain = this:GetSpawnNPC(116511)
		local Another = this:GetSpawnNPC(116516)		
						
	Session:AddNPC(Another)						
		Halfmain:MoveToMarker(33)
		Halfmain:Say("{sound=scene15_halfmain_4}��ħ�� �ḻ�� ���� ���� �Ա�...",2.7)
		Halfmain:Say("{sound=scene15_halfmain_5}���������� �׳��� ����� �� ������ ������ ���ڴ�!",4.8)		
		Another:ChangeAA(AA_FACTION)			
		--Arek:UseTalentSelf(211603013)		
		--Arek:GainBuff(110018)	
	--Session:CombatAll()		
	Session:CombatSession()		
	Session:Blocking()		
		Halfmain:UseTalentSelf(211651109)	-- ���
		Another:UseTalent(211651601, Halfmain)		-- [Bug2] > Attack���� �ߴ��� Enter BehaviorCombatState ��� �ϸ鼭 ������ �����
	--Session:AddChangeSceneRule("DrainFail", Halfmain, "e_motionfactor", {throwup, }) -- [Bug1] > ��� ���ͷδ� ���� �� �ٲ�
	--Session:AddChangeSceneRule("DrainFail", Halfmain, "hp", {0, 99})	
	--Session:AddChangeSceneRule("DrainFail", Halfmain, "damage", {lightning, 10})	
	Session:ChangeScene("DrainFail")	
end

function Field_1160311:OnSessionScene_Revenge_DrainFail(Session)
		local Arek = this:GetSpawnNPC(116502)
		local Halfmain = this:GetSpawnNPC(116511)
		local Another = this:GetSpawnNPC(116516)		
		
		Another:Despawn(false)
		Halfmain:NonDelaySay("{sound=scene15_halfmain_6}����?!",0.5)
		Arek:UseTalentSelf(211603041)
		Arek:MoveToMarker(25)		
	Session:ChangeScene("Interaction")
end

function Field_1160311:OnSessionScene_Revenge_Interaction(Session)
		local Arek = this:GetSpawnNPC(116502)
		local Halfmain = this:GetSpawnNPC(116511)
		
		Arek:Despawn(false)
		Halfmain:Say("{sound=scene15_halfmain_7}���ݸ�...... ���ݸ� �� �־����� ��ħ�� ������ �� �־��µ�!",5.0)		
		Halfmain:Say("{sound=scene15_halfmain_8}��ü ��� ���� �� ������ ���̳�!",2.7)
		Halfmain:Say("{sound=scene15_halfmain_9}...... Ū! ���� �ִٰ� ���� �� ã�� �� �ƴ���! �� ������ �밡�� ġ���� �� �״�!",5.8)	
		Halfmain:EnableInteraction()
	Session:EndSession()
end
