g_TutorialField = {};
g_TutorialField.bLockedCamera = false;		-- ũ��﷯���� ī�޶� ���� �ѹ� �Ǿ������� ����, �� �� �̻� ���� �ȵǵ��� �ϱ� ����

TutorialNarration = {};
TutorialNarration.Strings = {};
TutorialNarration.StringsFlag = {};

function TutorialNarration:Show(nStrIndex)
	if (TutorialNarration.StringsFlag[nStrIndex] == false) then
		TutorialNarration.StringsFlag[nStrIndex] = true;
		gamefunc:Narration(TutorialNarration.Strings[nStrIndex]);
	end
end

TutorialNarration.Strings[0] = "�տ� �ִ� �ΰ� ��Ʈ���ð� ��ȭ�� �Ͻʽÿ�.";
TutorialNarration.StringsFlag[0] = false;

TutorialNarration.Strings[1] = "�ָ��� ũ��﷯�� �����Ҹ��� ����ɴϴ�. �ؾȰ��� ���� �ż��� �����̼���.";
TutorialNarration.StringsFlag[1] = false;

TutorialNarration.Strings[2] = "������ �������� ��ġ��� ������ �����ϼ���.";
TutorialNarration.StringsFlag[2] = false;

TutorialNarration.Strings[3] = "������ ������ ȸ�Ǹ� ����ؼ� ���ϼ���.";
TutorialNarration.StringsFlag[3] = false;

-- Ʃ�丮�� �ʵ忡 ����� ������ �� ��� ����
function Field_1090000:OnSensorEnter_23(pActor)
	gamefunc:HelpTrigger(101);		--          [Ʃ�丮�� ����] �̵�, ����
end

function Field_1090000:OnSensorEnter_3(pActor)
	gamefunc:HelpTrigger(102);		--			[Ʃ�丮�� ����] NPC ��ȭ
end

function Field_1090000:OnSensorEnter_4(pActor)
	gamefunc:HelpTrigger(103);		--			[Ʃ�丮�� ����] ���� �̱�
end

function Field_1090000:OnSensorEnter_5(pActor)
	gamefunc:HelpTrigger(104);		--			[Ʃ�丮�� ����] �⺻ ����
end

function Field_1090000:OnSensorEnter_6(pActor)
	gamefunc:HelpTrigger(108);		--			[Ʃ�丮�� ����] ��ų
end

function Field_1090000:OnSensorEnter_7(pActor)
	gamefunc:HelpTrigger(106);		--			[Ʃ�丮�� ����] ȸ��
end

function Field_1090000:OnSensorEnter_8(pActor)
	gamefunc:HelpTrigger(107);		--			[Ʃ�丮�� ����] ����
end

function Field_1090000:OnSensorEnter_24(pActor)
	gamefunc:HelpTrigger(114);		--			[Ʃ�丮�� ����] ũ��﷯ ����
end


-- ���� : ũ��﷯ ī�޶� ��
function Field_1090000:OnSensorEnter_101(pActor)
	if (g_TutorialField.bLockedCamera == false) then
		gamefunc:PlayBGM("bgm_war_10");
		gamefunc:LockCameraToNPC(109809, "", 3);
		g_TutorialField.bLockedCamera = true;
	end
end