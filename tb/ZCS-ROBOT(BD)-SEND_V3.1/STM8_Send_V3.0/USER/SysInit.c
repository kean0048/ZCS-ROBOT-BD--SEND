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

/* 声明出错信息 */ 
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
//系统初始化
//******************************************************************************
void  SysInit(void)
{   
    Clock_Init();               //系统时钟初始化16M内部/外部 
    Port_Init();                //IO口初始化 
    EXTI3_Init();               //外部中断初始化
    SPI_Init();                 //SPI初始化
	AD_Init(); 					//AD采样初始化
    //IWDG_Init();
	Time1_Init(); 				//4路还PWM输出初始化（输出互补波形）
    Time4_Init();               //定时器初始化定时1ms
    GetUniqueID(ChipUniqueID);  //获取器件ID    
    Key_Check_ID1 = crc_cal_value(ChipUniqueID, Length_ChipUniqueID);
    Key_Check_ID2 = crc_check_value(ChipUniqueID,Length_ChipUniqueID);
    Key_Check_ID3 = crc_sum_value(ChipUniqueID,Length_ChipUniqueID);
    Eeprom_Init();	
	GetEeprom(CHECK_ID); 		//读取EEprom中数据
	BuzzInit(); 				//蜂鸣器初始化
    NRF24L01_Init();            //初始化NRF24L01
	_delay_1_ms();
	Uart2_Init();               //串口通信初始化
    Variable_Init();            //清RAM变量值初始化
}
//******************************************************************************


//******************************************************************************
//系统时钟初始化
//******************************************************************************
void  Clock_Init(void)
{
    //使用外部晶振16M
    CLK_ECKR |=0x01; // 开启外部时钟
    while(!(CLK_ECKR & 0x02)); // 等待外部时钟 rdy
    CLK_CKDIVR &= 0x08; //CPU 无分频/8  0x18
    CLK_SWR = 0xB4; // 选择外部时钟
    while(!(CLK_SWCR & 0x08)); // 这里要等
    CLK_SWCR |=0x02; // 使能外部时     
}
//******************************************************************************


//******************************************************************************
//I/O口初始化
//******************************************************************************

void  Port_Init(void)
{                    
	/* PA3  IGBT_M_UP_ERR  输入
     * PA4  IGBT_M_DN_ERR  输入
     * PA5  O_INPUT_VOL    输入
     * PA6  O_INPUT_CUR    输入
     */
    PA_DDR = 0x00; //PA_DDR=0b00000000;
    PA_CR1 = 0x00; //PA_CR1=0b00000000;
    PA_CR2 = 0x78; //PA_CR2=0b01111000;
    PA_ODR = 0x00; //PA_ODR=0b00000000;
    /* PB0  NTC_COIL_DET  输入
     * PB1  NTC_IGBT_DET  输入
     * PB2  PWR_VOL_DET   输入
     * PB3  PWR_CUR_DET   输入
     * PB4  空            输出
     * PB5  空            输出
     * PB6  O_COIL_CUR    输入
     * PB7  O_COIL_VOL    输入
     */
    PB_DDR = 0x30; //PB_DDR=0b00110000;
    PB_CR1 = 0x30; //PB_CR1=0b00110000;  上拉输入推挽输出
    PB_CR2 = 0xC0; //PB_CR2=0b11000000;  输入中断输出高速
    PB_ODR = 0x00; //PB_ODR=0b00000000;  输出信号锁存
    /* PC1  PWM_HIGH_1    输出
     * PC2  PWM_LOW_1     输出
     * PC3  SPI_CE        输出
     * PC4  SPI_IRQ       输入
     * PC5  SPI_CLK       输出
     * PC6  SPI_MOSI      输出
     * PC7  SPI_MISO      输入
     */
    PC_DDR = 0x6f; //PC_DDR=0b01101111;     数据方向 

    PC_CR1 = 0xff; //PC_CR1=0b11111111;  上拉输入推挽输出
    PC_CR2 = 0x40; //PC_CR02=0b01000000;//输入中断输出高速
    PC_ODR = 0x00; //PC_ODR=0b00000000; //输出信号锁存

    /* PD0  1_WIRE       输出
     * PD1  SWIM         输出
     * PD2  MCU_DAC_PWM  输出     
     * PD3  FAN_PWM      输出
     * PD4  BEEP_EN      输出
     * PD5  UART_TX      输出
     * PD6  UART_RX      输入
     * PD7  UP_DN_WAVE   输入
     */
    PD_DDR = 0x3f; //PD_DDR=0b00111111;
    PD_CR1 = 0xff; //PD_CR1=0b11111111;
    PD_CR2 = 0x00; //PD_CR2=0b00000000;
    PD_ODR = 0x00; //PD_ODR=0b00000000;
    /* PE0  MCU_OPEN     输出（高）
     * PE1  SCL          输出
     * PE2  SDA          输入
     * PE3  IGBT_ERR     输入（浮空）
     * PE5  SPI_NSS      输出
     * PE6               输出
     * PE7               输出
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
//AD转换初始化
//******************************************************************************

void AD_Init(void)
{
    ADC_CSR = 0x05; //选着AD采样通道5禁止中断
    ADC_CR1 |= 0x71; // 使能 ADC ， 18 分频
    ADC_CR2 |= 0x08; // 数据 右对齐， low 8BIT AT ADC_DRL;
}
//******************************************************************************

//******************************************************************************
//外部中断
//******************************************************************************
void  EXTI3_Init(void)
{
    //PORTA仅下降沿触发PA3/4/5/6 
    //PORTB仅下降沿触发PB6/7
	//PORTC仅下降沿触发PC4
    //EXTI_CR1 = 0x00;
	EXTI_CR1 = 0x2a;//00下降沿和低电平触发 01仅上升沿触发 10仅下降沿触发 11上升沿和下降沿触发000000
}
//******************************************************************************


//******************************************************************************
//SPI初始化
//******************************************************************************
void  SPI_Init(void)
{
    SPI_CR1 =0x0C;  // 16M/128/256； MSB 先；主设备；CPOL = 1；CPHA= 0  
    SPI_CR2 =0x03;  // 双线全双工；软件管理；无CRC 
    SPI_CR1|=0x40;  // 开启SPI总线
}
//******************************************************************************


//******************************************************************************
//变量值初始化
//******************************************************************************
void Variable_Init(void)
{
	//发送模式初始化
    Set_TX_Com_Mode();
	
    Clear_Nrf24l01();
    Address_Pair[0]= Key_Check_ID1&0xff;//低位
    Address_Pair[1]= Key_Check_ID1>>8;//高位
    Address_Pair[2]= Key_Check_ID2;
    Address_Pair[3]= Key_Check_ID3&0xff;//低位
    Address_Pair[4]= Key_Check_ID3>>8;//高位
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

	//初始化放置主机和从机地址的数组
	memset(Address_Pair_Child,0,sizeof(Address_Pair_Child));
	memset(Address_Pair_Parent,0,sizeof(Address_Pair_Parent));
	//时标初始化
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
	memset(AUTO_Array,0,sizeof(AUTO_Array));//20170225 确保万一，本人无法想到什么情况下会会出现这种情况
    
	if(Flag_RECV_ADDRESS_NUM_SAME != 0)
	{
		Flag_RECV_ADDRESS_NUM_SAME = 0;
		Flag_RECV_ADDRESS_NUM = 0;
	}
	CNT_FULL_Num = 0;//20170227
	flag_recheck_over = 0;
	for(int k = 0;k < 5;k++)
	{
		flg_stop_send_in[k] = 0;//每次进入这里就开启一个新的轮回，从零开始保存数据	
		Flg_Chenal_OK[k] = 0x02;
		Flg_Chenal_Fail[k] = 0;
		CNT_Rec_Check_Fail[k] = 1;
		Flag_FRIST_IN[k] = 0;
		flag_check_succ[k] = 0;
	}
}

//******************************************************************************
//定时器4初始化 8M
//******************************************************************************
void  Time4_Init(void)
{
    /*TIM4_IER = 0x00; // 禁止中断
    TIM4_EGR = 0x01; // 允许产生更新事件
    TIM4_PSCR = 0x07; // 计数器时钟 = 主时钟 /64=8MHZ/64=125000
    TIM4_ARR = 0x7c; // 设定重装载时的寄存器值， 255 是最大值
    TIM4_CNTR = 0x7c; // 设定计数器的初值
    //定时周期 =(ARR+1)*125=1000uS
    TIM4_CR1 = 0x01; // b0 = 1, 允许计数器工作
    //b1 = 0, 允许更新
    //设置控制器，启动定时器
    TIM4_IER = 0x01; // 允许更新中断*/
	
	TIM4_CR1 = 0x80; // b0 = 1, 允许计数器工作
	TIM4_PSCR = 0x07; // 计数器时钟 = 主时钟 /128=16MHZ/128=8us
	TIM4_ARR = 0xfa; // 设定重装载时的寄存器值250， 255 是最大值
	TIM4_IER = 0x01; // 允许更新中断
    TIM4_EGR = 0x01; // 允许产生更新事件
	TIM4_CR1 |= 0x01;
}
//******************************************************************************

//******************************************************************************
//定时器1初始化
//******************************************************************************
void  Time1_Init(void)
{
	unsigned int data;
	
	TIM1_CR1 = 0x27; //TIM1_CR1 = 0B00100111;
    //通道1和2输出
    TIM1_CCMR1 = 0x60; //TIM1_CCMR1=0B01100000;//TIM1_CH1模式1
    TIM1_CCMR2 = 0x70; //TIM1_CCMR2=0B01110000;//TIM1_CH2模式2
    TIM1_CCER1 = 0x11; //TIM1_CCER1=0B00010001;//TIM1_CH1		
    //通道3和4输出
    TIM1_CCMR3 = 0x00; //0x60; //TIM1_CCMR3 = 0B01100000;//TIM1_CH3模式1
    TIM1_CCMR4 = 0x00; //0x70; //TIM1_CCMR4 = 0B01110000;//TIM1_CH4模式2
    TIM1_CCER2 =0x00; // 0x11; //TIM1_CCER2 = 0B00010001;//TIM3_CH4
    //指定工作频率
	//20170223频率为30K，死区时间为30us
    /*TIM1_ARRH = (8000 / 30) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率20K
    TIM1_ARRL = (8000 / 30) % 256;
	//TIM1_ARR = 308; f = 26k
	TIM1_ARR = 267; //f = 30k*/
	
	TIM1_ARRH = (FOSC_16M/2 / FREQUET) / 256; //（16M/2/30K）16M时钟，中央对齐模式除以2，频率30K
    TIM1_ARRL = (FOSC_16M/2 / FREQUET) % 256;
	data = TIM1_ARRH;
	TIM1_ARR = data * 256 + TIM1_ARRL;

    //指定占空比 ch1 和 ch2互补
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
-----------------------------    看门狗初始化   -------------------------------
*******************************************************************************/
void  IWDG_Init(void)
{
    IWDG_KR = 0xCC; //当IWDG_KR被写入数值0xCC，独立看门狗被启动了
    IWDG_KR = 0x55;  //解除 PR 及 RLR 的写保护
    IWDG_RLR = 0xff; //看门狗计数器重装载数值         
    IWDG_PR = 0x06; //分频系数为4，最长超时时间为：1.02S
    IWDG_KR = 0xAA; //恢复 PR 及 RLR 的写保护状态
}
/******************************************************************************/

//******************************************************************************
//数据校验函数
//******************************************************************************
unsigned char CheckRecvDate(unsigned char *pCode)
{
    return 0;
}
//******************************************************************************

//******************************************************************************
//数据解码函数
//******************************************************************************
void streamTodecode(unsigned char *pFrmCode)
{

}
//******************************************************************************

//******************************************************************************
//新地址检查函数
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
//计算功率函数
//******************************************************************************
unsigned short CalculatedPower(const unsigned short *current,const unsigned short *voltage)
{
	assert(current == NULL || voltage == NULL);
	unsigned int tempI = *current;
	unsigned int tempV = *voltage;
	return tempI*tempV;	
}

//******************************************************************************
//低电压保护函数
//******************************************************************************
void ProtectLowVoltage(const unsigned short *voltage)
{
	assert(voltage == NULL);
	unsigned short tempV = *voltage;
	if(tempV <= ProtectVolValue)
	{
		//蜂鸣器：一长一短 告警
		BuzzChange(60,20,2);
	}		
}

//******************************************************************************
//IGBT温度采样处理函数
//******************************************************************************
short GetPwmValueFromIGBTtemp(const unsigned short *IgbtValue)
{
	assert(NULL == IgbtValue);
	unsigned short tempIgbtV = *IgbtValue;
	/*if(tempIgbtV == 0 || tempIgbtV == 5)
	{
		//一长两短报警
		BuzzChange(60,20,3);
		return ERR_0_5_Sensor_IGBT_ERR;
	}
	else */
	if(tempIgbtV >= IGBT_TEMP_VALUE_UP)
	{
		//停止工作
		PE_ODR_ODR0 = 1;//关断IGBT
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
//线圈温度采样处理函数
//******************************************************************************
short GetPwmValueFromCOILtemp(const unsigned short *CoilValue)
{
	assert(NULL == CoilValue);
	unsigned short tempCoilV = *CoilValue;
	/*if(tempCoilV == 0 || tempCoilV == 5)
	{
		//一长三短报警
		BuzzChange(60,20,4);
		return ERR_0_5_Sensor_COIL_ERR;
	}
	else */
	if(tempCoilV >= COIL_TEMP_VALUE_UP)
	{
		//停止工作
		PE_ODR_ODR0 = 1;							//关断IGBT
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
	//Time1_Need_cycle = temp_cycle/(4*2);			//四分之一，因为四个产品，每一个发送过来的都只是发射端的1/4,再除以2是因为数值比例为1:2，即1代表输出pwm值为2%
	Time1_Need_cycle = 50;//25%
}

/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/