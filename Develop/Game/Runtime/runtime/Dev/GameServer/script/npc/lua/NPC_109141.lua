-- ���� ���Դ� ���� (���ָ��� �ξߺ���)

function NPC_109141:OnSpawn(SpawnInfo)
	this:SetTimer(1, 45, true)
end

function NPC_109141:OnTimer(TimerID)
	this:ClearJob()
	if (TimerID == 1) then
		local dice = math.random(0,2)
		if( dice == 0) then 
			this:Balloon("$$Field_1091411_11", 5)
		end
		if( dice == 1) then 
			this:Balloon("$$Field_1091411_12")
		end
		if( dice == 2) then 
			this:Balloon("$$Field_1091411_13", 5)
		end
	end
end



