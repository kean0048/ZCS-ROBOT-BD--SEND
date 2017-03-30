/******************************************************************************/
/*					                                      						*/
/*	Project Name :	�����(���գ�		                                    	*/
/*	Version      :	1.0			                              					*/
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              		*/
/*	Clock        :	16MHz			                              				*/
/*	Author	     :	mengzhuozhuo   		                              			*/
/*	Modefied	 :	kean		   		                              			*/
/*  Date	     :	2016/04/26	                                      			*/
/*	Corporation  :	�лݴ��ǣ����ڣ����߹��缼�����޹�˾                    		*/
/*	Info		 ��ACK�����Զ��ظ�����Ϊ�ϴ�ת�ص���Ӧͨ����ַ�����ݣ�				*/
/*							����ͨ��ACK���ý��ն˵�ַʱ��Ҫ����ͨ�� 				*/
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
		PE_ODR_ODR0 = 1;//�ض�IGBT
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
//���IGBT��/�¹ܱ��ͳ������������ѹ���߸澯������������߸澯
#pragma vector=5
__interrupt void EXTI_PORTA_IRQHandler(void)
{
	if(PA_IDR_IDR3  == 0)					//IGBT_M_UP_ERR
	{
		//���IGBT�Ϲܱ��ͳ��������������£�
		AbortFunCheck(igbt_up_err);
	}
	else if(PA_IDR_IDR4 == 0)  			//IGBT_M_DN_ERR
	{
		//���IGBT�¹ܱ��ͳ��������������£�
		AbortFunCheck(igbt_dn_err);
	}
	else if(PA_IDR_IDR5 == 0)  			//O_INPUT_VOL
	{
		//�����ź��ѹ���߳��������������£�
		AbortFunCheck(o_input_vol_err);
	}
	else if(PA_IDR_IDR6 == 0)  			//O_INPUT_CUR
	{
		//�����ĵ�������澯���������£�
		AbortFunCheck(o_input_cur_err);
	}
}
#pragma vector=6
__interrupt void EXTI_PORTB_IRQHandler(void)
{
	if(PB_IDR_IDR7 == 0) 					//O_COIL_VOL
	{
		//��ȦLCг���·��ѹ���������������£�
		AbortFunCheck(o_coil_vol_err);
	}
	else if(PB_IDR_IDR6  == 0)  			//0_COIL_CUR
	{
		//��Ȧ�������߳��������������£�
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
__interrupt void TIM4_UPD_OVF_IRQHandler(void)//ÿ2ms����һ��
{
	CNT_T1ms++;
	CNT_T1s++;

    if(++globetimer >= GLOBLETIME) //20170221 ��ֹ�����������99���ع���10ֵ
		globetimer = 10;
	if(CNT_T1ms >= 5) //20170213 10ms����һ��
	{
		CNT_T1ms = 0;
		Flag_10ms_1 = 0xFF;//10ms once
		Flag_10ms_2 = 0xFF;//10ms once
	}
	CNT_T2ms = 1;
	if(Flag_10ms_H)
	{
		Flag_10ms_H = 0;
		//���п�ʼ��ʱ
		if(status == C_MSIdle)
        {
			count_time[3]++;
        }
        //pwm�ر�ʱ���ʱ��Ҳ��������������PWM��ر�
        if(FLAG_PWM_START == 1)
		{
			count_time[2]++;
		}
		else if(FLAG_PWM_START == 0)//pwm����ʱ���ʱ������������PWM����
		{
			count_time[4]++;
		}
        //��Բ�ѯʱ���ʱ
        if(status == C_MSPair)
        {
          count_time[0]++;
        }
        //��ѯ�Ӷ˳����ʱ
        if(status == C_MSWork)
        {
          count_time[1]++;
        }
        /**************************************************/
        /*****count_time[n] ����С��256(2^8)��������Ч******/
        /**************************************************/
		if(count_time[0] >= 2)//20ms��ѯ�Ƿ�����Ի�nrf
		{
			flag_statu[1] = 1;
			count_time[0] = 0;
		}
		if(count_time[1] >= 2)//20ms��ѯһ��״̬
		{
			flag_statu[2] = 1;
			count_time[1] = 0;
		}
		if(count_time[2] >= 200)//50ms����״̬�ȴ� pwm����ʱ��
		{
			flag_statu[0] = 1;
			count_time[2] = 0;
		}
		if(count_time[4] >= 300)//3sPWM�رճ���ʱ��
		{
			flag_statu[4] = 1;
			count_time[4] = 0;
		}			
		if(count_time[3] >= 2)//20ms ����nrf
		{
			flag_statu[3] = 1;
			count_time[3] = 0;
		}
	}
	
	if((globetimer % 500 == 0) && (Flag_RECV_ADDRESS_NUM_SAME > 0))//LED1 RED
    	PG_ODR_ODR0 = ~PG_ODR_ODR0;
	if((globetimer % 500 == 0) && (Flag_Eeprom_Ero == 1) && (Flag_LED2_ENABLE == 1))//LED2 BULE
    	PG_ODR_ODR1 = ~PG_ODR_ODR1;
	//��λ
    TIM4_SR &=0xFE;
}

#pragma vector=0x1A
__interrupt void EEPROM_EEC_IRQHandler(void)
{

}
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/