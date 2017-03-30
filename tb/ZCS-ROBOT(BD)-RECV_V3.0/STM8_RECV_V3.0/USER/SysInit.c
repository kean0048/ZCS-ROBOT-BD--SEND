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
#include "SysInit.h"
#include "Nrf24l01.h"
#include "string.h"
#include "Eeprom.h"
#include "uart.h"
#include "ADSample.h"

/* ����������Ϣ */ 
unsigned char* errmsg[] = { 
	/* 0 */ "No error", 
	/* 1 */ "CURR_OVER", 
	/* 2 */ "VOL_OVER", 
	/* 3 */ "OVER_INPUT_VOL", 
	/* 4 */ "O_INPUT_CUR_HIGH_PORTECT", 
	/* 5 */ "O_COIL_VOL_HIGH_PORTECT",
	/* 6 */ "O_COIL_CUR_HIGH_PORTECT", 
	/* 7 */ "NTC_IGBT_DET_ERR", 
	/* 8 */ "NTC_COIL_DET_ERR", 
	/* 9 */ "IGBT_ERR", 
	/* 10 */ "PWR_VOL_DET_LOW_PORTECT"
};
unsigned char         errno;
//******************************************************************************
//ϵͳ��ʼ��
//******************************************************************************

unsigned char Step_Normal;
unsigned char Step_ERR_Main;
int SysInit(void)
{   
    Clock_Init();               //ϵͳʱ�ӳ�ʼ��16M�ڲ�/�ⲿ 
    Port_Init();                //IO�ڳ�ʼ�� 
    EXTI3_Init();               //�ⲿ�жϳ�ʼ��
	EXTI2_Init();	
    SPI_Init();                 //SPI��ʼ��
	Time4_Init();               //��ʱ����ʼ����ʱ1ms
	Uart2_Init();               //����ͨ�ų�ʼ��
	AD_Init();                  //AD������ʼ��    
    //Time1_Init();               //��ʱ����ʼ����ʱ1ms	
	GetUniqueID(ChipUniqueID);  //��ȡ����ID    
    Key_Check_ID1 =crc_cal_value(ChipUniqueID, Length_ChipUniqueID);
    Key_Check_ID2 = crc_check_value(ChipUniqueID,Length_ChipUniqueID);
    Key_Check_ID3 = crc_sum_value(ChipUniqueID,Length_ChipUniqueID);
    Eeprom_Init();
	GetEeprom(CHECK_ID);        //��ȡEEprom������
    NRF24L01_Init();            //��ʼ��NRF24L01
    Variable_Init();            //��RAM����ֵ��ʼ��
	return 1;
}
//******************************************************************************


//******************************************************************************
//ϵͳʱ�ӳ�ʼ��
//******************************************************************************
void  Clock_Init(void)
{
    //ʹ���ⲿ����16M
    CLK_ECKR |= 0x01;        	// �����ⲿʱ��
    while(!(CLK_ECKR & 0x02)); // �ȴ��ⲿʱ�� rdy
    CLK_CKDIVR &= 0xf8; 		//CPU �޷�Ƶ ���ڲ�ʱ��8��Ƶ
    CLK_SWR = 0xB4; 			// ѡ���ⲿʱ��
    while(!(CLK_SWCR & 0x08)); // ����Ҫ��
    CLK_SWCR |= 0x02; 			// ʹ���ⲿʱ     
}
//******************************************************************************


//******************************************************************************
//I/O�ڳ�ʼ��
//******************************************************************************
void  Port_Init(void)
{                    
    PA_DDR = 0x04;//PA_DDR=0b00000100;p1IN;P2 OUT;
    //PA�ڶ�������
	//PA1 OSCIN
	//PA2 OSCOUT
    PA_CR1 = 0xfd;//PA_CR1=0b11111101;
    PA_CR2 = 0x00;//PA_CR2=0b00000000;
    PA_ODR = 0x00;//PA_ODR=0b00000000;

    PB_DDR = 0x30;//PB_DDR=0b00110000;
    //PB0��ģ���ѹ���룩���������룩
    //PB1��ģ��������룩���������룩
    //PB2��ģ���¶����룩���������룩
    //PB3��bat��ѹ���룩���������룩
    //PB4��i2c scl��
    //PB5��i2c sda��
    //PB6������û��������
    //PB7������û��������
    PB_CR1 = 0xf0;//PB_CR1=0b11110000;
    PB_CR2 = 0x00;//PB_CR2=0b00000000;10M
    PB_ODR = 0x30;//PB_ODR=0b00110000;I2C�ߵ�ƽ

    PC_DDR = 0x66;//PC_DDR=0b01100110;
    //PC0������û��������
    //PC1��LED2�����
    //PC2��LED1�����
    //PC3��CURR_OVER���룩�����ж�
    //PC4��VOLT_OVER���룩��ѹ�ж�
    //PC5��SPI_CLK�����
    //PC6��SPI_MOSI�����
    //PC7��SPI_MISO���룩(����)
    PC_CR1 = 0xe7;//PC_CR1=0b11111000;
    PC_CR2 = 0x58;//PC_CR2=0b01011110;//����
    PC_ODR = 0x00;//PC_ODR=0b00000000;
    
    PD_DDR = 0x2B;//PD_DDR=0b00101011;
    //PD0��SPI_CE�����
    //PD1��SWIM�ڣ��������
    //PD2��SPI_IRQ���룩
    //PD3��FAN_PWM�����
    //PD4��RF_SIGNAL���룩
    //PD5��UART2_TX�����
    //PD6��UART2_RX���룩
    //PD7��OVER_INPUT_VOL���룩
    PD_CR1 = 0xef;//PD_CR1=0b11101111;
    PD_CR2 = 0x84;//PD_CR2=0b10000100;ʹ���ⲿ�ж�pd2/7,swim ����2m
    PD_ODR = 0x00;//PD_ODR=0b00000000;

    PE_DDR = 0x20;//PE_DDR=0b00100000;
    //ֻ��PE5��SPI_NSS�����
    PE_CR1 = 0xff;//PE_CR1=0b11111111;
    PE_CR2 = 0x00;//PE_CR2=0b00000000;
    PE_ODR = 0x00;//PE_ODR=0b00000000;
	
	PF_DDR = 0x10;//PF_DDR=0b00010000;//ֻ��PF4
    //ֻ��PF4���̵������������
    PF_CR1 = 0x10;//PF_CR1=0b11111111;
    PF_CR2 = 0x00;//PF_CR2=0b00010000;
    PF_ODR = 0x00;//PF_ODR=0b00000000;

}
//******************************************************************************


//******************************************************************************
//�ⲿ�ж�3
//******************************************************************************
void  EXTI3_Init(void)
{
    EXTI_CR1 |= 0x80;//PORTd���½��ش���Pd2
    
}
//******************************************************************************

//******************************************************************************
//�ⲿ�ж�2
//******************************************************************************
void  EXTI2_Init(void)
{
    EXTI_CR1 |= 0x20;//PORTc���½��ش���Pc3/4
    
}
//******************************************************************************

//******************************************************************************
//ADת����ʼ��
//******************************************************************************
void  AD_Init(void)
{
    ADC_CSR = 0x05;//ѡ��AD����ͨ��5��ֹ�ж�
    ADC_CR1 |=0x71; // ʹ�� ADC �� 18 ��Ƶ
    ADC_CR2 |=0x08; // ���� �Ҷ��룬 low 8BIT AT ADC_DRL;
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
    Clear_Nrf24l01();
    Address_Pair[0]= Key_Check_ID1&0xff;//��λ
    Address_Pair[1]= Key_Check_ID1>>8;//��λ
    Address_Pair[2]= Key_Check_ID2;
    Address_Pair[3]= Key_Check_ID3&0xff;//��λ
    Address_Pair[4]= Key_Check_ID3>>8;//��λ
    Set_RX_Com_Mode();  
	for(int i = 0;i<5;i++)
	{
		Address_Rec[0][i] = RX_ADDRESS_0[i];
		Address_Rec[1][i] = RX_ADDRESS_1[i];
		Address_Rec[2][i] = RX_ADDRESS_2[i];
		Address_Rec[3][i] = RX_ADDRESS_3[i];
		Address_Rec[4][i] = RX_ADDRESS_4[i];
		Address_Rec[5][i] = RX_ADDRESS_5[i];
		Address_Rec[6][i] = Address_Pair[i];
	}
    
    Flag_Word = 0x11;       //�뿪������Ȧ��ʼ��ֵ0x11
    FULL_DOWN_BETTERFLY = 0;  //betterfly not full
	CNT_TOUCH_SET = 0;
	Pair_Succ = 0;
	Queue_Full_P0_Changed = 0;
	Step_ERR_Main = 1; //����������
	Flag_Right_Check = 0;
	Touch_Coil_On = 0;
	CNT_Send_Time = 1;
	Step_Normal = 0;
	Queue_Full = 0;
	Recv_Msg = 0;
	MacStatus = C_MSWork;
	STA_PAIR_CODE = 0;
	Sys_Start = 0;
	Flag_Supply_Volt_OK = 0;
	Flag_Supply_Volt_NO = 0;
	errno = 0;
	Fail_Num = 0;
	add_master_add = 0;
	ProcesstStatus = C_MSPair;
	myStatus = 0;
	Master_Comm_Re = 0xAA;
	Cut_OffPower = 0;
	Can_Pow_On = 0;
	CNT_PRINT = 0;
	Self_Num_Re = 1;
	FrmNumb = 0;
	Chanrg_Over = 0;		//δ������
	memset(master_cpd,0,sizeof(master_cpd));
	memset(self_cpd,0,sizeof(self_cpd));
	
	/*printf("sizeof(char) = %d\n",(int)sizeof(char));
	printf("sizeof(short) = %d\n",(int)sizeof(short));
	printf("sizeof(int) = %d\n",(int)sizeof(int));
	printf("sizeof(long) = %d\n",(int)sizeof(long));
	printf("sizeof(long long) = %d\n",(int)sizeof(long long));
	printf("sizeof(float) = %d\n",(int)sizeof(float));
	printf("sizeof(double) = %d\n",(int)sizeof(double));*/
}
//******************************************************************************
void Variable_Init_Second()
{
	//Flag_Supply_Volt_OK = 0;//��Ҫ������ʾ�Ǵ��ڴ����� 2017.01.17��ֵΪϵͳֵ��Ҫһֱ����ԭʼֵ�������ʼ�������ǵ��û��
    FULL_DOWN_BETTERFLY = 0;  //betterfly not full
	Recv_Msg = 0;   //�����Ҫת����ʶ
	Pair_Succ = 0;	//δ��Ա�ʶ
	Step_Normal = 0;	//ָʾ����˸
	Step_ERR_Main = 1; //����������
	MacStatus = C_MSWork;	//ϵͳĬ������
	ProcesstStatus = C_MSPair;//ϵͳĬ�����״̬
	myStatus = 0;			//�������֧
	Chanrg_Over = 0;		//δ������
	HaveChangedOver = 1;	//�����жϵ�ص�����֧
	STA_PAIR_CODE = 0;//�����ɱ�ʶȡ��
	CNT_PRINT = 0;         //���ڼ�¼������Ե����к�
	Self_Num_Re = 1;		//���ڼ�¼������Ե����к�
	CNT_TOUCH_SET = 0; 		//���ڼ�¼�Ӵ�ѹֵ���趨ֵ�����
	Touch_Coil_On = 0;  //δ�Ӵ�
    Flag_Word = 0x11;       //�뿪������Ȧ��ʼ��ֵ0x11
    Statu_Word_A = 0;//20170221���ʶ����
	Statu_Word_B = 0;
}

//******************************************************************************
void Variable_Init_Third()
{
	MacStatus = C_MSWork;	//ϵͳĬ������
	myStatus = 0;			//�������֧
	Chanrg_Over = 0;		//δ������
	HaveChangedOver = 0;	//�����жϵ�ص�����֧
    FULL_DOWN_BETTERFLY = 0;
}

//******************************************************************************
//��ʱ��4��ʼ��
//******************************************************************************
void  Time4_Init(void)
{
	TIM4_CR1 = 0x80; // b0 = 1, �������������
	TIM4_PSCR = 0x07; // ������ʱ�� = ��ʱ�� /16=16MHZ/128=8us
	TIM4_ARR = 0xfa; // �趨��װ��ʱ�ļĴ���ֵ250�� 255 �����ֵ 2ms
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
  	
}
//******************************************************************************

//******************************************************************************
//��ʱ��2��ʼ��
//******************************************************************************
void  Time2_Init(void)
{


}
//******************************************************************************

//******************************************************************************
//���Ժ���
//******************************************************************************
void  LED_TEST(void)
{
	if(Flag_10ms_G == 1)
	{	
        Flag_10ms_G = 0;
        CNT_TEST_ON++;

        if(CNT_TEST_ON >= 200)                    
        {
            CNT_TEST_ON = 0;
            PC_ODR_ODR2 = ~PC_ODR_ODR2;//LED1
            if(PC_IDR_IDR2)
            {
              PC_ODR_ODR1 = 0;
            }
            else
              PC_ODR_ODR1 = 1;
        }
	}
		
}

void  LED_TEST_INT(void)
{
	//����
    PC_ODR_ODR1 = 0;
    PC_ODR_ODR2 = 0;		
}

/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/

//******************************************************************************
//��ѹ��������
//******************************************************************************
void ProtectVoltage(const unsigned short *voltage)
{
	//assert(voltage == NULL);
		
}

//******************************************************************************
//������������
//******************************************************************************
void ProtectCurrent(const unsigned short *voltage)
{
	//assert(voltage == NULL);
		
}