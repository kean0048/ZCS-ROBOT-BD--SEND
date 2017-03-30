/******************************************************************************/
/*					                                      */
/*	Project Name :	�����		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*  Date	     :	2016/04/26	                                      */
/*	Corporation  :	�лݴ��ǣ����ڣ����߹��缼�����޹�˾                    */
/*						                              */
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
*******************************************************************************/
#ifndef _SYSINIT_H
#define _SYSINIT_H


/*******************************************************************************
-----------------------------    Macro define    -------------------------------
*******************************************************************************/

/*******************************************************************************
-------------------------    Function declaration    ---------------------------
*******************************************************************************/
void    SysInit(void);//��ʼ��
void	Clock_Init(void);//ϵͳʱ�ӳ�ʼ��16M�ڲ�/�ⲿ
void	Port_Init(void);//IO�ڳ�ʼ��
void	EXTI3_Init(void);//�ⲿ�жϳ�ʼ��
void	AD_Init(void);//AD������ʼ��
void	SPI_Init(void);//SPI��ʼ��
void	Variable_Init(void);//��RAM����ֵ��ʼ��
void	Time1_Init(void);//2·����PWM�����ʼ��
void	Time2_Init(void);//1·PWM��ʼ��
void	Time4_Init(void);//��ʱ����ʼ����ʱ1ms
void    Time3_Init(void);//��ʱ����ʼ����ʱ1ms
void	IWDG_Init(void);//�������Ź���ʼ��
void    Delay(unsigned int);
void    Variable_Init_Second(void);
unsigned char CheckRecvDate(unsigned char *pCode);//date check

//void _delay_ms(unsigned long ms);
//void  _delay_1_ms(void);
//void _delay_us(unsigned long us);
//******************************************************************************
//��������CheckRecvDate
//���ܣ�У��������ȷ��
//���룺CheckRecvDate
//����ֵ����ȷ������
//******************************************************************************

void streamTodecode(unsigned char *pFrmCode);//decode the recv date
//******************************************************************************
//��������streamTodecode
//���ܣ�������pFrmCode����
//���룺pFrmCode�յ�������
//����ֵ����
//******************************************************************************

int IsNewAddr(unsigned char *Resv_Address);//if or not a new adress
//******************************************************************************
//��������IsNewAddr
//���ܣ��ж�Resv_Address�Ƿ�Ϊ�Ѵ��ڵ���Ե�ַ������������ڲ�����0�������趨��������2���µ�ַ����1��
//���룺Resv_Address��ַ����Ϊ5���ֽ�
//����ֵ�����ݲ�ͬ�������0,1,2
//******************************************************************************

int Find_Max(int *LostP,int k);//make know who is the max in the lost-squeue
//******************************************************************************
//��������Find_Max
//���ܣ���LostP�в������ֵ
//���룺LostP���ֵ���ڶ���,k������Ԫ�ظ���
//����ֵ�����ֵ
//******************************************************************************

unsigned short CalculatedPower(const unsigned short *current,const unsigned short *voltage);
//******************************************************************************
//��������CalculatedPower
//���ܣ��������ݵ�ѹ�͵������㹦�ʣ������ع���ֵ
//���룺current(I),voltage��V��
//����ֵ������ֵ = I*V
//******************************************************************************

void ProtectLowVoltage(const unsigned short *voltage);
//******************************************************************************
//��������ProtectLowVoltage
//���ܣ�����ѹ����ĳһ�ض�ֵ��160V��ʱ������һ��һ�̸澯
//���룺voltage��V��
//�������
//******************************************************************************

short GetPwmValueFromIGBTtemp(const unsigned short *IgbtValue);
//******************************************************************************
//��������GetPwmValueFromIGBTtemp
//���ܣ��ж�IGBT�ɼ��¶ȵ���ֵ��������Ӧ�ķ�Ӧ������һ�����̸澯
//���룺IgbtValue��V������ѹֵ����ת�����¶�ֵ
//��������ز�ͬPWM����ֵ
//******************************************************************************

short GetPwmValueFromCOILtemp(const unsigned short *CoilValue);
//******************************************************************************
//��������GetPwmValueFromCOILtemp
//���ܣ��ж���Ȧ�ɼ��¶ȵ���ֵ��������Ӧ�ķ�Ӧ������һ�����̸澯
//���룺CoilValue��V������ѹֵ����ת�����¶�ֵ
//��������ز�ͬPWM����ֵ
//******************************************************************************

void Cycle_Deal_FormDate(const unsigned char *fromRSdate);
//******************************************************************************
//Cycle_Deal_FormDate
//���ܣ���ȡ����豸��ռ�ձȣ�����Ϊ1:4
//���룺fromRSdate���洢��������
//�����ռ�ձ�
//******************************************************************************
#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/