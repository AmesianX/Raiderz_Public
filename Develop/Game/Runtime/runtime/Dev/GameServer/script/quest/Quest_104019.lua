function Quest_104019:OnObjInteract(Player, ObjectiveID, Trigger, Progress, NPC)	
	if (ObjectiveID == 1)  then			
		local Field = Player:GetField()		
		NPC:UseTalentSelf(140612)		
		Field:SetTimer(1040190, 5, false)
	end
end


-- ������ �� �ı�  -- ������ ����ϸ� ������ ���� �Ĵڽ� ����
function Quest_104019:OnObjComplete(Player, ObjectiveID)	
	if (ObjectiveID == 1) then		
		local Field = Player:GetField()		
		Field:SpawnByID(104190, Point)				
		Player:Tip("$$Quest_104019_001")  --Player:Tip("������ ���ְ� �����Ͽ����ϴ�.")
	end
end
