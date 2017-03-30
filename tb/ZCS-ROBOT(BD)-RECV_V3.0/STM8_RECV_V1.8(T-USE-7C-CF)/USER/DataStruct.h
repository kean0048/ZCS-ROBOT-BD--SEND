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
		unsigned char Head_1;         /* 时标，ms，[0, 2^32-1] / time mark in ms */
		unsigned char Date_Length;      /* 接收到的卫星颗数，[0, 12] / count of satellites used in solution */
		unsigned short SelfID;   /* 周内时，ms，[0, 604800000] / time of week in ms, 0~604800000 */
		unsigned char Stuta;          /* 周数，week / week in weeks */
		unsigned char PairComm;           /* 定点数表示的纬度，等于浮点数表示的实际值除以对应当量 / latitude, fixed-point, -2^31~2^31-1 */
		unsigned char PairID[5];           /* 定点数表示的经度，等于浮点数表示的实际值除以对应当量 / longitude, fixed-point, -2^31~2^31-1 */
		unsigned short Vol;           /* 高度，m，[-, ] / altitude in m */
		unsigned short Curr;            /* 北向速度，m/s，[-, ] / velocity north in m/s */
		unsigned short Temp;            /* 东向速度，m/s，[-, ] / velocity east in m/s */
		unsigned int Power;            /* 地向速度，m/s，[-, ] / velocity down in m/s */
		unsigned short ErrID;          /* 速度（北东地），m/s，[-, ] / velocity(N, E, D), m/s */
		unsigned char CutOff_Comm;         /* 定点数表示的HDOP，等于浮点数表示的实际HDOP*10 */
		unsigned char Cycle;         /* 定点数表示的VDOP，等于浮点数表示的实际VDOP*10 */
		unsigned char ChargOver_Comm;         /* 定点数表示的PDOP，等于浮点数表示的实际PDOP*10 */
		unsigned char Touch_is;         /* 定点数表示的TDOP，等于浮点数表示的实际TDOP*10 */
		unsigned char Backup;
		unsigned char FrameCount;      /* 导航状态，Bit0～3=F定位，非F值为无定位，具体含义由各生产厂家自定 */
		unsigned short Crc;
		unsigned char Head_2;		/* frame number / 帧计数 */
	}LikeWifi;
	static LikeWifi ZoneChargWiLess;
	/* SRPV数据帧成员项转为数据结构成员项的元数据数组，参见TMdII */
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