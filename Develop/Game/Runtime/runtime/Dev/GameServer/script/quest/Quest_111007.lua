-- �ں���� ����(�����)

function Quest_111007:OnEnd(Player, NPC)
	local Field = Player:GetField()
	local Totem = Field:GetSpawnNPC(111302)
	local Kaka = Field:GetSpawnNPC(111200)
	
	if (Player:CheckCondition(1110079) == true) then
		Kaka:DisableInteraction()
		Kaka:NonDelaySay("$$Field_111_6",6.1)		-- ������ ���۰� ������ ���Ʈ�� �̿��� ���� �ں������ ��ġ�ڴ�.
		Kaka:StayawayFrom(Totem, 200)
		Kaka:Say("$$Field_111_7",2.9)				-- Pichick Oicvneur
		Kaka:Say("$$Field_111_8",4.9)				-- Dadento Ybvier Terncode Wier
		Kaka:Say("$$Field_111_9",4.3)				-- Gleshac Geedi Reterdnop!
		Kaka:ScriptSelf("Quest_111007_Script")
	end
end

function Quest_111007_Script(Self)
	local Field = Self:GetField()
	local Totem = Field:GetSpawnNPC(111302)
	local Kaka = Field:GetSpawnNPC(111200)	

	Kaka:ReturnToHome()
	Kaka:EnableInteraction()
	Totem:GainBuff(110042)
end
