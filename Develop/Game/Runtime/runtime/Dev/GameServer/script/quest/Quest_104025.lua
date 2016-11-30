-- �ʵ� ���� ��� ���� �ž� -- ������ ��ġ�ϸ� ������ ������ ����
function Quest_104025:OnObjComplete(Player, ObjectiveID)	
	if (ObjectiveID == 1) then		
		local Field = Player:GetField()				
		Field:EnableSensor(10402500)
	end
	
	if (ObjectiveID == 2) then		
		local Field = Player:GetField()
		
		Field:SpawnByID(104255) -- x50
		
		local x50 =  Field:GetSpawnNPC(104255)		
		local totem =  Field:GetSpawnNPC(104289)		
		
		totem:WaitFor(x50)
		x50:Say("$$Quest_104025_001",5)   --x50:Say("�ƾ�.. ���Ⱑ �����? �� �Ƹ��� �Ƹ��ɳ� �������� �ߵ� �Ǿ� �־�������.. �̷� ����.",5)
		x50:Say("$$Quest_104025_002",10)					 --x50:Say("���� ������ �����ڿ��� ���� ��ȥ�� ���� �Ƹ��� ������� ���Ƶ帮�� ������ �� ���ƿ�.. ������ �����ڰ� ���� �������� ���ѱ� ���ؼ� �츮 ��θ� ���� �� ������.",10)	
		x50:ScriptSelf("Field_104_Despawnx50")		
	end
end

function Field_104_Despawnx50(Self)
	Self:Despawn(false)
end

