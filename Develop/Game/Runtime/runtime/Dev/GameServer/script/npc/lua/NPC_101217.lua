
-- ��ü�Ҹ��� ���� �Ϸ�� ���״��� �����
function NPC_101217:OnDialogExit(Player, DialogID, nExit)
	if (1010574 == DialogID) and (1 == nExit) then		
		-- ���״��� ����Ʈ �߰�
		-- GLog("���״��� ����Ʈ ������")		
		-- local Field = Player:GetField()
		-- local npc = Field:GetSpawnNPC(101217)		
		-- npc:UseTalentSelf(140050)		
		
		
		this:UseTalentSelf(140050)
		
		Player:UpdateQuestVar(101057, 3)
		
		-- GLog("���״��� ����Ʈ ����")
	end
	
	if (1010671 == DialogID) and (2 == nExit) then					
		-- Player:UpdateQuestVar(101067, 1)
		Player:GateToTrial(1010670, false)		
	end		
	
end

--[[
function NPC_101217:OnDialogExit(Player, DialogID, nExit)
	if (1010313 == DialogID) then if (1 == nExit) then
			Player:UpdateQuestVar(101031, 2)			
		end
	end
end
]]--