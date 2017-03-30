
/* 
 * File:   GL_power_control.c
 * Author: cwj
 *
 * Created on 2016年8月11日, 上午11:42
 */

#include "type_def.h"

//******************************************************************************
/*驱动全桥波形输出*/
//******************************************************************************

//******************************************************************************
//无线收发数据
//******************************************************************************

void GL_power_control(void)
{
    switch (MacStatus)
      {
      case C_MSIdle://待机
        {
          Clear_Nrf24l01();
          MacStatus = C_MSScan;
          Time1_PWM_Close_Mode1(); //快速关闭PWM输出
          break;
        }
      case C_MSScan://查询接收机
        {
          Scan_Nrf24l01();
          Time1_PWM_Close_Mode1(); //快速关闭PWM输出
          switch (Step_Work)
            {
            case 0://
              {
                //PauseHeat(0, 1); //等待2000ms
                Step_Work =1;
                break;
              }
            case 1:
              {
                PauseHeat(98, 2); //等待3800ms		
                break;
              }
            case 2:
              {
                PauseHeat(2, 0); //等待100ms								
                break;
              }
            default:
              break;
            }
          break;
        }
      case C_MSPair://发送配对请求
        {
          NRF24L01_Mode = 0;
          Pair_Nrf24l01();
          Time1_PWM_Close_Mode1(); //快速关闭PWM输出
          PauseHeat(100, 20); //等待5000ms
          break;
        }
      case C_MSWork://供电
        {                  
          Fast_Adjust_Time1_cycle2(Time1_Need_cycle);
          Rec_Send_data(); //供电状态收发数据
          break;
        }
      case C_MSProt://异常
        {
          Time1_PWM_Close_Mode1(); //快速关闭PWM输出
          Rec_Send_data(); //异常状态保持通讯
          break;
        }
      default:
        break;
      }
}

//IGBT断续发送触发的时间=周期10000us-100us等待真正过零-20us高电平确保触发的延时

void setTrigTime(int Tcycle)
{
    Trig_time = Tcycle * 6;

    if (Trig_time < 100)
    {
        Trig_time = 0;
    }
    if (Trig_time > 1100)
    {
        Trig_time = 1200;
    }
    Close_time = 1200 - Trig_time;
}


//******************************************************************************

/*
 * 循环时，
 * 关断igbt信号：MCU_OPEN=0, MCU_PULSE=0;
 * 开启IGBT信号：MCU_OPEN=1，MCU_PULSE=1 200us,MCU_PULSE=0,
 * 开启或关断时间小于1ms时不进入循环，保持持续关断或持续开启；
 *           开启1      开启2                  关断
 * MCU_OPEN  1111111111 11111111111111111111  0000000000000000
 * MCU_PULSE 0000000000 11111111111111111111  1111111111111111
 * PWM       1111111111 11111111111111111111  0000000000000000
 * 
 */
//IGBT断续开关触发控制,增加保护控制

void IGBT_control2()
{
    switch (FlagTrig)
      {
      case 1:
        {
          FlagTrig = 2;

          CNTTrig = 0;
          break;
        }
      case 2: //开启1
        {
          CNTTrig++;
          if (CNTTrig >= 100) //进入开启2
          {
              CNTTrig = 0;
              FlagTrig = 3;
              MCU_PULSE = 1;

          }
          break;
        }

      case 3: //开启2
        {

          if (Trig_time < 1190)
          {
              CNTTrig++;
          }
          if (CNTTrig >= Trig_time) //进入关断
          {
              CNTTrig = 0;
              FlagTrig = 4;
              MCU_OPEN = 0;
              /*
                            TIM1_CCR1H = 0;
                            TIM1_CCR1L = 0;
               */
          }
          break;
        }
      case 4: //关断
        {
          if (Close_time > 100)
          {
              CNTTrig++;
          }
          if (CNTTrig >= Close_time && MacStatus == C_MSWork && Trig_time > 4) //进入开启1
          {
              CNTTrig = 0;
              FlagTrig = 5;

              MCU_OPEN = 1;
              TIM1_CCR1H = 0;
              TIM1_CCR1L = 0x64;
          }
          break;
        }
      case 5: //关断
        {
          if (Close_time > 10)
          {
              CNTTrig++;
          }
          if (CNTTrig >= Close_time && MacStatus == C_MSWork && Trig_time > 4) //进入开启1
          {
              CNTTrig = 0;
              FlagTrig = 2;
              MCU_PULSE = 0;

          }
          break;
        }


      case 7: //准备进入完全开启1 
        {
          if (MacStatus == C_MSWork)
          { //进入完全开启1
              CNTTrig = 0;
              FlagTrig = 8;
              MCU_PULSE = 0;
              MCU_OPEN = 1;
              TIM1_CCR1H = 0;
              TIM1_CCR1L = 0x64;
          }
          break;
        }
      case 8: //完全开启1
        {

          CNTTrig++;
          if (CNTTrig >= 100) //进入完全开启2
          {
              CNTTrig = 0;
              FlagTrig = 9;
              MCU_PULSE = 1;

          }

          break;
        }
      case 9: //完全开启IGBT信号
        {
          break;
        }

      case 10: //完全关断
        {

          CNTTrig = 0;
          FlagTrig = 9;
          MCU_OPEN = 0;
          /*
                    TIM1_CCR1H = 0;
                    TIM1_CCR1L = 0;
           */

          break;
        }
      case 0:
        {
          FlagTrig = 2;

          break;
        }


      }
}

//IGBT断续开关触发控制

void IGBT_control1()
{
    switch (FlagTrig)
      {
      case 1:
        {
          FlagTrig = 2;

          CNTTrig = 0;
          break;
        }
      case 2: //开启IGBT信号
        {
          CNTTrig++;
          if (CNTTrig >= Trig_time) //到了时间关闭igbt信号
          {
              CNTTrig = 0;
              FlagTrig = 3;
              TIM1_CCR1H = 0;
              TIM1_CCR1L = 0;
          }
          break;
        }
      case 3: //关闭IGBT信号
        {
          CNTTrig++;
          if (CNTTrig >= Close_time && MacStatus == C_MSWork && Trig_time > 4) //到了时间开启igbt信号
          {
              CNTTrig = 0;
              FlagTrig = 2;
              TIM1_CCR1H = 0;
              TIM1_CCR1L = 0x64;
          }
          break;
        }

      case 0:
        {
          FlagTrig = 2;

          break;
        }


      }
}

