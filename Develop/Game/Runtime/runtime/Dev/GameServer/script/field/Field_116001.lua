-- ħ�ĵ� (peace)

function Field_116001:OnSensorEnter_116020(Actor) -- ���� : �⵵�� ��� 
	if (Actor:IsPlayer() == true) then
		if (AsPlayer(Actor):CheckCondition(1160301) == true) then
			AsPlayer(Actor):Tip("�̰����� ���ɽ��ָ� ����Ͻʽÿ�.")
			AsPlayer(Actor):UpdateQuestVar(116030, 2)
		end
	end
end
function Field_116001:OnSensorLeave_116030(Actor) -- ���� : �־����� �⵵�� ��� �Ұ�
	if (Actor:IsPlayer() == true) then	
		AsPlayer(Actor):UpdateQuestVar(116030, 1)
	end
end
function Field_116001:OnSensorTalent_116030(Actor, TalentID) -- �⵵�� ����
	if (TalentID == 140554) then
		AsPlayer(Actor):UpdateQuestVar(116030, 3)
		this:SpawnByID(116210, false)
	end
end
