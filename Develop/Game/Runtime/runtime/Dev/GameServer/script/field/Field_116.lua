-- �ƶ��ٽ� ȭ������

function Field_116:OnSensorEnter_116017(Actor) -- ���� : �⵵�� ��� 
	if (Actor:IsPlayer() == true) then
		if (AsPlayer(Actor):CheckCondition(1160171) == true) then
			AsPlayer(Actor):Tip("�̰����� ���������� �⵵���� ����Ͻʽÿ�.")
			AsPlayer(Actor):UpdateQuestVar(116017, 2)
		end
	end
end
function Field_116:OnSensorLeave_116017(Actor) -- ���� : �־����� �⵵�� ��� �Ұ�
	if (Actor:IsPlayer() == true) then	
		AsPlayer(Actor):UpdateQuestVar(116017, 1)
	end
end
function Field_116:OnSensorTalent_116017(Actor, TalentID) -- �⵵�� ����
	if (TalentID == 140552) then
		AsPlayer(Actor):UpdateQuestVar(116017, 3)
		if (this:GetNPCCount(116206) == 0) and (this:GetNPCCount(116504) == 0) then
			this:SpawnByID(116206, false)	
			this:SpawnByID(116504, false)
			local Rogue = this:GetSpawnNPC(116206)
			local Halfmain = this:GetSpawnNPC(116504)
			local Session = this:MakeSession("DrainRogue", {Rogue, Halfmain})			
		end
	end
end

function Field_116:OnSensorEnter_116028(Actor) -- ��õ : ���ɽ��� ��� ��� 
	if (Actor:IsPlayer() == true) then
		if (AsPlayer(Actor):CheckCondition(1160281) == true) then
			AsPlayer(Actor):Tip("�̰����� ���ɽ��� ��Ḧ ����Ͻʽÿ�.")
			AsPlayer(Actor):UpdateQuestVar(116028, 2)
		end
	end
end
function Field_116:OnSensorLeave_116028(Actor) -- ��õ : �־����� ���ɽ��� ��� ��� �Ұ�
	if (Actor:IsPlayer() == true) then	
		AsPlayer(Actor):UpdateQuestVar(116028, 1)
	end
end
function Field_116:OnSensorTalent_116028(Actor, TalentID) -- ��õ : ���ɽ��� ��� ����
	if (TalentID == 140553) then
		AsPlayer(Actor):UpdateQuestVar(116028, 3)
		AsPlayer(Actor):Tip("���ɽ��ְ� �ϼ��Ǿ����ϴ�.")
		this:SpawnByID(116414, false)
	end
end

function Field_116:OnSpawn(SpawnInfo) -- ���ɽ��� ������
	if (SpawnInfo.NPCID == 116414) then		
		SpawnInfo.NPC:GainBuff(110072)
	end		
	if (SpawnInfo.NPCID == 116416) then		
		SpawnInfo.NPC:GainBuff(110087)
	end			
	if (SpawnInfo.SpawnID == 1000) or (SpawnInfo.SpawnID == 1001) or (SpawnInfo.SpawnID == 1002) then		
		SpawnInfo.NPC:SetDecayTime(0)
		AsNPC(SpawnInfo.NPC):SetTimer(1, 60, false)
	end			
end

function Field_116:OnSessionScene_DrainRogue_Begin(Session)
	local Rogue = this:GetSpawnNPC(116206)
	local Halfmain = this:GetSpawnNPC(116504)
		
	Session:Blocking()
		Rogue:Say("{sound=scene11_ghost_1}���� ���� ���� �ڴ� �����ΰ�?",2.6)
		Halfmain:SetAlwaysRun(true)
		Halfmain:MoveToMarker(1061)			
		Halfmain:Say("{sound=scene11_halfmain_1}{ani=positive}���� ������ ���� ���� ����̱�. �ڳ� ���� �˾ƺ��ڴ°�?", 4.3)
		Rogue:Say("{sound=scene11_ghost_2}�������� ���塦�� �׷���. �̹����� �� �����Դϱ�?", 3.7)
		Rogue:Say("{sound=scene11_ghost_3}�� �̷��Ա��� �� �ʿ䰡 �ֽ��ϱ�?", 2.5)
		Halfmain:NonDelaySay("{sound=scene11_halfmain_2}...... �̾��ϴٰ�� �����ϳ�. ������ �� ���� �ڳ��� ���� �ɷ��� �ʿ���. �̾��ϳ�.", 5.5)
		Halfmain:UseTalent(211650401, Rogue)
		Rogue:Say("{sound=scene11_ghost_4}{ani=MF_BT1}�� ������ ���� ��ƿ԰� �� ���п� �װ� �Ǿ�����, ��ȸ�� ���� �ʽ��ϴ�.", 5.0)
		Rogue:Say("{sound=scene11_ghost_5}������ ����. ����� ������ �� ���� ħ�Ĵ��ϰ� �� �̴ϴ�. �� �� �����Ͻʽÿ�.", 6.2)
	Session:ChangeScene("Drain")
end

function Field_116:OnSessionScene_DrainRogue_Drain(Session)
	local Rogue = this:GetSpawnNPC(116206)
	local Halfmain = this:GetSpawnNPC(116504)
	
		Rogue:Die(Rogue)
	Session:RemoveNPC(Rogue)
		Halfmain:Say("{sound=scene11_halfmain_3}�̰����� ������. ���� �ɷ��� ������ �Ʒ�ũ�� ����ϴµ� ū ������ �� �ž�.", 6.0)
		Halfmain:Say("{sound=scene11_halfmain_4}�� �ٽ� ħ�ĵ����� ���ư� ���� ������� ���� ��� ���ڳ�.", 4.7)
		Halfmain:Say("{sound=scene11_halfmain_5}�ڳ״� ķ���� ���ư� �����׸����� �׸� �����ְ�.", 3.2)
		Halfmain:Despawn(false)
	Session:EndSession()
end

function Field_116_SelfDespawn(Self)
	Self:Despawn(false)
end
