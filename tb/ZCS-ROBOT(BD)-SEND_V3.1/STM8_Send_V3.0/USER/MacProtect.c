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
#include "MacProtect.h"
#include "PWM_Control.h"
#include "FAN_Control.h"
#include "Buzz.h"
#include "delayTime.h"

static float const_f_empty_value = 2.01425;
static unsigned int Num_Interruput_Broken = 0;
extern char errno;
//******************************************************************************
//异常检测与处理
//******************************************************************************
void MacProtect()
{ 
    if(Flag_10ms_D ==1)
    {
        Flag_10ms_D =0;
		
        //MPSubA(0,ACTemp_DD,C_Minimum_IGBT_Hotn,C_Maximum_IGBT_Hot);//进入IGBT超温
		//MPSubA(1,ACTemp_DD,C_Minimum_COIL_Hotn,C_Maximum_COIL_Hot);//进入COIL超温
		
		
		//MPSubB(0,ACTemp_DD,C_Back_Minimum_IGBT_Hot,C_Back_Maximum_IGBT_Hot);//退出IGBT超温
		//MPSubB(1,ACTemp_DD,C_Back_Minimum_COIL_Hot,C_Back_Maximum_COIL_Hot);//退出COIL超温
		//MPSub_Efficiency_Check_out(7);//效率异常检测
		MPSub_IGBT_OUT_UP(2);
		MPSub_IGBT_OUT_DN(3);
		
		MPSub_VOL_OUT_INPUT(4);
        MPSub_Curr_OUT_INPUT(5);
           
        MPSub_VOL_OUT_COIL(6);
        MPSub_Curr_OUT_COIL(7);
		
		//MPSub_Efficiency_Check_in(8);//效率异常检测进入
		//MPSub_Efficiency_Check_out(8);//效率异常检测退出
        MPSub_Beep();//蜂鸣器
    }
}
//******************************************************************************
void MPSub_Efficiency_Check_in(unsigned char protype)
{
	if((ProtectFlag[protype] == 0) && (Cnt_ForeignBody_Available == Flag_RECV_ADDRESS_NUM_SAME) && (FLAG_PWM_START == 1))
    {
		if(Cnt_ForeignBody_Available > 0)
		{
			for(int i = 0;i<Flag_RECV_ADDRESS_NUM_SAME;i++)
				Float_ForeignBody_Value_Sum += Float_ForeignBody_Value[i];
		
			if((Power * 0.65 - Float_ForeignBody_Value_Sum) <= FLOATCOMPAREDVALUE)
			{
				CNT_Prot[protype]++;
				if(CNT_Prot[protype] >= 1000)//10s
				{	
					PE_ODR_ODR0 = 1;//关断IGBT
					CNT_Prot[protype] = 0;
					ProtectFlag[protype] = 1;
					if(MacStatus != C_MSProt)
					{
						CNT_MPSub_Beep = 500;
						ProNum = protype;	
						MacStatus = C_MSProt;
					}
					errno = protype - 1;		
				}
				Broken_Code = 1;
				
			}	
			else
			{
				CNT_Prot[protype] = 0;
			}
		}
		else
		{
			if(Power >= (const_f_empty_value * 1.05))
			{
				CNT_Prot[protype]++;
				if(CNT_Prot[protype] >= 10)//10s
				{	
					PE_ODR_ODR0 = 1;//关断IGBT
					CNT_Prot[protype] = 0;
					ProtectFlag[protype] = 1;
					if(MacStatus != C_MSProt)
					{
						CNT_MPSub_Beep = 500;
						ProNum = protype;	
						MacStatus = C_MSProt;
					}
					errno = protype - 1;
				}
				Broken_Code = 1;	
			}
			else
			{
				CNT_Prot[protype] = 0;
				Broken_Code = 0;
				errno = 0;
			}
		}
	}
	Cnt_ForeignBody_Available = 0;
}


void MPSub_Efficiency_Check_out(unsigned char protype)
{
	if((ProtectFlag[protype] == 1) && (CNT_ProtF[protype] == 1))
    {
		CNT_ProtB[protype]++;
		if(CNT_ProtB[protype] >= 200)
		{
			CNT_ProtF[protype] = 0;
			CNT_ProtB[protype] = 0;
			ProtectFlag[protype] = 0;
			MPSubC();
		}        
    }
	//else if(ProtectFlag[protype] == 1) && 
	else
	{
		CNT_ProtB[protype] = 0;
	}
}

//******************************************************************************
//异常检测
//******************************************************************************
void  MPSubA(unsigned char protype,unsigned int advalue,unsigned int ladv,unsigned int hadv)	
{
    if(ProtectFlag[protype] == 0)
    {
        if(advalue >= C_Maximum_Temp1)
        {
            CNT_Prot[protype]++;
            if(CNT_Prot[protype] >= 200)
            {
                CNT_Prot[protype] = 0;
                ProtectFlag[protype] = 1;
                if(MacStatus != C_MSProt)
                {
                    CNT_MPSub_Beep = 500;
                    ProNum = protype;	
                    MacStatus = C_MSProt;
				}
            }
		}
		else
		{
			CNT_Prot[protype] = 0;
		}
    }
}
//******************************************************************************


//******************************************************************************
//异常处理
//******************************************************************************
void  MPSubB(unsigned char protype,unsigned int advalue,unsigned int ladv,unsigned int hadv)	
{
    if(ProtectFlag[protype] == 1)
    {
        if(advalue <= C_Minimum_Temp1)
        {
            CNT_ProtB[protype]++;
            if(CNT_ProtB[protype] >= 100)
            {
                CNT_ProtB[protype] = 0;
                ProtectFlag[protype] = 0;
                MPSubC();
            }
        }
        else
        {
            CNT_ProtB[protype] = 0;
        }
    }
}
//******************************************************************************


//******************************************************************************
//退出异常
//******************************************************************************
void  MPSubC(void)
{
    unsigned char i,j;	
    j = 0;	
    for(i = 0;i <= 15;i++)
    {
        if(ProtectFlag[i] == 1)
        {
            j++;
        }
    }	
    if(j == 0)
    {
        KPIdle(); 
    }
}
//******************************************************************************


//******************************************************************************
//异常轮流显示
//******************************************************************************
void  ProCodeTurn(void)		
{
}
//******************************************************************************


//******************************************************************************
//退出异常
//******************************************************************************
void  KPIdle(void)
{
	MacStatus = C_MSNORMAL;//故障恢复后进入待机状态本程序待机直接进入查询状态
	errno = 0;
	flag_p = 4;
	//Clear_Nrf24l01();
}
//******************************************************************************


//******************************************************************************
//进入IGBT中断异常
//******************************************************************************
void  MPSub_IGBT_IN(unsigned char protype)
{
   if(Flag_enable_work ==1)
   {
       ProtectFlag[protype] = 1;
       if(MacStatus != C_MSProt)
       {
            CNT_MPSub_Beep = 500;
            ProNum = protype;	
            MacStatus = C_MSProt;
        }
   }
}
//******************************************************************************


//******************************************************************************
//退出IGBT中断异常
//******************************************************************************
void  MPSub_IGBT_OUT(unsigned char protype)
{
    if(ProtectFlag[protype] == 1)
    {
        if(IGBT_Check_PIN ==1)
        {
            CNT_ProtB[protype]++;
            if(CNT_ProtB[protype] >= 100)
            {
                CNT_ProtB[protype] = 0;
                ProtectFlag[protype] = 0;
                Flag_enable_work =0;
                MPSubC();
            }
        }
        else
        {
            CNT_ProtB[protype] = 0;
        }
    }
}
//******************************************************************************


//******************************************************************************
//进入过流保护
//******************************************************************************
void  MPSub_Curr_IN(unsigned char protype)
{
    if(ProtectFlag[protype] == 0)
    {
        if(PE_IDR_IDR6 ==0)
        {
            CNT_Prot[protype]++;
            if(CNT_Prot[protype] >=2)
            {
                CNT_Prot[protype] = 0;
                ProtectFlag[protype] = 1;
                if(MacStatus != C_MSProt)
                {
                    CNT_MPSub_Beep =500;
                    ProNum = protype;	
                    MacStatus = C_MSProt;
				}  
            }
        }
        else
        {
             CNT_Prot[protype] = 0;
        }
    }
}
//******************************************************************************


//******************************************************************************
//退出过流保护
//******************************************************************************
void  MPSub_Curr_OUT(unsigned char protype)
{
    if(ProtectFlag[protype] == 1)
    {
        if(PE_IDR_IDR6 == 1)
        {
            CNT_ProtB[protype]++;
            if(CNT_ProtB[protype] >= 200)
            {
                CNT_ProtB[protype] = 0;
                ProtectFlag[protype] = 0;
                MPSubC();
            }
        }
        else
        {
           CNT_ProtB[protype] = 0;
        }
    }
}
//******************************************************************************


//******************************************************************************
//风扇故障检测
//******************************************************************************
void  MPSub_Fan_IN(unsigned char protype)
{
    if(Flag_Fan_Open ==1)
    {
        CNT_Fan_Check++;
        if(CNT_Fan_Check >=10)
        {   
            PB_CR2 = 0x00;//关闭PB3中断
            if(CNT_Fan_Speed <100)
            {
                CNT_Prot[protype]++;
                if(CNT_Prot[protype] >= 5)
                {
                    CNT_Prot[protype] = 0;
                    ProtectFlag[protype] = 1;
                    if(MacStatus != C_MSProt)
                    {
                        CNT_MPSub_Beep =500;
                        ProNum = protype;	
                        MacStatus = C_MSProt;
                    }
                }               
            }
            CNT_Fan_Check =0;
            CNT_Fan_Speed =0;
            //PB_CR2 = 0x08;//打开PB3中断 
        }
    }
    else
    {
        CNT_Fan_Check =0;
        //PB_CR2 = 0x00;//关闭PB3中断
        CNT_Prot[protype] =0;
        CNT_Fan_Speed =0;
    }
}
//******************************************************************************

//******************************************************************************
//风扇故障退出
//******************************************************************************
void  MPSub_Fan_OUT(unsigned char protype)
{
    if(ProtectFlag[protype] == 1)
    {
        if(Flag_Fan_Open ==1)
        {
            CNT_Fan_Check++;
            if(CNT_Fan_Check >=10)
            {   
                //PB_CR2 = 0x00;//关闭PB3中断
                if(CNT_Fan_Speed >=100)
                {
                    CNT_ProtB[protype]++;
                    if(CNT_ProtB[protype] >= 2)
                    {
                        CNT_ProtB[protype] = 0;
						ProtectFlag[protype] = 0;
						MPSubC();
                    }               
                }
                CNT_Fan_Check =0;
                CNT_Fan_Speed =0;
                //PB_CR2 = 0x08;//打开PB3中断 
            }
        }
        else
        {
            CNT_Fan_Check =0;
            //PB_CR2 = 0x00;//关闭PB3中断
            CNT_ProtB[protype] =0;
            CNT_Fan_Speed =0;
        }        
    }    
}
//******************************************************************************


//******************************************************************************
//无线通信异常检测
//******************************************************************************
void  MPSub_Nrf24l01_IN(unsigned char protype)
{
    if(ProtectFlag[protype] == 0)
    {
        if((MacStatus ==C_MSWork)||(Flag_NRF24L01_OK ==1))
        {
            CNT_Prot[protype]--;
            if(CNT_Prot[protype] == 0)
            {
                CNT_Prot[protype] = 200;
                ProtectFlag[protype] = 1;
                Flag_NRF24L01_OK = 0;
                if(MacStatus != C_MSProt)
                {
                    CNT_MPSub_Beep = 500;
                    ProNum = protype;	
                    MacStatus = C_MSProt;
				}
             }
         }
    }  
}
//******************************************************************************


//******************************************************************************
//退出无线通信异常
//******************************************************************************
void  MPSub_Nrf24l01_OUT(unsigned char protype)
{
    if(ProtectFlag[protype] == 1)
    {
        CNT_ProtB[protype]++;
        if(CNT_ProtB[protype] >= 100)
        {
            CNT_ProtB[protype] = 0;
            ProtectFlag[protype] = 0;
            MPSubC();
        }
    }
    else
    {
        CNT_ProtB[protype] = 0;
    }
}
//******************************************************************************

//******************************************************************************
////从机有故障
//******************************************************************************
void  MPSub_Receiver_IN(unsigned char protype)
{
  if(ProtectFlag[protype] == 0)
  {
     if((RX_Pro_Code_A !=0) || (RX_Pro_Code_B !=0))
     {
         ProtectFlag[protype] = 1;
         if(MacStatus != C_MSProt)
         {
              CNT_MPSub_Beep = 500;
              ProNum = protype; 
              MacStatus = C_MSProt;
         }
         CNT_ProtB[protype] =0;
     }
  }
}
//******************************************************************************


//******************************************************************************
////退出从机故障
//******************************************************************************
void  MPSub_Receiver_OUT(unsigned char protype)
{
    if(ProtectFlag[protype] == 1)
    {
        if(Flag_NRF24L01_OK == 1)
        {
            if((RX_Pro_Code_A == 0)&&(RX_Pro_Code_B == 0))
            {
                CNT_ProtB[protype] = 0;
                ProtectFlag[protype] = 0;
                RX_Pro_Code_A = 0;
                RX_Pro_Code_B = 0;
                MPSubC(); 
            }
        }
        else
        {
            CNT_ProtB[protype]++;
            if(CNT_ProtB[protype] >= 500)
            {
                CNT_ProtB[protype] = 0;
                ProtectFlag[protype] = 0;
                RX_Pro_Code_A = 0;
                RX_Pro_Code_B = 0;
                MPSubC();
            }
        }
    }
    else
    {
        CNT_ProtB[protype] =0;
    }
}
//******************************************************************************


//******************************************************************************
//检测不到NRF24L01模块
//******************************************************************************
void  MPSub_Check_NRF24L01_IN(unsigned char protype)
{
    if(ProtectFlag[protype] == 0)
    {
        /*if(Flag_NRF24L01_Have == 0)
        {           
            if(NRF24L01_Check() == 0)//检测到NRF24L01模块
            {
                Flag_NRF24L01_Have = 1;
                CNT_Prot[protype] = 0;
            }
            else                    //检测不到NRF24l01模块
            {
                CNT_Prot[protype]++;
                if(CNT_Prot[protype] >= 200)
                {
                    CNT_Prot[protype] = 0;
                    ProtectFlag[protype] = 1;
                    if(MacStatus != C_MSProt)
                    {
                        CNT_MPSub_Beep = 500;
                        ProNum = protype;	
                        MacStatus = C_MSProt;
                    }
                }
            }
         }*/
    }  
}
//******************************************************************************


//******************************************************************************
//检测到NRF24L01模块
//******************************************************************************
void  MPSub_Check_NRF24L01_OUT(unsigned char protype)
{
    if(ProtectFlag[protype] == 1)
    {
        /*if(NRF24L01_Check() == 0)//检测到NRF24L01模块
        {
            Flag_NRF24L01_Have = 1;
            ProtectFlag[protype] = 0;
            MPSubC();
        }*/
    }
}

//******************************************************************************
///本机故障代码
//******************************************************************************
void  MPSub_Pro_Code(void)
{
    unsigned char i,code;
    for(i=0;i<16;i++)
    {
       if(i<8)
       {
           if(ProtectFlag[i] ==1)
           {
              code = (0x01 << i);
              TX_Pro_Code_A |= code;
           }
           else
           {
              code = ~(0x01 << i);
              TX_Pro_Code_A &= code;
           }
       }
       else
       {
            if(ProtectFlag[i] ==1)
           {
              code = (0x01 << (i-8));
              TX_Pro_Code_B |= code;
           }
           else
           {
              code = ~(0x01 << (i-8));
              TX_Pro_Code_B &= code;
           }
           TX_Pro_Code_B &= 0xfb;//主机故障不再返回给主机
       }
    }
}
//******************************************************************************


//******************************************************************************
//异常蜂鸣
//******************************************************************************
void  MPSub_Beep(void)
{
        CNT_MPSub_Beep++;
        if(CNT_MPSub_Beep >= 500)
        {
            CNT_MPSub_Beep = 0;
            if(ProtectFlag[0] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_0;
            }
            else if(ProtectFlag[1] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_1;
            }
            else if(ProtectFlag[2] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_2;
            }
            else if(ProtectFlag[3] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_3;
            }
            else if(ProtectFlag[4] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_4;
            }
            else if(ProtectFlag[5] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_5;
            }
            else if(ProtectFlag[6] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_6;
            }
            else if(ProtectFlag[7] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_7;
            }
            else if(ProtectFlag[8] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_8;
            }
            else if(ProtectFlag[9] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_9;
            }
            else if(ProtectFlag[10] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_10;
            }
            else if(ProtectFlag[11] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_11;
            }
			else if(ProtectFlag[12] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_12;
            }
			else if(ProtectFlag[13] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_13;
            }
			else if(ProtectFlag[14] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_14;
            }
			else if(ProtectFlag[15] == 1)
            {
                Buzz_Control = BUZZ_IN_Error_15;
            }
		}
}
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/
void  MPSub_IGBT_IN_UP(unsigned char protype)//PA3
{
    if(ProtectFlag[protype] == 0)
    {
        if(PA_IDR_IDR3 == 0)
        {
            CNT_Prot[protype]++;
            if(CNT_Prot[protype] >=2)
            {
                CNT_Prot[protype] = 0;
                ProtectFlag[protype] = 1;
                if(MacStatus != C_MSProt)
                {
                    CNT_MPSub_Beep = 500;
                    ProNum = protype;	
                    MacStatus = C_MSProt;
				}  
            }
        }
        else
        {
             CNT_Prot[protype] = 0;
        }
    }
}

void  MPSub_Curr_IN_INPUT(unsigned char protype)//PA6
{
    if(ProtectFlag[protype] == 0)
    {
        if(PA_IDR_IDR6 ==0)
        {
            CNT_Prot[protype]++;
            if(CNT_Prot[protype] >=2)
            {
                CNT_Prot[protype] = 0;
                ProtectFlag[protype] = 1;
                if(MacStatus != C_MSProt)
                {
                    CNT_MPSub_Beep = 500;
                    ProNum = protype;	
                    MacStatus = C_MSProt;
				}  
            }
        }
        else
        {
             CNT_Prot[protype] = 0;
        }
    }
}
void  MPSub_IGBT_IN_DN(unsigned char protype)//PA4
{
    if(ProtectFlag[protype] == 0)
    {
        if(PA_IDR_IDR4 ==0)
        {
            CNT_Prot[protype]++;
            if(CNT_Prot[protype] >=2)
            {
                CNT_Prot[protype] = 0;
                ProtectFlag[protype] = 1;
                if(MacStatus != C_MSProt)
                {
                    CNT_MPSub_Beep = 500;
                    ProNum = protype;	
                    MacStatus = C_MSProt;
				}  
            }
        }
        else
        {
             CNT_Prot[protype] = 0;
        }
    }
}
void  MPSub_VOL_IN_INPUT(unsigned char protype)//PA5 
{
    if(ProtectFlag[protype] == 0)
    {
        if(PA_IDR_IDR5 ==0)
        {
            CNT_Prot[protype]++;
            if(CNT_Prot[protype] >=2)
            {
                CNT_Prot[protype] = 0;
                ProtectFlag[protype] = 1;
                if(MacStatus != C_MSProt)
                {
                    CNT_MPSub_Beep = 500;
                    ProNum = protype;	
                    MacStatus = C_MSProt;
				}  
            }
        }
        else
        {
             CNT_Prot[protype] = 0;
        }
    }
}
void  MPSub_VOL_IN_COIL(unsigned char protype)//PB7
{
    if(ProtectFlag[protype] == 0)
    {
        if(PB_IDR_IDR7 ==0)
        {
            CNT_Prot[protype]++;
            if(CNT_Prot[protype] >=2)
            {
                CNT_Prot[protype] = 0;
                ProtectFlag[protype] = 1;
                if(MacStatus != C_MSProt)
                {
                    CNT_MPSub_Beep = 500;
                    ProNum = protype;	
                    MacStatus = C_MSProt;
				}  
            }
        }
        else
        {
             CNT_Prot[protype] = 0;
        }
    }
}
void  MPSub_Curr_IN_COIL(unsigned char protype) //PB6
{
    if(ProtectFlag[protype] == 0)
    {
        if(PB_IDR_IDR6 ==0)
        {
            CNT_Prot[protype]++;
            if(CNT_Prot[protype] >=2)
            {
                CNT_Prot[protype] = 0;
                ProtectFlag[protype] = 1;
                if(MacStatus != C_MSProt)
                {
                    CNT_MPSub_Beep = 500;
                    ProNum = protype;	
                    MacStatus = C_MSProt;
				}  
            }
        }
        else
        {
             CNT_Prot[protype] = 0;
        }
    }
}
//********************************************************************************
void  MPSub_IGBT_OUT_UP(unsigned char protype)//PA3
{
    if((ProtectFlag[protype] == 1) && (CNT_ProtF[protype] == 1))
    {
        if(PA_IDR_IDR3 == 1)
        {
            CNT_ProtB[protype]++;
            if(CNT_ProtB[protype] >= 200)
            {
				CNT_ProtF[protype] = 0;
                CNT_ProtB[protype] = 0;
                ProtectFlag[protype] = 0;
                MPSubC();
            }
        }
        else
        {
           CNT_ProtB[protype] = 0;
		   Broken_Code = 0;
		   errno = 0;
        }
    }
}
void  MPSub_Curr_OUT_INPUT(unsigned char protype)//PA6
{
    if((ProtectFlag[protype] == 1) && (CNT_ProtF[protype] == 1))
    {
        if(PA_IDR_IDR6 == 1)
        {
            CNT_ProtB[protype]++;
            if(CNT_ProtB[protype] >= 200)
            {
				CNT_ProtF[protype] = 0;
                CNT_ProtB[protype] = 0;
                ProtectFlag[protype] = 0;
                MPSubC();
            }
        }
        else
        {
           CNT_ProtB[protype] = 0;
		   Broken_Code = 0;
				errno = 0;
        }
    }
}
void  MPSub_IGBT_OUT_DN(unsigned char protype)//PA4
{
    if((ProtectFlag[protype] == 1) && (CNT_ProtF[protype] == 1))
    {
        if(PA_IDR_IDR4 == 1)
        {
            CNT_ProtB[protype]++;
            if(CNT_ProtB[protype] >= 200)
            {
				CNT_ProtF[protype] = 0;
                CNT_ProtB[protype] = 0;
                ProtectFlag[protype] = 0;
                MPSubC();
            }
        }
        else
        {
           CNT_ProtB[protype] = 0;
		   Broken_Code = 0;
				errno = 0;
        }
    }
}
void  MPSub_VOL_OUT_INPUT(unsigned char protype)//PA5
{
    if((ProtectFlag[protype] == 1) && (CNT_ProtF[protype] == 1))
    {
        if(PA_IDR_IDR5 == 1)
        {
            CNT_ProtB[protype]++;
            if(CNT_ProtB[protype] >= 200)
            {
				CNT_ProtF[protype] = 0;
                CNT_ProtB[protype] = 0;
                ProtectFlag[protype] = 0;
                MPSubC();
            }
        }
        else
        {
           CNT_ProtB[protype] = 0;
		   Broken_Code = 0;
				errno = 0;
        }
    }
}
void  MPSub_VOL_OUT_COIL(unsigned char protype)//PB7
{
    if((ProtectFlag[protype] == 1) && (CNT_ProtF[protype] == 1))
    {
        if(PB_IDR_IDR7 == 1)
        {
            CNT_ProtB[protype]++;
            if(CNT_ProtB[protype] >= 200)
            {
				CNT_ProtF[protype] = 0;
                CNT_ProtB[protype] = 0;
                ProtectFlag[protype] = 0;
                MPSubC();
            }
        }
        else
        {
           CNT_ProtB[protype] = 0;
		   Broken_Code = 0;
				errno = 0;
        }
    }
}
void  MPSub_Curr_OUT_COIL(unsigned char protype)//PB6
{
    if((ProtectFlag[protype] == 1) && (CNT_ProtF[protype] == 1))
    {
        if(PB_IDR_IDR6 == 1)
        {
            CNT_ProtB[protype]++;
            if(CNT_ProtB[protype] >= 200)
            {
				CNT_ProtF[protype] = 0;
                CNT_ProtB[protype] = 0;
                ProtectFlag[protype] = 0;
                MPSubC();
            }
        }
        else
        {
           CNT_ProtB[protype] = 0;
		   Broken_Code = 0;
				errno = 0;
        }
    }
}

void DEAL_ABNORMAL_FUN(const unsigned char c_num)
{
	unsigned char c_proNun = c_num;
	switch(c_proNun)
	{
		case 0://IGBT超温
		    if(devStatus.igbt_temp < C_Minimum_Temp1 )
			{
				Fan_Close();
				//MacStatus = C_MSNORMAL;
				ProtectFlag[0] = 0;
				MPSubC();
			}
			else if(devStatus.igbt_temp > C_Maximum_Temp1 )
			{
				Fan_Open();
			}																	
			break;
		case 1://COIL超温
			if(devStatus.igbt_temp < C_Minimum_Temp1 )
			{
				Fan_Close();
				//MacStatus = C_MSNORMAL;
				ProtectFlag[1] = 0;
				MPSubC();
			}
			else if(devStatus.igbt_temp > C_Maximum_Temp1 )
			{
				Fan_Open();
			}
			break;

		case 2://完成IGBT上管饱和出错报警
		  
		  ABORT_DEAL_FUC(2);
		  break;
		  
		case 3://完成IGBT下管饱和出错报警
		  ABORT_DEAL_FUC(3);
		  break;
		  
		case 4://整流桥后电压过高出错报警
		  ABORT_DEAL_FUC(4);
		  break;
		  
		case 5://总消耗电流过大告警
		  ABORT_DEAL_FUC(5);
		  break;
		  
		case 6://线圈LC谐振回路超压出错报警
		  ABORT_DEAL_FUC(6);
		  break;
		  
		case 7://线圈电流过高出错报警
		  ABORT_DEAL_FUC(7);
		  break;
		  
		case 8://异物检测故障
		  ABORT_DEAL_FUC(8);
		  break;
		  
		default:
		  break;
	}
}

void ABORT_DEAL_FUC(const unsigned char num)
{
	_delay_ms(10);// 延时10ms 
	if(Broken_Code  == 1)//如果此时中断进入,则从机要切断继电器，确保不会烧毁igbt
	{
		if(Flag_10ms_J == 1)
		{
			CNT_T500ms++;
			Flag_10ms_J = 0;
			if(CNT_T500ms >= 50)//500ms
			{
				if(Num_Interruput_Broken++ <= 2)
				{
					PE_ODR_ODR0 = 0;//打开IGBT
					Adjust_Time1_cycle2(0);//10%
					Broken_Code = 2;
					_delay_ms(100);// 延时100ms 
				}
				else
				{
					PE_ODR_ODR0 = 1;//关闭IGBT
					//flag_p = 6;
				}					
			}
		}
	}
	else if(Broken_Code == 2)
	{
		if(Flag_10ms_J == 1)
		{
			CNT_T500ms++;
			Flag_10ms_J = 0;
			if(CNT_T500ms >= 100) //1s
			{
				CNT_ProtF[num] = 1;
				CNT_T500ms = 0;
			}
		} 
		Num_Interruput_Broken = 0;
	}
}
