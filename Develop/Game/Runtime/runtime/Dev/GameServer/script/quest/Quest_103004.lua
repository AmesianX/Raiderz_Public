-- ����

function Quest_103004:OnBegin(Player, NPC) -- 103004 ����Ʈ �����ϸ� ���� ������ ��ġ����
	local Field = Player:GetField()
	local Narrater = Field:GetSpawnNPC(9000)
	
	NPC:DisableInteraction()
	Field:SpawnByID(103501)
	Field:SpawnByID(103502)			
	Narrater:ScriptSelf("Quest_103004_Kidnap")
	NPC:GainBuff(110061)
	Player:GainBuff(110061)	
	Player:Tip("����� ����� �޾ҽ��ϴ�.")
end

function Quest_103004_Kidnap(Self)
	local Field = Self:GetField()
	local Slaver1 = Field:GetSpawnNPC(103501)
	local Slaver2 = Field:GetSpawnNPC(103502)	
	
	Slaver1:ClearJob()
	Slaver2:ClearJob()
	Slaver2:Wait(1)	
	Slaver1:Say("{ani=atk_n}������, ���ο� �뿹��!")
	Slaver2:Wait(4)
	Slaver2:Say("{ani=taunt_2}�̳�鵵 ������ ������!")	
	Slaver2:ScriptSelf("Quest_103004_Despawn")
end

function Quest_103004_Despawn(Self)
	local Field = Self:GetField()
	local Slaver1 = Field:GetSpawnNPC(103501)
	local Slaver2 = Field:GetSpawnNPC(103502)
	local Fago = Field:GetSpawnNPC(103201)
	
	Slaver1:Despawn(false)
	Slaver2:Despawn(false)
	Fago:Despawn(true)	
end
