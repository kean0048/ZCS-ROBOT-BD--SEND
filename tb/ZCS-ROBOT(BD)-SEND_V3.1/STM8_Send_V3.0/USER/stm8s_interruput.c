/******************************************************************************/
/*					                                      						*/
/*	Project Name :	发射机(接收）		                                    	*/
/*	Version      :	1.0			                              					*/
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              		*/
/*	Clock        :	16MHz			                              				*/
/*	Author	     :	mengzhuozhuo   		                              			*/
/*	Modefied	 :	kean		   		                              			*/
/*  Date	     :	2016/04/26	                                      			*/
/*	Corporation  :	中惠创智（深圳）无线供电技术有限公司                    		*/
/*	Info		 ：ACK本次自动回复内容为上次转载到相应通道地址的内容，				*/
/*							故在通过ACK设置接收端地址时需要两次通信 				*/
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
*******************************************************************************/


/*******************************************************************************
-----------------------------    Include files   -------------------------------
*******************************************************************************/
#include "type_def.h"
#include "Uart.h"
#include "PWM_Control.h"
#include "delayTime.h"
/*****************************************************************************/  
extern int count_time[5];
extern char errno;
enum Flag_Interrupt_err{igbt_up_err = 2,igbt_dn_err,o_input_vol_err,o_input_cur_err,o_coil_vol_err,o_coil_cur_err}as;
/*******************************************************************************
-----------------------------    Global define   -------------------------------
*******************************************************************************/

#pragma vector=1
__interrupt void TRAP_IRQHandler(void)
{
   _delay_us(1000); 
}
#pragma vector=2
__interrupt void TLI_IRQHandler(void)
{

}
#pragma vector=3
__interrupt void AWU_IRQHandler(void)
{
  
}
#pragma vector=4
__interrupt void CLK_IRQHandler(void)
{
  
}

void AbortFunCheck(const unsigned char num)
{
	CNT_Prot[num]++;
	if(CNT_Prot[num] >= 10)
	{
		PE_ODR_ODR0 = 1;//关断IGBT
		Time1_PWM_Close_Mode_Fast();
		RecordPwmInfo[0]= Flag_RECV_ADDRESS_NUM;
		RecordPwmInfo[1] = CNT_FULL_Num;
		CNT_Prot[num] = 0;
		ProtectFlag[num] = 1;
		if(MacStatus != C_MSProt)
		{
			CNT_MPSub_Beep = 500;
			ProNum = num;	
			MacStatus = C_MSProt;			
		} 
		errno = num - 1;
	}
	Broken_Code = 1;
}
//完成IGBT上/下管饱和出错报警，输入电压过高告警，输出电流过高告警
#pragma vector=5
__interrupt void EXTI_PORTA_IRQHandler(void)
{
	if(PA_IDR_IDR3  == 0)					//IGBT_M_UP_ERR
	{
		//完成IGBT上管饱和出错报警，代码如下：
		AbortFunCheck(igbt_up_err);
	}
	else if(PA_IDR_IDR4 == 0)  			//IGBT_M_DN_ERR
	{
		//完成IGBT下管饱和出错报警，代码如下：
		AbortFunCheck(igbt_dn_err);
	}
	else if(PA_IDR_IDR5 == 0)  			//O_INPUT_VOL
	{
		//整流桥后电压过高出错报警，代码如下：
		AbortFunCheck(o_input_vol_err);
	}
	else if(PA_IDR_IDR6 == 0)  			//O_INPUT_CUR
	{
		//总消耗电流过大告警，代码如下：
		AbortFunCheck(o_input_cur_err);
	}
}
#pragma vector=6
__interrupt void EXTI_PORTB_IRQHandler(void)
{
	if(PB_IDR_IDR7 == 0) 					//O_COIL_VOL
	{
		//线圈LC谐振回路超压出错报警，代码如下：
		AbortFunCheck(o_coil_vol_err);
	}
	else if(PB_IDR_IDR6  == 0)  			//0_COIL_CUR
	{
		//线圈电流过高出错报警，代码如下：
		AbortFunCheck(o_coil_cur_err);
	}
}
#pragma vector=7
__interrupt void EXTI_PORTC_IRQHandler(void)
{

}
#pragma vector=8
__interrupt void EXTI_PORTD_IRQHandler(void)
{
	

}
#pragma vector=9
__interrupt void EXTI_PORTE_IRQHandler(void)
{
   
}

#pragma vector=0xC
__interrupt void SPI_IRQHandler(void)
{
    
}
#pragma vector=0xD
__interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void)
{
    
}
#pragma vector=0xE
__interrupt void TIM1_CAP_COM_IRQHandler(void)
{
  
}

#pragma vector=0xF
__interrupt void TIM2_UPD_OVF_BRK_IRQHandler(void)
{
     
}
#pragma vector=0x10
__interrupt void TIM2_CAP_COM_IRQHandler(void)
{
  
}


#pragma vector=0x11
__interrupt void TIM3_UPD_OVF_BRK_IRQHandler(void)
{
    
}
#pragma vector=0x12
__interrupt void TIM3_CAP_COM_IRQHandler(void)
{
     //++globetimer;
}

#pragma vector=0x13
__interrupt void UART1_TX_IRQHandler(void)
{
  
}
#pragma vector=0x14
__interrupt void UART2_TX_IRQHandler(void)
{ 

}

#pragma vector=0x17
__interrupt void UART2_RX_IRQHandler(void)
{
    volatile unsigned char reg;
    if(UART2_SR_OR_LHE)
    {
        reg = UART2_SR;
        reg = UART2_DR;
        UART2_RxInterrupt(reg);  
    }
    else if(UART2_SR_RXNE)
    {
        reg = UART2_DR;
        UART2_RxInterrupt(reg); 
		//UART2_SR_RXNE = 0;
    }
}


#pragma vector=0x16
__interrupt void UART3_TX_IRQHandler(void)
{
  
}
#pragma vector=0x15
__interrupt void UART3_RX_IRQHandler(void)
{
 	
}


#pragma vector=0x18
__interrupt void ADC2_IRQHandler(void)
{

}


#pragma vector=0x19
__interrupt void TIM4_UPD_OVF_IRQHandler(void)//每2ms进入一次
{
	CNT_T1ms++;
	CNT_T1s++;

    if(++globetimer >= GLOBLETIME) //20170221 防止计数溢出，满99天后回归至10值
		globetimer = 10;
	if(CNT_T1ms >= 5) //20170213 10ms进入一次
	{
		CNT_T1ms = 0;
		Flag_10ms_1 = 0xFF;//10ms once
		Flag_10ms_2 = 0xFF;//10ms once
	}
	CNT_T2ms = 1;
	if(Flag_10ms_H)
	{
		Flag_10ms_H = 0;
		//空闲开始计时
		if(status == C_MSIdle)
        {
			count_time[3]++;
        }
        //pwm关闭时间计时，也就是满足条件后PWM会关闭
        if(FLAG_PWM_START == 1)
		{
			count_time[2]++;
		}
		else if(FLAG_PWM_START == 0)//pwm开启时间计时，满足条件后PWM开启
		{
			count_time[4]++;
		}
        //配对查询时间计时
        if(status == C_MSPair)
        {
          count_time[0]++;
        }
        //查询子端程序计时
        if(status == C_MSWork)
        {
          count_time[1]++;
        }
        /**************************************************/
        /*****count_time[n] 必须小于256(2^8)，否则无效******/
        /**************************************************/
		if(count_time[0] >= 2)//20ms查询是否有配对机nrf
		{
			flag_statu[1] = 1;
			count_time[0] = 0;
		}
		if(count_time[1] >= 2)//20ms查询一次状态
		{
			flag_statu[2] = 1;
			count_time[1] = 0;
		}
		if(count_time[2] >= 200)//50ms空闲状态等待 pwm开启时间
		{
			flag_statu[0] = 1;
			count_time[2] = 0;
		}
		if(count_time[4] >= 300)//3sPWM关闭持续时间
		{
			flag_statu[4] = 1;
			count_time[4] = 0;
		}			
		if(count_time[3] >= 2)//20ms 发送nrf
		{
			flag_statu[3] = 1;
			count_time[3] = 0;
		}
	}
	
	if((globetimer % 500 == 0) && (Flag_RECV_ADDRESS_NUM_SAME > 0))//LED1 RED
    	PG_ODR_ODR0 = ~PG_ODR_ODR0;
	if((globetimer % 500 == 0) && (Flag_Eeprom_Ero == 1) && (Flag_LED2_ENABLE == 1))//LED2 BULE
    	PG_ODR_ODR1 = ~PG_ODR_ODR1;
	//置位
    TIM4_SR &=0xFE;
}

#pragma vector=0x1A
__interrupt void EEPROM_EEC_IRQHandler(void)
{

}
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/