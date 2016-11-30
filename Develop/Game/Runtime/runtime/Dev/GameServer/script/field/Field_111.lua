

function Field_111:OnSpawn(SpawnInfo)
	if (SpawnInfo.SpawnID == 400) then -- ������ ���� ��Ʈ��
		SpawnInfo.NPC:Patrol({4001,4002,4003,4004}, PT_LOOP_BACKORDER)
	end	
	if (SpawnInfo.SpawnID == 401) then -- ������ ���� ��Ʈ��
		SpawnInfo.NPC:Patrol({4011,4012,4013,4014}, PT_LOOP_BACKORDER)
	end		
	if (SpawnInfo.SpawnID == 403) then -- ������ ���� ��Ʈ��
		SpawnInfo.NPC:Patrol({4031,4032,4033,4034}, PT_LOOP_BACKORDER)
	end	
	if (SpawnInfo.SpawnID == 404) then -- ������ ���� ��Ʈ��
		SpawnInfo.NPC:Patrol({4041,4042,4043,4044,4045,4046}, PT_LOOP_BACKORDER)
	end		
	
	if (SpawnInfo.SpawnID == 450) then -- ����Ʈ ���� ��Ʈ��
		SpawnInfo.NPC:Patrol({4501,4502,4503,4504}, PT_LOOP_BACKORDER)
	end		
	if (SpawnInfo.SpawnID == 451) then -- ����Ʈ ���� ��Ʈ��
		SpawnInfo.NPC:Patrol({4510,4511,4512,4513}, PT_LOOP_BACKORDER)
	end		
	if (SpawnInfo.SpawnID == 452) then -- ����Ʈ ���� ��Ʈ��
		SpawnInfo.NPC:Patrol({4521,4522,4523}, PT_LOOP_BACKORDER)
	end		
	if (SpawnInfo.SpawnID == 453) then -- ����Ʈ ���� ��Ʈ��
		SpawnInfo.NPC:Patrol({4531,4532,4533,4534}, PT_LOOP_BACKORDER)
	end		
	if (SpawnInfo.SpawnID == 455) then -- ����Ʈ ���� ��Ʈ��
		SpawnInfo.NPC:Patrol({4551,4552,4553,4554,4555,4556}, PT_LOOP)
	end		
	
	if (SpawnInfo.SpawnID == 700) then -- ����Ʈ ���� ��Ʈ�� (����)
		SpawnInfo.NPC:Patrol({7001,7002,7003,7004,7005}, PT_LOOP_BACKORDER)
	end	
	if (SpawnInfo.SpawnID == 701) then -- ����Ʈ ���� ��Ʈ�� (����)
		SpawnInfo.NPC:Patrol({7011,7012,7013,7014}, PT_LOOP_BACKORDER)
	end	
	if (SpawnInfo.SpawnID == 702) then -- ����Ʈ ���� ��Ʈ�� (����)
		SpawnInfo.NPC:Patrol({7021,7022,7023,7024}, PT_LOOP_BACKORDER)
	end		
	if (SpawnInfo.SpawnID == 703) then -- ����Ʈ ���� ��Ʈ�� (����)
		SpawnInfo.NPC:Patrol({7031,7032,7033,7034,7035}, PT_LOOP_BACKORDER)
	end		
	if (SpawnInfo.SpawnID == 704) then -- ����Ʈ ���� ��Ʈ�� (����)
		SpawnInfo.NPC:Patrol({7041,7042,7043,7044,7045}, PT_LOOP_BACKORDER)
	end	
	if (SpawnInfo.SpawnID == 705) then -- ����Ʈ ���� ��Ʈ�� (����)
		SpawnInfo.NPC:Patrol({7051,7052,7053,7054}, PT_LOOP_BACKORDER)
	end	
	if (SpawnInfo.SpawnID == 706) then -- ����Ʈ ���� ��Ʈ�� (����)
		SpawnInfo.NPC:Patrol({7061,7062,7063,7064,7065}, PT_LOOP_BACKORDER)
	end	
	if (SpawnInfo.SpawnID == 707) then -- ����Ʈ ���� ��Ʈ�� (����)
		SpawnInfo.NPC:Patrol({7071,7072,7073,7074}, PT_LOOP_BACKORDER)
	end	
	if (SpawnInfo.SpawnID == 708) then -- ����Ʈ ���� ��Ʈ�� (����)
		SpawnInfo.NPC:Patrol({7081,7082,7083}, PT_LOOP_BACKORDER)
	end		
	if (SpawnInfo.SpawnID == 709) then -- ����Ʈ ���� ��Ʈ�� (����)
		SpawnInfo.NPC:Patrol({7091,7092,7093}, PT_LOOP_BACKORDER)
	end		
	if (SpawnInfo.NPCID == 111212) then -- ��ȥ�� ���	
		SpawnInfo.NPC:GainBuff(110032)
		SpawnInfo.NPC:Patrol({4004,4003,4002,4001,4034,4033,4032,4031,4041,4042,4043,4044,4045,4046,111021}, PT_ONCE)
		SpawnInfo.NPC:ScriptSelf("Field_111_DelayDespawn")
	end		
	if (SpawnInfo.SpawnID == 1112591) then
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:DisableCombat()
		SpawnInfo.NPC:MoveToMarker(11125911)
		SpawnInfo.NPC:MoveToMarker(11125912)
		SpawnInfo.NPC:NonDelaySay("$$Field_111_1")		-- īī��Ű. �ʸ� ã�Ҵ�. ũ��! �ű⸦ ������!
		SpawnInfo.NPC:ScriptSelf("Field_111_Invasion1")
	end
	if (SpawnInfo.SpawnID == 1112592) then
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:DisableCombat()	
		SpawnInfo.NPC:MoveToMarker(11125921)
		SpawnInfo.NPC:MoveToMarker(11125922)
		SpawnInfo.NPC:NonDelaySay("$$Field_111_2")		-- ����Ű���� ����� �ڴ� �� �̻� ���� ��ġ�� ����. ũ��.
		SpawnInfo.NPC:ScriptSelf("Field_111_Invasion2")		
	end	
	if (SpawnInfo.SpawnID == 1112593) then
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:DisableCombat()	
		SpawnInfo.NPC:MoveToMarker(11125931)
		SpawnInfo.NPC:MoveToMarker(11125932)
		SpawnInfo.NPC:NonDelaySay("$$Field_111_27")		-- ũ��! ����ڿ��� ������!
		SpawnInfo.NPC:ScriptSelf("Field_111_Invasion3")		
	end
end

function Field_111_DelayDespawn(Self)
	Self:Despawn(false)
end
function Field_111_Invasion1(Self)
	Self:EnableCombat()
	Self:ChangeAA(AA_ALWAYS)
end
function Field_111_Invasion2(Self)
	Self:EnableCombat()
	Self:ChangeAA(AA_ALWAYS)
end
function Field_111_Invasion3(Self)
	Self:EnableCombat()
	Self:ChangeAA(AA_ALWAYS)
end



function Field_111:OnSensorEnter_111003(Actor) -- ��ȣ�� ������ ����
	if (Actor:IsPlayer() == true) then
		if (AsPlayer(Actor):CheckCondition(1110031) == true) then
			if (this:GetNPCCount(111256) == 0) then		
				this:SpawnByID(111256)
				this:SpawnByID(111257)
				this:SpawnByID(111258)			
				
				local Rowen = this:GetSpawnNPC(111256)
				local Fighter = this:GetSpawnNPC(111257)
				local Shooter = this:GetSpawnNPC(111258)
					
				local Session = this:MakeSession("RowenEvent",{Rowen, Fighter, Shooter})
			end
		end
	end
end

function Field_111:OnSensorEnter_111005(Actor) -- �ں�Ʈ�� ���� �Լ� �� īī��Ű���� ���� �Ϸ�
	if (Actor:IsPlayer() == true) then
		if (AsPlayer(Actor):CheckCondition(1110063) == true) then	-- �ں�Ʈ�� ����(Ʈ��)
			AsPlayer(Actor):UpdateQuestVar(111006, 3)
		end
		if (AsPlayer(Actor):CheckCondition(1110073) == true) then	-- �ں�Ʈ�� ����(�����)
			AsPlayer(Actor):UpdateQuestVar(111007, 3)
		end
		if (AsPlayer(Actor):CheckCondition(1110202) == true) then	-- ������ ã�� ��
			AsPlayer(Actor):UpdateQuestVar(111020, 3)
		end		
	end
end
function Field_111:OnSensorEnter_111002(Actor) --  �Ϸ�
	if (Actor:IsPlayer() == true) then
		if (AsPlayer(Actor):CheckCondition(1110044) == true) then
			AsPlayer(Actor):UpdateQuestVar(111004, 5)
		end
	end
end

function Field_111:OnSessionScene_RowenEvent_Begin(Session)
	local Rowen = this:GetSpawnNPC(111256)
	local Fighter = this:GetSpawnNPC(111257)
	local Shooter = this:GetSpawnNPC(111258)
	
	Session:Blocking()
		Fighter:SetAlwaysRun(true)
		Rowen:NonDelaySay("$$Field_111_3")			-- ������ ���...
	Session:CombatSession()
	--Session:NonBlocking()
		--Rowen:Attack(Shooter)
		Shooter:UseTalent(211125801, Rowen)		
		Fighter:UseTalent(211125701, Rowen)		
	Session:Blocking()		
		Rowen:UseTalent(211125602, Fighter)	
		Rowen:UseTalent(211125603, Fighter)	
		--Rowen:FaceTo(Shooter)		
		Shooter:UseTalent(211125802, Rowen)
	Session:ChangeScene("Death")
end

function Field_111:OnSessionScene_RowenEvent_Death(Session)
	local Rowen = this:GetSpawnNPC(111256)
	local Fighter = this:GetSpawnNPC(111257)
	local Shooter = this:GetSpawnNPC(111258)
	
	Session:CombatSession()	
		--Rowen:GainBuff(110018)
		Rowen:NonDelaySay("$$Field_111_4")			-- ũ��... ���� ���� ������...
		--Rowen:FaceTo(Shooter)			
		Shooter:NonDelaySay("$$Field_111_5")		-- �׾��!	
		Shooter:UseTalent(211125803, Rowen)		
	Session:ChangeScene("End")	
end

function Field_111:OnSessionScene_RowenEvent_End(Session)
	local Rowen = this:GetSpawnNPC(111256)
	local Fighter = this:GetSpawnNPC(111257)
	local Shooter = this:GetSpawnNPC(111258)
	
	Session:Blocking()
		Rowen:Die(Rowen)
		Rowen:Despawn(false)		
		Shooter:Despawn(false)				
	Session:EndSession()
end

function Field_111:OnEvent_Decode(Actor)
	local Urcus = this:GetSpawnNPC(111201)
	local Hitch = this:GetSpawnNPC(111207)	
	local Totem = this:GetSpawnNPC(111304)	
	local Session = this:MakeSession("Decode",{Urcus, Hitch, Totem})
end

function Field_111:OnSessionScene_Decode_Begin(Session)
	local Urcus = this:GetSpawnNPC(111201)	
	local Totem = this:GetSpawnNPC(111304)
	Session:Blocking()	
		Urcus:DisableInteraction()
		Urcus:NonDelaySay("Field_111_6",6.1)		-- ������ ���۰� ������ ���Ʈ�� �̿��� ���� �ں������ ��ġ�ڴ�.
		Urcus:StayawayFrom(Totem, 250)
		Urcus:Say("$$Field_111_7",2.9)				-- Pichick Oicvneur
		Urcus:Say("$$Field_111_8",4.9)				-- Dadento Ybvier Terncode Wier
		Urcus:Say("$$Field_111_9",4.3)				-- Gleshac Geedi Reterdnop!
	Session:ChangeScene("1")
end

function Field_111:OnSessionScene_Decode_1(Session)
	local Urcus = this:GetSpawnNPC(111201)
	local Totem = this:GetSpawnNPC(111304)
	Session:Blocking()	
		Urcus:NonDelaySay("$$Field_111_10",3.6)		-- ���� �� �Ǿ���. ���� �ͼ� ���� ����
		Totem:GainBuff(110042)
		Urcus:SetAlwaysRun(true)		
		Urcus:ReturnToHome()
	Session:ChangeScene("2")
end

function Field_111:OnSessionScene_Decode_2(Session)
	local Urcus = this:GetSpawnNPC(111201)
	local Hitch = this:GetSpawnNPC(111207)	
	Session:Blocking()
		Hitch:DisableInteraction()	
		Urcus:Say("$$Field_111_11",3.3)				-- �״밡 �˰� �ִ� ����� ���� ����ϱ�...
		Urcus:Say("$$Field_111_12",4.2)				-- �װ��� ���ٿ��� ī�����԰��� ��ȭ�� ���� �ִ�.
		Urcus:Say("$$Field_111_13",10.0)			-- �巡���� ����� �Ϲ����� ������δ� �ı��� �� ����, �巡���� �������θ� ��ó�� �� �� �ִٰ� �Ѵ�. ũ��.
		Hitch:Say("$$Field_111_14",2.4)				-- �ƴ�..? �巡���� �������� ��ó�� �� �� �ִٰ�?
		Hitch:Say("$$Field_111_15",5.2)				-- �׷��ٸ�, ��� ���� ������Ű�� �ִ� �巡���� ��ü�� ���� ����� �������� �𸣰ڱ�.
		Urcus:Say("$$Field_111_16",11.6)			-- ����� �ı��ϰ�, �װ��� ������ ȭ���� ������ ���ο��� �¿������ڴ� ���ΰ�? ũ��
	Session:ChangeScene("3")
end

function Field_111:OnSessionScene_Decode_3(Session)
	Session:Blocking()	
		this:SpawnByID(111252)
	Session:ChangeScene("4")		
end

function Field_111:OnSessionScene_Decode_4(Session)
	local Urcus = this:GetSpawnNPC(111201)
	local Hitch = this:GetSpawnNPC(111207)
	local Lewanki = this:GetSpawnNPC(111252)	
	Session:AddNPC(Lewanki)
	Session:Blocking()
		Lewanki:GainBuff(110103)
		Lewanki:SetAlwaysRun(true)
		Lewanki:MoveToMarker(1112521)
		Lewanki:FaceTo(Urcus)
		Lewanki:Say("$$Field_111_17",2.0)			-- ����������~
	Session:NonBlocking()		
		Hitch:FaceTo(Lewanki)		
		Urcus:FaceTo(Lewanki)
	Session:Blocking()		
		Urcus:Say("$$Field_111_18",12.2)			-- ũ�ƾ�! ����Ű, ���������� ����Ʈ�� �̸��� �������� �ڴ� �뼭���� �ʰڴ�!
		Lewanki:Say("$$Field_111_19",5.5)			-- �׵��� ��Ÿ���� ���ſ� �����ϴ� �׳���� ���� ���� �ѽ��ϱ���. ũ��.
		Lewanki:Say("$$Field_111_20",3.1)			-- �� ������ �������� ���� ������ ���̴�!!!
		Lewanki:Say("$$Field_111_21",4.8)			-- �׸��� �� �������� �� ����Ű�� ������� �Բ� �Ͻ� ���̴�! ũ��.
		Hitch:Say("$$Field_111_22",2.1)				-- ���� �׷��� �ǵ��� ���� �� �ƴ���!
	Session:ChangeScene("5")		
end

function Field_111:OnSessionScene_Decode_5(Session)
	local Urcus = this:GetSpawnNPC(111201)
	local Hitch = this:GetSpawnNPC(111207)
	local Lewanki = this:GetSpawnNPC(111252)

	Session:CombatSession()

	Session:Blocking()		
		Lewanki:UseTalent(211101008, Urcus) 
		Lewanki:Say("$$Field_111_23",2.3)			-- ������ ���Ʈ�� �� �޾ư���!
		Lewanki:Say("$$Field_111_24",4.5)			-- ������... ������ �߾��غ��ƶ�! ������
		Lewanki:MoveToMarker(1112521)
		Lewanki:MoveToMarker(1112522)		
		Lewanki:Despawn(false)
	Session:ChangeScene("6")	
end

function Field_111:OnSessionScene_Decode_6(Session)
	local Urcus = this:GetSpawnNPC(111201)
	local Hitch = this:GetSpawnNPC(111207)
	local Lewanki = this:GetSpawnNPC(111252)
	Session:NonBlocking()
	Session:CombatNone()
		Urcus:EnableInteraction()	
		Hitch:EnableInteraction()
	Session:EndSession()
end

function Field_111:OnEndCutscene(Player,CutsceneID)
	if (CutsceneID == 111022) then
		local Mage = this:GetSpawnNPC(111202)
		Mage:Wait(3)	
		Mage:Say("$$Field_111_25")					-- ���һ�. �巡���� ��ü!? Ȯ���� ��ü ���°� �̻��ϰ� �귯������ �� ���� ���� �ɻ�ġ �ʱ�.
		Mage:Say("$$Field_111_26")					-- ��� �������� ���ٰ� �߼�? �׷��ٸ� ���� ��򰡿� ���� ��ġ ����Կ��� �� ����� �����ֽÿ�.
	end
end


