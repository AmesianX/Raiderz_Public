function NPC_101213:OnDialogExit(Player, DialogID, nExit)

	-- 101060 ���� �� ����Ű����.[�߰�]
	
	-- if (1010601 == DialogID) and ( ) then
		-- if (1 == nExit) then
			-- Player:UpdateQuestVar(1010601, 1)
		-- end
	-- end


	
	--UseTalent
	
	--101037 ����õ�� ���𿤱�
	if (1010372 == DialogID) then
		if (1 == nExit) then 
			Player:UpdateQuestVar(101037, 1)
		end
	end
	
	
	GLog("1".."/n")			
	
	--101059 ������ �޸����� ��ü
	if (1010592 == DialogID) and (1 == nExit) then		
		-- local Field = Player:GetField()
		-- Field:SpawnByID(127)		 
		
		-- local Session = Field:MakeSession("Merinsha", {Merinsha})
		
		
		-- GLog("1.5".."/n")			
		-- Player:UpdateQuestVar(101059, 1)	
		
		
		-- Field:SpawnByID(127) --�޸���
		-- Field:SpawnByID(128) --���� ���� 1
		-- Field:SpawnByID(129) --���� ���� 2
		-- Field:SpawnByID(130) --���� ���� 3
				

		-- local Gadiel1 = Field:GetSpawnNPC(101121)			
		-- local Gadiel2 = Field:GetSpawnNPC(101121)
		-- local Gadiel3 = Field:GetSpawnNPC(101121)
		
		-- local QuestProgress = Player:GetQuestVar(101059)
		
		
		-- Session:ChangeScene("Start")
	
		-- AsPlayer(Actor):Tip("�ڿ� �޸����� ��Ÿ�����ϴ�! �޸��� �տ��� ��ȭ�� �����̸� ����ؾ� �մϴ�!")
		
		-- Field:EnableSensor(22)	
		
		-- GLog("2".."/n")
	
	end	
end

