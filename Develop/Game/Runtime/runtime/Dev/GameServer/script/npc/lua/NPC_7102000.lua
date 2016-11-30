-- �糪�� ��ư�

function NPC_7102000:OnDie(DespawnInfo)
-- ���� GetKillerPlayer() �� �Լ��� ��Ÿ�� �������� �Ǿ��ִ�.
-- 2012.06.14
	local Field = this:GetField();
	local QuestPVP = Field:GetQuestPVP()
	local killer = this:GetKillerPlayer()
	local QPVPTeam = killer:GetQPVPTeam()
	
	local trollTower = Field:GetNPC(7102195)
	local ogreTower = Field:GetNPC(7102197)
	local trollBoss = Field:GetNPC(7102150)
	local ogreBoss = Field:GetNPC(7102151)
	
	this:NarrationNow("$$Field_102001_9")
	
	if (QPVPTeam == 1) then
		QuestPVP:GiveTeamBuff(1, 120069)
		
		-- ���� ��ȭ ������ �Ǵ�
		trollTower:GainBuff(120079)
		trollBoss:GainBuff(120079)
		
		-- ���� ��ȭ ������ �Ǵ�
		ogreTower:GainBuff(120078)
		ogreBoss:GainBuff(120078)
		
	elseif (QPVPTeam == 2) then
		QuestPVP:GiveTeamBuff(2, 120069)
		
		-- ���� ��ȭ ������ �Ǵ�
		ogreTower:GainBuff(120079)
		ogreBoss:GainBuff(120079)
		
		-- ���� ��ȭ ������ �Ǵ�
		trollTower:GainBuff(120078)
		trollBoss:GainBuff(120078)
		
	end
end





