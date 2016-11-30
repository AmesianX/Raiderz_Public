-- ������ (ȣ�� ���)

function NPC_102223:OnDialogExit(Player, DialogID, ExitID)
	if (1020031 == DialogID) and (2 == ExitID) then
		this:ClearJob()
		this:SetTimer(1, 300, false)			-- ������ ������ ���� 5�оȿ� �������� ������ �ڵ� ����
		this:NonDelayBalloon("$$NPC_102223_7")	-- "���ƿ�, �������� �ִ� �������� ������ ���Կ�."
		this:SetAlwaysRun(true)
		this:DisableInteraction()
		this:EnableSensorCheck(102003) 			-- 102003���� üũ ��. NPC�� ���� üũ�� ����߸� ������ ��ȣ�ۿ��� ����
		this:Patrol({1020031,1020032,1020033}, PT_ONCE)
		this:Balloon("$$NPC_102223_12")			-- "����, ����� ������!"
		this:ScriptSelf("NPC_102223_Walk")
		
	end
end

function NPC_102223_Walk(Self)
	Self:SetAlwaysRun(false)
	Self:NonDelayBalloon("$$NPC_102223_13")		-- "�� ��ȣ�� �ּ���."
	Self:Patrol({1020034,1020035,1020036,1020037}, PT_ONCE) -- ������ұ��� �̵�
	Self:ScriptSelf("NPC_102223_Escape")		
end

function NPC_102223_Escape(Self)
	Self:DisableCombat()
	Self:ChangeAA(AA_NOCE)
	Self:Balloon("$$NPC_102223_16")				-- "������� ������ ���� ������ �ſ���..."
	Self:SetAlwaysRun(true)
	Self:Patrol({1020038}, PT_ONCE)
	Self:KillTimer(1)
	Self:Balloon("$$NPC_102223_20")				-- "������ �����߳׿�. ���� ����帳�ϴ�."
	Self:Despawn(true)
end

function NPC_102223:OnHitCapsule_1_0(HitInfo)
	if (HitInfo.Damage >= 1) then
		--local Field = HitInfo.Victim:GetField()
		local dice = math.random(0,3)
		if( dice == 0) then 
			AsNPC(HitInfo.Victim):NonDelayBalloon("$$NPC_102223_30")	-- "�����ּ���!"
		end
		if( dice == 1) then 
			AsNPC(HitInfo.Victim):NonDelayBalloon("$$NPC_102223_33")	-- "����~!"
		end
		if( dice == 2) then 
			AsNPC(HitInfo.Victim):NonDelayBalloon("$$NPC_102223_36")	-- "���ݹް� �־��!"	
		end
		if( dice == 3) then 
			AsNPC(HitInfo.Victim):NonDelayBalloon("$$NPC_102223_39")	-- "������ �ʿ��ؿ�."
		end			
	end
end

function NPC_102223:OnTimer(TimerID)
	if (TimerID == 1) then
		this:ClearJob()	
		--this:Say("$$NPC_102223_33")
		this:Despawn(true)
	end
end

