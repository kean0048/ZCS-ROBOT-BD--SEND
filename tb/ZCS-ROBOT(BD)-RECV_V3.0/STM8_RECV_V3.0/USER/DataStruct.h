#ifndef DATASTRUCT_H
#define DATASTRUCT_H

#ifdef __cplusplus
extern "C"
{
#endif /* __cplusplus */
#define  NUM_LikeWifi  19
	/* // data structure of metadata for interconversion of corresponding item pair of frame and DS*/
	typedef struct
	{
		void *pID; /* // pointer to item of DS*/
		int cBIF; /* // count of bytes of item of frame*/
	}TMdII;

	//static TFramAll tframallD;
	typedef struct
	{
		unsigned char Head_1;         /* ʱ�꣬ms��[0, 2^32-1] / time mark in ms */
		unsigned char Date_Length;      /* ���յ������ǿ�����[0, 12] / count of satellites used in solution */
		unsigned short SelfID;   /* ����ʱ��ms��[0, 604800000] / time of week in ms, 0~604800000 */
		unsigned char Stuta;          /* ������week / week in weeks */
		unsigned char PairComm;           /* ��������ʾ��γ�ȣ����ڸ�������ʾ��ʵ��ֵ���Զ�Ӧ���� / latitude, fixed-point, -2^31~2^31-1 */
		unsigned char PairID[5];           /* ��������ʾ�ľ��ȣ����ڸ�������ʾ��ʵ��ֵ���Զ�Ӧ���� / longitude, fixed-point, -2^31~2^31-1 */
		unsigned short Vol;           /* �߶ȣ�m��[-, ] / altitude in m */
		unsigned short Curr;            /* �����ٶȣ�m/s��[-, ] / velocity north in m/s */
		unsigned short Temp;            /* �����ٶȣ�m/s��[-, ] / velocity east in m/s */
		unsigned int Power;            /* �����ٶȣ�m/s��[-, ] / velocity down in m/s */
		unsigned short ErrID;          /* �ٶȣ������أ���m/s��[-, ] / velocity(N, E, D), m/s */
		unsigned char CutOff_Comm;         /* ��������ʾ��HDOP�����ڸ�������ʾ��ʵ��HDOP*10 */
		unsigned char Cycle;         /* ��������ʾ��VDOP�����ڸ�������ʾ��ʵ��VDOP*10 */
		unsigned char ChargOver_Comm;         /* ��������ʾ��PDOP�����ڸ�������ʾ��ʵ��PDOP*10 */
		unsigned char Touch_is;         /* ��������ʾ��TDOP�����ڸ�������ʾ��ʵ��TDOP*10 */
		unsigned char Backup;
		unsigned char FrameCount;      /* ����״̬��Bit0��3=F��λ����FֵΪ�޶�λ�����庬���ɸ����������Զ� */
		unsigned short Crc;
		unsigned char Head_2;		/* frame number / ֡���� */
	}LikeWifi;
	static LikeWifi ZoneChargWiLess;
	/* SRPV����֡��Ա��תΪ���ݽṹ��Ա���Ԫ�������飬�μ�TMdII */
	static TMdII mdIIZONEPVR[NUM_LikeWifi] = {{&ZoneChargWiLess.Head_1,1}, 
											{&ZoneChargWiLess.Date_Length, 1}, 
											{&ZoneChargWiLess.SelfID,2}, 
											{&ZoneChargWiLess.Stuta,1}, 
											{&ZoneChargWiLess.PairComm,1}, 
											{&ZoneChargWiLess.PairID,5}, 
											{&ZoneChargWiLess.Vol,2}, 
											{&ZoneChargWiLess.Curr, 2}, 
											{&ZoneChargWiLess.Temp, 2}, 
											{&ZoneChargWiLess.Power,4}, 
											{&ZoneChargWiLess.ErrID,2}, 
											{&ZoneChargWiLess.CutOff_Comm,1}, 
											{&ZoneChargWiLess.Cycle,1}, 
											{&ZoneChargWiLess.ChargOver_Comm,1}, 
											{&ZoneChargWiLess.Touch_is, 1},
											{&ZoneChargWiLess.Backup, 1},
											{&ZoneChargWiLess.FrameCount,1},
											{&ZoneChargWiLess.Crc,2},
											{&ZoneChargWiLess.Head_2,1}};

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* #ifndef DATASTRUCT_H */