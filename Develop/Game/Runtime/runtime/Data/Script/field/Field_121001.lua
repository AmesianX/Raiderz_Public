
function Field_121001:OnSensorEnter_15(Actor) -- ù�� 
	local sz = string.format("Field_121:OnSensorEnter_15()")
	gamedebug:Log(sz)
	--gamefunc:ChangeCustomEnv("cg2_room1")
	--gamefunc:ChangeCustomWeather("cg2_room1", 2)
	gamefunc:ChangeCustomTimeWeather("cg2_room1", 0, 0)	
end

function Field_121001:OnSensorLeave_15(pActor)
	gamefunc:ChangeCurrentWeather("default", 0, 0)
end


function Field_121001:OnSensorEnter_16(Actor) -- �ɹ�
	local sz = string.format("Field_121:OnSensorEnter_16()")
	gamedebug:Log(sz)
	gamefunc:ChangeCustomTimeWeather("cg2_room3", 0, 0)
end

function Field_121001:OnSensorLeave_16(pActor)
	gamefunc:ChangeCurrentWeather("default", 0, 0)
end


function Field_121001:OnSensorEnter_17(Actor) -- ���� 
	local sz = string.format("Field_121:OnSensorEnter_17()")
	gamedebug:Log(sz)
	gamefunc:ChangeCustomTimeWeather("cg2_room2", 0, 0)
end

function Field_121001:OnSensorLeave_17(pActor)
	gamefunc:ChangeCurrentWeather("default", 0, 0)
end


function Field_121001:OnSensorEnter_18(Actor) -- �Ŵ��� ����1
	local sz = string.format("Field_121:OnSensorEnter_18()")
	gamedebug:Log(sz)
	gamefunc:ChangeCustomTimeWeather("cg2_room3", 0, 0)
end

function Field_121001:OnSensorLeave_18(pActor)
	gamefunc:ChangeCurrentWeather("default", 0, 0)
end



function Field_121001:OnSensorEnter_19(Actor) -- �Ʒ�ī
	local sz = string.format("Field_121:OnSensorEnter_19()")
	gamedebug:Log(sz)
	gamefunc:ChangeCustomTimeWeather("cg2_room1", 0, 0)
end

function Field_121001:OnSensorLeave_19(pActor)
	gamefunc:ChangeCurrentWeather("default", 0, 0)
end



function Field_121001:OnSensorEnter_20(Actor) -- �ι�° ���� 
	local sz = string.format("Field_121:OnSensorEnter_20()")
	gamedebug:Log(sz)
	gamefunc:ChangeCustomTimeWeather("cg2_room2", 0, 0)
end

function Field_121001:OnSensorLeave_20(pActor)
	gamefunc:ChangeCurrentWeather("default", 0, 0)
end



function Field_121001:OnSensorEnter_21(Actor) -- ��������
	local sz = string.format("Field_121:OnSensorEnter_21()")
	gamedebug:Log(sz)
	gamefunc:ChangeCustomTimeWeather("cg2_room4", 0, 0)
end

function Field_121001:OnSensorLeave_21(pActor)
	gamefunc:ChangeCurrentWeather("default", 0, 0)
end