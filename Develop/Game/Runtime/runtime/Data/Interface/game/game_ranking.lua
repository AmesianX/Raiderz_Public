--[[
	Game ranking LUA script
--]]


-- Global instance
luaRanking = {};


-- GetRankingType
function luaRanking:GetRankingType()

	local nType = 0;
	local nCurSel = cmbRankingFilter:GetCurSel();
	if ( nCurSel >= 0)  then  nType = cmbRankingFilter:GetItemData( nCurSel);
	end

	return nType;
end

-- SelChangeRankingTab
function luaRanking:SelChangeRankingTab()
	
	if ( frmSocial:GetShow() == false)  or  ( tbcSocialTabCtrl:GetSelIndex() ~= 2)  then  return;
	end

	cmbRankingFilter:SetCurSel(0);

	gamefunc:ArenaHonorSeasonListReq();

	gamefunc:ArenaRankerinfoReq();
	gamefunc:ArenaGuildRankerinfoReq();
	luaRanking:RefreshRanking();
end


-- RefreshFriends
function luaRanking:RefreshRanking()

	--gamedebug:Log( "luaRanking:RefreshRanking()\n");
	luaRanking:RefreshControls();
	luaRanking:RefreshRankingList();
	
end


-- RefreshControls
function luaRanking:RefreshControls()

	if ( frmSocial:GetShow() == false)  or  ( tbcSocialTabCtrl:GetSelIndex() ~= 2)  then  return;
	end

	if(luaRanking:GetRankingType() == RANKING_TYPE.RT_PERSON) then
		luaRanking:RefreshControlPerson();
	elseif(luaRanking:GetRankingType() == RANKING_TYPE.RT_GUILD) then
		luaRanking:RefreshControlGuild();
	end

end


-- RefreshControlPerson
function luaRanking:RefreshControlPerson()

	local nDate = 20130529;

	local nCount = gamefunc:GetArenaHonorSeasonListCount();
	if ( nCount ~= 0)  then
		local nDate = gamefunc:GetArenaHonorSeasonDate(nCount - 1);	
	end

	local nYear, nMonth, nDay = gamefunc:GetNextHonorSeasonDate(nDate, luaHonorRanking.nSeasonDay/7);
	local str = STR( "RANKING_SEASON_DESC") .. "  " .. nYear .. "/" .. nMonth .. "/" .. nDay .. "  ".. STR( "UNIT_AM") .. " 01:00";
	tvwRankingSeasonDesc:SetText(str);
	
end

-- RefreshControlGuild
function luaRanking:RefreshControlGuild()

	local nDate = 20130624;

	local nCount = gamefunc:GetArenaGuildHonorSeasonListCount();
	if ( nCount ~= 0)  then
		nDate = gamefunc:GetArenaGuildHonorSeasonDate(nCount - 1);
	end
	
	local nYear, nMonth, nDay = gamefunc:GetNextHonorSeasonDate(nDate, luaHonorRanking.nGuildSeasonDay/7);
	local str = STR( "RANKING_SEASON_GUILD_DESC") .. "  " .. nYear .. "/" .. nMonth .. "/" .. nDay .. "  ".. STR( "UNIT_AM") .. " 01:00";
	tvwRankingSeasonDesc:SetText(str);
end


-- RefreshFriendsMemberList
function luaRanking:RefreshRankingList()

	if ( frmSocial:GetShow() == false)  or  ( tbcSocialTabCtrl:GetSelIndex() ~= 2)  then  return;
	end

	lcMyRanking:DeleteAllItems();
	lcRankingList:DeleteAllItems();
	
	if(luaRanking:GetRankingType() == RANKING_TYPE.RT_PERSON) then
		luaRanking:RefreshRankingListPerson();
	elseif(luaRanking:GetRankingType() == RANKING_TYPE.RT_GUILD) then
		luaRanking:RefreshRankingListGuild();
	end

end

-- RefreshRankingListPerson
function luaRanking:RefreshRankingListPerson()

	local nCount = gamefunc:GetArenaRankerCount();
	if ( nCount == 0)  then	return;
	end

	-- �� ��ŷ ������ 0��° �ε����̴�
	local nIndex = lcMyRanking:AddItem( "", "");
	lcMyRanking:SetItemData( nIndex, 0);
	
	for i = 1, (nCount - 1)  do

		local nIndex = lcRankingList:AddItem( "", "");
		lcRankingList:SetItemData( nIndex, i);
	end	
end


-- RefreshRankingListGuild
function luaRanking:RefreshRankingListGuild()

	local nCount = gamefunc:GetArenaGuildRankerCount();
	if ( nCount == 0)  then	return;
	end
		
	-- �� ��� ��ŷ ������ 0��° �ε����̴�
	local nIndex = lcMyRanking:AddItem( "", "");
	lcMyRanking:SetItemData( nIndex, 0);
	
	for i = 1, (nCount - 1)  do

		local nIndex = lcRankingList:AddItem( "", "");
		lcRankingList:SetItemData( nIndex, i);
	end	

end

-- OnDrawMyRankerInfo
function luaRanking:OnDrawMyRankerInfo()

	local nSubItem = EventArgs:GetItemSubItem();
	if ( nSubItem ~= 0 ) then return;
	end

	local nSlotIndex = EventArgs:GetItemIndex();
	if ( nSlotIndex < 0)  then  return;
	end

	local nIndex = lcMyRanking:GetItemData(nSlotIndex);
	if ( nIndex < 0)  then  return;
	end

	local tRankerInfo = {};

	if(luaRanking:GetRankingType() == RANKING_TYPE.RT_PERSON) then
		tRankerInfo.strName			= gamefunc:GetArenaRankerName(nIndex);
		tRankerInfo.strGuildName	= gamefunc:GetArenaRankerGuileName(nIndex);
		tRankerInfo.nTitleStyle		= gamefunc:GetArenaRankerTitleStyle(nIndex);
		tRankerInfo.nScorePoint		= gamefunc:GetArenaRankerScorePoint(nIndex);
		tRankerInfo.nWins			= gamefunc:GetArenaRankerWins(nIndex);
		tRankerInfo.nLoses			= gamefunc:GetArenaRankerLoses(nIndex);
		tRankerInfo.nRanking		= gamefunc:GetArenaRankerRanking(nIndex);
		tRankerInfo.nDeltaRanking	= gamefunc:GetArenaRankerDeltaRanking(nIndex);
		
	
	elseif(luaRanking:GetRankingType() == RANKING_TYPE.RT_GUILD) then
		tRankerInfo.strName			= gamefunc:GetArenaGuildRankerName(nIndex);
		tRankerInfo.strGuildName	= gamefunc:GetArenaGuildRankerGuileName(nIndex);
		tRankerInfo.nTitleStyle		= gamefunc:GetArenaGuildRankerTitleStyle(nIndex);
		tRankerInfo.nScorePoint		= gamefunc:GetArenaGuildRankerScorePoint(nIndex);
		tRankerInfo.nWins			= gamefunc:GetArenaGuildRankerWins(nIndex);
		tRankerInfo.nLoses			= gamefunc:GetArenaGuildRankerLoses(nIndex);
		tRankerInfo.nRanking		= gamefunc:GetArenaGuildRankerRanking(nIndex);
		tRankerInfo.nDeltaRanking	= gamefunc:GetArenaGuildRankerDeltaRanking(nIndex);
	end
	
	tRankerInfo.nIndex				= nIndex;
	tRankerInfo.bShowDeltaRanking	= true;
	tRankerInfo.nRankingType		= luaRanking:GetRankingType();


	local x, y, w, h = EventArgs:GetItemRect();
	tRankerInfo.x = x;
	tRankerInfo.y = y;
	tRankerInfo.w = w;
	tRankerInfo.h = h;

	-- �� ĳ���� ��׶���
	gamedraw:SetBitmap("bmpArenaMyRank1");
	gamedraw:Draw( x+43, y, w+20-43, h);
	gamedraw:SetBitmap("bmpArenaMyRank");
	gamedraw:Draw( x+43, y, w+20-43, h);
	gamedraw:SetBitmap("bmpItemSlot");
	gamedraw:Draw( x, y, 40, 40);
	gamedraw:SetBitmap("bmpArenaMyRank");
	gamedraw:DrawEx( x, y, 40, 40, 250, 0, 40, 40);
	gamedraw:SetBitmap("bmpGlowButton");
	gamedraw:Draw( x, y, w+20, h);


	luaRanking:DrawRankerInfo(tRankerInfo);

end

-- OnDrawRankerInfo
function luaRanking:OnDrawRankerInfo()

	local nSubItem = EventArgs:GetItemSubItem();
	if ( nSubItem ~= 0 ) then return;
	end

	local nSlotIndex = EventArgs:GetItemIndex();
	if ( nSlotIndex < 0)  then  return;
	end

	local nIndex = lcRankingList:GetItemData(nSlotIndex);
	if ( nIndex < 0)  then  return;
	end

	local tRankerInfo = {};

	if(luaRanking:GetRankingType() == RANKING_TYPE.RT_PERSON) then
		tRankerInfo.strName			= gamefunc:GetArenaRankerName(nIndex);
		tRankerInfo.strGuildName	= gamefunc:GetArenaRankerGuileName(nIndex);
		tRankerInfo.nTitleStyle		= gamefunc:GetArenaRankerTitleStyle(nIndex);
		tRankerInfo.nScorePoint		= gamefunc:GetArenaRankerScorePoint(nIndex);
		tRankerInfo.nWins			= gamefunc:GetArenaRankerWins(nIndex);
		tRankerInfo.nLoses			= gamefunc:GetArenaRankerLoses(nIndex);
		tRankerInfo.nRanking		= gamefunc:GetArenaRankerRanking(nIndex);
		tRankerInfo.nDeltaRanking	= gamefunc:GetArenaRankerDeltaRanking(nIndex);

	elseif(luaRanking:GetRankingType() == RANKING_TYPE.RT_GUILD) then
		tRankerInfo.strName			= gamefunc:GetArenaGuildRankerName(nIndex);
		tRankerInfo.strGuildName	= gamefunc:GetArenaGuildRankerGuileName(nIndex);
		tRankerInfo.nTitleStyle		= gamefunc:GetArenaGuildRankerTitleStyle(nIndex);
		tRankerInfo.nScorePoint		= gamefunc:GetArenaGuildRankerScorePoint(nIndex);
		tRankerInfo.nWins			= gamefunc:GetArenaGuildRankerWins(nIndex);
		tRankerInfo.nLoses			= gamefunc:GetArenaGuildRankerLoses(nIndex);
		tRankerInfo.nRanking		= gamefunc:GetArenaGuildRankerRanking(nIndex);
		tRankerInfo.nDeltaRanking	= gamefunc:GetArenaGuildRankerDeltaRanking(nIndex);
	end

	tRankerInfo.nIndex				= nIndex;
	tRankerInfo.bShowDeltaRanking	= true;
	tRankerInfo.nRankingType		= luaRanking:GetRankingType();

	local x, y, w, h = EventArgs:GetItemRect();
	tRankerInfo.x = x;
	tRankerInfo.y = y;
	tRankerInfo.w = w;
	tRankerInfo.h = h;

	luaRanking:DrawRankerInfo(tRankerInfo);

end


-- DrawRankerInfo
function luaRanking:DrawRankerInfo(tRankerInfo)

	local nIndex			= tRankerInfo.nIndex;
	local strName			= tRankerInfo.strName;		
	local strGuildName		= tRankerInfo.strGuildName;
	local nTitleStyle		= tRankerInfo.nTitleStyle;
	local strTalentImage	= TITLE_STYLE_ICON[nTitleStyle];
	local nScorePoint		= tRankerInfo.nScorePoint;
	local nWins				= tRankerInfo.nWins;
	local nLoses			= tRankerInfo.nLoses;
	local nRanking			= tRankerInfo.nRanking;
	local nDeltaRanking		= tRankerInfo.nDeltaRanking;
	local nRankingType		= tRankerInfo.nRankingType;
	local bShowDeltaRanking = tRankerInfo.bShowDeltaRanking;

	if(strGuildName ~= "") then
		strName = strName .. " <" .. strGuildName .. ">";
	end

	if(nRankingType == RANKING_TYPE.RT_GUILD) then
		strName = strGuildName;
	end

	local x = tRankerInfo.x;
	local y = tRankerInfo.y;
	local w = tRankerInfo.w;
	local h = tRankerInfo.h;

	-- ����
	if(nRanking <= 0) then
		gamedraw:SetFont( "fntLargeStrong");
		gamedraw:SetColor( 200, 200, 200);
		gamedraw:SetTextAlign( "center", "center");
		gamedraw:TextEx( x, y, 40, 40, "-");

	elseif(nRanking >= 1 and nRanking <= 3) then
		local strRankingImage = "bmpArenaRanking" .. nRanking;
		gamedraw:SetBitmap( strRankingImage);
		gamedraw:Draw( x, y, 40, 40);

	else
		gamedraw:SetFont( "fntLargeStrong");
		gamedraw:SetColor( 200, 200, 200);
		gamedraw:SetTextAlign( "center", "center");
		gamedraw:TextEx( x, y, 40, 40, nRanking);
	end

	-- ��Ÿ�� ������ or ��� ��ũ
	if(nTitleStyle == 0) then
		strTalentImage = "iconDefQuestion";
	end

	if(nRankingType == RANKING_TYPE.RT_GUILD) then
		strTalentImage = "iconEmblem";
	end
	gamedraw:SetBitmap( strTalentImage);
	gamedraw:Draw( x + 45, y + 1, 38, 38);

	-- �̸�(�̸��� ���� �ٸ� UI�� ħ������ �ʵ��� ���ѳ��̸� �Ѿ ��� �ڿ� ������ ���ڿ��� �ڸ��� ...���� ǥ���Ѵ�)
	-- �� �Լ��� ���� ���� �ǿ����� ����ϰ� �ֱ� ������ �ε��� ���� �����ؼ� ó��(2:��ŷ, 3:��������)
	local nNameWidth = gamedraw:GetTextWidth("fntScript", strName);
	local nLimitWidth = 0;
	
	if(tbcSocialTabCtrl:GetSelIndex() == 2) then 
		nLimitWidth = 180;
	elseif(tbcSocialTabCtrl:GetSelIndex() == 3) then 
		nLimitWidth = 240;
	end
	
	if(nNameWidth > nLimitWidth) then
		strName = gamedraw:SubTextWidth( "fntScript", strName, nLimitWidth);
	end
	
	gamedraw:SetFont( "fntScript");
	gamedraw:SetColor( 200, 200, 200);
	gamedraw:SetTextAlign( "left", "center");
	gamedraw:TextEx( x + 90, y, 400, 20, strName);

	-- ����
	local nRecordCount = nWins + nLoses;
	local strWinningRate;
	if(nRecordCount == 0 and nWins == 0) then
		strWinningRate = STR( "RANKING_WINNING_RATE" ) .. " 0%";
	else
		strWinningRate = STR( "RANKING_WINNING_RATE" ) .. " " .. math.floor(nWins / (nRecordCount) * 100 + 0.5) .. "%";
	end
	local strRecord = nRecordCount .. STR( "RANKING_RECORD" ) .. " " ..
					  nWins .. STR( "ARENA_WIN" ) .. " " ..
					  strWinningRate;

	gamedraw:SetFont( "fntScript");
	gamedraw:SetColor( 100, 220, 100);
	gamedraw:SetTextAlign( "left", "center");
	gamedraw:TextEx( x + 90, y + 20, 400, 20, strRecord);

	-- ��������
	if(bShowDeltaRanking == true) then
		gamedraw:SetFont( "fntScript");
		gamedraw:SetTextAlign( "left", "center");

		if(true == gamefunc:IsLocale_ja_JP() ) then
			if(nDeltaRanking > 0) then
				gamedraw:SetBitmap( "bmpArenaRankUpJapan");
				gamedraw:Draw( x + 274, y + 2, 16, 16);
				gamedraw:SetColor( 150, 150, 220);
				gamedraw:TextEx( x + 290, y, 70, 20, nDeltaRanking);

			elseif(nDeltaRanking < 0) then
				gamedraw:SetBitmap( "bmpArenaRankDownJapan");
				gamedraw:Draw( x + 274, y + 2, 16, 16);
				gamedraw:SetColor( 220, 50, 50);
				gamedraw:TextEx( x + 290, y, 70, 20, -nDeltaRanking);

			else
				gamedraw:SetColor( 200, 200, 200);
				gamedraw:TextEx( x + 290, y, 70, 20, "=");
			end
		else
			if(nDeltaRanking > 0) then
				gamedraw:SetBitmap( "bmpArenaRankUp");
				gamedraw:Draw( x + 274, y + 2, 16, 16);
				gamedraw:SetColor( 220, 50, 50);
				gamedraw:TextEx( x + 290, y, 70, 20, nDeltaRanking);

			elseif(nDeltaRanking < 0) then
				gamedraw:SetBitmap( "bmpArenaRankDown");
				gamedraw:Draw( x + 274, y + 2, 16, 16);
				gamedraw:SetColor( 150, 150, 220);
				gamedraw:TextEx( x + 290, y, 70, 20, -nDeltaRanking);

			else
				gamedraw:SetColor( 200, 200, 200);
				gamedraw:TextEx( x + 290, y, 70, 20, "=");
			end
		end
		
	end

	-- ������
	gamedraw:SetFont( "fntHeadline");
	gamedraw:SetColor( 220, 140, 55);
	gamedraw:SetTextAlign( "center", "center");
	gamedraw:TextEx( x + 340, y + 0, 60, 40, nScorePoint);

	-- Ʈ����
	local strTrophyImage;
	if(nScorePoint >= 1600) then
		strTrophyImage = "bmpArenaTrophyGold";
	elseif(nScorePoint >= 1300) then
		strTrophyImage = "bmpArenaTrophySilver";
	else
		strTrophyImage = "bmpArenaTrophyBronze";
	end
	gamedraw:SetBitmap( strTrophyImage);
	gamedraw:Draw( x + 405, y, 40, 40);

end