--[[
	Game PartyMatching LUA script
--]]


-- Global instance
luaPartyMatching = {};
luaPartyMatching.MATCHINGLIST_COLUME		= { TITLE = 0,  LEARDER = 1, MEMBER = 2 };
luaPartyMatching.MEBERLIST_COLUME			= { NAME = 0,  LEVEL = 1, POS = 2 };
luaPartyMatching.nMatchingStringMaxLen		= 100;
luaPartyMatching.PartyMemberMax				= 5;
luaPartyMatching.nMatchingListCurrSel		= -1;
luaPartyMatching.MatchingInfoIndex			= -1;
luaPartyMatching.RecivePartyJoinName		= "";
luaPartyMatching.PartyMatchingListCurrPage	= 1;
luaPartyMatching.PartyMatchingListMaxPage	= 1;
luaPartyMatching.bRequestjoin				= false;
luaPartyMatching.nRequestjoinTime			= 0;

luaPartyMatching.RequestjoinStartTime		= {};

-- �ڵ� ���� �ð�
luaPartyMatching.nRequestjoinTimeLimit		= 30;


-- Default Position
luaPartyMatching.nDefaultX	= 50;
luaPartyMatching.nDefaultY	= 60;



-- OnLoadedPartyMatching
function luaPartyMatching:OnLoadedPartyMatching()
	
	frmPartyMatching:SetText( STR( "PARTY_MATCHING" ) );
    luaGame:RegisterWindow( frmPartyMatching, btnHoldPartyMatching );
        
end

-- OnShowPartyMatching
function luaPartyMatching:OnShowPartyMatching()
	
	-- Show
	if ( true == frmPartyMatching:GetShow() )		then
		
		luaPartyMatching.PartyMatchingListCurrPage	= 1;
		luaPartyMatching.PartyMatchingListMaxPage	= 100;
		edtPartyMatchingSearchString:SetText( "" );

		luaPartyMatching:OnShowPartyMatchingList();
		
	-- Hide
	else
		frmPartyMatchInfo:Show( false );
		--frmPartyMatchRegist:Show( false );
			
	end
	
	luaGame:ShowWindow( frmPartyMatching );
	
end

-- OnShowPartyMatchingList
function luaPartyMatching:OnShowPartyMatchingList()
	
	-- ������ ����Ʈ ��û
	
	-- ���� ������
	local nPage		= luaPartyMatching.PartyMatchingListCurrPage - 1;		-- �ε��� �ε�?
	local nMinLv	= 0;
	local nMaxLv	= 0;
	local strTitle	= edtPartyMatchingSearchString:GetText();
	
	gamefunc:ShowPartyMatchingList( nPage, nMinLv, nMaxLv, strTitle );
	
end

-- RefreshPartyMatchingList
function luaPartyMatching:RefreshPartyMatchingList( nMaxPage )
	
	lcPartyMatchingList:DeleteAllItems();
	luaPartyMatching.nMatchingListCurrSel	= -1;
	
	luaPartyMatching.PartyMatchingListMaxPage	= nMaxPage;		
	local nCount		= gamefunc:GetPartyMatchingListCount();
	
	for  i = 0, 12  do
		
		local strTitle		= gamedraw:SubTextWidth( "fntScript", gamefunc:GetPartyMatchingItemTitle( i ), 220 );
		local strLeader		= gamedraw:SubTextWidth( "fntScript", gamefunc:GetPartyMatchingItemLeaderName( i ), 120 );
		local nMemberCount	= gamefunc:GetPartyMatchingItemMemberCount( i );
		
		local nIndex		= lcPartyMatchingList:AddItem( strTitle, "" );
		if( i < nCount )		then
			lcPartyMatchingList:SetItemText( nIndex, 1, strLeader );
			lcPartyMatchingList:SetItemText( nIndex, 2, nMemberCount .. "/" .. luaPartyMatching.PartyMemberMax );
			
			if( true == gamefunc:IsMyPartyMatching( i ) )	then
				lcPartyMatchingList:SetItemColor( nIndex, 0, 111, 220, 89 );
				lcPartyMatchingList:SetItemColor( nIndex, 1, 111, 220, 89 );
				lcPartyMatchingList:SetItemColor( nIndex, 2, 111, 220, 89 );
			end
			
		end
	end
	
	-- ������ ǥ��
	tvwPartyMatchingPage:SetText( "{FONT name=\"fntBold\"}{COLUMN h=22}{ALIGN hor=\"center\" ver=\"center\"}" .. luaPartyMatching.PartyMatchingListCurrPage .." / " .. luaPartyMatching.PartyMatchingListMaxPage );
	
end

-- OnClickPartyMatchingFirstPage
function luaPartyMatching:OnClickPartyMatchingFirstPage()
	
	luaPartyMatching.PartyMatchingListCurrPage		= 1;
	luaPartyMatching:OnShowPartyMatchingList();
	
end

-- OnClickPartyMatchingPrevPage
function luaPartyMatching:OnClickPartyMatchingPrevPage()
	
	luaPartyMatching.PartyMatchingListCurrPage		= luaPartyMatching.PartyMatchingListCurrPage - 1;
	if( 1 > luaPartyMatching.PartyMatchingListCurrPage )	then
		luaPartyMatching.PartyMatchingListCurrPage	= 1;
	end
	
	luaPartyMatching:OnShowPartyMatchingList();
	
end

-- OnClickPartyMatchingNextPage
function luaPartyMatching:OnClickPartyMatchingNextPage()
	
	luaPartyMatching.PartyMatchingListCurrPage		= luaPartyMatching.PartyMatchingListCurrPage + 1;
	
	if( luaPartyMatching.PartyMatchingListMaxPage < luaPartyMatching.PartyMatchingListCurrPage )	then
		luaPartyMatching.PartyMatchingListCurrPage	= luaPartyMatching.PartyMatchingListMaxPage;
	end
	
	luaPartyMatching:OnShowPartyMatchingList();
	
end

-- RefreshPartyInfo
function luaPartyMatching:RefreshPartyInfo()
	
	frmPartyMatchInfo:Show( true );
	
	-- ��Ƽ �̸� ����
	local strPartyName		= gamefunc:GetPartyMatchingInfoName();
	twvPartyMatchTitle:SetText( strPartyName );
	
	lcPartyMemberList:DeleteAllItems();
	
	local nMemberCount		= gamefunc:GetPartyMatchingInfoMemberCount();
	
	-- Member list
	for i = 0,	nMemberCount-1	do
		local strName			= gamefunc:GetPartyMatchingInfoMemberName( i );
		local nLv				= gamefunc:GetPartyMatchingInfoMemberLv( i );
		local bOffline			= gamefunc:IsPartyMatchingInfoMemberOffline( i );
		local bLeader			= gamefunc:IsPartyMatchingInfoMemberLeader( i );
		local bDead				= gamefunc:IsPartyMatchingInfoMemberDead( i );
		local nStyle			= gamefunc:GetPartyMatchingInfoMemberTitleStyle( i );
		local strTalentImage	= TITLE_STYLE_ICON[ nStyle ];
		
		local strGrade = STR( "PARTYMEMBER" );
		if( true == bLeader )  then
			strGrade = STR( "PARTYLEADER" );
		end
		
		local strState = STR( "UI_ONLINE" );
		if( true == bOffline )		then
			strState = STR( "UI_OFFLINE" );
		elseif ( true == bDead )		then
			strState = STR( "UI_DIE" );
		end
		
		strName = strName .. " (" .. nLv .. ")";
		
		local nIndex = lcPartyMemberList:AddItem( strName, strTalentImage );
		lcPartyMemberList:SetItemText( nIndex, 1, strGrade );
		lcPartyMemberList:SetItemText( nIndex, 2, strState );
		
		if( true == bLeader )  then
			lcPartyMemberList:SetCurSel( nIndex );
		end
		
	end
	
end

-- OnSelChangelcPartyMatchingList
function luaPartyMatching:OnSelChangelcPartyMatchingList()
	
	local nSel		= lcPartyMatchingList:GetCurSel();
	if( 0 > nSel )	then
		return ;
	end
	
	local strTitle	= lcPartyMatchingList:GetItemText( nSel );
	
	if( ( nil == strTitle )	or ( "" == strTitle ) )	then
		luaPartyMatching.nMatchingListCurrSel	= -1;
		lcPartyMatchingList:SetCurSel( luaPartyMatching.nMatchingListCurrSel );
		return ;
	end
	
	luaPartyMatching.nMatchingListCurrSel	= nSel;
end

-- OnUserArgumentPartyMatching
function luaPartyMatching:OnUserArgumentPartyMatching()

	local arg = EventArgs:GetUserArgument();
    if ( arg == "RESTORE_UI")  then

        luaGame:RestoreUIPosition( frmPartyMatching );
        if ( gamefunc:GetAccountParam( "frmPartyMatching", "hold" ) ~= nil )  then  btnHoldPartyMatching:SetCheck( true );
        end
	
	elseif ( arg == "RECORD_UI")  then

        luaGame:RecordUIPosition( frmPartyMatching );
        if ( btnHoldPartyMatching:GetCheck() == true)  then  gamefunc:SetAccountParam( "frmPartyMatching", "hold", "1");
        end
        
	elseif ( arg == "RESET_UI")  then
	
		luaPartyMatching:ResetUI();

    end
        
end

-- OnLoadedlcPartyMatchingList
function luaPartyMatching:OnLoadedlcPartyMatchingList()
	
	lcPartyMatchingList:SetColumnText( luaPartyMatching.MATCHINGLIST_COLUME.TITLE, STR( "PARTY_MATCHINGLIST_TITLE" ) );
	lcPartyMatchingList:SetColumnText( luaPartyMatching.MATCHINGLIST_COLUME.LEARDER, STR( "PARTY_MATCHINGLIST_LEADER" ) );
	lcPartyMatchingList:SetColumnText( luaPartyMatching.MATCHINGLIST_COLUME.MEMBER, STR( "PARTY_MATCHINGLIST_MEMBER" ) );
	
end

-- OnValueChangedConfirmNumberEdit
function luaPartyMatching:OnValueChangedConfirmNumberEdit( Edit, Limit )
	
	if( nil == Edit )		then
		return;
	end
	
	local strMax	= "";
	for i=1, Limit-1	do
		strMax		= strMax .. "9";
	end
	
	local strText		= Edit:GetText();
	if ( nil == strText ) or ( "" == strText )					then
		Edit:SetText( "" );
	elseif( 0 == tonumber( Edit:GetText() ) )					then
		Edit:SetText( "" );
	elseif( tonumber( strMax ) < tonumber( Edit:GetText() ) )	then
		Edit:SetText( strMax );
	end
	
end

-- CheckSearchString
function luaPartyMatching:CheckSearchString()
	
	local strString = edtPartyMatchingSearchString:GetText();
	
	if( true == edtPartyMatchingSearchString:IsFocus() )	 then
		
		twvPartyMatchingSearchStringDefault:Show( false );
		
	else
		
		if( "" == strString )		then
		
			twvPartyMatchingSearchStringDefault:Show( true );
			
		else
		
			twvPartyMatchingSearchStringDefault:Show( false );
			
		end
		
	end
	
end

-- OnClickRegistMatch
function luaPartyMatching:OnClickRegistMatch()

	--[[
	local width, height = gamefunc:GetWindowSize();
	local w, h			= frmPartyMatchRegist:GetSize();
    frmPartyMatchRegist:SetPosition( (width - w) * 0.5 , (height - h) * 0.5 );
	frmPartyMatchRegist:DoModal();
	]]--
		
end

-- OnLoadedPartyMatchRegist
function luaPartyMatching:OnLoadedPartyMatchRegist()
	
	--[[
	frmPartyMatchRegist:SetText( STR( "PARTY_MATCHING_PARTYREGISTMATCH" ) );
	luaPartyMatching:RefreshPartyMatchingString();
	]]--
	
end

-- RefreshPartyMatchingString
function luaPartyMatching:RefreshPartyMatchingString()
	
	luaPartyMatching:CheckMatchingString();
	luaPartyMatching:UpdateStringLen();
	
end

-- CheckMatchingString
function luaPartyMatching:CheckMatchingString()
	
	local strString = edtPartyMatchingString:GetText();
	
	if( true == edtPartyMatchingString:IsFocus() )	 then
		
		twvPartyMatchingStringDefault:Show( false );
		
	else
		
		if( "" == strString )		then
		
			twvPartyMatchingStringDefault:Show( true );
			
		else
		
			twvPartyMatchingStringDefault:Show( false );
			
		end
		
	end
	
end

-- UpdateStringLen
function luaPartyMatching:UpdateStringLen()
	
	local nLen = edtPartyMatchingString:GetLength();
	
	
	if( luaPartyMatching.nMatchingStringMaxLen < nLen )		then
		
		labPartyMatchingStringChar:SetColor( 180, 30, 30 );
		btnDoRegistMatch:Enable( false );
		
	else
	
		labPartyMatchingStringChar:SetColor( 160, 160, 160 );
		btnDoRegistMatch:Enable( true );
		
	end
	
	labPartyMatchingStringChar:SetText( nLen .. " / " .. luaPartyMatching.nMatchingStringMaxLen .. STR( "UI_MAILBOX_CHARACTER" ) );
		
end

-- OnLoadedPartyMatchInfo
function luaPartyMatching:OnLoadedPartyMatchInfo()
	
	frmPartyMatchInfo:SetText( STR( "PARTY_MATCHING_PARTYMATCHINFO" ) );
	
	--edtPartyMatchInfo:SetText( "testsetset" );
	--edtPartyMatchInfo:SetEditable( false );
	--labPartyMatchInfoChar:Show( false );
	
	--luaPartyMatching:RefreshPartyMatchInfo();
	
end

-- RefreshPartyMatchInfo
--[[
function luaPartyMatching:RefreshPartyMatchInfo()
	
	luaPartyMatching:CheckMatchInfo();
	luaPartyMatching:UpdateInfoLen();
	
end
]]--

-- CheckMatchInfo
--[[
function luaPartyMatching:CheckMatchInfo()
	
	local strString = edtPartyMatchInfo:GetText();
	
	if( true == edtPartyMatchInfo:IsFocus() )	 then
		
		twvPartyMatchInfoDefault:Show( false );
		
	else
		
		if( "" == strString )		then
		
			twvPartyMatchInfoDefault:Show( true );
			
		else
		
			twvPartyMatchInfoDefault:Show( false );
			
		end
		
	end
	
end
]]--

-- UpdateInfoLen
function luaPartyMatching:UpdateInfoLen()
	
	local nLen = edtPartyMatchInfo:GetLength();
	
	
	if( luaPartyMatching.nMatchingStringMaxLen < nLen )		then
		
		labPartyMatchInfoChar:SetColor( 180, 30, 30 );
		
	else
	
		labPartyMatchInfoChar:SetColor( 160, 160, 160 );
		
	end
	
	labPartyMatchInfoChar:SetText( nLen .. " / " .. luaPartyMatching.nMatchingStringMaxLen .. STR( "UI_MAILBOX_CHARACTER" ) );
		
end

-- OpenPartyMatchInfo
function luaPartyMatching:OpenPartyMatchInfo()
	
	local nSel		= lcPartyMatchingList:GetCurSel();
	if( 0 > nSel )	then
		return ;
	end
	
	local strTitle	= lcPartyMatchingList:GetItemText( nSel );
	--if( 0 > luaPartyMatching.nMatchingListCurrSel )		then
	if( "" == strTitle )		then
		frmPartyMatchInfo:Show( false );	
		return ;
	end
	
	luaPartyMatching:OnShowPartyInfo();		
	--frmPartyMatchInfo:Show( true );
	
	if( true == luaPartyMatching.bRequestjoin )	then
	--gamedebug:Log( "�׽�Ʈ" );
		btnPartyMatchingJoin:Enable( false );
		return ;
	end
	
	btnPartyMatchingJoin:Enable( true );
	-- ���� ���� ��Ƽ���̶�� ��û�� ��Ȱ��ȭ ��Ų��
	if( true == gamefunc:IsPartyJoined() )	then
		btnPartyMatchingJoin:Enable( false );
	end
	
end

-- OnShowPartyInfo
function luaPartyMatching:OnShowPartyInfo()

	gamefunc:ShowPartyInfo( luaPartyMatching.nMatchingListCurrSel );
	
	-- ��û�Ҷ� �⺻ ������ ���� �� �����Ƿ� â�� �ʱ�ȭ ������
	luaPartyMatching:ClearPartyInfo();
	
	luaPartyMatching.MatchingInfoIndex		= luaPartyMatching.nMatchingListCurrSel;
	
end

-- OnShowPartyInfo
function luaPartyMatching:ClearPartyInfo()
	
	twvPartyMatchTitle:SetText( "" );
	lcPartyMemberList:DeleteAllItems();
	
end

-- OnLoadedPartyMemberList
function luaPartyMatching:OnLoadedPartyMemberList()
	
	lcPartyMemberList:SetColumnText( luaPartyMatching.MEBERLIST_COLUME.NAME, STR( "PARTY_MATCHING_PARTYMEMBERINFO_NAME" ) );
	lcPartyMemberList:SetColumnText( luaPartyMatching.MEBERLIST_COLUME.LEVEL, STR( "PARTY_MATCHING_PARTYMEMBERINFO_LEVEL" ) );
	lcPartyMemberList:SetColumnText( luaPartyMatching.MEBERLIST_COLUME.POS, STR( "PARTY_MATCHING_PARTYMEMBERINFO_POS" ) );
	
	for  i = 1, 5  do
		lcPartyMemberList:AddItem( "test" .. i, "" );
	end
	
end

-- �˸� �˾���
-- RequestPartyMatching
function luaPartyMatching:PopupRequestPartyMatching()
	
	-- ��Ƽ ��û �˸�
	local strImgString = luaGame:GetMessageImgString("iconSocial", STR( "PARTY_MATCHING_POPMGS_REQUESTPARTYMATCHING" ) );
	luaMessageBox:MessageBoxEx( strImgString, 15000, "RequestPartyMatching" );
		
end

-- RecivePartyMatching
function luaPartyMatching:PopupRecivePartyMatching( strName )
	
	-- ��Ƽ ��û ����
	local strKey = gamefunc:GetDisplayKeyString( "NPCINTERACTION" );
	local strImgString = luaGame:GetMessageImgString("iconSocial", STR( "PARTY_MATCHING_POPMGS_RECIVEPARTYMATCHING" ) );
	-- MessageBox type�� ��û�� �̸����� ��û �ߺ�( ������ �ٸ� ) ����� ����
	luaMessageBox:MessageBoxEx( strImgString, luaPartyMatching.nRequestjoinTimeLimit*1000, strName, nil, strKey, luaPartyMatching.RecivePartyMatching, strName, nil, luaPartyMatching.DelPartyMatching );
	
	luaPartyMatching.RequestjoinStartTime[ strName ]	= gamefunc:GetUpdateTime();
		
end

-- DelJoinQuestion
function luaPartyMatching:DelJoinQuestion( strName )
	
	if( ( nil == strName ) or ( "" == strName ) )		then
		return ;
	end
	
end

-- RefusePartyMatching
function luaPartyMatching:RefusePartyMatching( msg )
	
	-- ��Ƽ ��û ����
	local strImgString;
	if( ( nil == msg ) or ( "" == msg ) )	then
		strImgString = luaGame:GetMessageImgString( "iconSocial", STR( "PARTY_MATCHING_POPMGS_REFUSEPARTYMATCHING" ) );
	else
		strImgString = luaGame:GetMessageImgString( "iconSocial", msg );
	end
	
	luaMessageBox:MessageBoxEx( strImgString, 10000, "RefusePartyMatching" );
	
	-- ��û�� �ѱ����� �Ҽ� �ִ�
	luaPartyMatching.bRequestjoin	= false;
	btnPartyMatchingJoin:Enable( true );
	btnPartyMatchingJoin:SetToolTip( "" );
		
end

-- SinglePartyRes
function luaPartyMatching:SinglePartyRes( msg )
	
	luaParty.bPublicParty	= false;
	
	if( false == gamefunc:IsPartyJoined() )	then
		frmPartySetting:Show( false );
	end
	
	if( ( nil == msg ) or ( "" == msg ) )	then
		return ;
	end
	
	local strImgString	= luaGame:GetMessageImgString( "iconSocial", msg );
	luaMessageBox:MessageBoxEx( strImgString, 10000, "SinglePartyRes" );
	
end

-- PopPublicParty
function luaPartyMatching:PopPublicParty()
	
	-- ��Ƽ ���� ����
	local strImgString = luaGame:GetMessageImgString("iconSocial", STR( "PARTY_MATCHING_POPMGS_PUBLICPARTY" ) );
	luaMessageBox:MessageBoxEx( strImgString, 10000, "RegistPartyMatching" );
	
	luaGame:OnEventChattingMsg( STR( "PARTY_MATCHING_POPMGS_PUBLICPARTY" ), CHATFILTER_TYPE.SYSTEM );
		
end

-- PopPrivateParty
function luaPartyMatching:PopPrivateParty()
	
	-- ��Ƽ ����� ����
	local strImgString = luaGame:GetMessageImgString("iconSocial", STR( "PARTY_MATCHING_POPMGS_PRIVATEEPARTY" ) );
	luaMessageBox:MessageBoxEx( strImgString, 10000, "RegistPartyMatching" );
	
	luaGame:OnEventChattingMsg( STR( "PARTY_MATCHING_POPMGS_PRIVATEEPARTY" ), CHATFILTER_TYPE.SYSTEM );
		
end

-- RecivePartyMatching
function luaPartyMatching:RecivePartyMatching( strName )

	luaPartyMatching.RecivePartyJoinName	= "";
	
	local width, height = gamefunc:GetWindowSize();
	local w, h			= frmRecivePartyMatch:GetSize();
    frmRecivePartyMatch:SetPosition( (width - w) * 0.5 , (height - h) * 0.5 );
	frmRecivePartyMatch:Show( true );
	
	luaPartyMatching.RecivePartyJoinName	= strName;
	luaPartyMatching:RefreshRecivePartyMatch();
	
	gamefunc:ShowCursor( true );
	
end

-- OnUpdatefrmRecivePartyMatch
function luaPartyMatching:OnUpdatefrmRecivePartyMatch()
	
	local nCurrTime	= ( gamefunc:GetUpdateTime() - luaPartyMatching.RequestjoinStartTime[ luaPartyMatching.RecivePartyJoinName ] ) / 1000;
	
	if( luaPartyMatching.nRequestjoinTimeLimit < nCurrTime )	then
		luaPartyMatching:JoinQuestionRespond( false );		
	end
	
end

-- DelPartyMatching
function luaPartyMatching:DelPartyMatching( strName )
	
	-- ���� ó��
	gamefunc:JoinQuestionRespond( strName, false );
	
end

-- RecivePartyMatching
function luaPartyMatching:RefreshRecivePartyMatch()
	
	-- �̸� labRecivePartyMatchInfoName
	if( "" == luaPartyMatching.RecivePartyJoinName )	then
		-- �̸��� ���µ�? �׳� â �ݱ�
		frmRecivePartyMatch:Show( false );		
	end
	labRecivePartyMatchInfoName:SetText( STR( "PARTY_MATCHING_PARTYMEMBERINFO_NAME" ) .. " : " .. luaPartyMatching.RecivePartyJoinName );
	
	-- ���� labRecivePartyMatchInfoLevel
	labRecivePartyMatchInfoLevel:SetText( STR( "PARTY_MATCHING_PARTYMEMBERINFO_LEVEL" ) .. " : " .. gamefunc:GetPartyJoinQuestionLv( luaPartyMatching.RecivePartyJoinName ) );
	
	-- ��ġ labRecivePartyMatchInfoPos
	labRecivePartyMatchInfoPos:SetText( STR( "PARTY_MATCHING_PARTYMEMBERINFO_POS" ) .. " : " .. gamefunc:GetPartyJoinQuestionPos( luaPartyMatching.RecivePartyJoinName ) );
	
	local nStyle		= gamefunc:GetPartyJoinQuestionStyle( luaPartyMatching.RecivePartyJoinName );
	-- ������ picRecivePartyMatchInfoStyle
	picRecivePartyMatchInfoStyle:SetImage( TITLE_STYLE_ICON[ nStyle ] );
	-- ��ǥ��Ÿ�� labRecivePartyMatchInfoStyle
	labRecivePartyMatchInfoStyle:SetText( STR( "PARTY_MATCHING_PARTYMEMBERINFO_STYLE" ) .. " : " .. TITLE_STYLE_STRING[ nStyle ] );
	
end

-- ResetUI
function luaPartyMatching:ResetUI()

	frmPartyMatching:SetPosition( luaPartyMatching.nDefaultX, luaPartyMatching.nDefaultY );
	btnHoldPartyMatching:SetCheck( false );
	
end

-- OnClickhisperPartyMatchingInfo
function luaPartyMatching:OnClickhisperPartyMatchingInfo()
		
	local nCurSel = lcPartyMemberList:GetCurSel();
	if( 0 > nCurSel )	then
		return ;
	end

	local strName			= gamefunc:GetPartyMatchingInfoMemberName( nCurSel );
	if( ( nil == strName ) or ( "" == strName ) )	then
		return ;
	end

	local strChatMsg = "";
	strChatMsg = "/w " .. strName;
	
	--luaChattingBox:SetEditText( strChatMsg );
	
	gamefunc:SetLastSendWhisper( strName );
	cmwChattingBox:SetPrefix( 8, STR( "UI_CHATTING_WHISPER" ), "  [" .. gamefunc:GetLastSendWhisper() .. "]" );
	
	luaChattingBox:ActivateChatInput( true );	
		
end

-- OnClickhisperPartyMatchingInfo
function luaPartyMatching:OnClickPartyMatchingJoin()
	
	gamefunc:XPostPartyMatchingJoin( luaPartyMatching.MatchingInfoIndex );
	
	-- �޼��� ó��
	luaPartyMatching:PopupRequestPartyMatching();
	
	-- ��û�� �ѱ����� �Ҽ� �ִ�
	luaPartyMatching.bRequestjoin		= true;
	luaPartyMatching.nRequestjoinTime	= gamefunc:GetUpdateTime();
	btnPartyMatchingJoin:Enable( false );
	btnPartyMatchingJoin:SetToolTip( STR( "PARTY_MATCHING_REQUESTJOIN_TOOLTIP" ) );
	
end

-- JoinQuestion
function luaPartyMatching:JoinQuestion( strName )
	
	-- �˾��� ������ ��� �ڵ� ���� ó��
	if( false == luaMessageBox:IsEmptyMassegeBox() )	then
		return false;
	end
	luaPartyMatching:PopupRecivePartyMatching( strName );
	return true;	
end

-- JoinQuestionRespond
function luaPartyMatching:JoinQuestionRespond( bRespond )
	
	if( "" ~= luaPartyMatching.RecivePartyJoinName )	then
		-- ��û
		gamefunc:JoinQuestionRespond( luaPartyMatching.RecivePartyJoinName, bRespond );
		
	end

	frmRecivePartyMatch:Show( false );
		
end

-- OnClickPartyListRefresh
function luaPartyMatching:OnClickPartyListRefresh()
	
	-- ��Ƽ ���� â�� �ݾ���
	if( true == frmPartyMatchInfo:GetShow() )	then
		frmPartyMatchInfo:Show( false );
	end
	
	luaPartyMatching.PartyMatchingListCurrPage	= 1;
	luaPartyMatching:OnShowPartyMatchingList();
	
end

-- OnClickPartyListSearchReset
function luaPartyMatching:OnClickPartyListSearchReset()

	edtPartyMatchingSearchString:SetText( "" );
	luaPartyMatching:OnClickPartyListRefresh();
	
end

-- EnteredParty
function luaPartyMatching:EnteredParty()
	-- ��Ƽ ���� ó��( ��û�� ���� ó���� ���� )
	luaPartyMatching.bRequestjoin				= false;
	luaPartyMatching.nRequestjoinTime			= 0;
	
	luaPartyMatching:OnClickPartyListRefresh();
end

-- PartySearch
function luaPartyMatching:PartySearch()
	
	luaPartyMatching.PartyMatchingListCurrPage	= 1;
    luaPartyMatching:OnShowPartyMatchingList();
            
end

-- OnUpdateMatchingInfo
function luaPartyMatching:OnUpdateMatchingInfo()

	if( false == luaPartyMatching.bRequestjoin )	then
		return ;
	end
	
	local nCurrTime	= ( gamefunc:GetUpdateTime() - luaPartyMatching.nRequestjoinTime ) / 1000;
	
	-- ��û�ѳ��� ������ �ð����� +5�� �� ��޸���
	if( ( luaPartyMatching.nRequestjoinTimeLimit + 5 ) < nCurrTime )	then
		-- ����
		luaPartyMatching.bRequestjoin				= false;
		luaPartyMatching.nRequestjoinTime			= 0;
		-- ���� �˾�
		luaPartyMatching:RefusePartyMatching();
		-- refresh
		luaPartyMatching:OpenPartyMatchInfo();
		
	end
	
end

-- PartyLeave
function luaPartyMatching:PartyLeave()

	luaPartyMatching:OnClickPartyListRefresh();
	
end