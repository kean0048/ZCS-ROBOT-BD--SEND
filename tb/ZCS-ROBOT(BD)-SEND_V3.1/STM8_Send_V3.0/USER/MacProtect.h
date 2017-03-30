/******************************************************************************/
/*					                                      */
/*	Project Name :	发射机		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	中惠创智（深圳）无线供电技术有限公司                    */
/*						                              */
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
*******************************************************************************/
#ifndef _PROTECT_H
#define _PROTECT_H


/*******************************************************************************
-----------------------------    Macro define    -------------------------------
*******************************************************************************/
//电压范围  0   ≤ 电压数值  ≤ 639
//          0   ≤ 电压数值  ＜ 160    进入欠压保护
//         165  ≤ 电压数值  ＜ 639    退出欠压保护
#define C_Maximum_Low_Volt          16000          //欠压进入值
#define C_Minimum_Low_Volt          0            //欠压进入值
#define C_Back_Maximum_Low_Volt     65535         //欠压恢复值
#define C_Back_Minimum_Low_Volt     16500          //欠压恢复值
//         260  ≤ 电压数值  ＜ 639    进入过压保护
//         0    ≤ 电压数值  ＜ 255    退出过压保护
#define C_Maximum_High_Volt         65535         //过压进入值
#define C_Minimum_High_Volt         26000         //过压进入值
#define C_Back_Maximum_High_Volt    25500          //过压恢复值
#define C_Back_Minimum_High_Volt    0000           //过压恢复值
//温度范围 0   ≤ NTC的AD值  ≤ 1024
//         0   ≤ NTC的AD值  ＜ 20    进入短路保护
//         20  ≤ NTC的AD值  ＜ 1024  退出短路保护
#define C_Maximum_NTC_Short         1024             //短路进入值
#define C_Minimum_NTC_Short         1013              //短路进入值
#define C_Back_Maximum_NTC_Short    1013           //短路恢复值
#define C_Back_Minimum_NTC_Short    0            //短路恢复值
//         1013≤ NTC的AD值  ＜ 1024    进入开路保护
//         0   ≤ NTC的AD值  ＜ 1013   退出开路保护
#define C_Maximum_NTC_Open          20            //开路进入值
#define C_Minimum_NTC_Open          0            //开路进入值
#define C_Back_Maximum_NTC_Open     1024             //开路恢复值
#define C_Back_Minimum_NTC_Open     20              //开路恢复值
//温度范围 0   ≤ 温度数字  ≤ 200    //0表示-30℃，200表示170℃
//         100 ≤ 温度数字  ＜ 200    进入超温保护
//         0   ≤ 温度数字  ＜ 100    退出短路保护
#define C_Maximum_IGBT_Hot          92            //IGBT超温进入值
#define C_Minimum_IGBT_Hotn         100            //IGBT超温进入值
#define C_Back_Maximum_IGBT_Hot     90            //IGBT超温恢复值
#define C_Back_Minimum_IGBT_Hot     0             //IGBT超温恢复值
//温度范围 0   ≤ 温度数字  ≤ 200    //0表示-30℃，200表示170℃
//         100 ≤ 温度数字  ＜ 200    进入超温保护
//         0   ≤ 温度数字  ＜ 100    退出短路保护
#define C_Maximum_COIL_Hot          92            //COIL超温进入值
#define C_Minimum_COIL_Hotn         100            //COIL超温进入值
#define C_Back_Maximum_COIL_Hot     90            //COIL超温恢复值
#define C_Back_Minimum_COIL_Hot     0             //COIL超温恢复值

#define C_Maximum_ACCurr            4800          //电流单位1mA
/*******************************************************************************
-------------------------    Function declaration    ---------------------------
*******************************************************************************/
void  MacProtect(void);//异常检测与处理
void  MPSubA(unsigned char protype,unsigned int advalue,unsigned int ladv,unsigned int hadv);
void  MPSubB(unsigned char protype,unsigned int advalue,unsigned int ladv,unsigned int hadv);
void  MPSubC(void);
void  ProCodeTurn(void);
void  KPIdle(void);
void  MPSub_IGBT_IN(unsigned char protype);//进入IGBT中断异常
void  MPSub_IGBT_OUT(unsigned char protype);//退出IGBT中断异常

void  MPSub_Curr_IN(unsigned char protype);//进入过流保护
void  MPSub_Curr_OUT(unsigned char protype);//退出过流保护

void  MPSub_Fan_IN(unsigned char protype);//风扇故障检测
void  MPSub_Fan_OUT(unsigned char protype);//风扇故障退出

void  MPSub_Nrf24l01_IN(unsigned char protype);
void  MPSub_Nrf24l01_OUT(unsigned char protype);


void  MPSub_Receiver_IN(unsigned char protype);//从机有故障
void  MPSub_Receiver_OUT(unsigned char protype);//退出从机故障

void  MPSub_Check_NRF24L01_IN(unsigned char protype);
void  MPSub_Check_NRF24L01_OUT(unsigned char protype);

void  MPSub_Pro_Code(void);//本机故障代码
void  MPSub_Beep(void);


void  MPSub_IGBT_IN_UP(unsigned char protype);
void  MPSub_Curr_IN_INPUT(unsigned char protype);
void  MPSub_IGBT_IN_DN(unsigned char protype);
void  MPSub_VOL_IN_INPUT(unsigned char protype);    
void  MPSub_VOL_IN_COIL(unsigned char protype);
void  MPSub_Curr_IN_COIL(unsigned char protype);  
void  MPSub_Efficiency_Check_in(unsigned char protype);


void  MPSub_IGBT_OUT_UP(unsigned char protype);
void  MPSub_Curr_OUT_INPUT(unsigned char protype);
void  MPSub_IGBT_OUT_DN(unsigned char protype);
void  MPSub_VOL_OUT_INPUT(unsigned char protype);    
void  MPSub_VOL_OUT_COIL(unsigned char protype);
void  MPSub_Curr_OUT_COIL(unsigned char protype); 
void MPSub_Efficiency_Check_out(unsigned char protype);

void  DEAL_ABNORMAL_FUN(const unsigned char c_num);//异常处理函数
void  ABORT_DEAL_FUC(const unsigned char num);
#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/