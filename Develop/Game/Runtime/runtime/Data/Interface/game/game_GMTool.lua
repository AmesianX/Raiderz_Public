--[[
	Game GMTool LUA script
--]]


-- Global instance
luaGMTool = {};
luaGMTool.CATEGORY		= { GMT_NONE = 0, GMT_SEARCH = 1, GMT_SPAWN = 2, GMT_MOVEBATTLE = 3, GMT_CHAR = 4, GMT_BAN = 5, GMT_ETC = 6 };
luaGMTool.CurrCategory	= luaGMTool.CATEGORY.GMT_NONE;

-- OnShowGMToolFrame
function luaGMTool:OnShowGMToolFrame()

	-- Show
	if ( true == frmGMTool:GetShow() )		then
		
		luaGMTool:InitGMTool();
		
	-- Hide
	else
	
	end
	
	
	luaGame:ShowWindow( frmGMTool );
end

-- InitGMTool( �ʱ�ȭ )
function luaGMTool:InitGMTool()
	
	luaGMTool:InitGMToolPos();
	
	luaGMTool:ChangeCategory( luaGMTool.CATEGORY.GMT_CHAR );
	
	-- �ʿ信 ���� �������� ������ �ʿ��Ѱ͵� ó��
	luaGMChar:InitGMChar();
	
end

-- InitGMToolPos( GM Tool ��ġ ���� )
function luaGMTool:InitGMToolPos()

	-- �ػ󵵿� ���� â ��� ��ġ ��Ű��
	local winWidth, winHeight		= gamefunc:GetWindowSize();
	local frameWidth, frameHeight	= frmGMTool:GetSize();
	local px, py					= frmGMTool:GetPosition();
	frmGMTool:SetPosition( ( ( winWidth - frameWidth ) * 0.5 ), ( winHeight - frameHeight ) * 0.1 );
	
	--gamedebug:Log( "luaGMTool:InitGMToolSize() WinSize" );
	
end

-- InitGMToolPos
function luaGMTool:ChangeCategory( nCategory )
	
	if( nCategory == luaGMTool.CurrCategory	)	then
		return ;
	end
		
	--gamedebug:Log( "luaGMTool:ChangeCategory() : " .. nCategory );

	luaGMTool:HideAllCategory();
	
	if( luaGMTool.CATEGORY.GMT_SEARCH == nCategory )				then
		luaGMSearch:ShowGMSearchTab();
	elseif( luaGMTool.CATEGORY.GMT_SPAWN == nCategory )				then
		luaGMSpawn:ShowGMSpawnTab();
	elseif( luaGMTool.CATEGORY.GMT_MOVEBATTLE == nCategory )		then
		luaGMMoveBattle:ShowGMMoveBattleTab();
	elseif( luaGMTool.CATEGORY.GMT_CHAR == nCategory )				then
		luaGMChar:ShowGMCharTab();
	elseif( luaGMTool.CATEGORY.GMT_BAN == nCategory )				then
		luaGMBan:ShowGMBanTab();
	elseif( luaGMTool.CATEGORY.GMT_ETC == nCategory )				then
		luaGMEtc:ShowGMEtcTab();
	else
		--gamedebug:Log( "luaGMTool:ChangeCategory() Category Error : " .. nCategory );
	end
		
	luaGMTool.CurrCategory	= nCategory;
	
end

-- HideAllCategory
function luaGMTool:HideAllCategory()
	
	luaGMSearch:HideGMSearchTab();
	luaGMSpawn:HideGMSpawnTab();
	luaGMMoveBattle:HideGMMoveBattleTab();
	luaGMChar:HideGMCharTab();
	luaGMBan:HideGMBanTab();
	luaGMEtc:HideGMEtcTab();
	
end