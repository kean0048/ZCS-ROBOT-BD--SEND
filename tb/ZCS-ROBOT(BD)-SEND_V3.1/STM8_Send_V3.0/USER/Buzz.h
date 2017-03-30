/******************************************************************************/
/*					                                      */
/*	Project Name :	发射机		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	中惠创智（深圳）无线供电技术有限公司                  */
/*						                              */
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
*******************************************************************************/
#ifndef _BUZZ_H
#define _BUZZ_H

/*******************************************************************************
-----------------------------    Macro define    -------------------------------
*******************************************************************************/
#define    BUZZ_CLOSE              0X00
#define    BUZZ_OPEN               0X01

#define    BUZZ_POWER_ON           0X01
#define    BUZZ_KEY_ON             0X02
#define    BUZZ_IN_Error_0         0X03
#define    BUZZ_IN_Error_1         0X04
#define    BUZZ_IN_Error_2         0X05
#define    BUZZ_IN_Error_3         0X06
#define    BUZZ_IN_Error_4         0X07
#define    BUZZ_IN_Error_5         0X08
#define    BUZZ_IN_Error_6         0X09
#define    BUZZ_IN_Error_7         0X0a
#define    BUZZ_IN_Error_8         0X0b
#define    BUZZ_IN_Error_9         0X0c
#define    BUZZ_IN_Error_10        0X0d
#define    BUZZ_IN_Error_11        0X0e
#define    BUZZ_IN_Error_12        0X0f
#define    BUZZ_IN_Error_13        0X10
#define    BUZZ_IN_Error_14        0X11
#define    BUZZ_IN_Error_15        0X12

/*******************************************************************************
-------------------------    Function declaration    ---------------------------
*******************************************************************************/
void    Buzzer(void);
void    BuzzInit(void);
void    BuzzChange(unsigned char,unsigned char,unsigned char);
void    BuzzDriver(unsigned char);
void    BuzzStart(void);
void    BuzzStop(void);
void    BuzzerNewOld(void);


#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/