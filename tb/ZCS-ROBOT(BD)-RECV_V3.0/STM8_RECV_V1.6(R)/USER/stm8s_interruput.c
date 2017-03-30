/******************************************************************************/
/*					                                      */
/*	Project Name :	发射机		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	中惠创智（深圳）无线供电技术有限公司                    */
/*						                              */
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
*******************************************************************************/


/*******************************************************************************
-----------------------------    Include files   -------------------------------
*******************************************************************************/
#include "type_def.h"

extern unsigned char* errmsg[];
extern unsigned char  errno;
extern unsigned char RX_ADDRESS_N[5];
/*******************************************************************************
-----------------------------    Global define   -------------------------------
*******************************************************************************/
#define   	C_T100ms   	100  	//100ms
#define   	C_T1ms		(1/2)		//1ms
#define     C_T1s       100		//1s = 100
#define     C_T10ms     10		//10ms
static TMsg msg;

#pragma vector=1
__interrupt void TRAP_IRQHandler(void)
{
  
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
#pragma vector=5
__interrupt void EXTI_PORTA_IRQHandler(void)
{
  
}
#pragma vector=6
__interrupt void EXTI_PORTB_IRQHandler(void)
{

}
#pragma vector=7
__interrupt void EXTI_PORTC_IRQHandler(void)
{
	if(PC_IDR_IDR3 == 0)   //curr_over
	{
		//电流过流
		 if(Flag_Curr_OVER_IT == 0)
        {
            Flag_Curr_OVER_IT = 1;
			CNT_Prot[0]++;
            if(CNT_Prot[0] >= 3)
            {
                CNT_Prot[0] = 0;
                ProtectFlag[0] = 1;
                if(MacStatus != C_MSProt)
                {
                    CNT_MPSub_Beep = 500;
                    ProNum = 0;	
                    MacStatus = C_MSProt;
				}
            }
        }
		errno = 1;
		//PC_ODR_ODR2 = 0;//LED1
	}
	else if(PC_IDR_IDR4 == 0) //vol_over
	{
		//电压过高
		CNT_Prot[1]++;
		if(CNT_Prot[1] >= 3)
		{
			PC_ODR_ODR1 = !PC_ODR_ODR1;
			CNT_Prot[1] = 0;
			ProtectFlag[1] = 1;
			if(MacStatus != C_MSProt)
			{
				CNT_MPSub_Beep = 500;
				ProNum = 1;	
				MacStatus = C_MSProt;
			} 
		}
		errno = 2;
	}	
}
#pragma vector=8
__interrupt void  EXTI_PORTD_IRQHandler(void)
{
	if(PD_IDR_IDR2 == 0)
	{		
		static unsigned char sta;
    	int DataLength;
		sta = NRF24L01_Read_Reg(STATUS);  //读取状态寄存器的值
		NRF24L01_Write_Reg(WRITE_REG+STATUS,sta); //清除TX_DS或MAX_RT中断标志	
		
		//printf("sta = %02x \n",sta);
		
		if(sta & RX_OK)
		{
			if(!STA_PAIR_CODE) //此时可以保证Led等无法点亮，只有接触后才可以
			{
				Step_Normal = false;
			}
			else
			{
				Step_Normal = true;
			}

			NRF24L01_CE = 0;
			DataLength = nrfRxLength();
			NRF24L01_Read_Buf(RD_RX_PLOAD,RD_Array,DataLength);//读取数据
			NRF24L01_Write_Reg(FLUSH_RX,0xff);//清除RX FIFO寄存器 
			NRF24L01_CE = 1;
			Printf("recv signal\n");
			if(CheckRecData() && Sys_Start)
			{
				msg.pInf = RD_Array;
				msg.datalenth = DataLength;
				msg.time = globetimer;
				msg.id = sta;
				if(enQueue(&queSEND, &msg) == 0)//如果队列满，则1.没接触却一直在接触；2,主系统奔溃
				{
					/*if(!Touch_Coil_On) //不接触时
					{
						Queue_Full_P0_Changed = true;
						NRF24L01_CE = 0;
						NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）       
						NRF24L01_Write_Reg(FLUSH_RX,0x00);//清除TX FIFO寄存器（20160426加调试）
						NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_N,RX_ADR_WIDTH);//写RX节点地址					
						NRF24L01_CE = 1; //CE为高,进入接收模式
						Delay(140);
					}
					else
					{
						Queue_Full_P0_Changed = false;
					}*/
					Queue_Full = true;
				}
				for(int i = 0;i<DataLength;i++)
					Printf("%02x ",RD_Array[i]);
				Printf("\n");
				Flag_NRF24L01_OK = 1;	
			}
			
		}
	}
	else if(PD_IDR_IDR7 == 0)  //over_input_vol
	{
		CNT_Prot[9]++;
		if(CNT_Prot[9] >= 3)
		{
			PC_ODR_ODR1 = !PC_ODR_ODR1;
			CNT_Prot[9] = 0;
			ProtectFlag[9] = 1;
			if(MacStatus != C_MSProt)
			{
				CNT_MPSub_Beep = 500;
				ProNum = 9;	
				MacStatus = C_MSProt;
			} 
		}
		over_input_vol = true;
		errno = 3;
	}
}
#pragma vector=9
__interrupt void EXTI_PORTE_IRQHandler(void)
{
   
}
#pragma vector=0xC
__interrupt void SPI_IRQHandler(void)
{
    Flag_10ms_1 = 0xFF;//10ms once
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
  
}

#pragma vector=0x13
__interrupt void UART1_TX_IRQHandler(void)
{
  
}
#pragma vector=0x14
__interrupt void UART2_TX_IRQHandler(void)
{ 

}

#pragma vector=0x15
__interrupt void UART2_RX_IRQHandler(void)
{
    
}


#pragma vector=0x16
__interrupt void UART3_TX_IRQHandler(void)
{
  
}
#pragma vector=0x17
__interrupt void UART3_RX_IRQHandler(void)
{
 
}


#pragma vector=0x18
__interrupt void ADC2_IRQHandler(void)
{

}


#pragma vector=0x19
__interrupt void TIM4_UPD_OVF_IRQHandler(void) //2ms
{
    CNT_T1ms += 2;
	CNT_T1s += 2;
    if(CNT_T1ms >= C_T10ms) //10ms
    {
		globetimer++;
        CNT_T1ms = 0;

		Flag_10ms_1 = 0xFF;
		Flag_10ms_2 = 0xFF;
    }
	if(CNT_T1s >= C_T1s)
    {
        CNT_T1s = 0;
		if(!Step_Normal && NOT_TACH)
        	PC_ODR_ODR2 = ~PC_ODR_ODR2;//LED1
		if(!Step_ERR_Main)
        	PC_ODR_ODR1 = ~PC_ODR_ODR1;//LED2 蓝灯闪，主程序必有问题
    }
    /*if((Flag_10ms_G == 1) && FULL_LED && STA_PAIR_CODE)
	{	
        Flag_10ms_G = 0;
        CNT_TEST_ON++;
        
        if(CNT_TEST_ON >= 300)                    
        {
            CNT_TEST_ON = 0;
            PC_ODR_ODR2 = !PC_ODR_ODR2;//LED1

            PC_ODR_ODR1 = !PC_ODR_ODR1;

        }
	}*/
    
	CNT_T2ms = 1;
    TIM4_SR &=0xfe; 
}

#pragma vector=0x1A
__interrupt void EEPROM_EEC_IRQHandler(void)
{

}
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/