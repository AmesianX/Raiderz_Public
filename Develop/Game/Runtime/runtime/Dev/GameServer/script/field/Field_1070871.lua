-- ���⿡ ǫ ���� �״� (107087)

function Field_1070871:OnSpawn(SpawnInfo)
	if (SpawnInfo.NPCID == 107234) then  -- ���� �� �ſ�
		SpawnInfo.NPC:GainBuff(110009)
	end	
	if (SpawnInfo.NPCID == 107007) then  -- �׷��ý�
		SpawnInfo.NPC:DisableCombat()
		SpawnInfo.NPC:ChangeAA(AA_NONE)
	end		
end

function Field_1070871:OnSensorEnter_1(Actor) -- �׷��ý� ����
	if (Actor:IsPlayer() == true) then
		this:DisableSensor(1)
		Actor:Narration("$$Field_1070871_01")
		local Teresis = this:GetSpawnNPC(1200)
		Teresis:SetAlwaysRun(true)
		Teresis:UseTalentSelf(210700708)
		Teresis:MoveToMarker(301)
		Teresis:UseTalentSelf(210700703)
		Teresis:ScriptSelf("Field_1070871_Escape")
	end
end

function Field_1070871_Escape(Self) -- �׷��ý� ������ ��ġ�� �̵��ѵ� �����
	local Field = Self:GetField()
	Field:DespawnByID(1200)
end

function Field_1070871:OnTimer(TimerID) -- 10�ʵ� ���� ������ ������ �̵�
	if (TimerID == 1) then
		this:EnableSensor(2)
	end
end


--[[
function Field_1070871:OnDie(DespawnInfo)
	local Field = DespawnInfo.Field
	local Urcus = this:GetSpawnNPC(111250)	
	
	if (DespawnInfo.SpawnID == 111010) then
		Field:KillTimer(1)
		Urcus:RemoveBuff(110044)
		Urcus:Wait(4)
		Urcus:Say("��ħ�� ����Ű�� ���簡 ������ �Ǿ���.")
		Urcus:Say("�̰��� �����Ǹ� ������ ��� �� �� ����غ���.")
		Urcus:ScriptSelf("Field_1070871_End")
	end
end

function Field_1070871_End(Self)
	local Field = Self:GetField()
	Self:Narration("10�� �� �ڵ����� ���� �ʵ�� ���ư��ϴ�.")
	Field:SetTimer(2, 10, false)
end
--]]











