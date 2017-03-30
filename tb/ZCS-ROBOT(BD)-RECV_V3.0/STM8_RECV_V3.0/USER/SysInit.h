/******************************************************************************/
/*					                                      */
/*	Project Name :	�����		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	�лݴ��ǣ����ڣ����߹��缼�����޹�˾                    */
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
int     SysInit(void);//��ʼ��
void	Clock_Init(void);//ϵͳʱ�ӳ�ʼ��16M�ڲ�/�ⲿ
void	Port_Init(void);//IO�ڳ�ʼ��
void	EXTI3_Init(void);//�ⲿ�жϳ�ʼ��
void	EXTI2_Init(void);//�ⲿ�жϳ�ʼ��
void	AD_Init(void);//AD������ʼ��
void	SPI_Init(void);//SPI��ʼ��
void	Variable_Init(void);//��RAM����ֵ��ʼ��
void	Time1_Init(void);//2·����PWM�����ʼ��
void	Time2_Init(void);//1·PWM��ʼ��
void	Time4_Init(void);//��ʱ����ʼ����ʱ1ms
void	IWDG_Init(void);//�������Ź���ʼ��

void    LED_TEST(void);
void    LED_TEST_INT(void);
void 	ProtectVoltage(const unsigned short *voltage);
void 	ProtectCurrent(const unsigned short *voltage);
void 	Variable_Init_Second();//���״γ�ʼ��
void    Variable_Init_Third();//�����ϵ�����ֵ���ʼ��
unsigned char  CheckRecData(void);	

#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/