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
		unsigned char Head_1;         		/* 帧头*/
		unsigned char Date_Length;      	/* 帧数据长度 */
		unsigned char SelfID[2];   			/* 本机标号（种类） */
		unsigned char SlfNum;          	/* 配对机序列数 */
		unsigned char PairComm;           /* 配对指令/工作指令 */
		unsigned char PairID[5];          /* 配对机ID*/
		unsigned char Vol[2];           		/* 电压值（mV)*/
		unsigned char Curr[2];            	/* 电流值（mA） */
		unsigned short Temp;            	/* 温度值（℃） */
		unsigned char  PowerS[4];            	/* 配对机所需功率（w)*/
		unsigned short ErrID;          	/* 配对机故障ID */
		unsigned short Status;         	/* 状态值0：断开该路供电；2：充电完成标识；4：电池放到发射端上*/
		unsigned char Backup[3];				/* 备用 */
		unsigned char FrameCount;      	/* 帧计数【0~255】 */
		unsigned short Crc;				/* CRC校验值   */
		unsigned char Head_2;				/* 帧尾 */
	}LikeWifi;
	
void FunDealChildLost(const unsigned char selfNumb,unsigned char *lessfull);
void FunDealChildLostWork(const unsigned char ChildNum,unsigned char *lessfull);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* #ifndef DATASTRUCT_H */