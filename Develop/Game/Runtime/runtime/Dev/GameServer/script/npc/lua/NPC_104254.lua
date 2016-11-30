
function NPC_104254:OnDialogExit(Player, DialogID, Exit)
	
	local Field = Player:GetField()
	
	if (1040202 == DialogID) and (1 == Exit) and (Field:GetNPCCount(104100) == 0 ) then 									
		
		local spawn_pos1 = Math_GetDistancePoint( Player:GetPos(), Player:GetDir(), -200 )	
		local spawn_pos2 = Math_GetDistancePoint( Player:GetPos(), Player:GetDir(), 200 )	
		
		Field:Spawn(104100, spawn_pos1)		
		Field:Spawn(104100, spawn_pos2)		
		 
		this:Say("$$NPC_104254_001")   --this:Say("{ani=ignore} �� ������ �༮ �� ó����!!")
	end
	
	--�������Ŀ� ����� ���̾�α� 	
	
	if (1040203 == DialogID) and (1 == Exit) then 			
		Player:UpdateQuestVar(104020, 2)			
	end
end

