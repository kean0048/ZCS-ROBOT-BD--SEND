/******************************************************************************/
/*					                                      */
/*	Project Name :	发射机		                                      */
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


/*******************************************************************************
-----------------------------    Include files   -------------------------------
*******************************************************************************/
#include "type_def.h"


#define  SCLK    PB_ODR_ODR4
#define  DIO     PB_ODR_ODR5
//#define   DIO    PD_ODR_ODR3
//#define   SCLK     PB_ODR_ODR3
#define  nop     asm("nop")
static const unsigned char Display[16] =
{0xd7,0x14,0xcd,0x5d,0x1e,0x5b,0xdb,0x15,0xdf,0x5f,0xdd,0xda,0xc3,0xdc,0xcb,0x8b};
//******************************************************************************
//开始信号
//******************************************************************************
void START_PROC(void)

{
    SCLK = 0;
    nop;
    nop;
    nop;
    nop;
    DIO=1;
    nop;
    nop;
    nop;
    nop;
    SCLK=1;
    nop;
    nop;
    nop;
    nop;
    nop;
    DIO=0;
    nop;
    nop;
}
//******************************************************************************


//******************************************************************************
//结束信号
//******************************************************************************
void STOP_PROC(void)
{
    SCLK = 0;
    nop;
    nop;
    nop;
    nop;
    DIO = 0;
    nop;
    nop;
    nop;
    nop;
    SCLK = 1;
    nop;
    nop;
    nop;
    nop;
    nop;
    DIO = 1;
    nop;
    nop;
}          
//******************************************************************************


//******************************************************************************
//写数据给IC
//******************************************************************************
void WRITE_PROC(unsigned char j)

{
    unsigned char i;
    for(i=0;i<8;i++)
    {  
        SCLK=0;
        nop;
        nop;
        nop;
        nop;
        nop;
        if(j&0x01) 
            DIO=1;
        else 
            DIO=0;
        nop;
        nop;
        nop;
        nop;
        nop;
        nop;
        SCLK=1;
        nop;
        nop;
        nop;
        nop;
        nop;
        SCLK=0;
        j>>=1;
        nop;
        nop;
    }
}  
//******************************************************************************


//******************************************************************************
//应答信号
//******************************************************************************
void ACK_PROC(void)
{
    SCLK = 0;
    nop;
    nop;
    nop;
    nop;
    DIO = 1;
    nop;
    nop;
    nop;
    nop;
    SCLK = 1;
    nop;
    nop;
    nop;
    nop;   
}
//******************************************************************************


//******************************************************************************
//显示子程序
//******************************************************************************
void DISPLAY(void)
{
    SCLK=1;
    DIO=1;
    START_PROC();//调用开始命令，
    WRITE_PROC(0X40);
    //写命令40H（数据设置），地址自动加一写8位数据给R1.6
    //ACK_PROC()         ;//判断ACK应答信号
    STOP_PROC()        ;
    //调用结束信号，一个字节命令发送完毕，可以发送下一个命令
    nop;
    nop;
    nop;   
    START_PROC();
    WRITE_PROC(0XC0);//写起始地址命令（0C0H），地址从00H单元开始。
    //ACK_PROC() ;//起始地址送完后，判ACK信号，如果有ACK信号就直接送数据给显示寄存器。
    WRITE_PROC(Display[LED[0]]);
    WRITE_PROC(Display[LED[1]]);
    WRITE_PROC(Display[LED[2]]);
    WRITE_PROC(Display[LED[3]]);
    WRITE_PROC(Display[LED[4]]);
    WRITE_PROC(Display[LED[5]]);
    WRITE_PROC(Display[LED[6]]);
    WRITE_PROC(Display[LED[7]]);
    WRITE_PROC(Display[LED[8]]);
    WRITE_PROC(Display[LED[9]]);
    WRITE_PROC(Display[LED[10]]);
    WRITE_PROC(Display[LED[11]]);
    WRITE_PROC(Display[LED[12]]);
    WRITE_PROC(Display[LED[13]]);
    WRITE_PROC(Display[LED[14]]);
    WRITE_PROC(Display[LED[15]]);
    STOP_PROC();//送完6个字节显示寄存器数据，送结束信号。
    nop;
    nop;
    nop; 
    START_PROC();
    WRITE_PROC(0X8b);
    //送开屏命令，（8BH），亮度可以根据低三位调节。
    //ACK_PROC();
    STOP_PROC();
}
//******************************************************************************


//******************************************************************************
//显示更新
//******************************************************************************
void DisplayEndue(void)
{
    //调试主机电压电流
    /*
    LED[0] = (ACVolt_DD/100)%10;
    LED[1] = (ACVolt_DD/1000)%10;
    LED[2] = (ACVolt_DD/10000)%10;
    LED[3] = 0;

    LED[4] = ACCurr_DD%10;
    LED[5] = (ACCurr_DD/10)%10;
    LED[6] = (ACCurr_DD/100)%10;
    LED[7] = (ACCurr_DD/1000)%10;

    LED[12] = ACCurr_AD%10;
    LED[13] = (ACCurr_AD/10)%10;
    LED[14] = (ACCurr_AD/100)%10;
    LED[15] = (ACCurr_AD/1000)%10;

    LED[8] = TX_Pro_Code_A%16;
    LED[9] = TX_Pro_Code_A/16;
    LED[10] = TX_Pro_Code_B%16;
    LED[11] = TX_Pro_Code_B/16;
    */
    //调试从机电压电流

    LED[0] = (RX_ACVolt_DD/100)%10;
    LED[1] = (RX_ACVolt_DD/1000)%10;
    LED[2] = (RX_ACVolt_DD/10000)%10;
    LED[3] = 0;

    LED[4] = RX_ACVolt_AD%10;
    LED[5] = (RX_ACVolt_AD/10)%10;
    LED[6] = (RX_ACVolt_AD/100)%10;
    LED[7] = (RX_ACVolt_AD/1000)%10;

    LED[8] = RX_ACCurr_DD%10;
    LED[9] = (RX_ACCurr_DD/10)%10;
    LED[10] = (RX_ACCurr_DD/100)%10;
    LED[11] = (RX_ACCurr_DD/1000)%10;

    LED[12] = RX_ACCurr_AD%10;
    LED[13] = (RX_ACCurr_AD/10)%10;
    LED[14] = (RX_ACCurr_AD/100)%10;
    LED[15] = (RX_ACCurr_AD/1000)%10;

    if(Flag_10ms_L == 1)
    {
        //Flag_10ms_L =0;
        CNT_Display++;
        if(CNT_Display >= 50)
        {
            DISPLAY();
        }
    }
}
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/