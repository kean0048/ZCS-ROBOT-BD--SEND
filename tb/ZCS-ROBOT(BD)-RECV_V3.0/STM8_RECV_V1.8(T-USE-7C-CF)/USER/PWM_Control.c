/******************************************************************************/
/*					                                      */
/*	Project Name :	接收机		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	中惠创智（深圳）无线供电技术有限公司                     */
/*						                              */
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
*******************************************************************************/


/*******************************************************************************
-----------------------------    Include files   -------------------------------
*******************************************************************************/
#include "type_def.h"


//******************************************************************************
/*驱动全桥波形输出*/
//******************************************************************************
void  PWM_Control(void)//驱动全桥波形输出
{

    switch(MacStatus)
    {
	case  C_MSIdle://待机
	{
            Time1_PWM_Close_Mode2();//正常关闭PWM输出(缓慢关闭）
            break;
	}
	case  C_MSScan://查询接收机
	{
            Time1_PWM_Close_Mode2();//正常关闭PWM输出(缓慢关闭）
            break;
	}
	case  C_MSPair://配对
	{
          
            Time1_PWM_Close_Mode2();//正常关闭PWM输出(缓慢关闭）
            break;
	}
	case  C_MSWork://供电
	{
            Adjust_Time1_cycle(Time1_Need_cycle);
            break;
	}
	case  C_MSProt://异常
	{
            Time1_PWM_Close_Mode2();//正常关闭PWM输出(缓慢关闭）
            break;
	}
	default:
            break;
    }
}
//******************************************************************************


//******************************************************************************
/*等待查询阶段和等待发送配对信号*/
//******************************************************************************
void  PauseHeat(unsigned int ptime,unsigned char nextstep)
{
    Flag_PHCEn = 1;		// pause heat time count enable
    if(CNT_PHeat >= ptime)
    {
        Flag_PHCEn = 0;
        CNT_PHeat = 0;
        if(nextstep ==20)
        {
            MacStatus = C_MSWork;//主机配对阶段等待
            CNT_Prot[6] = 500;//CNT_Prot[protype] = 500;
            Mode_Rec_Send = 1;//接收模式
         }
        else//PWM发送阶段等待
        {
            Step_Work = nextstep;
        }
    }
}
//******************************************************************************


//******************************************************************************
/*快速关闭PWM输出*/
//******************************************************************************
void  Time1_PWM_Close_Mode1(void)
{
    TIM1_CCR1H = 0;
    TIM1_CCR1L = 0;
    Time1_Work_cycle =0;      
}
//******************************************************************************


//******************************************************************************
/*正常关闭PWM输出(缓慢关闭）*/
//******************************************************************************
void  Time1_PWM_Close_Mode2(void)//正常关闭PWM输出(缓慢关闭）
{ 
     if(Time1_Work_cycle <= Min_cycle)
    {
        Time1_PWM_Close_Mode1();
    }
    else
    {
        if(Flag_1ms_H ==1)
        {
            Flag_1ms_H =0;
            Time1_Work_cycle--;	
            //指定占空比
            TIM1_CCR1H = ((Time1_Work_cycle * TIM1_ARR)/200)/256;
            TIM1_CCR1L = ((Time1_Work_cycle * TIM1_ARR)/200)%256;
        }
    }
}
//******************************************************************************


//******************************************************************************
/*指定占空比，输出PWM*//*占空比一般10%到48%内*/
//******************************************************************************
void  Adjust_Time1_cycle(unsigned char cycle)//cycle=100表示占空比50%
{
    unsigned int data;
    unsigned char num1l,num1h;
    if(Flag_10ms_E ==1)
    {
        Flag_10ms_E =0;
        if(cycle >= Max_cycle)
        {
            cycle = Max_cycle;
            Time1_Work_cycle = cycle;
            num1h = TIM1_ARRH;
            num1l = TIM1_ARRL;
            data = num1h;
            TIM1_CCR1 = data*256 + num1l +1;
            TIM1_CCR1H = num1h;
            TIM1_CCR1L = num1l;
            
        }
        else if(Time1_Work_cycle < cycle)
        {
            Time1_Work_cycle++;	
            num1h = ((Time1_Work_cycle * TIM1_ARR)/200)/256;
            num1l = ((Time1_Work_cycle * TIM1_ARR)/200)%256;
            data = num1h;
            TIM1_CCR1 = data*256 + num1l;
            TIM1_CCR1H = num1h;
            TIM1_CCR1L = num1l;
	}
        else if(Time1_Work_cycle > cycle)
        {
            Time1_Work_cycle--;
            num1h = ((Time1_Work_cycle * TIM1_ARR)/200)/256;
            num1l = ((Time1_Work_cycle * TIM1_ARR)/200)%256;
            data = num1h;
            TIM1_CCR1 = data*256 + num1l;
            TIM1_CCR1H = num1h;
            TIM1_CCR1L = num1l;
        }
    }
}
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/