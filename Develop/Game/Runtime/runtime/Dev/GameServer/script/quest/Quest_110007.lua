-- ���� ����

function Quest_110007:OnObjInteract(Player, ObjectiveID, Progress, Trigger, NPC)
	
	if (2 == ObjectiveID) then												-- NPC : ���׾Ƹ� 110040
		NPC:DisableInteraction()
		NPC:GainBuff(110045)
	end
end

