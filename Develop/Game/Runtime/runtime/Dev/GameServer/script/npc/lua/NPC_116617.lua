-- ���� ���� ġ��� ����

function NPC_116617:OnDialogExit(Player, DialogID, Exit)
	if ((116616 == DialogID) and (1 == Exit)) then
		this:UseTalent(211350800,Player)
		this:Balloon("ȭ����!")
	end
end

