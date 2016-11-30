
-- Global instance
luaCredit = {};


luaCredit.m_fScrollSpeed		= 42; 					-- text ��ũ�� �ӵ�( ���ڰ� Ŭ ���� ���� �ö� �� ���� : �ػ󵵿� ���� ��ũ�ѵǴ� �ð��� �޸���.)
luaCredit.m_fImageChangeTime	= 8.5;					-- �̹��� ��ü �ð�( �� )
luaCredit.m_nImageCount			= 15;					-- �̹��� ����
luaCredit.m_fImageFadeTime		= 0.8;					-- �̹��� fade in/out �ð�( �� )
luaCredit.m_strBGM				= "bgm_credit";			-- ����� sound.xml
luaCredit.m_strFinishedImage	= "creditend";			-- ����� �̹��� �̸�( Ȯ���� ���� )
luaCredit.m_nImageX				= 20;					-- �̹��� x��ǥ

luaCredit.IMAGE_STATE			= { IMAGE_NONE = 0, IMAGE_OUT = 1, IMAGE_IN = 2 };

luaCredit.m_fScrollTimer		= 0;
luaCredit.m_fScrollValue		= 0;
luaCredit.m_nImageIndex			= 0;
luaCredit.m_fImageTimer			= 0;
luaCredit.m_bImageFadeTime		= 0;
luaCredit.m_ImageState			= luaCredit.IMAGE_STATE.IMAGE_NONE;
luaCredit.m_strBGMBackup		= "";
luaCredit.m_bFinalState			= false;
luaCredit.m_bFinished			= false;
luaCredit.m_fImageInjuryTime	= 0;


-- LeaveToCharSelect
function luaCredit:LeaveToCharSelect()
	luaCharacterFrame:SwitchScene( luaCharacter.SwitchToCharSelect);
end

-- ReadyCredit
function luaCredit:ReadyCredit()
	
	luaCredit.m_strBGMBackup	= "";
	luaCredit.m_strBGMBackup	= gamefunc:GetPlayBGM();
	gamefunc:PlayBGM( "" );
	
	--gamedebug:Log( "ReadyCredit() " .. luaCredit.m_strBGMBackup );

end

-- EnterCredit
function luaCredit:EnterCredit()
	
	layerCharCredit:Enable( true );
	layerCharCredit:Show( true );
	pnlCharCredit:Show( true );
	
	luaCredit.m_fScrollTimer		= 0;
	luaCredit.m_fScrollValue		= 0;
	luaCredit.m_nImageIndex			= 0;
	luaCredit.m_fImageTimer			= 0;
	luaCredit.m_fImageInjuryTime	= 0;
	luaCredit.m_ImageState			= luaCredit.IMAGE_STATE.IMAGE_NONE;
	luaCredit.m_bFinalState			= false;
	luaCredit.m_bFinished			= false;
	
	luaCredit:RefreshImageControl();
	luaCredit:SetImage();
	
	-- BGM
	if( "" ~= luaCredit.m_strBGM )		then
		-- play
		gamefunc:PlayBGM( luaCredit.m_strBGM );
	end
	
end

-- LeaveCredit
function luaCredit:LeaveCredit()
	
	--gamedebug:Log( "LeaveCredit" .. luaCredit.m_strBGMBackup );
	
	if( "" ~= luaCredit.m_strBGMBackup )	then
		gamefunc:PlayBGM( luaCredit.m_strBGMBackup );
		luaCredit.m_strBGMBackup		= "";
	end
	
end

-- RefreshImageControl
function luaCredit:RefreshImageControl()
	
	local nWidth, nHeight	= gamefunc:GetWindowSize();
	local nW, nH	= pnlImage:GetSize();
	
	-- �̹��� ũ�� ����( 960:770 ) ���� ����
	nH		= nHeight - 100;	-- ��/�Ʒ� 50�� Ȯ��
	nW		= ( 960 * nH ) / 770;
	pnlImage:SetSize( nW, nH );
	picCreditImage:SetSize( nW, nH );
	
	-- â ũ�⿡ ���� ������ �߾ӹ�ġ
	local nX	= luaCredit.m_nImageX;
	local nY	= math.max( 0, ( ( nHeight - nH ) / 2 ) );
	pnlImage:SetPosition( luaCredit.m_nImageX, nY );
	
	-- ���ܷ� ��ġ ����( �̹��� �����ʿ� �ٵ��� )
	local nGW, nGH	= StepRollTextView:GetSize();
	local n = ( nWidth / 10 );
	n = nWidth - nGW - ( n/2 );
	StepRollTextView:SetPosition( n, 0 );
	
	-- �׶��̼�
	local nGraHeight	= 150;
	picGradationTop:SetSize( nWidth, nGraHeight );
	picGradationTop:SetPosition( 0, 0 );
	
	picGradationBottom:SetSize( nWidth, nGraHeight );
	picGradationBottom:SetPosition( 0, nHeight - nGraHeight );
end

-- SetImageFinal
function luaCredit:SetImageFinal()
	
	-- �̹��� �߾� ����
	local nWidth, nHeight	= gamefunc:GetWindowSize();
	local nW, nH	= pnlImage:GetSize();
	
	local nX	= math.max( 0, ( nWidth - nW ) / 2 );
	local nY	= math.max( 0, ( nHeight - nH ) / 2 );
	pnlImage:SetPosition( nX, nY );
	
end

-- SetImage
function luaCredit:SetImage()
	
	local strImage	= "";
	if( true == luaCredit.m_bFinalState )	then
		-- ���� �̹����� ����
		strImage		= gamefunc:GetCreditImageString( luaCredit.m_strFinishedImage );
		luaCredit:SetImageFinal();
	else
		strImage		= gamefunc:GetCreditImage( luaCredit.m_nImageIndex );
		
		luaCredit.m_nImageIndex = luaCredit.m_nImageIndex +1;
		if( luaCredit.m_nImageIndex >= luaCredit.m_nImageCount )	then
			luaCredit.m_nImageIndex = 0;
		end
	end
	
	picCreditImage:SetImage( strImage );
	
end

-- SetImageChange
function luaCredit:SetImageChange()

	if( true == luaCredit.m_bFinalState )	then
		luaCredit:LeaveToCharSelect();
		luaCredit.m_bFinished		= true;
	else
		-- ��ũ�� ���� �ð��� �̹��� ������ �����ִ� �ð����� �۴ٸ� �׳� �������̹����� ����������
		local nMin, nMax	= StepRollTextView:GetScrollBarRange();
		local nStepRollTime	= nMax - luaCredit.m_fScrollValue;
		--gamedebug:Log( "�����ð� " .. nStepRollTime );
		if( nStepRollTime > 0 )	then
			nStepRollTime	= nStepRollTime / luaCredit.m_fScrollSpeed;	
		
			if( ( luaCredit.m_fImageChangeTime + ( luaCredit.m_fImageFadeTime * 2 ) ) > nStepRollTime )	then		-- 0.1�� �Ҽ��� ������ ������ ������
				-- �׳� ������ �̹����� ����
				luaCredit.m_bFinalState			= true;
				luaCredit.m_fImageInjuryTime	= nStepRollTime;
				--gamedebug:Log( "���������� ���� ��ũ�� �����ð� " .. nStepRollTime );
			end
		end
		
		luaCredit.m_ImageState		= luaCredit.IMAGE_STATE.IMAGE_OUT;
	end
		
	luaCredit.m_bImageFadeTime	= gamefunc:GetUpdateTime();
	
end

-- UpdateImageChange
function luaCredit:UpdateImageChange()
	
	local nOpa		= picCreditImage:GetOpacity();
	local fElapsed	= ( gamefunc:GetUpdateTime() - luaCredit.m_bImageFadeTime ) / ( luaCredit.m_fImageFadeTime * 1000 );
	luaCredit.m_bImageFadeTime	= gamefunc:GetUpdateTime();
	
	if( luaCredit.IMAGE_STATE.IMAGE_OUT == luaCredit.m_ImageState )		then
		
		nOpa		= nOpa - fElapsed;
		if( 0 > nOpa )	then
			nOpa		= 0;
			luaCredit.m_ImageState = luaCredit.IMAGE_STATE.IMAGE_IN;
			
			luaCredit:SetImage();
		end
		
	elseif( luaCredit.IMAGE_STATE.IMAGE_IN == luaCredit.m_ImageState )	then
		
		nOpa		= nOpa + fElapsed;
		if( 1 < nOpa )	then
			nOpa		= 1;
			luaCredit.m_ImageState = luaCredit.IMAGE_STATE.IMAGE_NONE;
			
			-- �̹��� ���� �ð� ����
			luaCredit.m_fImageTimer = gamefunc:GetUpdateTime();

		end
	
	end
	
	--gamedebug:Log( "UpdateImageChange " .. nOpa );
	picCreditImage:SetOpacity( nOpa );
	
end

-- UpdateImage
function luaCredit:UpdateImage()
	
	if( true == luaCredit.m_bFinished )	then
		return ;
	end
	
	if( 0 == luaCredit.m_fImageTimer )	then
		luaCredit.m_fImageTimer		= gamefunc:GetUpdateTime();
	end
		
	local fElapsed = gamefunc:GetUpdateTime() - luaCredit.m_fImageTimer;
	if( ( ( luaCredit.m_fImageChangeTime + luaCredit.m_fImageInjuryTime ) * 1000 ) < fElapsed )	then
		--gamedebug:Log( "�׽�Ʈ1" );
		luaCredit:SetImageChange();		
	end
	
	--gamedebug:Log( "luaCredit:OnUpdateCredit() " .. fElapsed );
		
end

-- OnUpdateCredit
function luaCredit:OnUpdateCredit()
	
	if( luaCredit.IMAGE_STATE.IMAGE_NONE ~= luaCredit.m_ImageState )	then
		luaCredit:UpdateImageChange();
	else
		luaCredit:UpdateImage();
	end
	
end

-- OnUpdate
function luaCredit:OnUpdate()
		
	if( 0 == luaCredit.m_fScrollTimer ) then
		luaCredit.m_fScrollTimer = gamefunc:GetUpdateTime();
		luaCredit.m_fScrollValue = 0;
	end
	
	local fElapsed = gamefunc:GetUpdateTime() - luaCredit.m_fScrollTimer;
	luaCredit.m_fScrollTimer = gamefunc:GetUpdateTime();
	
	luaCredit.m_fScrollValue = luaCredit.m_fScrollValue + ( ( fElapsed / 1000.0 ) * luaCredit.m_fScrollSpeed );
	StepRollTextView:SetScrollValue( luaCredit.m_fScrollValue );
	
	local nMin, nMax	= StepRollTextView:GetScrollBarRange();
	
	if( true == luaCredit.m_bFinalState )	then
		return;
	end
	
	if( nMax < luaCredit.m_fScrollValue )	then
		luaCredit:SetFinalState();
	end
	
end

-- SetFinalState
function luaCredit:SetFinalState()
	-- ������ �̹��� ����
	luaCredit:SetImageChange();
	--gamedebug:Log( "�׽�Ʈ2" );
	luaCredit.m_bFinalState		= true;
	
end

-- BeginSpaceText
function luaCredit:BeginSpaceText()
	
	local nWidth, nHeight	= gamefunc:GetWindowSize();
	local nFontHeight		= 10; -- 10 ����
	local nSpace			= ( nHeight / nFontHeight );
	
	return nSpace;	
	
end

-- SetupCreditText
function luaCredit:SetupCreditText()
	
	local s = "{FONT name=\"fntCreditTitle\"}";
	-- ���� ���� �ֱ�
	local nSpace = luaCredit:BeginSpaceText();
	for  i = 0, nSpace  do
		s = s .. "\n";
	end
	-- ���� ����
	
	s = s .. "{ALIGN hor=\"center\"}";
	
	--for  i = 0, 10  do
		s = s .. "{FONT name=\"fntCreditMainTitle\"}{COLOR r=230 g=230 b=230}Raiderz{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Producer{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Director{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�����{/COLOR}\n\n\n";

		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}ART{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Art Director{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�輺ȯ{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Lead Artist{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}����ö{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Background Concept Artists{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�蹫��{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�ֳ���{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Background Modelers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}����{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�ֽſ�{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Character Concept Artists{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�ڼ���{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Character Modelers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}����ȣ{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�ڼ���{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Animators{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}����ȣ{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}ä����{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Effect Artists{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}ä�¿�{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n\n";

		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Engineering{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Lead Programmer{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}ǥȿ��{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Server Programmers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}���ѱ�{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}��â��{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}��â��{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}���߿�{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Client Programmers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�ǿ���{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}���ͼ�{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}��ö��{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Client & Platform Programmer{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�ӵ�ȯ{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Lead DB Programmer{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�߱���{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}DB Programmers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}ȫ����{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}���¹�{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Technical Director{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}���ڿ�{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Lead Engine Programmer{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�ڱٹ�{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Engine Programmers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�̼���{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}��ȣ��{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n\n";

		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Game Design{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Lead Designer{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Assistant Lead Designers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�����{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}Ȳ��ȯ{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Game Designers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}����ö{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�ڻ���{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�ѻ��{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�̰���{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�ۿ���{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�����{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n\n";

		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Sound{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Sound Producer{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}����ȣ{/COLOR}\n\n\n";

		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Development Support Team{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Development PM{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�赿��{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}QA{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}System Engineer{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n\n";

		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Business{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Marketing Director{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}����{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}International Brand Managers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�̽¾�{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n\n\n";

		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}- Neowiz Staff -{/COLOR}\n\n\n";
		
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Publishing Business Division{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Project General Manager - Vice President{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n";
		
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Business Team{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Project Director{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Team Manager{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}����ȫ{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Project Managers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�ּ���{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}����ȯ{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}����ȣ{/COLOR}\n\n";
		
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Service Product Management Team{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Group Manager{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�̵���{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Team Manager{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�̿���{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Service Product Managers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�赿��{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}���߱�{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n";
		
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Marketing Team{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Group Manager{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�̽���{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Team Manager{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Marketers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�Ż�ȭ{/COLOR}\n\n";
		
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Publishing Service Planning Team{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Team Manager{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Publishing Service Planner{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}����{/COLOR}\n\n";
		
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Publishing PR Team{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Group Manager{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Team Manager{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}��â��{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}PR Planner{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n";
		
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Database Engineering Team{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Team Manager{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}����ȣ{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Engineer{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n";
		
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}System Engineering Team{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Team Manager{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�赿��{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Engineer{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�����{/COLOR}\n\n";
		
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Service Operations Team{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Service Operations Manager{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�̽ô�{/COLOR}\n\n";
		
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Publishing Development Group{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Group Manager{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�����{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Team Managers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}���ȯ{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}���¾�{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�强��{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Web / Infra Programmers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�ڼ���{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}����ȣ{/COLOR}\n\n";
		
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Publishing Design Team{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Group Manager{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}���ؿ�{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Designers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�����{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}�̵�ȯ{/COLOR}\n\n";
		
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Publishing Quality Assurance Team{/COLOR}\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Team Manager{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}����ȣ{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditSubTitle\"}{COLOR r=208 g=154 b=50}Testers{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}������{/COLOR}\n\n\n\n";
		
		
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}- Outsourcing Staff -{/COLOR}\n\n\n";

		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Translation{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}���̿º긮��{/COLOR}\n\n";
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Modeling & Texture{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}��Ʈ�ڵ�{/COLOR}\n"
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}��Ʈ��������{/COLOR}\n\n"
		s = s .. "{FONT name=\"fntCreditTitle\"}{COLOR r=212 g=130 b=1}Sound{/COLOR}\n";
		s = s .. "{FONT name=\"fntRegular\"}{COLOR r=230 g=230 b=230}���̺��ھ�{/COLOR}\n\n\n"	
		
		s = s .. "{FONT name=\"fntCreditMainTitle\"}{COLOR r=230 g=230 b=230}Thank You{/COLOR}\n";
	--end
	
	-- ������ ���� �ֱ�
	s = s .. "{FONT name=\"fntCreditTitle\"}";
	for  i = 0, nSpace  do
		s = s .. "\n";
	end
	-- ���� ����

	StepRollTextView:SetText( s );
	
	--gamedebug:Log( "�׽�Ʈ4" );
end
