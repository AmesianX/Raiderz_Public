-- �������� (�Ʒ�ũ�� ����:Ʈ���̾� �ʵ�)

function NPC_116511:OnSpawn(SpawnInfo) -- �������� ������ ����
	if (SpawnInfo.NPCID == 116511) then		
		SpawnInfo.NPC:GainBuff(110076)		
	end		
end

function NPC_116511:OnDialogExit(Player, DialogID, Exit)
	if (1160311 == DialogID) then	-- ���� >>> Ʈ���̾� �ʵ��
		if (1 == Exit) then
			Player:GateToTrial(1160310, true)
		end
	end
	if (1160312 == DialogID) then 	-- Ʈ���̾� >> ���� �ʵ��
		if (1 == Exit) then
			Player:GateToMarker(116004, 2)
		end
	end	
end