#pragma once

class GDropSoul : public MTestMemPool<GDropSoul>
{
public:
	GDropSoul();

	void Clear();
	bool IsAuthorizedCID(CID nCID);

public:
	SOUL_TYPE nSoulType;
	int nAmount;
	CID nAuthorizedCID;	// ȹ�� ������ �ִ� ����� CID
};
