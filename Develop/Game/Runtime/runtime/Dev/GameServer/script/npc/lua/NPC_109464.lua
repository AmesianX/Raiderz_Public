-- ���� �����ô� ����

function NPC_109464:OnSpawn(SpawnInfo)
	this:SetTimer(1, 115, true)
end

function NPC_109464:OnTimer(TimerID)
	this:ClearJob()
	if (TimerID == 1) then
		local dice = math.random(0,2)
		if( dice == 0) then 
			this:Balloon("$$Field_1094641_11")
		end
		if( dice == 1) then 
			this:Balloon("$$Field_1094641_12")
		end
		if( dice == 2) then 
			this:Balloon("$$Field_1094641_13")
		end
	end
end



