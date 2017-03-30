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
#ifndef _PWMCONTROL_H
#define _PWMCONTROL_H


/*******************************************************************************
-----------------------------    Macro define    -------------------------------
*******************************************************************************/
#define   IGBT_Check_PIN    PD_IDR_IDR7

//#define   Max_cycle   48
//#define   Min_cycle   2
#define   Current_Protect_PIN   PC_IDR_IDR3  

//#define   Max_cycle   96
#define   Max_cycle   200
//#define   Mid_cycle   20
#define   Min_cycle   4

#define   PWM_frequency   30
/*******************************************************************************
-------------------------    Function declaration    ---------------------------
*******************************************************************************/
void  PWM_Control(void);//驱动全桥波形输出
void  Time1_PWM_Close_Mode1(void);//快速关闭PWM输出
void  Time1_PWM_Close_Mode2(void);//正常关闭PWM输出(缓慢关闭）
void  Time1_PWM_Open(unsigned char frequency,unsigned char Start_Time1_cycle);
void  PauseHeat(unsigned int ptime,unsigned char nextstep);
void  Adjust_Time1_cycle(unsigned char cycle);


#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/
