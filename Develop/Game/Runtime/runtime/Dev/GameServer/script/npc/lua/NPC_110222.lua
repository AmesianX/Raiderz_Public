-- ��ȣ�� �۷θ���
function NPC_110222:Init(NPCID)
	
end

function NPC_110222:OnDialogExit(Player, DialogID, ExitID)
	if (110222 == DialogID) then
		if (2 == ExitID) then
			Player:RemoveBuff(1910) -- �ؽ��� �Ƿ� ����
			Player:GainBuff(88901) -- ġ�� ����
		end			
	end
end
