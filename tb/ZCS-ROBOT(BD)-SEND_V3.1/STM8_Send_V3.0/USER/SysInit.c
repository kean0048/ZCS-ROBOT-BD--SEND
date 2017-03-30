/******************************************************************************/
/*					                                      */
/*	Project Name :	�����		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	�лݴ��ǣ����ڣ����߹��缼�����޹�˾                  */
/*						                              */
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
*******************************************************************************/


/*******************************************************************************
-----------------------------    Include files   -------------------------------
*******************************************************************************/
#include "type_def.h"
#include "string.h"

#include "SysInit.h"
#include "Nrf24l01.h"
#include "Clock.h"
#include "uart.h"
#include "delayTime.h"
#include "Eeprom.h"
#include "ADSample.h"
#include "Buzz.h"
//#include "FAN_Control.h"
#include "PWM_Control.h"
#include "assert.h"
#include "MacProtect.h"

#define FREQUET 30000ul

/* ����������Ϣ */ 
ramExtern unsigned char* errmsg[] = { 
	/* 0 */ "No error", 
	/* 1 */ "IGBT_M_UP_ERR", 
	/* 2 */ "IGBT_M_DN_ERR", 
	/* 3 */ "O_INPUT_VOL_HIGH_PORTECT", 
	/* 4 */ "O_INPUT_CUR_HIGH_PORTECT", 
	/* 5 */ "O_COIL_VOL_HIGH_PORTECT",
	/* 6 */ "O_COIL_CUR_HIGH_PORTECT", 
	/* 7 */ "Efficiency_abnormal", 
	/* 8 */ "NTC_COIL_DET_ERR", 
	/* 9 */ "IGBT_ERR", 
	/* 10 */ "PWR_VOL_DET_LOW_PORTECT"
};
char errno = 0;

//******************************************************************************
//ϵͳ��ʼ��
//******************************************************************************
void  SysInit(void)
{   
    Clock_Init();               //ϵͳʱ�ӳ�ʼ��16M�ڲ�/�ⲿ 
    Port_Init();                //IO�ڳ�ʼ�� 
    EXTI3_Init();               //�ⲿ�жϳ�ʼ��
    SPI_Init();                 //SPI��ʼ��
	AD_Init(); 					//AD������ʼ��
    //IWDG_Init();
	Time1_Init(); 				//4·��PWM�����ʼ��������������Σ�
    Time4_Init();               //��ʱ����ʼ����ʱ1ms
    GetUniqueID(ChipUniqueID);  //��ȡ����ID    
    Key_Check_ID1 = crc_cal_value(ChipUniqueID, Length_ChipUniqueID);
    Key_Check_ID2 = crc_check_value(ChipUniqueID,Length_ChipUniqueID);
    Key_Check_ID3 = crc_sum_value(ChipUniqueID,Length_ChipUniqueID);
    Eeprom_Init();	
	GetEeprom(CHECK_ID); 		//��ȡEEprom������
	BuzzInit(); 				//��������ʼ��
    NRF24L01_Init();            //��ʼ��NRF24L01
	_delay_1_ms();
	Uart2_Init();               //����ͨ�ų�ʼ��
    Variable_Init();            //��RAM����ֵ��ʼ��
}
//******************************************************************************


//******************************************************************************
//ϵͳʱ�ӳ�ʼ��
//******************************************************************************
void  Clock_Init(void)
{
    //ʹ���ⲿ����16M
    CLK_ECKR |=0x01; // �����ⲿʱ��
    while(!(CLK_ECKR & 0x02)); // �ȴ��ⲿʱ�� rdy
    CLK_CKDIVR &= 0x08; //CPU �޷�Ƶ/8  0x18
    CLK_SWR = 0xB4; // ѡ���ⲿʱ��
    while(!(CLK_SWCR & 0x08)); // ����Ҫ��
    CLK_SWCR |=0x02; // ʹ���ⲿʱ     
}
//******************************************************************************


//******************************************************************************
//I/O�ڳ�ʼ��
//******************************************************************************

void  Port_Init(void)
{                    
	/* PA3  IGBT_M_UP_ERR  ����
     * PA4  IGBT_M_DN_ERR  ����
     * PA5  O_INPUT_VOL    ����
     * PA6  O_INPUT_CUR    ����
     */
    PA_DDR = 0x00; //PA_DDR=0b00000000;
    PA_CR1 = 0x00; //PA_CR1=0b00000000;
    PA_CR2 = 0x78; //PA_CR2=0b01111000;
    PA_ODR = 0x00; //PA_ODR=0b00000000;
    /* PB0  NTC_COIL_DET  ����
     * PB1  NTC_IGBT_DET  ����
     * PB2  PWR_VOL_DET   ����
     * PB3  PWR_CUR_DET   ����
     * PB4  ��            ���
     * PB5  ��            ���
     * PB6  O_COIL_CUR    ����
     * PB7  O_COIL_VOL    ����
     */
    PB_DDR = 0x30; //PB_DDR=0b00110000;
    PB_CR1 = 0x30; //PB_CR1=0b00110000;  ���������������
    PB_CR2 = 0xC0; //PB_CR2=0b11000000;  �����ж��������
    PB_ODR = 0x00; //PB_ODR=0b00000000;  ����ź�����
    /* PC1  PWM_HIGH_1    ���
     * PC2  PWM_LOW_1     ���
     * PC3  SPI_CE        ���
     * PC4  SPI_IRQ       ����
     * PC5  SPI_CLK       ���
     * PC6  SPI_MOSI      ���
     * PC7  SPI_MISO      ����
     */
    PC_DDR = 0x6f; //PC_DDR=0b01101111;     ���ݷ��� 

    PC_CR1 = 0xff; //PC_CR1=0b11111111;  ���������������
    PC_CR2 = 0x40; //PC_CR02=0b01000000;//�����ж��������
    PC_ODR = 0x00; //PC_ODR=0b00000000; //����ź�����

    /* PD0  1_WIRE       ���
     * PD1  SWIM         ���
     * PD2  MCU_DAC_PWM  ���     
     * PD3  FAN_PWM      ���
     * PD4  BEEP_EN      ���
     * PD5  UART_TX      ���
     * PD6  UART_RX      ����
     * PD7  UP_DN_WAVE   ����
     */
    PD_DDR = 0x3f; //PD_DDR=0b00111111;
    PD_CR1 = 0xff; //PD_CR1=0b11111111;
    PD_CR2 = 0x00; //PD_CR2=0b00000000;
    PD_ODR = 0x00; //PD_ODR=0b00000000;
    /* PE0  MCU_OPEN     ������ߣ�
     * PE1  SCL          ���
     * PE2  SDA          ����
     * PE3  IGBT_ERR     ���루���գ�
     * PE5  SPI_NSS      ���
     * PE6               ���
     * PE7               ���
     */
    PE_DDR = 0xe3; //PE_DDR=0b11100011;
    PE_CR1 = 0xf6; //PE_CR1=0b11110110;
    PE_CR2 = 0x00; //PE_CR2=0b01000000;
    PE_ODR = 0x00; //PE_ODR=0b00000000;
	
	PF_ODR_ODR4 = 1;
    /*
     * PG0 LED2
     * PG1 LED1
     */
    PG_DDR = 0x03; //PF_DDR=0b00000011;

    PG_CR1 = 0xff; //PF_CR1=0b11111111;
    PG_CR2 = 0x00; //PF_CR2=0b00000000;
    PG_ODR = 0x00; //PF_ODR=0b00000000;
}

//******************************************************************************

//******************************************************************************
//ADת����ʼ��
//******************************************************************************

void AD_Init(void)
{
    ADC_CSR = 0x05; //ѡ��AD����ͨ��5��ֹ�ж�
    ADC_CR1 |= 0x71; // ʹ�� ADC �� 18 ��Ƶ
    ADC_CR2 |= 0x08; // ���� �Ҷ��룬 low 8BIT AT ADC_DRL;
}
//******************************************************************************

//******************************************************************************
//�ⲿ�ж�
//******************************************************************************
void  EXTI3_Init(void)
{
    //PORTA���½��ش���PA3/4/5/6 
    //PORTB���½��ش���PB6/7
	//PORTC���½��ش���PC4
    //EXTI_CR1 = 0x00;
	EXTI_CR1 = 0x2a;//00�½��غ͵͵�ƽ���� 01�������ش��� 10���½��ش��� 11�����غ��½��ش���000000
}
//******************************************************************************


//******************************************************************************
//SPI��ʼ��
//******************************************************************************
void  SPI_Init(void)
{
    SPI_CR1 =0x0C;  // 16M/128/256�� MSB �ȣ����豸��CPOL = 1��CPHA= 0  
    SPI_CR2 =0x03;  // ˫��ȫ˫�������������CRC 
    SPI_CR1|=0x40;  // ����SPI����
}
//******************************************************************************


//******************************************************************************
//����ֵ��ʼ��
//******************************************************************************
void Variable_Init(void)
{
	//����ģʽ��ʼ��
    Set_TX_Com_Mode();
	
    Clear_Nrf24l01();
    Address_Pair[0]= Key_Check_ID1&0xff;//��λ
    Address_Pair[1]= Key_Check_ID1>>8;//��λ
    Address_Pair[2]= Key_Check_ID2;
    Address_Pair[3]= Key_Check_ID3&0xff;//��λ
    Address_Pair[4]= Key_Check_ID3>>8;//��λ
	Address_Pair[5]= 0;
	if(CHECK_ID[16] == 0x11)
	{
		for(int i = 0;i<5;i++)
		{
			Stor_Frequen_eeprom[i] = CHECK_ID[i+6];
			Stor_Ratio_eeprom[i] = CHECK_ID[i+11];
            Stor_Frequent[i] = Stor_Frequen_eeprom[i];
            Stor_Ratio[i] = Stor_Ratio_eeprom[i];
		}
		Stor_Frequen_eeprom[5] = CHECK_ID[17];
		Stor_Ratio_eeprom[5] = CHECK_ID[18];
	}

	//��ʼ�����������ʹӻ���ַ������
	memset(Address_Pair_Child,0,sizeof(Address_Pair_Child));
	memset(Address_Pair_Parent,0,sizeof(Address_Pair_Parent));
	//ʱ���ʼ��
	globetimer = 0;
	//add init
	for(int j = 0;j < 5;j++)
	{
		Flg_Chenal_OK[j] = 0x02;
		flg_stop_send_in[j] = 0;
		Flg_Chenal_Fail[j] = 0;
		RX_ADDRESS[j] = 0;
		Power_Rec_ch[j] = 0;
		flag_inwstatu[j] = 0;
		flag_statu[j] = 0;
	}
	
	Float_ForeignBody_Value_Sum = 0.64;
	Power = 1.0;
	
	FLAG_PWM_START = 0;
	Pwm_Product_numValue = 0;
	Flag_Fan_Open = 0;
    CNT_FULL_Num = 0;
	Time1_Work_cycle = 10;
	NUM_PWM_UPload = 0;
	NUM_PWM_UPload_LessFull = 0;
	Flg_Chenal_OK[5] = 0;
	flg_stop_send_in[5] = 0;	
	Power_Rec = 0;
	Flag_LED2_ENABLE = 0;	
	MacStatus = C_MSNORMAL;
	Buzz_Control = BUZZ_POWER_ON;
	Child_Num = 0;
	Check_Num = 0;
	Flag_False_Check_Pass = 0;
	Flag_ADDRESS_P0 = 1;
	status = C_MSIdle;
	flag_recheck_over = 0;
	count_false_check = 0;
	memset(AUTO_Array,0,sizeof(AUTO_Array));
	memset(Frm_count,0,sizeof(Frm_count));
	
	memset(CNT_Prot,0,sizeof(CNT_Prot));
	memset(CNT_ProtB,0,sizeof(CNT_ProtB));
	memset(ProtectFlag,0,sizeof(ProtectFlag));
	memset(Flag_NEW_DEV,0,sizeof(Flag_NEW_DEV));
	memset(Flag_FRIST_IN,0,sizeof(Flag_FRIST_IN));
	/*printf("sizeof(char) = %d\n",(int)sizeof(char));
	printf("sizeof(short) = %d\n",(int)sizeof(short));
	printf("sizeof(int) = %d\n",(int)sizeof(int));
	printf("sizeof(long) = %d\n",(int)sizeof(long));
	printf("sizeof(long long) = %d\n",(int)sizeof(long long));
	printf("sizeof(float) = %d\n",(int)sizeof(float));
	printf("sizeof(double) = %d\n",(int)sizeof(double));*/
	flag_p = 0;
	Pwm_Frequent_Value = 28;
	Pwm_Ratio_Value = 10;
	Pwm_Product_numValue = 10;
	
}
//******************************************************************************
void Variable_Init_Second(void)
{
	memset(AUTO_Array,0,sizeof(AUTO_Array));//20170225 ȷ����һ�������޷��뵽ʲô����»������������
    
	if(Flag_RECV_ADDRESS_NUM_SAME != 0)
	{
		Flag_RECV_ADDRESS_NUM_SAME = 0;
		Flag_RECV_ADDRESS_NUM = 0;
	}
	CNT_FULL_Num = 0;//20170227
	flag_recheck_over = 0;
	for(int k = 0;k < 5;k++)
	{
		flg_stop_send_in[k] = 0;//ÿ�ν�������Ϳ���һ���µ��ֻأ����㿪ʼ��������	
		Flg_Chenal_OK[k] = 0x02;
		Flg_Chenal_Fail[k] = 0;
		CNT_Rec_Check_Fail[k] = 1;
		Flag_FRIST_IN[k] = 0;
		flag_check_succ[k] = 0;
	}
}

//******************************************************************************
//��ʱ��4��ʼ�� 8M
//******************************************************************************
void  Time4_Init(void)
{
    /*TIM4_IER = 0x00; // ��ֹ�ж�
    TIM4_EGR = 0x01; // ������������¼�
    TIM4_PSCR = 0x07; // ������ʱ�� = ��ʱ�� /64=8MHZ/64=125000
    TIM4_ARR = 0x7c; // �趨��װ��ʱ�ļĴ���ֵ�� 255 �����ֵ
    TIM4_CNTR = 0x7c; // �趨�������ĳ�ֵ
    //��ʱ���� =(ARR+1)*125=1000uS
    TIM4_CR1 = 0x01; // b0 = 1, �������������
    //b1 = 0, �������
    //���ÿ�������������ʱ��
    TIM4_IER = 0x01; // ��������ж�*/
	
	TIM4_CR1 = 0x80; // b0 = 1, �������������
	TIM4_PSCR = 0x07; // ������ʱ�� = ��ʱ�� /128=16MHZ/128=8us
	TIM4_ARR = 0xfa; // �趨��װ��ʱ�ļĴ���ֵ250�� 255 �����ֵ
	TIM4_IER = 0x01; // ��������ж�
    TIM4_EGR = 0x01; // ������������¼�
	TIM4_CR1 |= 0x01;
}
//******************************************************************************

//******************************************************************************
//��ʱ��1��ʼ��
//******************************************************************************
void  Time1_Init(void)
{
	unsigned int data;
	
	TIM1_CR1 = 0x27; //TIM1_CR1 = 0B00100111;
    //ͨ��1��2���
    TIM1_CCMR1 = 0x60; //TIM1_CCMR1=0B01100000;//TIM1_CH1ģʽ1
    TIM1_CCMR2 = 0x70; //TIM1_CCMR2=0B01110000;//TIM1_CH2ģʽ2
    TIM1_CCER1 = 0x11; //TIM1_CCER1=0B00010001;//TIM1_CH1		
    //ͨ��3��4���
    TIM1_CCMR3 = 0x00; //0x60; //TIM1_CCMR3 = 0B01100000;//TIM1_CH3ģʽ1
    TIM1_CCMR4 = 0x00; //0x70; //TIM1_CCMR4 = 0B01110000;//TIM1_CH4ģʽ2
    TIM1_CCER2 =0x00; // 0x11; //TIM1_CCER2 = 0B00010001;//TIM3_CH4
    //ָ������Ƶ��
	//20170223Ƶ��Ϊ30K������ʱ��Ϊ30us
    /*TIM1_ARRH = (8000 / 30) / 256; //��16M/2/20K��16Mʱ�ӣ��������ģʽ����2��Ƶ��20K
    TIM1_ARRL = (8000 / 30) % 256;
	//TIM1_ARR = 308; f = 26k
	TIM1_ARR = 267; //f = 30k*/
	
	TIM1_ARRH = (FOSC_16M/2 / FREQUET) / 256; //��16M/2/30K��16Mʱ�ӣ��������ģʽ����2��Ƶ��30K
    TIM1_ARRL = (FOSC_16M/2 / FREQUET) % 256;
	data = TIM1_ARRH;
	TIM1_ARR = data * 256 + TIM1_ARRL;

    //ָ��ռ�ձ� ch1 �� ch2����
    TIM1_CCR1H = 0;
    TIM1_CCR1L = 0;
	data = TIM1_CCR1H;
    TIM1_CCR1 = data * 256 + TIM1_CCR1L;
    TIM1_CCR3H = TIM1_CCR1H;
    TIM1_CCR3L = TIM1_CCR1L;
    TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
    TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
    TIM1_CCR4H = TIM1_CCR2H;
    TIM1_CCR4L = TIM1_CCR2L;
	
	TIM1_DTR = 0X05;
    TIM1_BKR = 0x80; //TIM1_BKR = 0B10000000;   
    TIM1_EGR |= 0X01;
}
//******************************************************************************

/*******************************************************************************
-----------------------------    ���Ź���ʼ��   -------------------------------
*******************************************************************************/
void  IWDG_Init(void)
{
    IWDG_KR = 0xCC; //��IWDG_KR��д����ֵ0xCC���������Ź���������
    IWDG_KR = 0x55;  //��� PR �� RLR ��д����
    IWDG_RLR = 0xff; //���Ź���������װ����ֵ         
    IWDG_PR = 0x06; //��Ƶϵ��Ϊ4�����ʱʱ��Ϊ��1.02S
    IWDG_KR = 0xAA; //�ָ� PR �� RLR ��д����״̬
}
/******************************************************************************/

//******************************************************************************
//����У�麯��
//******************************************************************************
unsigned char CheckRecvDate(unsigned char *pCode)
{
    return 0;
}
//******************************************************************************

//******************************************************************************
//���ݽ��뺯��
//******************************************************************************
void streamTodecode(unsigned char *pFrmCode)
{

}
//******************************************************************************

//******************************************************************************
//�µ�ַ��麯��
//******************************************************************************
int IsNewAddr(unsigned char * Resv_Address)
{
	return 0;
}
//******************************************************************************
//FIND THE MAX
//******************************************************************************
int Find_Max(int *LostP,int k)
{
	int a;
	a = LostP[0];
	for(int j = 1;j < k;j++)
	{
		if(LostP[j]>a)
	  		a = LostP[j];
	}
	return a;
}
//******************************************************************************
//���㹦�ʺ���
//******************************************************************************
unsigned short CalculatedPower(const unsigned short *current,const unsigned short *voltage)
{
	assert(current == NULL || voltage == NULL);
	unsigned int tempI = *current;
	unsigned int tempV = *voltage;
	return tempI*tempV;	
}

//******************************************************************************
//�͵�ѹ��������
//******************************************************************************
void ProtectLowVoltage(const unsigned short *voltage)
{
	assert(voltage == NULL);
	unsigned short tempV = *voltage;
	if(tempV <= ProtectVolValue)
	{
		//��������һ��һ�� �澯
		BuzzChange(60,20,2);
	}		
}

//******************************************************************************
//IGBT�¶Ȳ���������
//******************************************************************************
short GetPwmValueFromIGBTtemp(const unsigned short *IgbtValue)
{
	assert(NULL == IgbtValue);
	unsigned short tempIgbtV = *IgbtValue;
	/*if(tempIgbtV == 0 || tempIgbtV == 5)
	{
		//һ�����̱���
		BuzzChange(60,20,3);
		return ERR_0_5_Sensor_IGBT_ERR;
	}
	else */
	if(tempIgbtV >= IGBT_TEMP_VALUE_UP)
	{
		//ֹͣ����
		PE_ODR_ODR0 = 1;//�ض�IGBT
		return ERR_62_Stop_Work;
	}
	else if(tempIgbtV  == IGBT_TEMP_VALUE_MID)
	{
		Time1_Work_cycle -= 5;
		return ERR_60_DN_5_Work;
	}
	else if(tempIgbtV  == IGBT_TEMP_VALUE_LOW)
	{
		Time1_Work_cycle -= 3;
		return ERR_58_DN_3_Work;
	}
	else 
		return NORMAL_STA_VALUE;
}

//******************************************************************************
//��Ȧ�¶Ȳ���������
//******************************************************************************
short GetPwmValueFromCOILtemp(const unsigned short *CoilValue)
{
	assert(NULL == CoilValue);
	unsigned short tempCoilV = *CoilValue;
	/*if(tempCoilV == 0 || tempCoilV == 5)
	{
		//һ�����̱���
		BuzzChange(60,20,4);
		return ERR_0_5_Sensor_COIL_ERR;
	}
	else */
	if(tempCoilV >= COIL_TEMP_VALUE_UP)
	{
		//ֹͣ����
		PE_ODR_ODR0 = 1;							//�ض�IGBT
		return ERR_120_Stop_Work;
	}
	else if(tempCoilV  == COIL_TEMP_VALUE_MID)
	{
		Time1_Work_cycle -= 5;
		return ERR_100_DN_5_Work;
	}
	else if(tempCoilV  <= COIL_TEMP_VALUE_LOW)
	{
		Time1_Work_cycle -= 3;
		return ERR_90_DN_3_Work;
	}
	else 
		return NORMAL_STA_VALUE;
}

void Cycle_Deal_FormDate(const unsigned char *fromRSdate)
{
	//unsigned char temp_cycle = *(fromRSdate+24);
	//Time1_Need_cycle = temp_cycle/(4*2);			//�ķ�֮һ����Ϊ�ĸ���Ʒ��ÿһ�����͹����Ķ�ֻ�Ƿ���˵�1/4,�ٳ���2����Ϊ��ֵ����Ϊ1:2����1�������pwmֵΪ2%
	Time1_Need_cycle = 50;//25%
}

/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/