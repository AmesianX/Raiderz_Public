-- ħ�ĵ� : Ʈ���̾� (���Ѻ��� ��)

function Field_1160201:OnSpawn(SpawnInfo) -- �������� ������ ����
	if (SpawnInfo.NPCID == 116209) then		
		SpawnInfo.NPC:DisableInteraction()
	end		
end

function Field_1160201:OnSensorEnter_116020(Actor) -- ��ȭ ���� ����
	if (Actor:IsPlayer() == true) then
		this:DisableSensor(116020)	
		local Sage = this:GetSpawnNPC(116207)		
		local Halfmain = this:GetSpawnNPC(116209)
		local Session = this:MakeSession("Talking", {Halfmain, Sage})
		Session:AddBookmark("Player", Actor)
	end
end

function Field_1160201:OnSessionScene_Talking_Begin(Session)
		local Sage = this:GetSpawnNPC(116207)		
		local Halfmain = this:GetSpawnNPC(116209)
	
	Session:Blocking()
		Halfmain:Say("{sound=scene12_halfmain_1}{ani=talk1}�׻� ����� ���� �� ��Ű�±�.", 2.5)
		Sage:Say("{sound=scene12_redsage_1}{ani=talk1}����̶� �׷� ���̴ϱ��. �Ʒ�ũ�� �������� ���ذ� Ŀ ���Դϴ�.", 4.6)	
		Halfmain:Say("{sound=scene12_halfmain_2}{ani=talk1}���ش� ũ����, ��ȹ�� ������ ���ٳ�. �ڳװ� ���� ���� ������ ����� ����ϰ� �����ϱ�.", 6.6)		
		Sage:Say("{sound=scene12_redsage_2}{ani=talk1}Ȯ���� ����ũ�� ���ʰ� ������ ��ü�� ���� ������ �Ϸ�� �� ������.", 4.9)
		Halfmain:Say("{sound=scene12_halfmain_3}{ani=ignore}������ �̷� �Ϳ� �����ϰ� ���� �ʾҳ�.", 2.7)
		Sage:Say("{sound=scene12_redsage_3}{ani=talk1}����Ͻð�����. ������ ����ũ�� ������ �������� ����� �׾����ϴ�.", 4.8)
		Sage:Say("{sound=scene12_redsage_4}{ani=talk1}��ü�� �� �̻��� �Ʒ�ũ�� ȭ���� ��Ÿ �ջ�ǰų����� ��������ϱ��.", 5.9)
		Sage:Say("{sound=scene12_redsage_5}{ani=talk1}�׷��� �� ���� �����ؼ��� �� �˴ϴ�.", 2.3)
		Halfmain:Say("{sound=scene12_halfmain_4}{ani=talk1}������ �ñ��ߴµ�, �ڳװ� �� ���� ������ ����?", 3.8)
		Halfmain:Say("{sound=scene12_halfmain_5}{ani=talk1}���� �ٸ� ������ �ִ� �� ������?", 2.3)
		Sage:Say("{sound=scene12_redsage_6}{ani=talk1}��...... ������ �����������, ���� ��Ű� ���� ���� �����Ѵٰ� �ص���. ���� ���� �ǽ��ϱ⿣ �ñⰡ ���� �ʽ��ϴ�.", 9.7)
		Sage:Say("{sound=scene12_redsage_7}{ani=talk1}�׸��� ���� �帰 ������ ����� ������ �����ϴ��� ���� ���� ������.", 4.8)
		Halfmain:Say("{sound=scene12_halfmain_6}{ani=positive}��! �� �װ͵� ������ ����. �ڳװ� ���ؼ� ���� �׸��� ���� �ִ���.", 5.5)
		Sage:Say("{sound=scene12_redsage_8}{ani=talk1}����� ���¸� Ȯ�������� �̸� �������� ����.", 2.8)
		Sage:Say("{sound=scene12_redsage_9}{ani=talk1}���� �� �� ���� �ƶ��ٽ��� ���Ⱑ ���� �������� �� ã�ƿ����� �ϰڽ��ϴ�.", 5.4)
		Sage:Say("{sound=scene12_redsage_10}{ani=talk1}���� �ƶ��ٽ��� Ȱȭ�굵 �ῡ�� ��� ���� �Ǿ�����.", 4.2)
		Halfmain:Say("{sound=scene12_halfmain_7}{ani=negative}�����? �ƶ��ٽ� ȭ���� �ٽ� ����ٴ�?", 3.0)	
		Sage:UseTalentSelf(211620701)			
	Session:ChangeScene("End")	
end

function Field_1160201:OnSessionScene_Talking_End(Session)
		local Sage = this:GetSpawnNPC(116207)
		local Halfmain = this:GetSpawnNPC(116209)		
		Sage:Despawn(false)
		Halfmain:Say("{sound=scene12_halfmain_8}{ani=talk1}�� �ǹ̽����� ���� ����� ���±�.",2.5)			
	Session:EndSession()
end

function Field_1160201:OnSensorEnter_10(Actor) -- �߰� ����
	if (Actor:IsPlayer() == true) then
		this:DisableSensor(10)
		local Sage = this:GetSpawnNPC(116207)		
		local Halfmain = this:GetSpawnNPC(116209)
		local Session = this:MakeSession("Cancel", {Halfmain, Sage})
		Session:AddBookmark("Player", Actor)
	end
end

function Field_1160201:OnSessionScene_Cancel_Begin(Session)
		local Sage = this:GetSpawnNPC(116207)		
		local Halfmain = this:GetSpawnNPC(116209)
		
	Session:NonBlocking()
		Sage:ClearJob()		
		Halfmain:ClearJob()	
	Session:Blocking()
		Halfmain:FaceTo(Session:FindBookmark("Player"))	
		Sage:FaceTo(Session:FindBookmark("Player"))				
		Halfmain:NonDelaySay("{sound=scene12_halfmain_9}�ű� ���� �ִ� ���� ������?",1.7)	
		Sage:UseTalentSelf(211620701)				
	Session:ChangeScene("End")	
end

function Field_1160201:OnSessionScene_Cancel_End(Session)
		local Sage = this:GetSpawnNPC(116207)
		Sage:Despawn(false)
	Session:EndSession()
end

function Field_1160201:OnSensorEnter_11(Actor) -- ���ͷ��� ON ����
	if (Actor:IsPlayer() == true) then
		this:DisableSensor(11)	
		local Halfmain = this:GetSpawnNPC(116209)
		local Session = this:MakeSession("Spot", {Halfmain})
		Session:AddBookmark("Player", Actor)		
	end
end

function Field_1160201:OnSessionScene_Spot_Begin(Session)
		local Halfmain = this:GetSpawnNPC(116209)
	Session:Blocking()	
		Halfmain:FaceTo(Session:FindBookmark("Player"))		
		Halfmain:Say("{sound=scene12_halfmain_10}{ani=talk1}�ƾ�, �ڳ׷α�. �׷� ���� �Ϸ� �� �ǰ�?",3.5)
		Halfmain:EnableInteraction()
	Session:EndSession()
end

