-- PC�� ���� �̵�����

function NPC_5212002:OnDialogExit(Player, DialogID, ExitID)
	if (5212005 == DialogID) then
		if (5 == ExitID) then --�׷��� ��� �Ա�
			local GoldTo_107 = 0 
			
			if (Player:GetSilver() >= GoldTo_107) and (Player:CheckCondition(904) == true) then
				Player:RemoveSilver(GoldTo_107)
				Player:GateToMarker(107, 2)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����
		--elseif (6 == ExitID) then --�׷��� ��� �ø��� �������		
			--local GoldTo_107 = 3000 --30�ǹ� ���� ���������� �ش� �������� 10�� ���
			
			--if (Player:GetSilver() >= GoldTo_107) and (Player:CheckCondition(904) == true) then
				--Player:RemoveSilver(GoldTo_107)
				--Player:GateToMarker(107, 33)
			--else
				--this:Balloon("$$NPC_1210_1")
			--end --������� �� ����
		elseif (7 == ExitID) then --�׷��� ��� �׷��ý� �������	
			local GoldTo_107 = 3000 --30�ǹ� ���� ���������� �ش� �������� 10�� ���
			
			if (Player:GetSilver() >= GoldTo_107) and (Player:CheckCondition(904) == true) then
				Player:RemoveSilver(GoldTo_107)
				Player:GateToMarker(107, 14)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����
-- �׷��� ��� ����			

-- ����Ʈ �ζ� ���� 
		elseif (8 == ExitID) then --����Ʈ �ζ� �Ա�
			local GoldTo_110 = 0 
			
			if (Player:GetSilver() >= GoldTo_110) and (Player:CheckCondition(905) == true) then
				Player:RemoveSilver(GoldTo_110)
				Player:GateToMarker(110, 1)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����			
			
		elseif (9 == ExitID) then --����Ʈ �ζ� ������ 
			local GoldTo_110 = 4000 --40�ǹ� ���� ���������� �ش� �������� 10�� ���
			
			if (Player:GetSilver() >= GoldTo_110) and (Player:CheckCondition(905) == true) then
				Player:RemoveSilver(GoldTo_110)
				Player:GateToMarker(110, 13052)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����			
		--elseif (10 == ExitID) then --����Ʈ �ζ� ��� ��	
			--local GoldTo_110 = 4000 --40�ǹ� ���� ���������� �ش� �������� 10�� ���
			
			--if (Player:GetSilver() >= GoldTo_110) and (Player:CheckCondition(905) == true) then
				--Player:RemoveSilver(GoldTo_110)
				--Player:GateToMarker(110, 13031)
			--else
				--this:Balloon("$$NPC_1210_1")
			--end --������� �� ����	
-- ����Ʈ �ζ� ����

-- ������ ���ֱ� ����
		elseif (11 == ExitID) then --������ ���ֱ� �Ա�
			local GoldTo_113 = 0 --5�ǹ� ���� ���������� �ش� �������� 10�� ���
			
			if (Player:GetSilver() >= GoldTo_113) and (Player:CheckCondition(906) == true) then
				Player:RemoveSilver(GoldTo_113)
				Player:GateToMarker(113, 1)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����	
		elseif (12 == ExitID) then --������ ���ֱ� ������ ȭ��
			local GoldTo_113 = 1000 --���� �Ա��� �Ա��� 2��� ���			
			
			if (Player:GetSilver() >= GoldTo_113) and (Player:CheckCondition(906) == true) then
				Player:RemoveSilver(GoldTo_113)
				Player:GateToMarker(113, 7)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����	
		elseif (13 == ExitID) then --������ ���ֱ� ���ֹ��� �����
			local GoldTo_113 = 1000 --���� �Ա��� �Ա��� 2��� ���		
			
			if (Player:GetSilver() >= GoldTo_113) and (Player:CheckCondition(906) == true) then
				Player:RemoveSilver(GoldTo_113)
				Player:GateToMarker(113, 10)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����	
		elseif (14 == ExitID) then --������ ���ֱ� ��Ʈ ���̴�
			local GoldTo_113 = 5000 --���� ���������� �ش� �������� 10�� ���
			
			if (Player:GetSilver() >= GoldTo_113) and (Player:CheckCondition(906) == true) then
				Player:RemoveSilver(GoldTo_113)
				Player:GateToMarker(113, 1601)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����	
--������ ���ֱ� ����

--���ٻ� ����
		elseif (15 == ExitID) then --���ٻ��Ա�
			local GoldTo_102 = 0 --���� ���������� �ش� �������� 10�� ���
			
			if (Player:GetSilver() >= GoldTo_102) and (Player:CheckCondition(907) == true) then
				Player:RemoveSilver(GoldTo_102)
				Player:GateToMarker(102, 1)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����	
		elseif (16 == ExitID) then --���ٻ� ������
			local GoldTo_102 = 6000 --���� ���������� �ش� �������� 10�� ���	
			
			if (Player:GetSilver() >= GoldTo_102) and (Player:CheckCondition(907) == true) then
				Player:RemoveSilver(GoldTo_102)
				Player:GateToMarker(102, 1110)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����	
--���ٻ� ����

--����Ʈ �ζ� ����			
		elseif (17 == ExitID) then --����Ʈ �ζ� �Ա�
			local GoldTo_111 = 0 --���� ���������� �ش� �������� 10�� ���	
			
			if (Player:GetSilver() >= GoldTo_111) and (Player:CheckCondition(908) == true) then
				Player:RemoveSilver(GoldTo_111)
				Player:GateToMarker(111, 1)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����				
		elseif (18 == ExitID) then --����Ʈ �ζ� ũ�󼭽� 
			local GoldTo_111 = 7000 --���� ���������� �ش� �������� 10�� ���	
			
			if (Player:GetSilver() >= GoldTo_111) and (Player:CheckCondition(908) == true) then
				Player:RemoveSilver(GoldTo_111)
				Player:GateToMarker(111, 4)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����	
--����Ʈ �ζ� ����

--������ ����
		elseif (19 == ExitID) then --������ �Ա�
			local GoldTo_101 = 0 --���� ���������� �ش� �������� 10�� ���	
			
			if (Player:GetSilver() >= GoldTo_101) and (Player:CheckCondition(909) == true) then
				Player:RemoveSilver(GoldTo_101)
				Player:GateToMarker(101, 1)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����	
		--elseif (20 == ExitID) then --������ ���״���
			--local GoldTo_101 = 8000 --���� ���������� �ش� �������� 10�� ���		
			
			--if (Player:GetSilver() >= GoldTo_101) and (Player:CheckCondition(909) == true) then
				--Player:RemoveSilver(GoldTo_101)
				--Player:GateToMarker(101, 1010321)
			--else
				--this:Balloon("$$NPC_1210_1")
			--end --������� �� ����	
		elseif (21 == ExitID) then --������ �̸���
			local GoldTo_101 = 8000 --���� ���������� �ش� �������� 10�� ���
			
			if (Player:GetSilver() >= GoldTo_101) and (Player:CheckCondition(909) == true) then
				Player:RemoveSilver(GoldTo_101)
				Player:GateToMarker(101, 1010195)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����
		elseif (22 == ExitID) then --������ ������
			local GoldTo_101 = 1600 --���� ���������� �ش� �������� 10�� ���	
			
			if (Player:GetSilver() >= GoldTo_101) and (Player:CheckCondition(909) == true) then
				Player:RemoveSilver(GoldTo_101)
				Player:GateToMarker(101, 1010530)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����
--������ ����

--���� ���ϼ��� ����
		elseif (23 == ExitID) then --���ϼ��� �Ա�
			local GoldTo_117 = 0 --���� ���������� �ش� �������� 10�� ���	
			
			if (Player:GetSilver() >= GoldTo_117) and (Player:CheckCondition(910) == true) then
				Player:RemoveSilver(GoldTo_117)
				Player:GateToMarker(117, 2)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����
		--elseif (24 == ExitID) then --��Ž� 
			--local GoldTo_117 = 9000 --���� ���������� �ش� �������� 10�� ���	
			
			--if (Player:GetSilver() >= GoldTo_117) and (Player:CheckCondition(910) == true) then
				--Player:RemoveSilver(GoldTo_117)
				--Player:GateToMarker(117, 41)
			--else
				--this:Balloon("$$NPC_1210_1")
			--end --������� �� ����
		--elseif (25 == ExitID) then --������
			--local GoldTo_117 = 9000 --���� ���������� �ش� �������� 10�� ���
			
			--if (Player:GetSilver() >= GoldTo_117) and (Player:CheckCondition(910) == true) then
				--Player:RemoveSilver(GoldTo_117)
				--Player:GateToMarker(117, 37)
			--else
				--this:Balloon("$$NPC_1210_1")
			--end --������� �� ����
		elseif (26 == ExitID) then --Ÿ�Ϸ�Ʈ ����
			local GoldTo_117 = 9000 --���� ���������� �ش� �������� 10�� ���	
			
			if (Player:GetSilver() >= GoldTo_117) and (Player:CheckCondition(910) == true) then
				Player:RemoveSilver(GoldTo_117)
				Player:GateToMarker(117, 117022)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����
--���� ���ϼ��� ����

--ħ���� �庮 ���� 
		elseif (27 == ExitID) then --ħ���� �庮
			local GoldTo_118 = 0 --���� ���������� �ش� �������� 10�� ���	
			
			if (Player:GetSilver() >= GoldTo_118) and (Player:CheckCondition(911) == true) then
				Player:RemoveSilver(GoldTo_118)
				Player:GateToMarker(118, 1)
			else
				this:Balloon("$$NPC_1210_1")
			end --������� �� ����
		--elseif (28 == ExitID) then --Ű�޶�
			--local GoldTo_118 = 10000 --���� ���������� �ش� �������� 10�� ���
			
			--if (Player:GetSilver() >= GoldTo_118) and (Player:CheckCondition(911) == true) then
				--Player:RemoveSilver(GoldTo_118)
				--Player:GateToMarker(118, 1)
			--else
				--this:Balloon("$$NPC_1210_1")
			--end --������� �� ����					
--ħ���� �庮 ����					
--���ٻ� ���� ���� 
		elseif (28 == ExitID) then --���ٻ� ����
			local GoldTo_102001 = 0 
			
			if (Player:GetSilver() >= GoldTo_102001) and (Player:CheckCondition(34) == true) then
				Player:RemoveSilver(GoldTo_102001)
				Player:GateToMarker(102001, 99)
			else
				this:Balloon("$$NPC_1210_1")
			end 
--���ٻ� ���� ����
--���� ������ ���� 
		elseif (29 == ExitID) then --���� ������
			local GoldTo_3 = 0 
			
			if (Player:GetSilver() >= GoldTo_3) and (Player:CheckCondition(5) == true) then
				Player:RemoveSilver(GoldTo_3)
				Player:GateToMarker(3, 107101)
			else
				this:Balloon("$$NPC_1210_1")
			end 
--���� ������ ����
--���� ���� 
		elseif (30 == ExitID) then --����
			local GoldTo_1 = 0 
			
			if (Player:GetSilver() >= GoldTo_1) and (Player:CheckCondition(28) == true) then
				Player:RemoveSilver(GoldTo_1)
				Player:GateToMarker(1, 1210)
			else
				this:Balloon("$$NPC_1210_1")
			end 
--���� ����
		end
	end 
end	




