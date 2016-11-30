-- ���� ���� ���� : Ʈ���̾� �ʵ�
function Field_1030011:OnSensorEnter_103000(Actor) -- ������ : üũ ����Ʈ, QuestVar(1)
	
	if (Actor:IsPlayer() == true) then		
		AsPlayer(Actor):UpdateQuestVar(103001, 1)
	end
end

function Field_1030011:OnSensorEnter_103001(Actor) -- ķ���� ����������
	this:DisableSensor(103001)
	
	if (Actor:IsPlayer() == true) then	
		local Narrator = this:GetSpawnNPC(103500)
		this:PlayBGM("bgm_Scenetalk_1")	
		Narrator:Narration("ķ���� ����ֽ��ϴ�. �ƹ����� ����ܿ��� ���� ���� ���� �� �����ϴ�.")
		Narrator:Wait(3)
		Narrator:Narration("Ǫ�� ����ź�� ����� ��ȣ�� �����ʽÿ�.")	
		AsPlayer(Actor):UpdateQuestVar(103001, 2)
	end
end

function Field_1030011:OnSensorTalent_103002(Actor, TalentID)
	if (TalentID == 140501) then
		this:SpawnByID(103200)
		Actor:Narration("������ �پ���� �Ҹ��� �鸳�ϴ�.")
		AsPlayer(Actor):UpdateQuestVar(3)
		local Pago = this:GetSpawnNPC(103200)
		local Session = this:MakeSession("PagoRun", {Pago})
		Session:AddBookmark("Player", Actor)
	end
end

function Field_1030011:OnSessionScene_PagoRun_Begin(Session)
	local Pago = this:GetSpawnNPC(103200)
		Pago:SetAlwaysRun(true)
		Pago:Patrol({11,12,13,14}, PT_ONCE)
		Pago:FaceTo(Session:FindBookmark("Player"))
		Pago:Say("{ani=respire}���... ���. ��� ��ȣ�� ���� ����� ����Դϱ�?")
		Pago:Say("{ani=talk1}�ƴ�! �߿����� �ִ� ������� �� ���� �� ����?")	
	Session:ChangeScene("End")
end

function Field_1030011:OnSessionScene_PagoRun_End(Session)
		this:EnableSensor(103003)
	Session:EndSession()
end

