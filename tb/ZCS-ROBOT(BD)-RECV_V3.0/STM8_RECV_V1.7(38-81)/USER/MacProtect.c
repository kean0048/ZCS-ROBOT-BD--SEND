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

extern unsigned char RX_ADDRESS_N[5];
//static unsigned char enter_count = 0;
//******************************************************************************
//异常检测与处理
//******************************************************************************
void MacProtect()
{  
    //MPSub_Viot_Curr_Over_IN(9);//只保护电压，不保护电流
    if(Flag_10ms_D ==1)
    {
        Flag_10ms_D =0;
        
      //MPSubA(故障号,实时变量,进入故障下限值，进入故障上限值);
      //MPSubA(0,ACVolt_DD,C_Minimum_Low_Volt,C_Maximum_Low_Volt);//进入欠压
      //MPSubA(1,ACVolt_DD,C_Minimum_High_Volt,C_Maximum_High_Volt);//进入过压
      //MPSub_Volt_IN(1);//快速进入过压保护
      //MPSubA(2,ACTemp_AD,C_Minimum_NTC_Short,C_Maximum_NTC_Short);//进入NTC短路
      //MPSubA(3,ACTemp_AD,C_Minimum_NTC_Open,C_Maximum_NTC_Open);//进入NTC断路
      //MPSubA(4,ACTemp_DD,C_Minimum_IGBT_Hotn,C_Maximum_IGBT_Hot);//进入IGBT超温
      //MPSub_Fan_IN(5);//风扇故障检测
      //MPSub_Nrf24l01_IN(6);
      //MPSub_Nrf24l01_Pair_IN(7);
      //MPSub_Remove_load_IN(8);
      //MPSub_IGBT_IN(8);//进入IGBT中断异常
      //MPSub_Viot_Curr_Over_IN(9);
      //MPSub_Receiver_IN(10);//主机有故障 
      //MPSub_Check_NRF24L01_IN(11);//检测不到NRF24L01模块
       
      MPSub_Curr_OUT(0);
      //MPSubB(故障号,实时变量,退出故障下限值，退出故障上限值);
      //MPSubB(0,ACVolt_DD,C_Back_Minimum_Low_Volt,C_Back_Maximum_Low_Volt);//退出欠压
      MPSubB(1,ACVolt_DD,C_Back_Minimum_High_Volt,C_Back_Maximum_High_Volt);//退出过压
      //MPSubB(2,ACTemp_AD,C_Back_Minimum_NTC_Short,C_Back_Maximum_NTC_Short);//退出NTC短路
      //MPSubB(3,ACTemp_AD,C_Back_Minimum_NTC_Open,C_Back_Maximum_NTC_Open);//退出NTC断路
      //MPSubB(4,ACTemp_DD,C_Back_Minimum_IGBT_Hot,C_Back_Maximum_IGBT_Hot);//退出IGBT超温
      //MPSub_Fan_OUT(5);//风扇故障退出
      //MPSub_Nrf24l01_OUT(6);
      //MPSub_Nrf24l01_Pair_OUT(7);
      //MPSub_Remove_load_OUT(8);
      //MPSub_IGBT_OUT(8);//退出IGBT中断异常
      MPSub_Viot_Curr_Over_OUT(9);
      //MPSub_Receiver_OUT(10);//退出从机故障  
      //MPSub_Check_NRF24L01_OUT(11);//检测到NRF24L01模块
	  MPSub_Tached_Check(8); //20170213 检查是否在规定的时间内未收到查询指令
	  Flag_NRF24L01_Have = 1;
      MPSub_Pro_Code();
      MPSub_Beep();//蜂鸣器
    }
}
//******************************************************************************


//******************************************************************************
//异常检测
//******************************************************************************
void  MPSubA(unsigned char protype,unsigned int advalue,unsigned int ladv,unsigned int hadv)	
{
    if(ProtectFlag[protype] == 0)
    {
        if((advalue >= ladv) && (advalue < hadv))
        {
            CNT_Prot[protype]++;
            if(CNT_Prot[protype] >= 200)
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
//异常检测
//******************************************************************************
void  MPSubB(unsigned char protype,unsigned int advalue,unsigned int ladv,unsigned int hadv)	
{
    if(ProtectFlag[protype] == 1)
    {
        if((advalue >= ladv) && (advalue < hadv))
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
    for(i = 1;i < 12;i++)
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
	MacStatus = C_MSWork;//故障恢复后进入待机状态本程序待机直接进入查询状态
	//STA_PAIR_CODE = false;	
	//memset(RX_ADDRESS_0,0xEB,sizeof(RX_ADDRESS_0));
	//TX_P_SET();
	Clear_Nrf24l01();
}
//******************************************************************************


//******************************************************************************
//快速进入过压保护
//******************************************************************************
void  MPSub_Volt_IN(unsigned char protype)//快速进入过压保护
{
    if(ProtectFlag[protype] == 0)
    {
        if(ACVolt_DD >= 40000)
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
}
//******************************************************************************
void  MPSub_Tached_Check(unsigned char protype)
{
	static unsigned char count_paired_fails = 0;
	static unsigned char enter_count = 0;
	/*sif(Touch_Coil_On)
	{
		//队列相关
		if(Queue_Full) // 接触但队列还是满了报错
		{
			CNT_Prot[protype]++;
            if(CNT_Prot[protype] >= 100)
            {
				Step_ERR_Main = false;
				ProtectFlag[protype] = 1;
				ProNum = protype;
				MacStatus = C_MSProt;
				CNT_Prot[protype] = 0;
			}
		}
		else if(Queue_Full_P0_Changed)
		{
			Queue_Full_P0_Changed = false;
			NRF24L01_CE = 0;
			NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）       
			NRF24L01_Write_Reg(FLUSH_RX,0x00);//清除TX FIFO寄存器（20160426加调试）
			NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_0,RX_ADR_WIDTH);//写RX节点地址					
			NRF24L01_CE = 1; //CE为高,进入接收模式
			Delay(140);
			//队列数据复原0
			queSEND.front = 0;
			queSEND.rear = 0;
			for(int i = 0;i<3;i++)
			{
				queSEND.base[i].pInf = NULL;
				queSEND.base[i].datalenth = 0;
				queSEND.base[i].id = 0;
				queSEND.base[i].time = 0;
			}
		}
	  //配对相关
	  if((Flag_10ms_H == 1) && (ProcesstStatus == C_MSScan))
	  {
		  Flag_10ms_H = 0;
		  count_paired_fails++;
		  if(count_paired_fails >= 100) //2s
		  {
			  if(Pair_Succ)
			  {
				  Pair_Succ = false;
				  Fail_Num = 0;
			  }
			  else
				  Fail_Num++;
			  count_paired_fails = 0;
		  }
		  if(Fail_Num >= 3)
		  {
			  NRF24L01_CE = 0;
			  NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）       
			  NRF24L01_Write_Reg(FLUSH_RX,0x00);//清除TX FIFO寄存器（20160426加调试）
			  NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_0,RX_ADR_WIDTH);//写RX节点地址
			  NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS_N,RX_ADR_WIDTH);//写RX节点地址
			  NRF24L01_CE = 1; //CE为高,进入接收模式
			  Delay(140);
			  Fail_Num = 0;
			  Pair_Succ = true;
			  Variable_Init_Second();//关键变量初始化
		  }
				  
	  }
	  
	}
	else
	{
		if(Queue_Full) // 队列满
		{
			Queue_Full = false; //清空标识
		}
		CNT_Prot[protype] = 0;
	}*/
	//2017.01.18 增加与主机失去联系后回到P0通道的切换功能
	if(Flag_10ms_I == 1)//入口条件为：线圈接触&配对成功&至少收到一帧查询指令
	{
		Flag_10ms_I = 0;
		if(NOT_TACH && STA_PAIR_CODE)
		{
			enter_count++;	
			if(enter_count >= 100)
			{
				enter_count = 0;
				if(Pair_Succ)
				{
					Pair_Succ = false;
					count_paired_fails = 0;
				}
				else
					count_paired_fails++;
				
				//if((count_paired_fails >= 7) && Recv_Msg)
				if(count_paired_fails >= 5)
				{
					////20170221
					FLAG_CNT_TOUCH_RE = true;
					RX_P_SET();
					Variable_Init_Second();//
					count_paired_fails = 0;
				}
			}
		}
		else
		{
			enter_count = 0;
			count_paired_fails = 0;
		}
	}
}

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
            CNT_MPSub_Beep =500;
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
         if(ACCurr_DD >= C_Maximum_ACCurr) 
        {
            CNT_Prot[protype]++;
            if(CNT_Prot[protype] >= 100)
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
//退出过流保护
//******************************************************************************
void  MPSub_Curr_OUT(unsigned char protype)
{
    if(ProtectFlag[protype] == 1)
    {
        if(ACCurr_AD < 48) // 该值要修改
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
    else
    {
        CNT_ProtB[protype] = 0;
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
            PB_CR2 = 0x08;//打开PB3中断 
        }
    }
    else
    {
        CNT_Fan_Check =0;
        PB_CR2 = 0x00;//关闭PB3中断
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
                PB_CR2 = 0x00;//关闭PB3中断
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
                PB_CR2 = 0x08;//打开PB3中断 
            }
        }
        else
        {
            CNT_Fan_Check =0;
            PB_CR2 = 0x00;//关闭PB3中断
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
        if((MacStatus == C_MSWork)||(Flag_NRF24L01_OK == 1))
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
              CNT_MPSub_Beep =500;
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
        if(Flag_NRF24L01_OK ==1)
        {
            if((RX_Pro_Code_A ==0)&&(RX_Pro_Code_B ==0))
            {
                CNT_ProtB[protype] = 0;
                ProtectFlag[protype] = 0;
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
                RX_Pro_Code_A =0;
                RX_Pro_Code_B =0;
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
        if(Flag_NRF24L01_Have == 0)
        {           
            if(NRF24L01_Check() == 0)//检测到NRF24L01模块
            {
                Flag_NRF24L01_Have =1;
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
                        CNT_MPSub_Beep =500;
                        ProNum = protype;	
                        MacStatus = C_MSProt;
                    }
                }
            }
         }
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
        if(NRF24L01_Check() == 0)//检测到NRF24L01模块
        {
            Flag_NRF24L01_Have = 1;
            ProtectFlag[protype] = 0;
            MPSubC();
        }
        else
        {
			
        }
    }
}
//******************************************************************************


void  MPSub_Viot_Curr_Over_IN(unsigned char protype)//PD7引脚检测过压过流
{
    if(ProtectFlag[protype] == 0)
    {
        if(PC_IDR_IDR4 ==0)
        {
            CNT_Prot[protype]++;
            if(CNT_Prot[protype] >=2)
            {
                //LED_Exception =!LED_Exception;
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
void  MPSub_Viot_Curr_Over_OUT(unsigned char protype)//PD7引脚检测过压过流
{
    if(ProtectFlag[protype] == 1)
    {
        if(PC_IDR_IDR4 == 1)
        {
            CNT_ProtB[protype]++;
            if(CNT_ProtB[protype] >= 200)
            {
                CNT_ProtB[protype] = 0;
                ProtectFlag[protype] = 0;
                MPSubC();
            }
			over_input_vol = false;
        }
        else
        {
           CNT_ProtB[protype] = 0;
        }
    } 
}

void  MPSub_Nrf24l01_Pair_IN(unsigned char protype)
{
    if(ProtectFlag[protype] == 0)
    {
        if ((ACSupply_Volt_DD < 1500) && (RX_Time1_Work_cycle > 100))
        {
            CNT_Prot[protype]++;
            if(CNT_Prot[protype] >=100)
            {
                //LED_Normal =!LED_Normal;
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

void  MPSub_Nrf24l01_Pair_OUT(unsigned char protype)
{
    if(ProtectFlag[protype] == 1)
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

void  MPSub_Remove_load_IN(unsigned char protype)
{
    if(ProtectFlag[protype] == 0)
    {
        if ((ACCurr_DD < 200) && (Flag_Remove_load_EN==1))
        {
            CNT_Prot[protype]++;
            if(CNT_Prot[protype] >=50)
            {
                //LED_Normal =!LED_Normal;
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


void  MPSub_Remove_load_OUT(unsigned char protype)
{
    if(ProtectFlag[protype] == 1)
    {
        CNT_ProtB[protype]++;
        if(CNT_ProtB[protype] >= 500)
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
///本机故障代码
//******************************************************************************
void  MPSub_Pro_Code(void)
{
    unsigned char i,code;
    for(i=0;i<12;i++)
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
            CNT_MPSub_Beep =0;
            if(ProtectFlag[0]==1)
            {
               Buzz_Control = BUZZ_IN_Error_0;
            }
            else if(ProtectFlag[1]==1)
            {
               Buzz_Control = BUZZ_IN_Error_1;
            }
            else if(ProtectFlag[2]==1)
            {
               Buzz_Control = BUZZ_IN_Error_2;
            }
            else if(ProtectFlag[3]==1)
            {
               Buzz_Control = BUZZ_IN_Error_3;
            }
            else if(ProtectFlag[4]==1)
            {
               Buzz_Control = BUZZ_IN_Error_4;
            }
            else if(ProtectFlag[5]==1)
            {
               Buzz_Control = BUZZ_IN_Error_5;
            }
            else if(ProtectFlag[6]==1)
            {
               Buzz_Control = BUZZ_IN_Error_6;
            }
            else if(ProtectFlag[7]==1)
            {
               Buzz_Control = BUZZ_IN_Error_7;
            }
            else if(ProtectFlag[8]==1)
            {
               Buzz_Control = BUZZ_IN_Error_8;
            }
            else if(ProtectFlag[9]==1)
            {
               Buzz_Control = BUZZ_IN_Error_9;			   
            }
            else if(ProtectFlag[10]==1)
            {
               Buzz_Control = BUZZ_IN_Error_10;
            }
            else if(ProtectFlag[11]==1)
            {
                Buzz_Control = BUZZ_IN_Error_11;
            }
        }
}
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/
