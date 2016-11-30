function Field_1170581:OnCreate()
	
	this:SpawnByID(11710004, false)
	this:SpawnByID(11710006, false)
	this:SpawnByID(11710007, false)
	this:SpawnByID(11710012, false)
	this:SpawnByID(11710018, false)
	
end

--üũ����Ʈ����
function Field_1170581:OnSensorEnter_4234(Actor)
	
	
end

function Field_1170581:OnSensorEnter_4235(Actor)
	
	this:DisableSensor(4235)
	
	if (AsPlayer(Actor):GetQuestVar(117058) == 4) then	
		AsPlayer(Actor):Tip("$$Quest_117058_006") --Player:Tip("��� �ڿ� �Ʊ����� ��Ÿ�� ���Դϴ�!")
		this:SetTimer(1170580, 10, false)						
	end 
	

end

function Field_1170581:OnTimer(TimerID) 
		
	-- GLog("f Line")
	
	--�ڱݿ� ���� ����Ʈ
	if (TimerID == 117058) then
	
		local burning_supply1 = this:GetSpawnNPC(11710000)
		local burning_supply2 = this:GetSpawnNPC(11710001)
		local burning_supply3 = this:GetSpawnNPC(11710002)
		local burning_supply4 = this:GetSpawnNPC(11710003)

		if (burning_supply1:CheckBuff(110028) == true) then

			-- burning_supply1:RemoveBuff(110028)			

		end
		
		if (burning_supply2:CheckBuff(110028) == true) then
			-- burning_supply2:RemoveBuff(110028)
			
		end
		
		if (burning_supply3:CheckBuff(110028) == true) then
			-- burning_supply3:RemoveBuff(110028)
			
		end
		
		if (burning_supply4:CheckBuff(110028) == true) then
			-- burning_supply4:RemoveBuff(110028)
			
		end		
		
	end
	
	
	--â�� ���� ��� �Ѹ� #�ʵ� �Ʊ����� ����
	if (TimerID == 1170580) then		
		this:SpawnByID(117601)		
		local meckih = this:GetNPC(117601)
		
		meckih:DisableCombat()		
		meckih:Narration("$$Field_1170581_001")						--meckih:Narration("�߱����� â�� ��Ÿ�����ϴ�!")						
		meckih:Say("$$Field_1170581_002") 		--meckih:Say("������!! â�� ���� ���� �༮��!!!") 		
		meckih:Say("$$Field_1170581_003") 				--		meckih:Say("�̷� ��༮����!! �װ� �;� ȯ���߱���!!") 				
		-- meckih:UseTalentSelf(211760100)		
	
	end
	
	if (TimerID == 1170581) then
		
		local meckih = this:GetNPC(117601)		
		local dice = math.random(0, 2)
		
		meckih:EnableCombat()		
		
		if dice == 0 then			
			meckih:SayNow("$$Field_1170581_004") 				--meckih:Say("���� ���� ���� ���Ҿ�� �ߴ� ųų") 				
		end
		
		if dice == 1 then
			meckih:SayNow("$$Field_1170581_005") 				--meckih:Say("����! ���� �����ҰŶ� �����ѰԳ�!!") 				
		end
		
		if dice == 2 then
			meckih:SayNow("$$Field_1170581_006") 				--meckih:Say("�� ������ ����!!") 				
		end
	end
end


function Field_1170581:OnSpawn(SpawnInfo)

	-- local Field = SpawnInfo.Field	
	
	if (SpawnInfo.SpawnID == 117601) then	
		-- GLog("Spawn mekih")	
		
		this:SetTimer(1170581, 15, true)			
	
	end

end

function Field_1170581:OnDie(DespawnInfo)
	if (DespawnInfo.SpawnID == 117601) then	
		this:KillTimer(1170581)
	end	
end