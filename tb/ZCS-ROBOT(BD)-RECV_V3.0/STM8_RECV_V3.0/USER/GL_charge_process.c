/******************************************************************************/
/*	File Name    :  GL_charge_process.c		                      */
/*	Discription  :  罐笼充电过程控制		                      */


/*					                                      */
/*	Project Name :	罐笼充电接收		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	caiweijie base mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	中惠创智（深圳）无线供电技术有限公司                  */

/*						                              */
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
 *******************************************************************************/

#include "type_def.h"
#include "GL_charge_process.h"

/*******************************************************************************
-----------------------------    Macro define    -------------------------------
 *******************************************************************************/

/*******************************************************************************
-------------------------    Function declaration    ---------------------------
 *******************************************************************************/
void GL_charge_process(void)//无线收发数据
{
    /*switch (MacStatus)
      {
      case C_MSIdle://待机
        {
          TX_Cycle = 0;
          RX_Time1_Work_cycle=0;
          Con_Power = 0x00;
          MacStatus = C_MSScan;
          break;
        }
      case C_MSScan://从机发送信号给主机查询
        {
          TX_Cycle = 0;
          RX_Time1_Work_cycle=0;
          Con_Power = 0x00;
          Send_Signal();
          Wait_Time(50, C_MSPair); //等待1秒
          Flag_NRF24L01_Change_EN = 0;
          break;
        }
      case C_MSPair://配对
        {
          NRF24L01_Mode = 0;
          TX_Cycle = 0;
          RX_Time1_Work_cycle=0;
          Con_Power = 0x00;
          Rec_Pair_Nrf24l01(); //接收主机与自己配对信息
          Wait_Time(50, C_MSIdle); //等待2秒
          if (MacStatus == C_MSIdle)
          {
              if (Flag_NRF24L01_Change_EN == 1)
              {
                  MacStatus = C_MSWork;
                  Mode_Rec_Send = 0; //配对转换到供电初始化为发送模式
                  CNT_Prot[6] = 200;
              }
          }
          Flag_First_Charge =0;
          break;
        }
      case C_MSWork://供电
        {
          if (myStatus == 6)
              chargeComplete();
          else CC_CVcharging();
          Con_Power = 0x03;
          Rec_Send_data(); 			// 供电状态收发数据
          break;
        }
      case C_MSProt://异常
        {
          TX_Cycle = 0;
          RX_Time1_Work_cycle=0;
          Con_Power = 0x00;
          Rec_Send_data(); 			// 供电状态收发数据
          Flag_First_Charge =0;
          break;
        }
      default:
        break;
      }*/
}

void CC_CVcharging()
{   
	if (ACVolt_DD >= 2050 && ACCurr_DD <= 500)		//判断电池是否充满  20.5v  
    {
        if(Flag_10ms_A == 1)
        {
            Flag_10ms_A = 0;
            CNT_Battery_Full++;
            if(CNT_Battery_Full >= 255)
            {
				CNT_Battery_Full = 0;
                myStatus = 6;
				Chanrg_Over = 1;
            }
        }
    }
    else if((ACVolt_DD >= 2050) && (ACCurr_DD <= 1000 || ACCurr_DD >= 500))
    {
      if(Flag_10ms_A == 1)
        {
            Flag_10ms_A = 0;
            CNT_Battery_Full++;
            if(CNT_Battery_Full >= 255)
            {
				CNT_Battery_Full = 0;
                Statu_Word_A = 0;
                Statu_Word_B = 2;
            }
        }     
    }
    else
      CNT_Battery_Full = 0;
}

void chargeComplete()
{ 
    myStatus = 5;
	Statu_Word_A = 0;
	Statu_Word_B = 1;
}

/*******************************************************************************
-----------------------------    End of file    --------------------------------
 *******************************************************************************/
