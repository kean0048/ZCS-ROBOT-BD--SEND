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
#ifndef _SYSINIT_
#define _SYSINIT_

#define FOSC_24M	24000000UL
#define FOSC_16M	16000000UL
#define FOSC_8M		8000000UL
#define FOSC_4M		4000000UL

#define FOSC 		FOSC_16M
/*******************************************************************************
-----------------------------    Macro define    -------------------------------
*******************************************************************************/

/*******************************************************************************
-------------------------    Function declaration    ---------------------------
*******************************************************************************/
int     SysInit(void);//初始化
void	Clock_Init(void);//系统时钟初始化16M内部/外部
void	Port_Init(void);//IO口初始化
void	EXTI3_Init(void);//外部中断初始化
void	EXTI2_Init(void);//外部中断初始化
void	AD_Init(void);//AD采样初始化
void	SPI_Init(void);//SPI初始化
void	Variable_Init(void);//清RAM变量值初始化
void	Time1_Init(void);//2路互补PWM输出初始化
void	Time2_Init(void);//1路PWM初始化
void	Time4_Init(void);//定时器初始化定时1ms
void	IWDG_Init(void);//独立看门狗初始化

void    LED_TEST(void);
void    LED_TEST_INT(void);
void 	ProtectVoltage(const unsigned short *voltage);
void 	ProtectCurrent(const unsigned short *voltage);
void 	Variable_Init_Second();//非首次初始化
void    Variable_Init_Third();//线盘上掉到阈值后初始化
unsigned char  CheckRecData(void);	

#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/