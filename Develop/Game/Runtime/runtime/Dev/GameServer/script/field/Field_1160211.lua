-- �ƶ��ٽ� ȭ������ : Ʈ���̾� (���� ���ɰ��� ȸ��)

function Field_1160211:OnSpawn(SpawnInfo) -- �������� ������ ����
	if (SpawnInfo.NPCID == 116301) then		
		SpawnInfo.NPC:DisableInteraction()	
	end		
	if (SpawnInfo.NPCID == 116504) then		
		SpawnInfo.NPC:DisableInteraction()	
	end			
end

function Field_1160211:OnSensorEnter_1(Actor) -- �̵� ���� ����
	if (Actor:IsPlayer() == true) then
		this:DisableSensor(1)	
		
		local Halfmain = this:GetSpawnNPC(116504)
		local Gaf = this:GetSpawnNPC(116305)
		local Guard1 = this:GetSpawnNPC(102)
		local Guard2 = this:GetSpawnNPC(103)			
	
		local Session = this:MakeSession("Moving", {Halfmain, Gaf, Guard1, Guard2})
		Session:AddBookmark("Player", Actor)
	end
end

function Field_1160211:OnSessionScene_Moving_Begin(Session)
	local Halfmain = this:GetSpawnNPC(116504)
	local Gaf = this:GetSpawnNPC(116305)
	local Guard1 = this:GetSpawnNPC(102)
	local Guard2 = this:GetSpawnNPC(103)
	
	Session:Blocking()
		Halfmain:FaceTo(Session:FindBookmark("Player"))
		Halfmain:Say("{sound=scene13_halfmain_1}�Ա�. ���� ������.",1.7)
		Halfmain:MoveToMarker(5041)
		Halfmain:Say("{sound=scene13_halfmain_2}�� �巡�� �����̾� ������� ���������̴�.",3.5)
		Halfmain:Say("{sound=scene13_halfmain_3}�״���� ���ָ� ������ �̰��� �Դ�.",2.6)
		Gaf:Say("{sound=scene13_fire_1}�״���� �� �̰��� �Դ��� �˰� �ִ�.")
		Gaf:Say("{sound=scene13_fire_2}���� �������.")		
	Session:ChangeScene("Move")	
end

function Field_1160211:OnSessionScene_Moving_Move(Session)
	local Halfmain = this:GetSpawnNPC(116504)
	local Gaf = this:GetSpawnNPC(116305)
	local Guard1 = this:GetSpawnNPC(102)
	local Guard2 = this:GetSpawnNPC(103)
	
	Session:NonBlocking()
		Guard1:MoveToMarker(102)
		Guard2:MoveToMarker(103)
		Gaf:Patrol({351,352},PT_ONCE)
		Halfmain:MoveToMarker(5042)			
	Session:Blocking()		
		Gaf:FaceTo(Halfmain)
	Session:ChangeScene("End")	
end

function Field_1160211:OnSessionScene_Moving_End(Session)
	local Halfmain = this:GetSpawnNPC(116504)
	local Gaf = this:GetSpawnNPC(116305)
	
		Gaf:FaceTo(Halfmain)
		this:EnableSensor(2)
	Session:EndSession()
end

function Field_1160211:OnSensorEnter_2(Actor) -- ��ȭ ���� ����
	if (Actor:IsPlayer() == true) then
		this:DisableSensor(2)
		
		local Halfmain = this:GetSpawnNPC(116504)
		local Vulcan = this:GetSpawnNPC(116301)	
		local Gaf = this:GetSpawnNPC(116305)		
		local Session = this:MakeSession("Talking", {Halfmain, Vulcan, Gaf})
		Session:AddBookmark("Player", Actor)		
	end
end

function Field_1160211:OnSessionScene_Talking_Begin(Session)
	local Halfmain = this:GetSpawnNPC(116504)
	local Vulcan = this:GetSpawnNPC(116301)	
	local Gaf = this:GetSpawnNPC(116305)	
	
	Session:Blocking()
		Gaf:FaceTo(Halfmain)
		Halfmain:FaceTo(Vulcan)
		Halfmain:Say("{sound=scene13_halfmain_4}{ani=talk1}���� ���� �� �Դ��� �ȴٴ�, ��Ⱑ �����ڱ�.", 3.3)
		Halfmain:Say("{sound=scene13_halfmain_5}{ani=point}�Ʒ�ũ�� ���� �Ա��� ���� �ִ� ���� �״���� ���� ���̰���?", 4.3)
		Halfmain:Say("{sound=scene13_halfmain_6}{ani=ignore}�� �ƶ��ٽ� ȭ�����븦 �������� �Ʒ�ũ�� óġ�� ���̴�. ���� ��踦 ��ü�� �޶�.", 6.1)
		Vulcan:Say("{sound=scene13_vulcan_1}�� ���� �Ʒ�ũ�� ��ȣ�ϱ� ���� ���� ���ֲ��� ����� ���̴�.", 4.7)
		Vulcan:Say("{sound=scene13_vulcan_2}�츮�� �Ժη� ������ �� �ִ� ���� �ƴϴ�.", 2.4)
		Halfmain:Say("{sound=scene13_halfmain_7}{ani=point}���� ���� �ϴ� �ǰ�! �� ��ģ ���� ��ȣ�Ѵٴ� ���� �� �Ǵ� �Ҹ�!", 4.5)
		Halfmain:Say("{sound=scene13_halfmain_8}{ani=negative}��� ������ �����̶� ������� �߳�?", 2.9)
		Halfmain:Say("{sound=scene13_halfmain_9}�� �̻� �Ʒ�ũ�� �����ϰ� ���ּ��� �� ��! ���� ���� ���־� �Ѵ� ���̴�!", 5.0)
		Vulcan:Say("{sound=scene13_vulcan_3}�ΰ��̿�. �Ʒ�ũ�� �Ƹ��ɳ� �������� �����Ǿ� ���Ĺ��� ���̴�.", 4.2)
		Vulcan:Say("{sound=scene13_vulcan_4}������ ���� ���ֲ��� �Ʒ�ũ�� ġ���� ����� ã�Ƴ��þ���.", 3.8)
		Halfmain:Say("{sound=scene13_halfmain_10}�������� ȸ���Ѵٰ�?", 1.7)
		Halfmain:Say("{sound=scene13_halfmain_11}{ani=negative}�׷� �� �Ұ�����!", 1.4)
		Halfmain:Say("{sound=scene13_halfmain_12}�� �������� �־����� �� ���� ���� �������̾�!", 3.7)		
		Vulcan:Say("{sound=scene13_vulcan_5}�ΰ��̿�. �״밡 �̰��� ���� ������ ���� ����� ���ܵ� ������ �г븦 ���� �� �־���.", 6.4)
		Vulcan:Say("{sound=scene13_vulcan_6}������ �츮�� �Ʒ�ũ�� ��ȣ�ؾ߸� �Ѵ�. �ȵ����� �״밡 ���ϴ� ����� ���� ���� ���̴�.", 6.1)
	Session:ChangeScene("End")	
end

function Field_1160211:OnSessionScene_Talking_End(Session)
		this:EnableSensor(116021)
	Session:EndSession()
end

function Field_1160211:OnSensorEnter_116021(Actor) -- ����Ʈ �Ϸ� ����
	if (Actor:IsPlayer() == true) then
		this:DisableSensor(116021)
		local Halfmain = this:GetSpawnNPC(116504)
		local Session = this:MakeSession("Return", {Halfmain})
		Session:AddBookmark("Player", Actor)
	end
end

function Field_1160211:OnSessionScene_Return_Begin(Session)
	local Halfmain = this:GetSpawnNPC(116504)
	
	Session:Blocking()
		Halfmain:Say("......")	
		Halfmain:FaceTo(Session:FindBookmark("Player"))
		Halfmain:Say("{sound=scene13_halfmain_13}����...... �ð��� �����߱�.", 2.5)
		Halfmain:EnableInteraction()
	Session:EndSession()
end

