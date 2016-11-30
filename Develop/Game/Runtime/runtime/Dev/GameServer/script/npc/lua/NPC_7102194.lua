-- ���� �ƿ���

function NPC_7102194:OnDie(DespawnInfo)
-- ���� GetKillerPlayer() �� �Լ��� ��Ÿ�� �������� �Ǿ��ִ�.
-- 2012.06.14
	local Field = this:GetField();
	local QuestPVP = Field:GetQuestPVP()
	local killer = this:GetKillerPlayer()
	local QPVPTeam = killer:GetQPVPTeam()
	
	local trollBoss = Field:GetNPC(7102150)
	local ogreBoss = Field:GetNPC(7102151)
	
	this:NarrationNow("$$Field_102001_7")
	
	if (QPVPTeam == 1) then
		QuestPVP:GiveTeamBuff(1, 120068)
		
		-- ǥ�ÿ� ���� �Ǵ�.
		trollBoss:GainBuff(120081)
		
	elseif (QPVPTeam == 2) then
		QuestPVP:GiveTeamBuff(2, 120068)
		
		-- ǥ�ÿ� ���� �Ǵ�.
		ogreBoss:GainBuff(120081)
		
	end
end





