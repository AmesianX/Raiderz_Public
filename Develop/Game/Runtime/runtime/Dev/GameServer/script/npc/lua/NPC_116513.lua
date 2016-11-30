-- �������� (�������� â Ʈ���̾� �ʵ�)

function NPC_116513:OnHitCapsule_1_0(HitInfo)
	local Field = HitInfo.Attacker:GetField()

	if (HitInfo.TalentID == 140556) then	
		Field:DisableSensor(116037)
		HitInfo.Victim:RemoveBuff(110070)
		HitInfo.Victim:RemoveBuff(110081)		
		AsPlayer(HitInfo.Attacker):UpdateQuestVar(116037, 3)
		HitInfo.Victim:FaceTo(HitInfo.Attacker)
		HitInfo.Victim:SaveHomePoint()
		HitInfo.Victim:Say("{sound=scene17_halfmain_1}�������� â�̶��?!",1.5)
		HitInfo.Victim:Say("{sound=scene17_halfmain_2}�ʸ��� �� �����ϴ� ���ΰ�...",2.1)
		HitInfo.Victim:Say("{sound=scene17_halfmain_3}�� ���� ���ῴ����, �� ������ �����ϴ� �ڴ� ������ �뼭���� �ʰڴ�.",5.5)
		HitInfo.Victim:Say("{sound=scene17_halfmain_4}ħ�ĵ����� ��ٸ���. �װ����� �ʿ��� �ḻ�� ������ ����.",4.7)
		HitInfo.Victim:UseTalentSelf(211651301)
		HitInfo.Victim:ScriptSelf("NPC_116513_Portal")
	end
end

function NPC_116513_Portal(self)
	local Field = self:GetField()
	self:Despawn(false)
	Field:DespawnByID(200)
	Field:DespawnByID(201)
	Field:DespawnByID(202)
	Field:DespawnByID(203)
	Field:DespawnByID(204)
	Field:DespawnByID(205)
	Field:DespawnByID(206)
	Field:DespawnByID(207)
	Field:DespawnByID(208)
	Field:DespawnByID(209)
	Field:DespawnByID(210)	
	Field:DespawnByID(211)	
	Field:EnableSensor(2)
end