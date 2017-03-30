#ifndef _DATASTRUCT_H
#define _DATASTRUCT_H

#ifdef __cplusplus
extern "C"
{
#endif /* __cplusplus */
#define  NUM_LikeWifi  16
	/* // data structure of metadata for interconversion of corresponding item pair of frame and DS*/
	typedef struct
	{
		void *pID; /* // pointer to item of DS*/
		int cBIF; /* // count of bytes of item of frame*/
	}TMdII;

	//static TFramAll tframallD;
	typedef struct
	{
		unsigned char Head_1;         		/* ֡ͷ*/
		unsigned char Date_Length;      	/* ֡���ݳ��� */
		unsigned char SelfID[2];   			/* ������ţ����ࣩ */
		unsigned char SlfNum;          	/* ��Ի������� */
		unsigned char PairComm;           /* ���ָ��/����ָ�� */
		unsigned char PairID[5];          /* ��Ի�ID*/
		unsigned char Vol[2];           		/* ��ѹֵ��mV)*/
		unsigned char Curr[2];            	/* ����ֵ��mA�� */
		unsigned short Temp;            	/* �¶�ֵ���棩 */
		unsigned char  PowerS[4];            	/* ��Ի����蹦�ʣ�w)*/
		unsigned short ErrID;          	/* ��Ի�����ID */
		unsigned short Status;         	/* ״ֵ̬0���Ͽ���·���磻2�������ɱ�ʶ��4����طŵ��������*/
		unsigned char Backup[3];				/* ���� */
		unsigned char FrameCount;      	/* ֡������0~255�� */
		unsigned short Crc;				/* CRCУ��ֵ   */
		unsigned char Head_2;				/* ֡β */
	}LikeWifi;
	
void FunDealChildLost(const unsigned char selfNumb,unsigned char *lessfull);
void FunDealChildLostWork(const unsigned char ChildNum,unsigned char *lessfull);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* #ifndef DATASTRUCT_H */