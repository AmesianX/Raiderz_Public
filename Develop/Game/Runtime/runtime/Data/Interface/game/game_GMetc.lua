--[[
	Game GMEtc LUA script
--]]


-- Global instance
luaGMEtc = {};

-- ShowGMEtcTab
function luaGMEtc:ShowGMEtcTab()
	
	--gamedebug:Log( "�׽�Ʈ" );
	
	pnlEtcMain:Show( true );
	pnlEtcInfoBase:Show( true );
	
end

-- HideGMEtcTab
function luaGMEtc:HideGMEtcTab()
	
	pnlEtcMain:Show( false );
	pnlEtcInfoBase:Show( false );
	
end
