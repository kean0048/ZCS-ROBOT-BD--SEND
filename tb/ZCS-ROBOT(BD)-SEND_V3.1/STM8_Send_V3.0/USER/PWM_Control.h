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
#ifndef _PWMCONTROL_H
#define _PWMCONTROL_H


/*******************************************************************************
-----------------------------    Macro define    -------------------------------
*******************************************************************************/
#define   IGBT_Check_PIN    PD_IDR_IDR7

//#define   Max_cycle   48
//#define   Min_cycle   2

//#define   Max_cycle   96
#define   Max_cycle   100
#define   Min_cycle   2

#define   PWM_frequency    20      //PWM输出频率为20K


/*******************************************************************************
-------------------------    Function declaration    ---------------------------
*******************************************************************************/
void  PWM_Control(void);//驱动全桥波形输出
void  Time1_PWM_Close_Mode_Fast(void);//快速关闭PWM输出
int   Time1_PWM_Close_Mode_Slow(void);//正常关闭PWM输出(缓慢关闭）
void  PauseHeat(unsigned int ptime,unsigned char nextstep);
void  Adjust_Time1_cycle(unsigned char cycle);
void  Adjust_Time1_cycle2(unsigned char cycle);
void  Fast_Adjust_Time1_cycle2(unsigned char cycle);
void  Sum_Adjust_Time1_cycle(const unsigned char Pnumb);
void  Fast_Adjust_Time1_cycle(const unsigned char cycle,const unsigned int Pow_On,const unsigned char which_chenal,const unsigned char isnew_chenal);
void  Adjust_Time1_RF_4UART( const unsigned char commd[],const unsigned char Pnumb,const unsigned char Pfrequent,const unsigned char Pratio);
void  Fast_Adjust_Time1_cycle_4uart(const unsigned int Frequent_value,const unsigned int Ratio_Value);//cycle=100表示占空比50%
void  Sum_Adjust_Time1_cycle_lessfull(const unsigned char Pnumb,const unsigned char num_lessfull);
void FunDealChildPwm(const unsigned char selfNumb,const unsigned char childstatu,unsigned char *lessfull);
#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/
