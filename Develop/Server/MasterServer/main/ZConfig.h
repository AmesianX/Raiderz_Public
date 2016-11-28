#pragma once

#include "MTypes.h"
#include "string"
#include "SConfig.h"

#define CONFIG_AUTO_TEST_AI	L"ai"



struct ZDBConfig
{
	std::wstring	strServer;
	std::wstring	strDatabaseName;
	std::wstring	strUserName;
	std::wstring	strPassword;
};

/// �ΰ��� ������
class ZConfig : public SConfig
{
private:
	static wstring GetPathString(const wchar_t* szFileName, const wchar_t* szKeyName);

	static void InitAccountDB(const wchar_t* szFileName);
	static void InitGameDB(const wchar_t* szFileName);
	static void InitLogDB(const wchar_t* szFileName);
public:
	static void Init_INI();

	// server info
	static int			m_nMaxUser;					///< �ִ� ������
	static std::wstring	m_strServerName;
	static uint8		m_nServerType;
	static int			m_SSN;						///< �Ǹ� ���� ID
	static int			m_nMyWorldID;
	static int			m_nMyServerID;
	static bool			m_bPMSEnable;
	static bool			m_bPmangDBEncrypt;
	static wstring		m_strOdbcDriver;
	static int			m_nSocketPoolSize;			///< ���� Ǯ ������
	static int			m_nSendPendingLimitCount;	///< ���� Ŀ��� �ҵ� ����

	// database
	static ZDBConfig	m_AccountDBConfig;
	static ZDBConfig	m_GameDBConfig;
	static ZDBConfig	m_LogDBConfig;

	// config
	static bool		m_bWindowVisible;				///< ����â�� ������ ����
	static int		m_nPort;						///< ���� ��Ʈ

	// path
	static std::wstring	m_strSystemPath;			///< �ý��� ����
	static std::wstring	m_strFieldPath;				///< Field ����
	
	// etc
	static wstring			m_strDumpDestServerIP;
	static int				m_nDumpDestServerPort;
};
