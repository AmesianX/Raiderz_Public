-- �ƶ��ٽ� ȭ������ : Ʈ���̾� (�������� â)

function Field_1160371:OnSpawn(SpawnInfo) -- �������� ������ ����
	if (SpawnInfo.NPCID == 116513) then		
		SpawnInfo.NPC:GainBuff(110070)		
		SpawnInfo.NPC:GainBuff(110081)			
	end	
	if (SpawnInfo.NPCID == 281) then			
		SpawnInfo.NPC:GainBuff(110009)			
	end			
end

function Field_1160371:OnSensorEnter_116037(Actor) -- �帣�� �� : �������� â ��� 
	if (Actor:IsPlayer() == true) then
		if (AsPlayer(Actor):CheckCondition(1160371) == true) then
			AsPlayer(Actor):Tip("�̰����� �������� â�� ����Ͻʽÿ�.")
			AsPlayer(Actor):UpdateQuestVar(116037, 2)
		end
	end
end

function Field_1160371:OnSensorLeave_116037(Actor) -- �帣�� �� : �������� â ��� �Ұ�
	if (Actor:IsPlayer() == true) then	
		AsPlayer(Actor):UpdateQuestVar(116037, 1)
	end
end

function Field_1160371:OnSensorEnter_2(Actor) -- �������� ������� ����
	if (Actor:IsPlayer() == true) then	
		this:DisableSensor(116037)
		this:SetTimer(1, 10, false)
		AsPlayer(Actor):UpdateQuestVar(116037, 1)
		AsPlayer(Actor):Narration("����Ʈ�� �Ϸ��߽��ϴ�. 10�� �� ķ���� �ڵ� ��ȯ�մϴ�.")
	end
end

function Field_1160371:OnTimer(TimerID) -- 10�� �� ��ȯ���� �۵�
	if (TimerID == 1) then
		this:DisableSensor(2)	
		this:EnableSensor(3)
	end
end