-- �����ǿ��� ����ó (Ʈ���̾�)
function Field_113001:OnSpawn(SpawnInfo) 
    if (SpawnInfo.SpawnID == 512002) then -- ���ڷν� ���� �Ұ��� ����
		SpawnInfo.NPC:DisableCombat()
		SpawnInfo.NPC:ChangeAA(AA_NONE)
	end
	if (SpawnInfo.SpawnID == 113079) then -- �Ը����� �̺�Ʈ ������ ���� �Ұ��� ����
		SpawnInfo.NPC:DisableCombat()
		SpawnInfo.NPC:ChangeAA(AA_NONE)
	end	
end

function Field_113001:OnSensorEnter_10(Actor) -- ���ڷν��� ������ ��ȥ�� ���
	this:DisableSensor(10)
	local Lich = this:GetSpawnNPC(512002)
	--local Field = this:GetID()		
	if (Actor:IsPlayer() == true) then		
		this:PlayBGM("bgm_Scenetalk_1")
		Lich:SetAlwaysRun(true)
		Lich:MoveToMarker(5)
		Lich:NonDelaySay("$$Field_113001_21",2.2) -- �� ������ ����� �Ǿ��!
		Lich:UseTalentSelf(251200205)
		Lich:ScriptSelf("Field_113001_Victim")
	end
end

function Field_113001_Victim(Self)
	local Field = Self:GetField()
	local Victim1 = Field:GetSpawnNPC(11)
	local Victim2 = Field:GetSpawnNPC(12)
	local Victim3 = Field:GetSpawnNPC(13)
	Victim1:GainBuff(110008)
	Victim2:GainBuff(110008)
	Victim3:GainBuff(110008)	
end

function Field_113001:OnDie(DespawnInfo) 
	local Field = this:GetID()
	local Lich = this:GetSpawnNPC(512002)
	
	if (DespawnInfo.NPCID == 113244) then -- ���� ��� ������ �̺�Ʈ ����
		if (this:GetNPCCount(113244) == 0) then
			Lich:GainBuff(110006)
			Lich:Say("$$Field_113001_44",4.9) -- (����) �̷ν� �� ��ü�� ��� �����Ǿ���.
			Lich:Wait(3)
			Lich:Say("$$Field_113001_46",2.3)	-- �� ��� ������ ��ã�� �� �ְڱ�
			Lich:ScriptSelf("Field_113001_Event1")
		end
	end
	if (DespawnInfo.NPCID == 113079) then -- [1] �Ը����� ������ : �̺�Ʈ ����
		local Pos = DespawnInfo.Pos
		DespawnInfo.Field:Spawn(113245, Pos)
		Lich:Say("$$Field_113001_53",2.5) -- �̳� �ᱹ ������� �Ұ��߱�
		Lich:Say("$$Field_113001_54",3.8)	-- �� �� ����. ���� ���� ������ ��ȥ�� ����� �ָ�
		Lich:Say("$$Field_113001_55",2.2) -- �� ������ ����� �Ǿ��
		Lich:UseTalentSelf(251200205)
		Lich:ScriptSelf("Field_113001_Event3")	-- [2] ���Ͻ��� ��ȥ�� ����
	end	
end

function Field_113001_Event1(Self)	-- ������Ʈ Ʈ���� ����
	local Field = Self:GetField()	
	Field:SpawnByID(113217)
	Field:EnableSensor(11)
end

function Field_113001:OnSensorEnter_11(Actor) -- ������ ������ �̺�Ʈ 1
    this:DisableSensor(11)
	local Lich = this:GetSpawnNPC(512002)
	local Gerion = this:GetSpawnNPC(113079)
	local Iesent = this:GetSpawnNPC(113217)
	
	if (Actor:IsPlayer() == true) then	
		Iesent:Say("$$Field_113001_74",2.0) -- ���� �ǵ���� �� �� ������
		Iesent:WaitFor(Lich)
		Lich:FaceTo(Iesent)
		Lich:Wait(1)
		Lich:Say("$$Field_113001_78",1.9) -- �� ������Ʈ Ʈ����!
		Lich:Say("$$Field_113001_79",4.2)	-- �׳� ��Ȱ�� ���ΰ�! ������ ���� ��ȥ �ۿ� ���� �ʾұ�.
		Lich:Say("$$Field_113001_80",2.8) -- ���ŵ� ���� ���� ������ ��¼�ڴ� ���̳�!
		Lich:NextAction()
		Lich:WaitFor(Iesent)
		Iesent:Say("$$Field_113001_83",4.9) -- ���� ������ �ٽ���������, �� ���� ���� �� �ڰ� �̾ ���̴�.
		Iesent:NextAction()
		Lich:Say("$$Field_113001_85",1.8) -- ���ڰ� �� �ҷ��� ���ΰ�
		Lich:Say("$$Field_113001_86",3.3) -- �̷� �ּ��̰� ���� ������ ����̶��. �ѽ��ϱ�
		Lich:FaceTo(Gerion)
		Lich:Say("$$Field_113001_88",6.0) -- �ű� �ִ� �����. �� ��Ȱ�� �����ص� ���� ��������, �� ���� ����� �ŵ쳪�� ���ָ�
		Lich:UseTalentSelf(251200206)
		Lich:ScriptSelf("Field_113001_Event2")
	end
end

function Field_113001_Event2(Self)	-- �Ը��°� ���� ����
	local Field = Self:GetField()
	local Gerion = Field:GetSpawnNPC(113079)	
	Field:EnableSensor(12)
	Gerion:Say("$$Field_113001_98")	
end

function Field_113001:OnSensorEnter_12(Actor) -- �Ը����� �����ϰ� ����
	this:DisableSensor(12)
	local Lich = this:GetSpawnNPC(512002)
	local Gerion = this:GetSpawnNPC(113079)
		
	if (Actor:IsPlayer() == true) then		
		this:PlayBGM("bgm_Scenewar_1")
		Lich:FaceTo(Actor)		
		Gerion:GainBuff(110031)
		Gerion:EnableCombat()
		Gerion:ChangeAA(AA_ALWAYS)
		Gerion:Attack(Actor)	-- [1] �Ը����� ������	
		
		Gerion:Say("$$Field_113001_114")	
	end
end

function Field_113001_Event3(Self)	-- [2] ���Ͻ��� ��ȥ�� ����
	local Field = Self:GetField()	
	Field:EnableSensor(13)	
end

function Field_113001:OnSensorEnter_13(Actor) -- ���Ͻ��� ��ȥ�� ���ڷν��� ����
	this:DisableSensor(13)
	local Lich = this:GetSpawnNPC(512002)
	local Jails = this:GetNPC(113245)
	
	if (Actor:IsPlayer() == true) then	
		--this:PlayBGM("bgm_Scenewar_2")
		Lich:FaceTo(Jails)
		Lich:Say("$$Field_113001_131")	
		Jails:GainBuff(110032)
		Jails:Wait(4)
		Jails:MoveToMarker(5)
		Jails:ScriptSelf("Field_113001_Fusion")	
	end
end

function Field_113001_Fusion(Self)	-- ����
	local Field = Self:GetField()
	Self:Despawn(true)	
	local Lich = Field:GetSpawnNPC(512002)	
	Lich:UseTalentSelf(251200208)
	Lich:GainBuff(110006)	
	Lich:GainBuff(110033) -- ��ġ ���ο��ϱ�
	Lich:Say("$$Field_113001_146",4.1) 	-- �� ��ȥ�� ���� ������� ���� ����... 	
	Lich:Narration("$$Field_113001_147",3.4)	-- �Ը����� ��ü���� �׳��� ��ü�� �ŰܿԴ�.
	Lich:Wait(5)
	Lich:Narration("$$Field_113001_149",4.3) -- �װ� �� ��ȥ�� ����ϱ⸸�� �󸶳� ��ٷȴ��� �� �� ���̴�.
	Lich:Wait(6)		
	Lich:Narration("$$Field_113001_151",4.0) -- ���� �׸� �����ϰ�, �� ��ü�� ������ ���Ķ�.
	Lich:Wait(5)		
	Lich:NonDelaySay("$$Field_113001_153",3.0) -- ������ ũ�ƾƾ�~
	Lich:UseTalentSelf(251200207)
	Lich:ScriptSelf("Field_113001_Event4")
end

function Field_113001_Event4(Self)	-- [2] ���Ͻ��� ��ȥ�� ����
	local Field = Self:GetField()	
	Field:EnableSensor(14)
	Self:Despawn(true)
end

function Field_113001:OnSensorEnter_14(Actor)
	if (Actor:IsPlayer() == true) then	
		this:DisableSensor(14)
		local GK = this:GetSpawnNPC(113217)	
		
		GK:MoveToMarker(5)
		GK:FaceTo(AsPlayer(Actor))
		GK:Say("$$Field_113001_170",3.6) -- ���Ͻ��� ��ȥ�� ���ڷν��� ��ü�� �����ع��ȱ�...
		GK:Say("$$Field_113001_171",4.6) -- ���� ��� ���� ȸ���ϰ� �Ǹ�, �� ����� ū ȥ���� ������ �� �ž�.
		GK:Say("$$Field_113001_172",4.0) -- �� ���� ���ڷν��� ������ �ִ� ������ ������ �ı��ؾ� ��.
		GK:Say("$$Field_113001_173",2.4) -- ��Ź�Ѵ�... ���� �������̿�.
		GK:ScriptSelf("Field_113001_DespawnSelf")	
	end
end

function Field_113001_DespawnSelf(Self)
	Self:Despawn(true)
end


