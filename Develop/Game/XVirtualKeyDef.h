#ifndef _XVIRTUAL_KEY_H
#define _XVIRTUAL_KEY_H

#include <map>
using namespace std;

// �̰� �߰��ϰų� �����ϸ� XKeyMapTable.cpp�� InitVirtualKeyString()���� ��������� �մϴ�.
const enum XVirtualKey
{
	VKEY_NA				= 0,
	VKEY_FORWARD,					///< ������ �̵�
	VKEY_BACKWARD,					///< �ڷ� �̵�
	VKEY_LEFT,						///< �������� �̵�
	VKEY_RIGHT,						///< ���������� �̵�
	VKEY_JUMP,						///< ����
	VKEY_CHANGE_STANCE,				///< ���Ľ� ����
	VKEY_ACTION,					///< �׼�,�⺻ ����
	VKEY_ACTION2,					///< �ι�° �׼�, �⺻�� ���
	VKEY_AUTO_RUN,					///< Auto Run
	VKEY_CHANGE_WEAPON,				///< ���� ����
	VKEY_NPCINTERACTION,			///< NPC ���ͷ���
	VKEY_PCINTERACTION,				///< PC ���ͷ���
	VKEY_LOCKTARGET,				///< Ÿ�� ����
	VKEY_TOGGLE_MOUSE,				///< ���콺 ���
	VKEY_SIT,						///< �ɱ�
	VKEY_TOGGLE_FREECAMERA,			///< ���� ī�޶�
	VKEY_GUARD,						///< ����
	VKEY_DODGE,						///< ȸ��

	// �������̽���
	VKEY_UI_NA,						///< UI
	VKEY_UI_MAINMENU,				///< ���� �޴�â
	VKEY_UI_CHARACTER,				///< ĳ���� â
	VKEY_UI_INVENTORY,				///< �κ��丮 â
	VKEY_UI_TALENT,					///< �ڷ�Ʈ â
	VKEY_UI_JOURNAL,				///< ����â
	VKEY_UI_SOCIAL,					///< ��Ƽâ
	VKEY_UI_MAP,					///< �޴�â
	VKEY_UI_CONTROLSHELP1,			///< ����Ű ���� 1
	VKEY_UI_CONTROLSHELP2,			///< ����Ű ���� 2

	VKEY_UI_PALETTE0,
	VKEY_UI_PALETTE1,
	VKEY_UI_PALETTE2,
	VKEY_UI_PALETTE3,
	VKEY_UI_PALETTE4,
	VKEY_UI_PALETTE5,
	VKEY_UI_PALETTE6,
	VKEY_UI_PALETTE7,
	VKEY_UI_PALETTE8,
	VKEY_UI_PALETTE9,

	VKEY_UI_PALETTE10,
	VKEY_UI_PALETTE11,
	VKEY_UI_PALETTE12,
	VKEY_UI_PALETTE13,
	VKEY_UI_PALETTE14,
	VKEY_UI_PALETTE15,
	VKEY_UI_PALETTE16,
	VKEY_UI_PALETTE17,
	VKEY_UI_PALETTE18,
	VKEY_UI_PALETTE19,
	VKEY_UI_PALETTE20,
	VKEY_UI_PALETTE21,
	VKEY_UI_PALETTE22,
	VKEY_UI_PALETTE23,
	VKEY_UI_PALETTE24,
	VKEY_UI_PALETTE25,
	VKEY_UI_PALETTE26,
	VKEY_UI_PALETTE27,
	VKEY_UI_PALETTE28,
	VKEY_UI_PALETTE29,

	VKEY_COUNT		= 128			///< ����Ű�� 128���� ���� �� �����ϴ�.
};



#endif