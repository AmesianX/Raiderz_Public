-- ȥ���� �ұ�
function NPC_116121:OnSpawn(SpawnInfo)
	SpawnInfo.NPC:SetAlwaysRun(true)
	--SpawnInfo.NPC:GainBuff(88553) -- �ϵ�
	local dice = math.random(0,3)
	if( dice == 0) then 
		this:NonDelayBalloon("��� �¿�������")
	end
	if( dice == 1) then 
		this:NonDelayBalloon("���÷� ���ư�����")
	end
	if( dice == 2) then 
		this:NonDelayBalloon("�������� â�� �״�� �ξ��!")
	end
	if( dice == 3) then 
		this:NonDelayBalloon("�� ���� ȥ���� �ı���!")
	end		
end

function NPC_116121:OnTimer(TimerID)
	if (TimerID == 1) then	
		--this:ReturnToHome()
		this:Despawn(false)
	end
end