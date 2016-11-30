-- ���� ������ : ������ ���� (peace)

function Field_1030041:OnSpawn(SpawnInfo)
	if (SpawnInfo.NPCID == 103503) then	
		SpawnInfo.NPC:SetAlwaysRun(true)
	end
	if (SpawnInfo.SpawnID == 103507) then	
		SpawnInfo.NPC:SetAlwaysRun(true)
	end	
	if (SpawnInfo.SpawnID == 103521) then	
		SpawnInfo.NPC:SetAlwaysRun(true)
	end	
	if (SpawnInfo.SpawnID == 103522) then	
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:DisableInteraction()
	end		
end

function Field_1030041:OnSensorEnter_1(Actor) -- ���۽� ���� ������� �ɸ�
	if (Actor:IsPlayer() == true) then	
		this:DisableSensor(1)
		AsPlayer(Actor):GainBuff(110059)
		local Pago = this:GetSpawnNPC(103503)	
		local Slaver1 = this:GetSpawnNPC(10)		
		local Session = this:MakeSession("Wake", {Pago,Slaver1})
		Session:AddBookmark("Player", Actor)		
	end
end

function Field_1030041:OnSessionScene_Wake_Begin(Session)
	local Pago = this:GetSpawnNPC(103503)
	local Charle = this:GetSpawnNPC(103504)
	local Garner = this:GetSpawnNPC(103505)	
	local Slaver1 = this:GetSpawnNPC(10)		
		
		Pago:Wait(6)
		Pago:FaceTo(Session:FindBookmark("Player"))
		Pago:Say("{sound=scene9_pago_1}{ani=talk1}�̺���? ������ ��ϱ�?",1.2)
		Pago:Say("{sound=scene9_pago_2}{ani=talk1}���� �������� �����Դϴ�. ����� �츱 �̰����� ���� ����.",3.5)
		Pago:Say("{sound=scene9_pago_3}{ani=negative}��� �� ���°� ���� �ƴϱ���.",1.8)
		Pago:Say("{sound=scene9_pago_4}{ani=positive}����� ���� �ɷ� ������ ����� �� Ȥ���ϰ� �ٷ� �� �����ϴ�.",3.4)
		Slaver1:MoveToMarker(100)
		Pago:FaceTo(Slaver1)
		Pago:Say("{sound=scene9_pago_5}{ani=talk1}�̷�, �츮�� ��ƿ� ���� ���׿�.",1.7)		
		Slaver1:Say("{sound=scene9_slaver1_1}�ű�, �뿹 ��. ���� �ð��̴�. ���� �� �����!",3.7)	
	Session:ChangeScene("Sensor")
	--Session:EndSession()
end

function Field_1030041:OnSessionScene_Wake_Sensor(Session)
		this:EnableSensor(2)
	Session:EndSession()
end

function Field_1030041:OnSensorEnter_2(Actor) -- ���� ����
	if (Actor:IsPlayer() == true) then	
		this:DisableSensor(2)

		local Pago = this:GetSpawnNPC(103503)
		local Charle = this:GetSpawnNPC(103504)
		local Garner = this:GetSpawnNPC(103505)		
		local Slaver1 = this:GetSpawnNPC(10)			
		local Slaver2 = this:GetSpawnNPC(30)			
		local Runner = this:GetSpawnNPC(103507)			
		local Session = this:MakeSession("Work", {Pago,Charle,Garner,Slaver1,Slaver2,Runner})
		Session:AddBookmark("Player", Actor)		
	end
end

function Field_1030041:OnSessionScene_Work_Begin(Session)
	local Pago = this:GetSpawnNPC(103503)		
	local Slaver1 = this:GetSpawnNPC(10)	
	Session:Blocking()	
	Pago:StayawayFrom(Slaver1, 300)
	Session:ChangeScene("Seed1")		
end
		
function Field_1030041:OnSessionScene_Work_Seed1(Session)
	local Pago = this:GetSpawnNPC(103503)
	local Slaver1 = this:GetSpawnNPC(10)		
	local Runner = this:GetSpawnNPC(103507)	
	
		Pago:SetAlwaysRun(false)
	Session:NonBlocking()
		Slaver1:Patrol({101, 102},PT_ONCE)		
		Pago:Patrol({110, 111},PT_ONCE)
	Session:Blocking()
		Pago:Say("{sound=scene9_pago_6}�� ����� �������...",1.3)
		Runner:Say("{sound=scene9_researcher_1}�ȵ�! ���� �̷��� �� �� ����!",2.4)	
		Runner:MoveToMarker(120)
	Session:ChangeScene("Seed2")
end 

function Field_1030041:OnSessionScene_Work_Seed2(Session)
	local Pago = this:GetSpawnNPC(103503)
	local Charle = this:GetSpawnNPC(103504)	
	local Slaver1 = this:GetSpawnNPC(10)	
	local Slaver2 = this:GetSpawnNPC(30)	
	local Runner = this:GetSpawnNPC(103507)	
	
		Pago:FaceTo(Runner)
		Runner:GainBuff(110088)
		Pago:Say("{sound=scene9_pago_7}�̷�, ����!",1.1)
		Slaver1:Say("{sound=scene9_slaver1_2}��� �뿹�� ������ ������ �ɾ�����...",3.3)
		Slaver1:Say("{sound=scene9_slaver1_3}���� ����� ���� ������ ������ �� �Ŵ�.",4.6)
	Session:NonBlocking()			
		Slaver1:Patrol({103},PT_ONCE)	
		Pago:Patrol({112},PT_ONCE)
	Session:Blocking()
		Pago:FaceTo(Charle)
		Pago:Say("{sound=scene9_pago_8}�������ݾ�? ������ ���� ������ �־���?",2.6)
		Slaver1:FaceTo(Pago)
		Slaver1:Say("{sound=scene9_slaver1_4}���� �� �Ȱ� �� �༮�� ������ �濬���� ĳ�Ͷ�.",3.1)
		Slaver1:Say("{sound=scene9_slaver1_5}����ġ�� �ʰ� �� �����ϰ�.",2.8)
		Charle:Say("{sound=scene9_charle_1}�����... �Ķ�����... ȯ�ϰ�(�߾��߾�)",7.6)
		Slaver2:FaceTo(Pago)		
		Slaver2:Say("{sound=scene9_slaver2_1}������, �� �༮�� �󸶳� ���� ��ƿ�.",4.4)		
		Slaver2:Say("{sound=scene9_slaver2_2}��, � ����!",1.5)
		Slaver1:FaceTo(Session:FindBookmark("Player"))
		Slaver1:Say("{sound=scene9_slaver1_6}�� ��� �� �����.",1.7)		
		Slaver1:Narration("�뿹 ��ɲ��� ���󰡽ʽÿ�.")
	Session:ChangeScene("Move")
end 
	
function Field_1030041:OnSessionScene_Work_Move(Session)
	local Pago = this:GetSpawnNPC(103503)
	local Slaver1 = this:GetSpawnNPC(10)
	local Slaver2 = this:GetSpawnNPC(30)	
	local Bottle = this:GetSpawnNPC(102)	
	
	Session:NonBlocking()	
		Slaver2:Patrol({115, 116},PT_ONCE)	
		Slaver1:Patrol({104, 105},PT_ONCE)		
		Pago:Patrol({113, 114},PT_ONCE)
	Session:Blocking()
		Slaver1:FaceTo(Session:FindBookmark("Player"))
		Slaver1:Say("{sound=scene9_slaver1_7}�ʴ� ���� ���� ����.",1.7)	
		Slaver1:Say("{sound=scene9_slaver1_8}�濬���� ĳ�� �ʾƵ� �Ǵ� ���̾�.",2.7)			
		Slaver1:FaceTo(Bottle)
		Slaver1:Say("{sound=scene9_slaver1_9}������ ���� ���� ������ ���Ͷ�.",2.4)
		this:EnableSensor(5)
		Pago:Despawn(false)
		Slaver2:Despawn(false)		
	Session:EndSession()	
end

function Field_1030041:OnSensorEnter_5(Actor) -- �� ������ ������
	if (Actor:IsPlayer() == true) then	
		if (AsPlayer(Actor):CheckCondition(1030042) == true) then	
			this:DisableSensor(5)	
			local Slaver1 = this:GetSpawnNPC(10)		
			local Session = this:MakeSession("ToSwamp", {Slaver1})
			Session:AddBookmark("Player", Actor)	
		end
	end
end

function Field_1030041:OnSessionScene_ToSwamp_Begin(Session)		
	local Slaver1 = this:GetSpawnNPC(10)	
	Session:Blocking()	
		Slaver1:SetAlwaysRun(true)
		Slaver1:Say("{sound=scene9_slaver1_10}����, ���ߴ�.",2.0)
		Slaver1:Say("{sound=scene9_slaver1_11}���� �Ѵ����� ���� �� ��������.",2.6)		
		Slaver1:Patrol({106, 107, 108, 109},PT_ONCE)	
		this:EnableSensor(6)
	Session:EndSession()			
end

function Field_1030041:OnSensorEnter_6(Actor) -- ���� �ձ��� �̵�
	if (Actor:IsPlayer() == true) then	
		this:DisableSensor(6)	
		local Slaver1 = this:GetSpawnNPC(10)		
		local Session = this:MakeSession("ToLair", {Slaver1})
		Session:AddBookmark("Player", Actor)	
	end
end

function Field_1030041:OnSessionScene_ToLair_Begin(Session)		
	local Slaver1 = this:GetSpawnNPC(10)	
	Session:Blocking()	
		Slaver1:Say("{sound=scene9_slaver1_12}�ٹ����� ���� ���� �����",1.8)		
		Slaver1:Patrol({121, 122, 123, 124},PT_ONCE)	
		this:EnableSensor(7)
	Session:EndSession()				
end

function Field_1030041:OnSensorEnter_7(Actor) -- ũ�� ���� ��
	if (Actor:IsPlayer() == true) then	
		this:DisableSensor(7)	
		local Slaver1 = this:GetSpawnNPC(10)		
		local Session = this:MakeSession("UseBottle", {Slaver1})
		Session:AddBookmark("Player", Actor)
	end
end

function Field_1030041:OnSessionScene_UseBottle_Begin(Session)		
	local Slaver1 = this:GetSpawnNPC(10)	
	Session:Blocking()	
		Slaver1:Say("{sound=scene9_slaver1_13}�� �� ��ó���� �Ʊ� ������ ���� ��Ʈ��.",3.4)	
		this:EnableSensor(1030042)
	Session:EndSession()				
end

function Field_1030041:OnSensorEnter_1030042(Actor) -- ���� ��ó : ��ü�� �� �� ��� ��������
	if (Actor:IsPlayer() == true) then	
		Actor:Narration("��ü�� �� ���� ����Ͻʽÿ�.")
		AsPlayer(Actor):UpdateQuestVar(103004, 2)
	end
end

function Field_1030041:OnSensorLeave_1030042(Actor) -- �����κ��� �־����� ��ü�� �� ���� ��� �Ұ�������
	if (Actor:IsPlayer() == true) then	
		AsPlayer(Actor):UpdateQuestVar(103004, 1)
	end
end

function Field_1030041:OnSensorTalent_1030042(Actor, TalentID)
	if (TalentID == 140505) then
		Actor:Narration("��ü�� �� ���� ����߽��ϴ�.")
		this:DisableSensor(1030042)
		AsPlayer(Actor):UpdateQuestVar(103004, 3)
		AsPlayer(Actor):GainBuff(110057)
		local Slaver1 = this:GetSpawnNPC(10)		
		local Reffi = this:GetSpawnNPC(103521)
		local Rynec = this:GetSpawnNPC(103522)		
		local Session = this:MakeSession("Freedom", {Slaver1, Reffi, Rynec})
		Session:AddBookmark("Player", Actor)	
	end
end

function Field_1030041:OnSessionScene_Freedom_Begin(Session)		
	local Slaver1 = this:GetSpawnNPC(10)	
	Session:Blocking()	
		Slaver1:Wait(3)
		Slaver1:Say("{sound=scene9_slaver1_14}���� ������� �� ������ �����Ѱ�...",3.3)		
		Slaver1:Say("{sound=scene9_slaver1_15}���ư��� �� �� �����;߰ڴ�.",2.1)		
		this:SpawnByID(103521)
		this:SpawnByID(103522)
		Slaver1:Wait(3)		
	Session:ChangeScene("Slay")				
end

function Field_1030041:OnSessionScene_Freedom_Slay(Session)		
	local Slaver1 = this:GetSpawnNPC(10)	
	local Reffi = this:GetSpawnNPC(103521)
	local Rynec = this:GetSpawnNPC(103522)
	
	Session:AddNPC(Reffi)
	Session:AddNPC(Rynec)	
		Slaver1:GainBuff(110082)
	Session:NonBlocking()
		Reffi:MoveToMarker(125)
		Rynec:MoveToMarker(126)	
	Session:Blocking()
		Rynec:Say("{sound=scene9_rynec_1}�����Ͻʴϱ�?",0.8)
	Session:ChangeScene("Cure")				
end

function Field_1030041:OnSessionScene_Freedom_Cure(Session)		
	local Reffi = this:GetSpawnNPC(103521)
	local Rynec = this:GetSpawnNPC(103522)
	
	Session:Blocking()	
		Rynec:EnableInteraction()
		Rynec:Say("{sound=scene9_rynec_2}����� ã�� �־����ϴ�.",1.3)		
		Reffi:Say("{sound=scene9_reffi_1}�ϴ� ����� �ɾ���� ���Ѻ��� ������ �帮��.",2.7)
	Session:ChangeScene("Talk")					
end

function Field_1030041:OnSessionScene_Freedom_Talk(Session)		
	local Reffi = this:GetSpawnNPC(103521)
	local Rynec = this:GetSpawnNPC(103522)
	
	Session:Blocking()
		Session:FindBookmark("Player"):RemoveBuff(110059)
		Session:FindBookmark("Player"):GainBuff(1754)
	Session:EndSession()				
end