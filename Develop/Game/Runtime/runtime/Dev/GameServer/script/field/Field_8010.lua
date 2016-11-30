-- �ƶ��ٽ� ȭ������

function Field_8010:OnSensorEnter_116017(Actor) -- ���� : �⵵�� ��� 
	if (Actor:IsPlayer() == true) then
		if (AsPlayer(Actor):CheckCondition(1160171) == true) then
			AsPlayer(Actor):Tip("�̰����� ���������� �⵵���� ����Ͻʽÿ�.")
			AsPlayer(Actor):UpdateQuestVar(116017, 2)
		end
	end
end
function Field_8010:OnSensorLeave_116017(Actor) -- ���� : �־����� �⵵�� ��� �Ұ�
	if (Actor:IsPlayer() == true) then	
		AsPlayer(Actor):UpdateQuestVar(116017, 1)
	end
end
function Field_8010:OnSensorTalent_116017(Actor, TalentID) -- �⵵�� ����
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

function Field_8010:OnSensorEnter_116028(Actor) -- ��õ : ���ɽ��� ��� ��� 
	if (Actor:IsPlayer() == true) then
		if (AsPlayer(Actor):CheckCondition(1160281) == true) then
			AsPlayer(Actor):Tip("�̰����� ���ɽ��� ��Ḧ ����Ͻʽÿ�.")
			AsPlayer(Actor):UpdateQuestVar(116028, 2)
		end
	end
end
function Field_8010:OnSensorLeave_116028(Actor) -- ��õ : �־����� ���ɽ��� ��� ��� �Ұ�
	if (Actor:IsPlayer() == true) then	
		AsPlayer(Actor):UpdateQuestVar(116028, 1)
	end
end
function Field_8010:OnSensorTalent_116028(Actor, TalentID) -- ��õ : ���ɽ��� ��� ����
	if (TalentID == 140553) then
		AsPlayer(Actor):UpdateQuestVar(116028, 3)
		AsPlayer(Actor):Tip("���ɽ��ְ� �ϼ��Ǿ����ϴ�.")
		this:SpawnByID(116414, false)
	end
end

function Field_8010:OnSpawn(SpawnInfo) -- ���ɽ��� ������

	-- quest pvp ����
	if (SpawnInfo.NPCID == 116603) then		
		QuestPVP = this:GetQuestPVP();
		QuestPVP:EnableMarkHP(116603);	
		Base = this:GetNPC(116603)
		Base:EnableMarkPos(116603)
	end	
	if (SpawnInfo.NPCID == 116604) then		
		QuestPVP = this:GetQuestPVP();
		QuestPVP:EnableMarkHP(116604);	
		Base = this:GetNPC(116604)
		Base:EnableMarkPos(116604)
	end	


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
	
	-- quest pvp ���� ��ȣ��
	-- ��ȣ�� ������ ������ �ɸ� ����� ��������
	if (SpawnInfo.NPCID == 116613) then
		local Base = this:GetNPC(116603)
		if (Base:CheckBuff(501192) == true) then
			Base:RemoveBuff(501192)
		end
	elseif (SpawnInfo.NPCID == 116614) then
		local Base = this:GetNPC(116604)
		if (Base:CheckBuff(501192) == true) then
			Base:RemoveBuff(501192)
		end
	end
	
end

function Field_8010:OnSessionScene_DrainRogue_Begin(Session)
	local Rogue = this:GetSpawnNPC(116206)
	local Halfmain = this:GetSpawnNPC(116504)
		
	Session:Blocking()
		Rogue:Say("���� ���� ���� �ڴ� �����ΰ�?")
		Halfmain:SetAlwaysRun(true)
		Halfmain:MoveToMarker(1061)			
		Halfmain:Say("{ani=positive}���� ������ ���� �� �� ����̱�. �ڳ� ���� �˾ƺ��ڴ°�?", 3)
		Rogue:Say("�������� ���塦�� �׷���. �̹����� �� �����Դϱ�?", 2)
		Rogue:Say("�� �̷��Ա��� �� �ʿ䰡 �ֽ��ϱ�?", 2)
		Halfmain:NonDelaySay("...... �̾��ϴٰ�� �����ϳ�. ������ �� ���� �ڳ��� ���� �ɷ��� �ʿ���. �̾��ϳ�.", 5)
		Halfmain:UseTalent(211650401, Rogue)
		Rogue:Say("{ani=MF_BT1}�� �� ����� ���� ��ƿ԰� �׷� ���� �׾� ���������......", 2)
		Rogue:Say("������ ����. ����� ������ �� ���� ħ�Ĵ��� �̴ϴ�. ��ȸ���� ���ʽÿ�.", 3)
	Session:ChangeScene("Drain")
end

function Field_8010:OnSessionScene_DrainRogue_Drain(Session)
	local Rogue = this:GetSpawnNPC(116206)
	local Halfmain = this:GetSpawnNPC(116504)
	
		Rogue:Die(Rogue)
	Session:RemoveNPC(Rogue)
		Halfmain:Say("�̰����� ������. ���� �ɷ��� ������ �Ʒ�ũ�� ����ϴµ� ū ������ �� �ž�.", 4)
		Halfmain:Say("�� �ٽ� ħ�ĵ����� ���ư� ���� ������� ���� ��� ���ڳ�.", 3)
		Halfmain:Say("�ڳ״� ķ���� ���ư� �����׸����� �׸� �����ְ�.", 2)
		Halfmain:Despawn(false)
	Session:EndSession()
end

function Field_8010_SelfDespawn(Self)
	Self:Despawn(false)
end

-- quest pvp ��ȣ�� �׾��� �� ������ ����� �ɱ�
function Field_8010:OnDie(DespawnInfo) -- �䰡Ʈ ��ȣ�� ������ ������ ��Ż�� ������.

	if (DespawnInfo.SpawnID == 116603) then
		QuestPVP = this:GetQuestPVP();
		QuestPVP:DisableMarkPos(116603);
	end
	if (DespawnInfo.SpawnID == 116604) then
		QuestPVP = this:GetQuestPVP();
		QuestPVP:DisableMarkPos(116604);
	end

	if (DespawnInfo.SpawnID == 22) then
		local Base = this:GetNPC(116603)
		Base:GainBuff(501192)
	elseif (DespawnInfo.SpawnID == 23) then
		local Base = this:GetNPC(116604)
		Base:GainBuff(501192)
	elseif (DespawnInfo.SpawnID == 30) or (DespawnInfo.SpawnID == 31) then
		-- ���� ���� �߰� ������ ������ ���� ��ȣ�� ����
		local Base = this:GetNPC(116603)
		Base:RemoveBuff(501206)
	elseif (DespawnInfo.SpawnID == 32) or (DespawnInfo.SpawnID == 33) then
		-- ���� ���� �߰� ������ ������ ���� ��ȣ�� ����
		local Base = this:GetNPC(116604)
		Base:RemoveBuff(501206)
	end
end













