/******************************************************************************/
/*					                                      */
/*	Project Name :	接收机		                                      */
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
#include "Buzz.h"


//******************************************************************************
//蜂鸣器函数
//******************************************************************************
void  Buzzer(void)
{	
    if(Flag_10ms_F ==1)
    {
        Flag_10ms_F = 0;
        BuzzerNewOld();
        switch (Buzz_Buffer)
        {
            case  BUZZ_POWER_ON://上电
                BuzzChange(100,0,1);
                break;
            case  BUZZ_KEY_ON://按键
                BuzzChange(10,0,1);
                break;
            case  BUZZ_IN_Error_0://过流
                BuzzChange(20,0,1);
                break;
            case  BUZZ_IN_Error_1://过压
                BuzzChange(20,0,1);
                break;
            case  BUZZ_IN_Error_2://NTC短路
                BuzzChange(20,30,2); 
                break;
            case  BUZZ_IN_Error_3://NTC开路
                BuzzChange(20,30,2);
                break;
            case  BUZZ_IN_Error_4://IGBT超温
                BuzzChange(20,30,3);
                break;
            case  BUZZ_IN_Error_5://风扇异常
                BuzzChange(20,30,4);
                break;
            case  BUZZ_IN_Error_6://通信异常
                BuzzChange(20,30,5); 
                break;
            case  BUZZ_IN_Error_7://效率异常
                BuzzChange(20,30,6);
                break;
            case  BUZZ_IN_Error_8://没有查询指令，回复到p0通道，发出一声滴
                BuzzChange(10,0,1); 
                break;
            case  BUZZ_IN_Error_9://电压过高
                BuzzChange(80,20,2); 
                break;
            case  BUZZ_IN_Error_10://检测从机异常
                BuzzChange(80,20,3); 
                break;
            case  BUZZ_IN_Error_11://检测从机异常
                BuzzChange(80,20,4); 
                break;
            case  BUZZ_EXIT_Error://退出故障
                BuzzChange(100,0,1);
                break;	
            default:
                Buzz_Buffer = 0;
                break;
        }
    }
}
//******************************************************************************


//******************************************************************************
//蜂鸣器函数
//******************************************************************************
void  BuzzerNewOld(void)
{
    if(Buzz_Control != 0)//说明有新的蜂鸣器来了
    {
        Buzz_Times_CNT = 0;
        Buzz_Keep_CNT = 0;
        Buzz_Step = 0;
        Buzz_Buffer = 0;
        BuzzDriver(BUZZ_CLOSE);
        CNT_Buzzer++;
        if(CNT_Buzzer >= 5)//延时10*5＝50ms
        {
            CNT_Buzzer = 0;
            Buzz_Buffer = Buzz_Control;
            Buzz_Control = 0;
        }
    }
}
//******************************************************************************


//******************************************************************************
//蜂鸣器初始化函数
//******************************************************************************
void  BuzzInit(void)//要解锁后执行
{
    //unsigned char i;
    Command_Old = 0XFF;
    Buzz_Control = BUZZ_POWER_ON;
    /*
    FLASH_CR2 = 0x80;
    i=10;
    while(i--);
    FLASH_NCR2 = 0x7f;
    i=10;
    while(i--);
    *((unsigned char *)0x4803) = 0x80;
    i=10;
    while(i--);
    *((unsigned char *)0x4804) = 0x7f;
    BEEP_CSR=0X02;
    */
}
//******************************************************************************


//******************************************************************************
//蜂鸣器函数
//******************************************************************************
void  BuzzChange(unsigned char Buzz_On,unsigned char Buzz_Off,unsigned char Buzz_Times)
{
    switch (Buzz_Step)
    {
        case  0://on
            Buzz_Keep_CNT++;
            if (Buzz_Keep_CNT > Buzz_On)
            {
                Buzz_Keep_CNT = 0;                
                Buzz_Times_CNT++;
                if (Buzz_Times_CNT >= Buzz_Times)
                {
                    Buzz_Times_CNT = 0;
                    Buzz_Buffer = 0;
                    Buzz_Step = 0;
                    BuzzDriver(BUZZ_CLOSE);
                }
                else
                {
                    Buzz_Step = 1;//on to off
                    BuzzDriver(BUZZ_CLOSE);
                }
            }
            else
            {
                BuzzDriver(BUZZ_OPEN);
            }
            break;
        case  1://off
            Buzz_Keep_CNT++;
            if (Buzz_Keep_CNT >= Buzz_Off)  
            {
                Buzz_Keep_CNT = 0;
                Buzz_Step = 0;//off to on
                if (Buzz_Times_CNT < Buzz_Times)
                {
                    BuzzDriver(BUZZ_OPEN);      
                    Buzz_Keep_CNT++;            
                }
            }
            break;
        default:
            Buzz_Step = 0;
            Buzz_Buffer = 0;
            BuzzDriver(BUZZ_CLOSE);
            break;
    }
}
//******************************************************************************


//******************************************************************************
//蜂鸣器函数
//******************************************************************************
void  BuzzDriver(unsigned char Command_New)
{
    if (Command_Old != Command_New)
    {
        Command_Old = Command_New;
        if (Command_Old == BUZZ_OPEN)
        {
            BuzzStart();
        }
        else if (Command_Old == BUZZ_CLOSE)
        {
            BuzzStop();
        }
    }
}
//******************************************************************************


//******************************************************************************
//开启蜂鸣器函数
//******************************************************************************
void  BuzzStart(void)
{
    //BEEP_CSR_BEEPEN =1;
    PD_ODR_ODR4 =1;
}
//******************************************************************************


//******************************************************************************
//关闭蜂鸣器函数
//******************************************************************************
void  BuzzStop(void)
{
    //BEEP_CSR_BEEPEN =0;
    PD_ODR_ODR4 =0;
}
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/