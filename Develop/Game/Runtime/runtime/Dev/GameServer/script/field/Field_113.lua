
-- ////////////////////////// Ʈ���̾� ���� ���� ///////////////////////////

function Field_113:OnSensorEnter_80(Actor) -- ȭ�� ���� �Ұ� ����
	if Actor:IsPlayer() == true then
		if AsPlayer(Actor):CheckCondition(1210012) == true then
			AsPlayer(Actor):Tip("$$Field_113_6")
		end
		if AsPlayer(Actor):CheckCondition(1210013) == true then  -- ���� ȭ�� ���� �Ұ� ����
			AsPlayer(Actor):Tip("$$Field_113_7")
		end
	end
end

function Field_113:OnSensorEnter_81(Actor) -- ����� ���� �Ұ� ����
	if Actor:IsPlayer() == true then
		if AsPlayer(Actor):CheckCondition(5120005) == true then
			AsPlayer(Actor):Tip("$$Field_113_16")
		end
	    if AsPlayer(Actor):CheckCondition(5120007) == true then  -- ���� ����� ���� �Ұ� ����
			AsPlayer(Actor):Tip("$$Field_113_25")
		end
	end
end

function Field_113:OnSensorEnter_82(Actor) -- ����� ���� �Ұ� ����
	if Actor:IsPlayer() == true then
		if AsPlayer(Actor):CheckCondition(5120005) == true then
			AsPlayer(Actor):Tip("$$Field_113_16")
		end
		if AsPlayer(Actor):CheckCondition(5120007) == true then  -- ���� ����� ���� �Ұ� ����
			AsPlayer(Actor):Tip("$$Field_113_25")
		end
	end
end



function Field_113:OnSpawn(SpawnInfo)
	if (SpawnInfo.NPCID == 113160) then -- ��Ʈ���̴�
		
		SpawnInfo.NPC:Patrol({1601,1602,1603,1604,1605,1606,1607,1608,1609,1610,1611,1612}, PT_ONCE)
		SpawnInfo.NPC:ScriptSelf("Field_113_DespawnSelf")	-- ���� �Ǳ�	
	end
end

function Field_113_DespawnSelf(Self, Opponent)
	Self:Despawn(true)	
end