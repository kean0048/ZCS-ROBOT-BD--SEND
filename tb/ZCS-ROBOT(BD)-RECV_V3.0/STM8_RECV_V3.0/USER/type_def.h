/******************************************************************************/
/*					                                      */
/*	Project Name :	���騦??��		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	?D?Y���??�ꡧ��??����??T??1?��???��?��D?T1???                    */
/*						                              */
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
*******************************************************************************/
#ifndef __type_def_h
#define __type_def_h
/*******************************************************************************
-----------------------------    Include files   -------------------------------
*******************************************************************************/
#include "iostm8s105k4.h"
#include "RAM.h"

/*******************************************************************************
----------------------------     Global define    ------------------------------
*******************************************************************************/
typedef struct 
{
    unsigned char  b7:1;
    unsigned char  b6:1;
    unsigned char  b5:1;
    unsigned char  b4:1;
    unsigned char  b3:1;
    unsigned char  b2:1;
    unsigned char  b1:1;
    unsigned char  b0:1;
}TYPE_BIT;


ramExtern volatile union
{
    unsigned char       Flag_10ms_1;
    TYPE_BIT             Flag_10ms_1_bit;
};
#define   Flag_10ms_A    Flag_10ms_1_bit.b0
#define   Flag_10ms_B    Flag_10ms_1_bit.b1
#define   Flag_10ms_C    Flag_10ms_1_bit.b2
#define   Flag_10ms_D    Flag_10ms_1_bit.b3
#define   Flag_10ms_E    Flag_10ms_1_bit.b4
#define   Flag_10ms_F    Flag_10ms_1_bit.b5
#define   Flag_10ms_G    Flag_10ms_1_bit.b6
#define   Flag_10ms_H    Flag_10ms_1_bit.b7


ramExtern volatile union
{
    unsigned char       Flag_10ms_2;
    TYPE_BIT             Flag_10ms_2_bit;
};
#define   Flag_10ms_I    Flag_10ms_2_bit.b0
#define   Flag_10ms_J    Flag_10ms_2_bit.b1
#define   Flag_10ms_K    Flag_10ms_2_bit.b2
#define   Flag_10ms_L    Flag_10ms_2_bit.b3
#define   Flag_10ms_M    Flag_10ms_2_bit.b4
#define   Flag_10ms_N    Flag_10ms_2_bit.b5
#define   Flag_10ms_O    Flag_10ms_2_bit.b6
#define   Flag_10ms_P    Flag_10ms_2_bit.b7

ramExtern volatile union
{
    unsigned char       Flag_1ms;
    TYPE_BIT             Flag_1ms_bit;
};
#define   Flag_1ms_A    Flag_1ms_bit.b0
//#define   Flag_1ms_B    Flag_1ms_bit.b1
//#define   Flag_1ms_C    Flag_1ms_bit.b2
//#define   Flag_1ms_D    Flag_1ms_bit.b3
//#define   Flag_1ms_E    Flag_1ms_bit.b4
//#define   Flag_1ms_F    Flag_1ms_bit.b5
//#define   Flag_1ms_G    Flag_1ms_bit.b6
#define   Flag_1ms_H    Flag_1ms_bit.b7


ramExtern volatile union
{
    unsigned char       Flag_NRF24L01;
    TYPE_BIT             Flag_NRF24L01_bit;
};
#define   NRF24L01_Mode_Rec1    Flag_NRF24L01_bit.b0//1?12?����??�꨺?
#define   NRF24L01_Mode_Rec2    Flag_NRF24L01_bit.b1//?????����??�꨺?
#define   NRF24L01_Mode_Send1   Flag_NRF24L01_bit.b2//1?12���騦??�꨺?
#define   NRF24L01_Mode_Send2   Flag_NRF24L01_bit.b3//????���騦??�꨺?
#define   Mode_Rec_Send         Flag_NRF24L01_bit.b4//0����?��?�꨺?1?����??�꨺?

ramExtern volatile union
{
    unsigned char       Key_Buffer;
    TYPE_BIT             Key_Buffer_bit;
};
#define   Key_Buffer_0    Key_Buffer_bit.b0
#define   Key_Buffer_1    Key_Buffer_bit.b1
#define   Key_Buffer_2    Key_Buffer_bit.b2

typedef struct
{
	unsigned short vol;
	unsigned long supply_vol;
	unsigned short cur;
	unsigned short temp;
	unsigned char  status;
	unsigned char  rsv1;
	unsigned char  rsv2;
	unsigned char  rsv3;
}DEV_STATUS;

ramExtern DEV_STATUS devStatus;

typedef struct
{
	unsigned char id;			//
	unsigned char len;			//?����?+��y?Y3��?��	
	unsigned char cmd;			//?����?
	unsigned char dBuf[16];		//��y?Y
}ROBOT_CMD_PKG;

ramExtern ROBOT_CMD_PKG rCmdPkg;

//bus data struct
typedef struct
{
	unsigned int PairSucc	:	2;	//��Գɹ���־
        unsigned int PairReq	:       2;	//�������
        unsigned int PowerChange:      2;	//���ʵ���
        unsigned int PowerZero:        2;	//���ʵ���
	unsigned int PowerUnit:        4;	//����ֵ��λ
	unsigned int PowerDecade:      4;	//����ֵʮλ
        unsigned int PowerHundreds:    4;	//����ֵ��λ
	unsigned int BusStatus	:	1;	//����״̬
	unsigned int BusWho	:       1;	//�豸����
	unsigned int DevStatus	:       1;	//�豸״̬
	unsigned int Undefine   :      9;	//δ����λ
}WorkCode;

typedef struct
{
	unsigned char CompCode	;	        //��˾������
	unsigned char ProdCode;		//��Ʒ������	
	WorkCode *sWorkCode;			//����������
    unsigned char PairAdress[5];		//��Ե�ַ
}ARCHITECTRUEPR;

ramExtern ARCHITECTRUEPR prodData;

typedef struct
{
	unsigned char heading;		//֡ͷ	
	unsigned char length;		//֡����
	ARCHITECTRUEPR *prodData;
    int Voltage;
    int Electron;
    int Temperature;
    unsigned char DutyCycle;
    unsigned char Efficiency;
    unsigned int FaultCode;
    unsigned int FrequetValue;
    unsigned char CommandCode;
    unsigned char SelfStatus;
    unsigned char Backup;
    unsigned int ProNum;
	unsigned int checksum;
    unsigned char Ending;		//֡β
}BUS_INFO;

ramExtern BUS_INFO busInfo;

/****************************************************************************/
//msg struct define

#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/