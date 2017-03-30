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
#include "SysInit.h"
#include "Nrf24l01.h"
#include "string.h"
#include "Eeprom.h"
#include "uart.h"
#include "ADSample.h"

/* 声明出错信息 */ 
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
//系统初始化
//******************************************************************************

unsigned char Step_Normal;
unsigned char Step_ERR_Main;
int SysInit(void)
{   
    Clock_Init();               //系统时钟初始化16M内部/外部 
    Port_Init();                //IO口初始化 
    EXTI3_Init();               //外部中断初始化
	EXTI2_Init();	
    SPI_Init();                 //SPI初始化
	Time4_Init();               //定时器初始化定时1ms
	Uart2_Init();               //串口通信初始化
	AD_Init();                  //AD采样初始化    
    //Time1_Init();               //定时器初始化定时1ms	
	GetUniqueID(ChipUniqueID);  //获取器件ID    
    Key_Check_ID1 =crc_cal_value(ChipUniqueID, Length_ChipUniqueID);
    Key_Check_ID2 = crc_check_value(ChipUniqueID,Length_ChipUniqueID);
    Key_Check_ID3 = crc_sum_value(ChipUniqueID,Length_ChipUniqueID);
    Eeprom_Init();
	GetEeprom(CHECK_ID);        //读取EEprom中数据
    NRF24L01_Init();            //初始化NRF24L01
    Variable_Init();            //清RAM变量值初始化
	return 1;
}
//******************************************************************************


//******************************************************************************
//系统时钟初始化
//******************************************************************************
void  Clock_Init(void)
{
    //使用外部晶振16M
    CLK_ECKR |= 0x01;        	// 开启外部时钟
    while(!(CLK_ECKR & 0x02)); // 等待外部时钟 rdy
    CLK_CKDIVR &= 0xf8; 		//CPU 无分频 ，内部时钟8分频
    CLK_SWR = 0xB4; 			// 选择外部时钟
    while(!(CLK_SWCR & 0x08)); // 这里要等
    CLK_SWCR |= 0x02; 			// 使能外部时     
}
//******************************************************************************


//******************************************************************************
//I/O口初始化
//******************************************************************************
void  Port_Init(void)
{                    
    PA_DDR = 0x04;//PA_DDR=0b00000100;p1IN;P2 OUT;
    //PA口都不考虑
	//PA1 OSCIN
	//PA2 OSCOUT
    PA_CR1 = 0xfd;//PA_CR1=0b11111101;
    PA_CR2 = 0x00;//PA_CR2=0b00000000;
    PA_ODR = 0x00;//PA_ODR=0b00000000;

    PB_DDR = 0x30;//PB_DDR=0b00110000;
    //PB0（模拟电压输入）（浮空输入）
    //PB1（模拟电流输入）（浮空输入）
    //PB2（模拟温度输入）（浮空输入）
    //PB3（bat电压输入）（浮空输入）
    //PB4（i2c scl）
    //PB5（i2c sda）
    //PB6（引脚没有引出）
    //PB7（引脚没有引出）
    PB_CR1 = 0xf0;//PB_CR1=0b11110000;
    PB_CR2 = 0x00;//PB_CR2=0b00000000;10M
    PB_ODR = 0x30;//PB_ODR=0b00110000;I2C高电平

    PC_DDR = 0x66;//PC_DDR=0b01100110;
    //PC0（引脚没有引出）
    //PC1（LED2输出）
    //PC2（LED1输出）
    //PC3（CURR_OVER输入）过流中断
    //PC4（VOLT_OVER输入）过压中断
    //PC5（SPI_CLK输出）
    //PC6（SPI_MOSI输出）
    //PC7（SPI_MISO输入）(上拉)
    PC_CR1 = 0xe7;//PC_CR1=0b11111000;
    PC_CR2 = 0x58;//PC_CR2=0b01011110;//高速
    PC_ODR = 0x00;//PC_ODR=0b00000000;
    
    PD_DDR = 0x2B;//PD_DDR=0b00101011;
    //PD0（SPI_CE输出）
    //PD1（SWIM口）（输出）
    //PD2（SPI_IRQ输入）
    //PD3（FAN_PWM）输出
    //PD4（RF_SIGNAL输入）
    //PD5（UART2_TX输出）
    //PD6（UART2_RX输入）
    //PD7（OVER_INPUT_VOL输入）
    PD_CR1 = 0xef;//PD_CR1=0b11101111;
    PD_CR2 = 0x84;//PD_CR2=0b10000100;使能外部中断pd2/7,swim 速率2m
    PD_ODR = 0x00;//PD_ODR=0b00000000;

    PE_DDR = 0x20;//PE_DDR=0b00100000;
    //只有PE5（SPI_NSS输出）
    PE_CR1 = 0xff;//PE_CR1=0b11111111;
    PE_CR2 = 0x00;//PE_CR2=0b00000000;
    PE_ODR = 0x00;//PE_ODR=0b00000000;
	
	PF_DDR = 0x10;//PF_DDR=0b00010000;//只有PF4
    //只有PF4（继电器控制输出）
    PF_CR1 = 0x10;//PF_CR1=0b11111111;
    PF_CR2 = 0x00;//PF_CR2=0b00010000;
    PF_ODR = 0x00;//PF_ODR=0b00000000;

}
//******************************************************************************


//******************************************************************************
//外部中断3
//******************************************************************************
void  EXTI3_Init(void)
{
    EXTI_CR1 |= 0x80;//PORTd仅下降沿触发Pd2
    
}
//******************************************************************************

//******************************************************************************
//外部中断2
//******************************************************************************
void  EXTI2_Init(void)
{
    EXTI_CR1 |= 0x20;//PORTc仅下降沿触发Pc3/4
    
}
//******************************************************************************

//******************************************************************************
//AD转换初始化
//******************************************************************************
void  AD_Init(void)
{
    ADC_CSR = 0x05;//选着AD采样通道5禁止中断
    ADC_CR1 |=0x71; // 使能 ADC ， 18 分频
    ADC_CR2 |=0x08; // 数据 右对齐， low 8BIT AT ADC_DRL;
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
    Clear_Nrf24l01();
    Address_Pair[0]= Key_Check_ID1&0xff;//低位
    Address_Pair[1]= Key_Check_ID1>>8;//高位
    Address_Pair[2]= Key_Check_ID2;
    Address_Pair[3]= Key_Check_ID3&0xff;//低位
    Address_Pair[4]= Key_Check_ID3>>8;//高位
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
    
    Flag_Word = 0x11;       //离开发射线圈初始化值0x11
    FULL_DOWN_BETTERFLY = 0;  //betterfly not full
	CNT_TOUCH_SET = 0;
	Pair_Succ = 0;
	Queue_Full_P0_Changed = 0;
	Step_ERR_Main = 1; //主程序正常
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
	Chanrg_Over = 0;		//未充满电
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
	//Flag_Supply_Volt_OK = 0;//主要用来表示是存在存电过程 2017.01.17该值为系统值，要一直保留原始值，无需初始化，除非电池没电
    FULL_DOWN_BETTERFLY = 0;  //betterfly not full
	Recv_Msg = 0;   //配对需要转换标识
	Pair_Succ = 0;	//未配对标识
	Step_Normal = 0;	//指示灯闪烁
	Step_ERR_Main = 1; //主程序正常
	MacStatus = C_MSWork;	//系统默认正常
	ProcesstStatus = C_MSPair;//系统默认配对状态
	myStatus = 0;			//进入充电分支
	Chanrg_Over = 0;		//未充满电
	HaveChangedOver = 1;	//进入判断电池电量分支
	STA_PAIR_CODE = 0;//配对完成标识取消
	CNT_PRINT = 0;         //用于记录本次配对的序列号
	Self_Num_Re = 1;		//用于记录本次配对的序列号
	CNT_TOUCH_SET = 0; 		//用于记录接触压值超设定值后计数
	Touch_Coil_On = 0;  //未接触
    Flag_Word = 0x11;       //离开发射线圈初始化值0x11
    Statu_Word_A = 0;//20170221充电识别码
	Statu_Word_B = 0;
}

//******************************************************************************
void Variable_Init_Third()
{
	MacStatus = C_MSWork;	//系统默认正常
	myStatus = 0;			//进入充电分支
	Chanrg_Over = 0;		//未充满电
	HaveChangedOver = 0;	//进入判断电池电量分支
    FULL_DOWN_BETTERFLY = 0;
}

//******************************************************************************
//定时器4初始化
//******************************************************************************
void  Time4_Init(void)
{
	TIM4_CR1 = 0x80; // b0 = 1, 允许计数器工作
	TIM4_PSCR = 0x07; // 计数器时钟 = 主时钟 /16=16MHZ/128=8us
	TIM4_ARR = 0xfa; // 设定重装载时的寄存器值250， 255 是最大值 2ms
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
  	
}
//******************************************************************************

//******************************************************************************
//定时器2初始化
//******************************************************************************
void  Time2_Init(void)
{


}
//******************************************************************************

//******************************************************************************
//测试函数
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
	//常亮
    PC_ODR_ODR1 = 0;
    PC_ODR_ODR2 = 0;		
}

/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/

//******************************************************************************
//电压保护函数
//******************************************************************************
void ProtectVoltage(const unsigned short *voltage)
{
	//assert(voltage == NULL);
		
}

//******************************************************************************
//电流保护函数
//******************************************************************************
void ProtectCurrent(const unsigned short *voltage)
{
	//assert(voltage == NULL);
		
}