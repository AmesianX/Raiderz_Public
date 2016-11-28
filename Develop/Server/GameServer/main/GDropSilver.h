#pragma once

class GLootInfo;
class GEntityPlayer;

// ����� �ǹ��� �����ڰ���

class GDropMoney : public MTestMemPool<GDropMoney>
{
public:
	GDropMoney();		
	void Clear();

	void Drop(CID nBeneficiaryCID, GLootInfo* pLootInfo);
	void Drop(const vector<CID>& vecBeneficiaryCID, GLootInfo* pLootInfo);

	bool IsAuthorizedCID(CID nCID);
	bool IsEmpty();
	int	 GetQuantity();

	void GetViewableCID(set<CID>& outsetViewableCID);
	void GetAuthorizedCID(set<CID>& outsetAuthorizedCID);

private:
	int			m_nMoney;
	set<CID>	m_setAuhorizedCID;	// ȹ�� ������ �ִ� ����� CID
};
