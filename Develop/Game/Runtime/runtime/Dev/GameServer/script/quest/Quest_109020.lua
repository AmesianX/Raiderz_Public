-- ������ �ұ� 

function Quest_109020:OnObjInteract(Player, ObjectiveID, Trigger, Progress, NPC)			-- ��Ʈ ���¿��
	if (Trigger == true) then
		if (NPC:CheckBuff(110099) == false) then
			NPC:GainBuff(110099)
		end
	end
end


