-- ����ũ�� ����

function NPC_111213:OnHitCapsule_1_0(HitInfo)
	if (HitInfo.Attacker:IsPlayer() == true) then
		if (AsPlayer(HitInfo.Attacker):CheckCondition(1110261) == true) then -- or (AsPlayer(HitInfo.Attacker):CheckCondition(1110411) == true) then
			if (HitInfo.Damage >= 0) then
				local User = HitInfo.Attacker
				
				User:GainBuff(110038)	-- 110038 ������ 5�� ���̸� 110039�� ����. 110026 ����Ʈ�� �Ϸ�ȴ�.				
				User:GainBuff(110041)	-- ���� ����
			end
		end
		if (AsPlayer(HitInfo.Attacker):CheckCondition(1110261) == false) then
			if (HitInfo.Damage >= 0) then
				local User = HitInfo.Attacker
				
				AsPlayer(User):Tip("$$NPC_111213", 2.5)			-- ������ ������ �ʽ��ϴ�.
				User:GainBuff(110041)
			end
		end
	end
end

function NPC_111213:OnTimer(TimerID)
	if (TimerID == 1) then
		this:Despawn(true) -- �� ���̰� 15�� �� Ÿ�� ��������.
	end
end

