-- ���ϴ���
--[[
function NPC_109101:OnTryHit(Actor, TalentID)
	if (Actor:IsPlayer() == true) then
		if (AsPlayer(Actor):CheckCondition(1090071) == true) then
			AsPlayer(Actor):UpdateQuestVar(109007, 3)
			AsPlayer(Actor):Tip("�е����� �� ����Ʈ�� �Ϸ��Ͽ����ϴ�.")
		end
	end
end
--]]


