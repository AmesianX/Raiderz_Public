-- ���� ���� ����

function NPC_116611:OnDialogExit(Player, DialogID, Exit)
	if ((116611 == DialogID) and (1 == Exit)) then
		local ItemCount_01 = Player:GetItem(9990060)
		
		if (10 <= ItemCount_01) then
			local Field = Player:GetField()
			local SpawnPos = Player:GetPos()
			
			Field:Spawn( 116615, SpawnPos )
		else
			this:Balloon("���� ��ᰡ �������ݾ�!")
		end
	end
end

