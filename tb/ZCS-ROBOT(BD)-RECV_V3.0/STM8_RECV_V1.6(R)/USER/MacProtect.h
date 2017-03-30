/******************************************************************************/
/*					                                      */
/*	Project Name :	接收机		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	中惠创智（深圳）无线供电技术有限公司                   */
/*						                              */
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
*******************************************************************************/
#ifndef _PROTECT_
#define _PROTECT_


/*******************************************************************************
-----------------------------    Macro define    -------------------------------
*******************************************************************************/
//电压范围  0   ≤ 电压数值  ≤ 639
//          0   ≤ 电压数值  ＜ 180    进入欠压保护
//         185  ≤ 电压数值  ＜ 639    退出欠压保护
#define C_Maximum_Low_Volt          18000          //欠压进入值
#define C_Minimum_Low_Volt          0            //欠压进入值
#define C_Back_Maximum_Low_Volt     31000         //欠压恢复值
#define C_Back_Minimum_Low_Volt     18500          //欠压恢复值
//         260  ≤ 电压数值  ＜ 639    进入过压保护
//         0    ≤ 电压数值  ＜ 255    退出过压保护
/*
#define C_Maximum_High_Volt         31000         //过压进入值
#define C_Minimum_High_Volt         26000         //过压进入值
#define C_Back_Maximum_High_Volt    25500          //过压恢复值
#define C_Back_Minimum_High_Volt    0000           //过压恢复值
*/
//电压单位10mV
#define C_Maximum_High_Volt         5000         //过压进入值
#define C_Minimum_High_Volt         4500         //过压进入值
#define C_Back_Maximum_High_Volt    4000          //过压恢复值
#define C_Back_Minimum_High_Volt    0000           //过压恢复值
//温度范围 0   ≤ NTC的AD值  ≤ 1024
//         0   ≤ NTC的AD值  ＜ 20    进入短路保护
//         20  ≤ NTC的AD值  ＜ 1024  退出短路保护
#define C_Maximum_NTC_Short         20             //短路进入值
#define C_Minimum_NTC_Short         0              //短路进入值
#define C_Back_Maximum_NTC_Short    1024           //短路恢复值
#define C_Back_Minimum_NTC_Short    20             //短路恢复值
//         1013≤ NTC的AD值  ＜ 1024    进入开路保护
//         0   ≤ NTC的AD值  ＜ 1013   退出开路保护
#define C_Maximum_NTC_Open          1024            //开路进入值
#define C_Minimum_NTC_Open          1013            //开路进入值
#define C_Back_Maximum_NTC_Open     1013             //开路恢复值
#define C_Back_Minimum_NTC_Open     0              //开路恢复值
//温度范围 0   ≤ 温度数字  ≤ 200    //0表示-30℃，200表示170℃
//         100 ≤ 温度数字  ＜ 200    进入超温保护
//         0   ≤ 温度数字  ＜ 100    退出短路保护
#define C_Maximum_IGBT_Hot          229            //IGBT超温进入值
#define C_Minimum_IGBT_Hotn         200            //IGBT超温进入值
#define C_Back_Maximum_IGBT_Hot     180            //IGBT超温恢复值
#define C_Back_Minimum_IGBT_Hot     0             //IGBT超温恢复值

#define C_Maximum_ACCurr            4000          //电流单位1mA
/*******************************************************************************
-------------------------    Function declaration    ---------------------------
*******************************************************************************/
void  MacProtect(void);//异常检测与处理
void  MPSubA(unsigned char protype,unsigned int advalue,unsigned int ladv,unsigned int hadv);
void  MPSubB(unsigned char protype,unsigned int advalue,unsigned int ladv,unsigned int hadv);
void  MPSubC(void);
void  ProCodeTurn(void);
void  KPIdle(void);
//void  MPSub_IGBT_IN(unsigned char protype);//进入IGBT中断异常
//void  MPSub_IGBT_OUT(unsigned char protype);//退出IGBT中断异常
void  MPSub_Remove_load_IN(unsigned char protype);
void  MPSub_Remove_load_OUT(unsigned char protype);

void  MPSub_Curr_IN(unsigned char protype);//进入过流保护
void  MPSub_Curr_OUT(unsigned char protype);//退出过流保护

void  MPSub_Fan_IN(unsigned char protype);//风扇故障检测
void  MPSub_Fan_OUT(unsigned char protype);//风扇故障退出

void  MPSub_Nrf24l01_IN(unsigned char protype);
void  MPSub_Nrf24l01_OUT(unsigned char protype);


void  MPSub_Check_NRF24L01_IN(unsigned char protype);
void  MPSub_Check_NRF24L01_OUT(unsigned char protype);

void  MPSub_Receiver_IN(unsigned char protype);//从机有故障
void  MPSub_Receiver_OUT(unsigned char protype);//退出从机故障


void  MPSub_Pro_Code(void);//本机故障代码
void  MPSub_Beep(void);

void  MPSub_Volt_IN(unsigned char protype);//快速进入过压保护
void  MPSub_Tached_Check(unsigned char protype); //检查进入系统前的和队列有关的信息正确性
void  MPSub_Viot_Curr_Over_IN(unsigned char protype);//PD7引脚检测过压过流
void  MPSub_Viot_Curr_Over_OUT(unsigned char protype);//PD7引脚检测过压过流

void  MPSub_Nrf24l01_Pair_IN(unsigned char protype);
void  MPSub_Nrf24l01_Pair_OUT(unsigned char protype);
#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/