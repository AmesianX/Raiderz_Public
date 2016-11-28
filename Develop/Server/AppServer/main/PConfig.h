#pragma once

#include "MTypes.h"
#include <string>

#include "SConfig.h"

struct PDBConfig
{
	wstring	strServer;
	wstring	strDatabaseName;
	wstring	strUserName;
	wstring	strPassword;
};

/// �ΰ��� ������
class PConfig : public SConfig
{
private:
	static wstring GetPathString( const wchar_t* szFileName, const wchar_t* szKeyName );

	static void InitAccountDB(const wchar_t* szFileName);
	static void InitGameDB(const wchar_t* szFileName);
	static void InitLogDB(const wchar_t* szFileName);

public:
	static void Init_INI();

	// config
	static bool		m_bWindowVisible;			///< ����â�� ������ ����
	static int		m_nMyNetworkCardID;			///< Listen Socket���� ����� ��Ʈ��ũ ī�� ID
	static int		m_nPort;					///< ���� ��Ʈ

	// ServerInfo
	static wstring	m_strServerName;			///< �����̸�
	static uint8	m_nServerType;				///< ����Ÿ��
	static int		m_nMyServerID;				///< ����ID
	static int		m_nMyWorldID;				///< ����ID
	static int		m_SSN;						///< �Ǹ� ���� ID
	static bool		m_bPmangDBEncrypt;
	static wstring	m_strOdbcDriver;			///< ODBC ����̹� �̸�
	static int		m_nSocketPoolSize;			///< ���� Ǯ ������
	static int		m_nSendPendingLimitCount;		///< ���� Ŀ��� �ҵ� ����

	// MasterServer
	static int		m_nMasterServer_NetworkCardID;	///< ������ ���� ��ſ� ����� ��Ʈ��ũ ī�� ID
	static wstring	m_strMasterServerIP;		///< ���� IP
	static int		m_nMasterServerPort;		///< ���� ��Ʈ

	// db
	static PDBConfig	m_AccountDBConfig;
	static PDBConfig	m_GameDBConfig;
	static PDBConfig	m_LogDBConfig;

	// path
	static wstring	m_strSystemPath;			///< �ý��� ����

	// PMS
	static bool		m_bPMSEnable;

	// etc
	static wstring			m_strDumpDestServerIP;
	static int				m_nDumpDestServerPort;


};
