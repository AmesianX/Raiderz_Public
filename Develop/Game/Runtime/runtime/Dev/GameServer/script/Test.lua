
-- �ܼ�â�� ds call �Է��ϸ� ȣ��ȴ�.
function test_handler(Actor)
	GLog("test_handler(Actor)")
	
	local Field = Actor:GetField()
	local fieldID = Field:GetID()
	
	if fieldID == 501001 or fieldID == 501101 then -- �� �ĳ� ������
		Field:ActivateSpawnGroup(200) -- 2���� ������ȸ��
		Field:ActivateSpawnGroup(300) -- 3�� ������ �����
		Field:ActivateSpawnGroup(400) -- 4�� ���ϴ���, 5�� ġ�����
		Field:ActivateSpawnGroup(600) -- 6��/7�� ġ���	
		Field:ActivateSpawnGroup(800) -- 8�� ����, 9�� ����
		Field:ActivateSpawnGroup(1000) -- 10��/11�� ������Ȱ��
		Field:ActivateSpawnGroup(1200) -- 12�� ����
		Field:ActivateSpawnGroup(1300) -- 13�� �⵵��	
	
	elseif fieldID == 508001 then -- ������ ����
		Field:ActivateSpawnGroup(100) -- 1���� �Ա�
		Field:ActivateSpawnGroup(200) -- 2���� ����� ���
		Field:ActivateSpawnGroup(300) -- 3���� ���������� �����
		Field:ActivateSpawnGroup(400) -- 4���� �������� ����
		Field:ActivateSpawnGroup(500) -- 5���� ����
		Field:ActivateSpawnGroup(600) -- 6���� ��ȸ�� ��
		Field:ActivateSpawnGroup(700) -- 7���� ��ȸ�� - ���̴��� ��
	end -- if
end
