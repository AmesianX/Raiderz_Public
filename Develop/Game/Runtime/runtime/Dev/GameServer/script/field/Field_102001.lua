-- ���� ���ٻ�
function Field_102001:OnCreate()
	this:SetTimer(1, 7200, true)	
end


function Field_102001:OnTimer(TimerID) 
	if (TimerID == 1) then	
		local QuestPVP = this:GetQuestPVP()
		QuestPVP:BeginEvent(102001)
		this:SpawnByID(7102232)
	elseif (TimerID == 2) then
		-- Ʈ�� ���ݺ�A
		local OgreBoss = this:GetNPC(7102151)
		if (OgreBoss:IsDead() == false) then
			local SpawnPos = this:GetMarkerPos(19)
			this:Spawn(7102241,SpawnPos)
		else
			this:KillTimer(2)
		end
	elseif (TimerID == 3) then
		-- Ʈ�� �Ѻ�A
		local OgreBoss = this:GetNPC(7102151)
		if (OgreBoss:IsDead() == false) then
			local SpawnPos = this:GetMarkerPos(19)
			this:Spawn(7102243,SpawnPos)
		else
			this:KillTimer(3)
		end
	elseif (TimerID == 4) then
		-- Ʈ�� ���ݺ�B
		local OgreBoss = this:GetNPC(7102151)
		if (OgreBoss:IsDead() == false) then
			local SpawnPos = this:GetMarkerPos(47)
			this:Spawn(7102242,SpawnPos)
		else
			this:KillTimer(4)
		end
	elseif (TimerID == 5) then
		-- Ʈ�� �Ѻ�B
		local OgreBoss = this:GetNPC(7102151)
		if (OgreBoss:IsDead() == false) then
			local SpawnPos = this:GetMarkerPos(47)
			this:Spawn(7102244,SpawnPos)
		else
			this:KillTimer(5)
		end
	elseif (TimerID == 6) then
		-- ����� ���ݺ�A
		local TrollBoss = this:GetNPC(7102150)
		if (TrollBoss:IsDead() == false) then
			local SpawnPos = this:GetMarkerPos(20)
			this:Spawn(7102245,SpawnPos)
		else
			this:KillTimer(6)
		end
	elseif (TimerID == 7) then
		-- ����� �Ѻ�A
		local TrollBoss = this:GetNPC(7102150)
		if (TrollBoss:IsDead() == false) then
			local SpawnPos = this:GetMarkerPos(20)
			this:Spawn(7102247,SpawnPos)
		else
			this:KillTimer(7)
		end
	elseif (TimerID == 8) then
		-- ����� ���ݺ�B
		local TrollBoss = this:GetNPC(7102150)
		if (TrollBoss:IsDead() == false) then
			local SpawnPos = this:GetMarkerPos(48)
			this:Spawn(7102246,SpawnPos)
		else
			this:KillTimer(8)
		end
	elseif (TimerID == 9) then
		-- ����� �Ѻ�B
		local TrollBoss = this:GetNPC(7102150)
		if (TrollBoss:IsDead() == false) then
			local SpawnPos = this:GetMarkerPos(48)
			this:Spawn(7102248,SpawnPos)
		else
			this:KillTimer(9)
		end
	end
end

function Field_102001:OnSpawn(SpawnInfo)
	if (SpawnInfo.NPCID == 7102150) then -- ������ ��ų�� ����
		QuestPVP = this:GetQuestPVP()
		QuestPVP:EnableMarkHP(7102150)
		SpawnInfo.NPC:EnableMarkPos(7102150)
		
		SpawnInfo.NPC:GainBuff(40107) -- "������ ��ȣ��" ����
		SpawnInfo.NPC:GainBuff(40108) -- "�������� ���" ����
		
		SpawnInfo.NPC:Say("$$Field_102001_1")
		
	elseif (SpawnInfo.NPCID == 7102151) then -- ������ �����޼� ����
		QuestPVP = this:GetQuestPVP()
		QuestPVP:EnableMarkHP(7102151)
		SpawnInfo.NPC:EnableMarkPos(7102151)
		
		SpawnInfo.NPC:GainBuff(40107) -- "������ ��ȣ��" ����
		SpawnInfo.NPC:GainBuff(40108) -- "�������� ���" ����
		
		SpawnInfo.NPC:Say("$$Field_102001_1")
		
	elseif (SpawnInfo.NPCID == 7102195) then -- �߰�����
		TrollBase = this:GetNPC(7102195)
		TrollBase:EnableMarkPos(7102195)
	elseif (SpawnInfo.NPCID == 7102197) then -- �߰�����
		OgreBase = this:GetNPC(7102197)
		OgreBase:EnableMarkPos(7102197)
	elseif (SpawnInfo.NPCID == 7102241 ) then -- Ʈ�� ���ݺ� A��Ʈ
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:Patrol({2,46,7,42,41,60,59,8,9,58,57,56,55,45,10,11,12,44,13,14,54,49,51,15,16,50,52,53,40,17,23,18}, PT_ONCE)
		this:SetTimer(3, 20, false)
	elseif (SpawnInfo.NPCID == 7102243 ) then -- Ʈ�� �Ѻ� A��Ʈ
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:Patrol({2,46,7,42,41,60,59,8,9,58,57,56,55,45,10,11,12,44,13,14,54,49,51,15,16,50,52,53,40,17,23,18}, PT_ONCE)
		this:SetTimer(2, 20, false)
	elseif (SpawnInfo.NPCID == 7102242 ) then -- Ʈ�� ���ݺ� B��Ʈ
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:Patrol({2,24,26,27,28,29,30,31,32,33,43,34,35,36,22,37,38,39,23,18}, PT_ONCE)
		this:SetTimer(5, 20, false)
	elseif (SpawnInfo.NPCID == 7102244 ) then -- Ʈ�� �Ѻ� B��Ʈ
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:Patrol({2,24,26,27,28,29,30,31,32,33,43,34,35,36,22,37,38,39,23,18}, PT_ONCE)
		this:SetTimer(4, 20, false)
	elseif (SpawnInfo.NPCID == 7102245 ) then -- ����� ���ݺ� A��Ʈ
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:Patrol({21,22,37,38,39,23,17,40,53,52,50,16,15,51,49,54,14,13,44,12,11,10,45,55,56,57,58,9,8,59,60,41,42,7,46,24,26,27,25}, PT_ONCE)
		this:SetTimer(7, 20, false)
	elseif (SpawnInfo.NPCID == 7102247 ) then -- ����� �Ѻ� A��Ʈ
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:Patrol({21,22,37,38,39,23,17,40,53,52,50,16,15,51,49,54,14,13,44,12,11,10,45,55,56,57,58,9,8,59,60,41,42,7,46,24,26,27,25}, PT_ONCE)
		this:SetTimer(6, 20, false)
	elseif (SpawnInfo.NPCID == 7102246 ) then -- ����� ���ݺ� B��Ʈ
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:Patrol({21,36,35,34,43,33,32,31,30,29,28,27,25}, PT_ONCE)
		this:SetTimer(9, 20, false)
	elseif (SpawnInfo.NPCID == 7102248 ) then -- ����� �Ѻ� B��Ʈ
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:Patrol({21,36,35,34,43,33,32,31,30,29,28,27,25}, PT_ONCE)
		this:SetTimer(8, 20, false)
	elseif (SpawnInfo.NPCID == 7102000 ) then
		this:EnableSpawn(7102196, false) -- ��ư� ������ ����
	end
end

function Field_102001_DespawnSelf(Self, Opponent)
	Self:Despawn(true)	
end

function Field_102001:OnDie(DespawnInfo)
	if (DespawnInfo.SpawnID == 7102195) then -- Ʈ�� ���� �߰� ������ ������
		DespawnInfo.NPC:NarrationNow("$$Field_102001_2")
		
		local trollBoss = this:GetSpawnNPC(7102150)
		trollBoss:RemoveBuff(40107) -- ������ ��ȣ�� ����
		
		local SpawnPos = this:GetMarkerPos(48) -- ����� ���ݺ�B �⵿
		this:Spawn(7102246,SpawnPos)
		
	elseif (DespawnInfo.SpawnID == 7102197) then -- ����� ���� �߰� ������ ������
		DespawnInfo.NPC:NarrationNow("$$Field_102001_3")
		
		local ogreBoss = this:GetSpawnNPC(7102151)
		ogreBoss:RemoveBuff(40107) -- ������ ��ȣ�� ����
		
		local SpawnPos = this:GetMarkerPos(47) -- Ʈ�� ���ݺ�B �⵿
		this:Spawn(7102242,SpawnPos)
		
	elseif (DespawnInfo.SpawnID == 7102150) then -- Ʈ�� ������ ������
		DespawnInfo.NPC:NarrationNow( "$$EPIC_EDAWAR_OGRE_PRIST_WIN" )
		
		local QuestPVP = this:GetQuestPVP()
		QuestPVP:GiveTeamBuff(2, 120067)
		QuestPVP:EndEvent(102001, 2);
		
		this:EnableSpawn(7102000, false) -- �糪�� ��ư� ������ ����
		this:EnableSpawn(7102196, true) -- ��ư� ������ �ѱ�
		
	elseif (DespawnInfo.SpawnID == 7102151) then -- ����� ������ ������
		DespawnInfo.NPC:NarrationNow( "$$EPIC_EDAWAR_TROLL_PRIST_WIN" )
		
		local QuestPVP = this:GetQuestPVP()
		QuestPVP:GiveTeamBuff(1, 120067)
		QuestPVP:EndEvent(102001, 1)
		
		this:EnableSpawn(7102000, false) -- �糪�� ��ư� ������ ����
		this:EnableSpawn(7102196, true) -- ��ư� ������ �ѱ�
	end
end







