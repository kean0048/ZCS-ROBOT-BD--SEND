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
#include "PWM_Control.h"
#include "string.h"
#include "stdio.h"
static unsigned char Falg_F_R_Changed = 0;

//static unsigned char Falg_lessfull_Changed = 0;
//******************************************************************************
//static unsigned char str_succ[20] = "set_success_";
//static unsigned char str_fail[20] = "set_failed__";
//******************************************************************************
/*等待查询阶段和等待发送配对信号*/
//******************************************************************************

void PauseHeat(unsigned int ptime, unsigned char nextstep)
{
    Flag_PHCEn = 1; // pause heat time count enable
    if (CNT_PHeat >= ptime)
    {
        Flag_PHCEn = 0;
        CNT_PHeat = 0;
        if (nextstep == 20)
        {
            MacStatus = C_MSWork; //主机配对阶段等待
            CNT_Prot[6] = 200; //CNT_Prot[protype] = 500;
            Mode_Rec_Send = 1; //接收模式
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

void Time1_PWM_Close_Mode_Fast(void)
{
	unsigned int data;
	//TIM1_ARR = 267; //f = 30k
    TIM1_CCR1H = 0;
    TIM1_CCR1L = 0;
	data = TIM1_CCR1H;
    TIM1_CCR1 = data * 256 + TIM1_CCR1L;

    TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
    TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;

}
//******************************************************************************


//******************************************************************************
/*正常关闭PWM输出(缓慢关闭）*/
//******************************************************************************

int Time1_PWM_Close_Mode_Slow(void)//正常关闭PWM输出(缓慢关闭）
{
	unsigned int data;
	//TIM1_ARR = 267; //f = 30k
    if (Time1_Work_cycle <= Min_cycle)
    {
        Time1_PWM_Close_Mode_Fast();
    }
    else
    {
        if (Flag_10ms_E == 1)
        {
            Flag_10ms_E = 0;
            Time1_Work_cycle--;
			
			TIM1_CCR1H = ((Time1_Work_cycle * TIM1_ARR / 100) / 308) / 256;
			TIM1_CCR1L = ((Time1_Work_cycle * TIM1_ARR / 100) / 308) / 256;
			data = TIM1_CCR1H;
			TIM1_CCR1 = data * 256 + TIM1_CCR1L;
			TIM1_CCR3H = TIM1_CCR1H;
			TIM1_CCR3L = TIM1_CCR1L;
			TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
			TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
			TIM1_CCR4H = TIM1_CCR2H;
			TIM1_CCR4L = TIM1_CCR2L;
        }
    }
	return 1;
}
//******************************************************************************


//******************************************************************************
/*IGBT间歇发送式 指定占空比，输出PWM*//*占空比一般10%到48%内*/
//******************************************************************************

void Adjust_Time1_cycle2(unsigned char cycle)//cycle=100表示占空比50%
{   
    /*unsigned int data;
	TIM1_ARRH = (8000 / 30) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率30K
    TIM1_ARRL = (8000 / 30) % 256;
	TIM1_ARR = 267; //f = 30k
    TIM1_CCR1H = 0;
    TIM1_CCR1L = cycle;
	data = TIM1_CCR1H;
    TIM1_CCR1 = data * 256 + TIM1_CCR1L;
    TIM1_CCR3H = TIM1_CCR1H;
    TIM1_CCR3L = TIM1_CCR1L;
    TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
    TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
    TIM1_CCR4H = TIM1_CCR2H;
    TIM1_CCR4L = TIM1_CCR2L;*/
	
	unsigned int data;
	unsigned int Ratio_Value;
	unsigned int Frequent_value;
	
	if(Falg_F_R_Changed == 1)
	{
		Stor_Frequen_eeprom[cycle+5] = Stor_Frequent[cycle];
		Stor_Ratio_eeprom[cycle+5] = Stor_Ratio[cycle];
		Falg_F_R_Changed = 0;
	}

	Frequent_value = Stor_Frequen_eeprom[cycle+5];				
	Ratio_Value = Stor_Ratio_eeprom[cycle+5];
	
    TIM1_ARRH = (FOSC_16M / 2000 / Frequent_value) / 256; //（16M/2/40K）16M时钟，中央对齐模式除以2，频率20K
	TIM1_ARRL = (FOSC_16M / 2000 / Frequent_value) % 256;
	data = TIM1_ARRH;
	TIM1_ARR = data * 256 + TIM1_ARRL;
	Time1_Work_cycle = Ratio_Value;
	TIM1_CCR1H = 0;
	TIM1_CCR1L = TIM1_ARR * Ratio_Value / 100;//80;//53;//40;//27;
	data = TIM1_CCR1H;
	TIM1_CCR1 = data * 256 + TIM1_CCR1L;

	TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
	TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
	
}

//******************************************************************************
/*指定占空比，输出PWM*//*占空比一般10%到48%内*/
//******************************************************************************

void Adjust_Time1_cycle(unsigned char cycle)//cycle=100表示占空比50%
{
    unsigned int data;
    unsigned char num1l, num1h;
    if (Flag_100us_A == 1)
    {
        Flag_100us_A = 0;
        if (cycle >= Max_cycle)
        {
            cycle = Max_cycle;
        }
        if (Time1_Work_cycle < cycle)
        {
            Time1_Work_cycle++;
            num1h = ((Time1_Work_cycle * TIM1_ARR) / 200) / 256;
            num1l = ((Time1_Work_cycle * TIM1_ARR) / 200) % 256;
            data = num1h;
            TIM1_CCR1 = data * 256 + num1l;
            TIM1_CCR1H = num1h;
            TIM1_CCR1L = num1l;
        }
        else if (Time1_Work_cycle > cycle)
        {
            Time1_Work_cycle--;
            num1h = ((Time1_Work_cycle * TIM1_ARR) / 200) / 256;
            num1l = ((Time1_Work_cycle * TIM1_ARR) / 200) % 256;
            data = num1h;
            TIM1_CCR1 = data * 256 + num1l;
            TIM1_CCR1H = num1h;
            TIM1_CCR1L = num1l;
        }
    }
}
/*******************************************************************************
-----------------------------    End of file    --------------------------------
 *******************************************************************************/
//******************************************************************************
/*IGBT根据接收端请求直接输出PWM*//*占空比一般5%到30%内*/
//******************************************************************************

void Fast_Adjust_Time1_cycle2(unsigned char cycle)//cycle=200表示占空比30%
{
    unsigned int data;

    Time1_Work_cycle = cycle;
    data = Time1_Work_cycle * 3  / 5;

    if (Time1_Work_cycle < 8)
    {
        num1h = 0;
        num1l = 0;
    }
    else if (Time1_Work_cycle < 16)
    {
        num1h = 0;
        num1l = 48 / 5 % 256;
    }
    else
    {
        num1h = Time1_Work_cycle * 3 / 1280;
        num1l = Time1_Work_cycle * 3 / 5 % 256;
    }

    /*
            num1h = ((Time1_Work_cycle * 6 / 20 * TIM1_ARR) / 200) / 256;
            num1l = ((Time1_Work_cycle * 6 / 20 * TIM1_ARR) / 200) % 256;
     */

    //data = num1h;
    TIM1_CCR1 = data;
    TIM1_CCR1H = num1h;
    TIM1_CCR1L = num1l;
    TIM1_CCR3H = TIM1_CCR1H;
    TIM1_CCR3L = TIM1_CCR1L;
    TIM1_CCR2H = (TIM1_ARR - data) / 256;
    TIM1_CCR2L = (TIM1_ARR - data) % 256;
    TIM1_CCR4H = TIM1_CCR2H;
    TIM1_CCR4L = TIM1_CCR2L;
}

//******************************************************************************
/*不缓启动，直接输出PWM*//*占空比一般10%到48%内*/
//******************************************************************************

void Fast_Adjust_Time1_cycle_4uart(const unsigned int Frequent_value,const unsigned int Ratio_Value)//cycle=100表示占空比50%
{
	unsigned int data;
    TIM1_ARRH = (FOSC_16M / 2000 / Frequent_value) / 256; //（16M/2/40K）16M时钟，中央对齐模式除以2，频率20K
	TIM1_ARRL = (FOSC_16M / 2000 / Frequent_value) % 256;
	data = TIM1_ARRH;
	TIM1_ARR = data * 256 + TIM1_ARRL;
	Time1_Work_cycle = Ratio_Value;
	TIM1_CCR1H = 0;
	TIM1_CCR1L = TIM1_ARR * Ratio_Value / 100;//80;//53;//40;//27;
	data = TIM1_CCR1H;
	TIM1_CCR1 = data * 256 + TIM1_CCR1L;

	TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
	TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
	printf("set_success_%d!",Pwm_Product_numValue);
}

//******************************************************************************
//根据挂载产品数量粗调PWM值//*占空比一般10%到48%内*/
//******************************************************************************
void  Sum_Adjust_Time1_cycle(const unsigned char Pnumb)
{
	if((NUM_PWM_UPload != Pnumb) || (Falg_F_R_Changed == 1))
	{
		NUM_PWM_UPload = Pnumb;
		if(Falg_F_R_Changed == 1)
		{
			if(CNT_FULL_Num >= 1)
			{
				Stor_Frequen_eeprom[NUM_PWM_UPload] = Stor_Frequent[NUM_PWM_UPload + CNT_FULL_Num];
				Stor_Ratio_eeprom[NUM_PWM_UPload] = Stor_Ratio[NUM_PWM_UPload + CNT_FULL_Num];				
			}
			else
			{
				Stor_Frequen_eeprom[NUM_PWM_UPload] = Stor_Frequent[NUM_PWM_UPload];
				Stor_Ratio_eeprom[NUM_PWM_UPload] = Stor_Ratio[NUM_PWM_UPload];
			}
		}
		Fast_Adjust_Time1_cycle_4uart(Stor_Frequen_eeprom[NUM_PWM_UPload],Stor_Ratio_eeprom[NUM_PWM_UPload]);
			
		Falg_F_R_Changed = 0;
	}
}

void  Sum_Adjust_Time1_cycle_lessfull(const unsigned char Pnumb,const unsigned char num_lessfull)
{
	if((NUM_PWM_UPload != Pnumb) || (Falg_F_R_Changed == 1) || (num_lessfull != NUM_PWM_UPload_LessFull))
	{
		NUM_PWM_UPload = Pnumb;
		NUM_PWM_UPload_LessFull = num_lessfull;
		if(Falg_F_R_Changed == 1)
		{
			if(CNT_FULL_Num >= 1)
			{
				Stor_Frequen_eeprom[NUM_PWM_UPload] = Stor_Frequent[NUM_PWM_UPload + CNT_FULL_Num];
				Stor_Ratio_eeprom[NUM_PWM_UPload] = Stor_Ratio[NUM_PWM_UPload + CNT_FULL_Num];				
			}
			else
			{
				Stor_Frequen_eeprom[NUM_PWM_UPload] = Stor_Frequent[NUM_PWM_UPload];
				Stor_Ratio_eeprom[NUM_PWM_UPload] = Stor_Ratio[NUM_PWM_UPload];
			}
		}
		switch(NUM_PWM_UPload_LessFull)
		{
		  case 1:
			Fast_Adjust_Time1_cycle_4uart(Stor_Frequen_eeprom[NUM_PWM_UPload] + 2,Stor_Ratio_eeprom[NUM_PWM_UPload]);
			break;
		  case 2:
			Fast_Adjust_Time1_cycle_4uart(Stor_Frequen_eeprom[NUM_PWM_UPload] + 5,Stor_Ratio_eeprom[NUM_PWM_UPload]);
			break;	
		  case 3:
			Fast_Adjust_Time1_cycle_4uart(Stor_Frequen_eeprom[NUM_PWM_UPload],Stor_Ratio_eeprom[NUM_PWM_UPload]);
			break;
		  case 4:
			Fast_Adjust_Time1_cycle_4uart(Stor_Frequen_eeprom[NUM_PWM_UPload],Stor_Ratio_eeprom[NUM_PWM_UPload]);
			break;
		  case 5:
			Fast_Adjust_Time1_cycle_4uart(Stor_Frequen_eeprom[NUM_PWM_UPload],Stor_Ratio_eeprom[NUM_PWM_UPload]);
			break;
		  default:
			break;
		}
		Falg_F_R_Changed = 0;
	}
}
/*void  Sum_Adjust_Time1_cycle(unsigned char Pnumb)
{
	unsigned int data;
	static int temp_frequent_value= 0;
	static int temp_ratio_value = 0;
    unsigned char tem_comd[5] = "$cmd";
    if(Pnumb == Pwm_Product_numValue)
    {
       if((strncmp((char*)Stor_Commd,(char*)tem_comd,4) == 0) && ((temp_frequent_value != Pwm_Frequent_Value) || (temp_ratio_value != Pwm_Ratio_Value)))
        {
			temp_frequent_value = Pwm_Frequent_Value;
			temp_ratio_value = Pwm_Ratio_Value;
          TIM1_ARRH = (8000 / Pwm_Frequent_Value) / 256; //（16M/2/40K）16M时钟，中央对齐模式除以2，频率20K
          TIM1_ARRL = (8000 / Pwm_Frequent_Value) % 256;
          data = TIM1_ARRH;
          TIM1_ARR = data * 256 + TIM1_ARRL;
          Time1_Work_cycle = Pwm_Ratio_Value;
          TIM1_CCR1H = 0;
          TIM1_CCR1L = TIM1_ARR * Pwm_Ratio_Value / 100;//80;//53;//40;//27;
          data = TIM1_CCR1H;
          TIM1_CCR1 = data * 256 + TIM1_CCR1L;
          TIM1_CCR3H = TIM1_CCR1H;
          TIM1_CCR3L = TIM1_CCR1L;
          TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
          TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
          TIM1_CCR4H = TIM1_CCR2H;
          TIM1_CCR4L = TIM1_CCR2L;
		  //sprintf((char*)str_succ,"set_success_%d!",Pwm_Product_numValue);
		  //strcat((char*)str_succ,(char*)Pwm_Product_numValue);
		  //UART2_SendString(str_succ,13);
		  printf("set_success_%d!",Pwm_Product_numValue);
		  Printf("DS16(0,102,'pwm_Succ!',12);\n\r");
        }
	   //else if((temp_frequent_value == Pwm_Frequent_Value) && (temp_ratio_value == Pwm_Ratio_Value));
	   //else
		   //Printf("DS16(0,102,'pwm_Fail!',12);\n\r");
		   //printf("set_failed__%d!",Pwm_Product_numValue);
    }
    else
    {
	  if((NUM_PWM_UPload != Pnumb) || (Falg_F_R_Changed == 1))
      {
          NUM_PWM_UPload = Pnumb;
          switch(NUM_PWM_UPload)
          {
            case 0: //关闭 20170223 此处永远不法进入，屏蔽
              Adjust_Time1_cycle2(27);
              break;
            case 1: //10% 15% 20% 15%
              //TIM1_ARRH = (8000 / 30) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率30K
              //TIM1_ARRL = (8000 / 30) % 256;
              //TIM1_ARR = 267; //f = 30k  dt = 30us
              TIM1_ARRH = (8000 / 28) / 256; //（16M/2/40K）16M时钟，中央对齐模式除以2，频率20K
              TIM1_ARRL = (8000 / 28) % 256;
              TIM1_ARR = 286;
              Time1_Work_cycle = 20;
              TIM1_CCR1H = 0;
              TIM1_CCR1L = 57;//80;//53;//40;//27;
              data = TIM1_CCR1H;
              TIM1_CCR1 = data * 256 + TIM1_CCR1L;
              TIM1_CCR3H = TIM1_CCR1H;
              TIM1_CCR3L = TIM1_CCR1L;
              TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
              TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
              TIM1_CCR4H = TIM1_CCR2H;
              TIM1_CCR4L = TIM1_CCR2L;   
              break;
            case 2: //20% 15% 20% 30% 25%
              //TIM1_ARRH = (8000 / 27) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率27K
              //TIM1_ARRL = (8000 / 27) % 256;
              //TIM1_ARR = 296; //f = 27k  dt = 30us
              TIM1_ARRH = (8000 / 28) / 256; //（16M/2/40K）16M时钟，中央对齐模式除以2，频率20K
              TIM1_ARRL = (8000 / 28) % 256;
              TIM1_ARR = 286;
              Time1_Work_cycle = 27;
              TIM1_CCR1H = 0;
              TIM1_CCR1L = 77;//120;//80;//53;//40;//59;
              data = TIM1_CCR1H;
              TIM1_CCR1 = data * 256 + TIM1_CCR1L;
              TIM1_CCR3H = TIM1_CCR1H;
              TIM1_CCR3L = TIM1_CCR1L;
              TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
              TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
              TIM1_CCR4H = TIM1_CCR2H;
              TIM1_CCR4L = TIM1_CCR2L; 
              break;
            case 3: //30% 20% 25% 36% 33%
              //TIM1_ARRH = (8000 / 23) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率23K
              //TIM1_ARRL = (8000 / 23) % 256;
              //TIM1_ARR = 347; //f = 23k  dt = 30us
              TIM1_ARRH = (8000 / 28) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率23K
              TIM1_ARRL = (8000 / 28) % 256;
              TIM1_ARR = 286; //f = 23k  dt = 30us
              Time1_Work_cycle = 35;//30;
              TIM1_CCR1H = 0;
              TIM1_CCR1L = 101;//144;//96;//67;//53;//104;
              data = TIM1_CCR1H;
              TIM1_CCR1 = data * 256 + TIM1_CCR1L;
              TIM1_CCR3H = TIM1_CCR1H;
              TIM1_CCR3L = TIM1_CCR1L;
              TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
              TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
              TIM1_CCR4H = TIM1_CCR2H;
              TIM1_CCR4L = TIM1_CCR2L;
              break;
            case 4: //40% 25% 30% 41% 39%
              //TIM1_ARRH = (8000 / 20) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率20K
              //TIM1_ARRL = (8000 / 20) % 256;
              //TIM1_ARR = 400; //f = 20k dt = 30us
              TIM1_ARRH = (8000 / 28) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率20K
              TIM1_ARRL = (8000 / 28) % 256;
              TIM1_ARR = 286; //f = 20k dt = 30us
              Time1_Work_cycle = 40;
              TIM1_CCR1H = 0;
              TIM1_CCR1L = 114;//164;//109;//80;
              data = TIM1_CCR1H;
              TIM1_CCR1 = data * 256 + TIM1_CCR1L;
              TIM1_CCR3H = TIM1_CCR1H;
              TIM1_CCR3L = TIM1_CCR1L;
              TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
              TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
              TIM1_CCR4H = TIM1_CCR2H;
              TIM1_CCR4L = TIM1_CCR2L;
              break;
            case 5: //45%
              Time1_Work_cycle = 45;
              TIM1_CCR1H = 0;
              TIM1_CCR1L = 139;
              data = TIM1_CCR1H;
              TIM1_CCR1 = data * 256 + TIM1_CCR1L;
              TIM1_CCR3H = TIM1_CCR1H;
              TIM1_CCR3L = TIM1_CCR1L;
              TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
              TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
              TIM1_CCR4H = TIM1_CCR2H;
              TIM1_CCR4L = TIM1_CCR2L;
              break;
            default:
                  break;			
          }
      }
    }
}*/


//******************************************************************************
/*不缓启动，直接输出PWM*//*占空比一般10%到48%内*/
/*Pow_On：代表每一个接收端需要的功率*/
//which_chenal:代表通道
//******************************************************************************

void Fast_Adjust_Time1_cycle(const unsigned char cycle,const unsigned int Pow_On,const unsigned char which_chenal,const unsigned char isnew_chenal)//cycle=100表示占空比50%
{
    unsigned int data;
    unsigned char num1l, num1h;
	static unsigned long Temp_pow[5] = {0}; 	//记录初始功率，及要调整的功率阈值
	static unsigned char Temp_chenal = 0; 	//通道值
	static char Temp_chenal_frist[5] = {1};// 辅助记录初始值的一次性变量，只有遇到新增接收机时才开启记录一次
	static float Temp_Work_cycle = 0;			//计算占空比用
	Temp_chenal = which_chenal;
	//占空比设定第一步
	if(isnew_chenal == 1)
	{
		Time1_Work_cycle += 25;//如果是新的就增加25%
		switch(Temp_chenal)
		{
		  case 1:
			Temp_chenal_frist[0] = 1;
			break;
		  case 2:
			Temp_chenal_frist[1] = 1;
			break;
		  case 3:
			Temp_chenal_frist[2] = 1;
			break;
		  case 4:
			Temp_chenal_frist[3] = 1;
			break;
		  case 5:
			Temp_chenal_frist[4] = 1;
			break;
		  default:
			break;		
		}
	}
	Temp_Work_cycle = Time1_Work_cycle;
	//占空比调整第二步
	switch(Temp_chenal)
	{
	  case 1:
		Flag_NEW_DEV[0] = 0;
		if(Temp_chenal_frist[0])
		{
			Temp_pow[0] = Pow_On;
			Temp_chenal_frist[0] = 0;
		}
		if((int)(Temp_pow[0]*0.8) >= Pow_On)
		{
			//Temp_Work_cycle = (Temp_Work_cycle*(cycle-1) / cycle) + ((Temp_Work_cycle /cycle) * 0.8);
			Temp_Work_cycle = (Temp_Work_cycle*(cycle-1) / cycle) + ((Temp_Work_cycle /cycle) * 0.8);
			Temp_pow[0] = (long)(Temp_pow[0] * 0.5);
		}
	    else if(Temp_pow[0] >= Pow_On)
		{
			Temp_Work_cycle = (Temp_Work_cycle*(cycle-1) / cycle) + ((Temp_Work_cycle /cycle) * 0.5);
			Temp_pow[0] = (long)(Temp_pow[0] * 0.2);
		}
	    else if(Temp_pow[0] >= Pow_On)
		{
			Temp_Work_cycle = (Temp_Work_cycle*(cycle-1) / cycle) + ((Temp_Work_cycle /cycle) * 0.2);
			Temp_pow[0] = 0;
		}
		Time1_Work_cycle = (int)Temp_Work_cycle;
		break;
	  case 2:
		Flag_NEW_DEV[1] = 0;
		break;
	  case 3:
		Flag_NEW_DEV[2] = 0;
		break;
	  case 4:
		Flag_NEW_DEV[3] = 0;
		break;
	  case 5:
		Flag_NEW_DEV[4] = 0;
		break;
	  default:
		break;
	}
	
	if(Pow_On)
	{
		num1h = Time1_Work_cycle  / 256;
        num1l = Time1_Work_cycle  % 256;
		data = Time1_Work_cycle;
		TIM1_CCR1H = num1h;
		TIM1_CCR1L = num1l;
		TIM1_CCR2H = (TIM1_ARR - data) / 256;
    	TIM1_CCR2L = (TIM1_ARR - data) % 256;
	}
	else
	{
		TIM1_CCR1H = 0;
		TIM1_CCR1L = 0;	
		TIM1_CCR2H = 0;
		TIM1_CCR2L = 0;
	}
	
	
}


//*********************************************************************************
/*函数名   ：Adjust_Time1_RF_4UART(unsigned char Pnumb) 						 */
/*功能     ：通过接收串口命令，修改pwm频率及占空比                               */
/*输入参数 ：Pnumb-调整电池个数即设置几个电池的占空比及频率                      */
/*返回值   ： null                                                               */
/*Time     ：2017-03-10															 */
/*Author   ：Kean																 */
/*Modify   ：null																 */
//*********************************************************************************
void Adjust_Time1_RF_4UART( const unsigned char commd[],const unsigned char Pnumb,const unsigned char Pfrequent,const unsigned char Pratio)
{
	static int temp_frequent_value= 0;
	static int temp_ratio_value = 0;
	static int temp_product_value = 0;
    unsigned char tem_comd[5] = "$cmd";

    if((strncmp((char*)commd,(char*)tem_comd,4) == 0) && ((temp_frequent_value != Pfrequent) || (temp_ratio_value != Pratio)))
	{
		temp_frequent_value = Pfrequent;
		temp_ratio_value = Pratio;
		temp_product_value = Pnumb;
		
		switch(temp_product_value)
		{
		  case 0:
			Stor_Frequent[0] = temp_frequent_value;
			Stor_Ratio[0] = temp_ratio_value;
			break;
		  case 1: 
			Stor_Frequent[1] = temp_frequent_value;
			Stor_Ratio[1] = temp_ratio_value;
			break;
		  case 2: 
			Stor_Frequent[2] = temp_frequent_value;
			Stor_Ratio[2] = temp_ratio_value;
			break;
		  case 3:
			Stor_Frequent[3] = temp_frequent_value;
			Stor_Ratio[3] = temp_ratio_value;
			break;
		  case 4:
			Stor_Frequent[4] = temp_frequent_value;
			Stor_Ratio[4] = temp_ratio_value;
			break;
		  default:
			break;
		}
		Falg_F_R_Changed = 1;  
	}
}


void FunDealChildPwm(const unsigned char selfNumb,const unsigned char childstatu,unsigned char *lessfull)
{
	unsigned char Status,Numb,num_lessfull;
	Status = childstatu;
	Numb = selfNumb;
	num_lessfull = *lessfull;
	
	switch(Status)
	{
	  case 0://未充满
		if(num_lessfull >= 1)
			Sum_Adjust_Time1_cycle_lessfull(Flag_RECV_ADDRESS_NUM - CNT_FULL_Num,num_lessfull);
		else
			Sum_Adjust_Time1_cycle(Flag_RECV_ADDRESS_NUM - CNT_FULL_Num);
		
		//留作他用
		break;
	  case 1://充满
		if(Flag_FRIST_IN[Numb] == 0)
		{			 
			Flag_FRIST_IN[Numb] = 1;
			(*lessfull)--;
			/*20170224 电池充满后判断如果充电个数等于充满个数则将pwm调节至与初始间断发射同频但连续发射*/
			/*20170224 电池充满后判断如果充电个数不等于充满个数则将pwm降级*/
			CNT_FULL_Num++;
			if(CNT_FULL_Num == Flag_RECV_ADDRESS_NUM)
			{
				Adjust_Time1_cycle2(0);
			}
			else if(num_lessfull >= 1)
				Sum_Adjust_Time1_cycle_lessfull(Flag_RECV_ADDRESS_NUM - CNT_FULL_Num,num_lessfull);
			else
				Sum_Adjust_Time1_cycle(Flag_RECV_ADDRESS_NUM - CNT_FULL_Num);
		}
		else if(CNT_FULL_Num == Flag_RECV_ADDRESS_NUM)
			Adjust_Time1_cycle2(0);
		else if(num_lessfull >= 1)
			Sum_Adjust_Time1_cycle_lessfull(Flag_RECV_ADDRESS_NUM - CNT_FULL_Num,num_lessfull);
		else
			Sum_Adjust_Time1_cycle(Flag_RECV_ADDRESS_NUM-CNT_FULL_Num);
		//留作其他使用
		
		break;
	  case 2:
		Falg_Bettery_Lessfull[Numb] = 1;	
		//Flag_lessfull_bool = 1;
		Sum_Adjust_Time1_cycle_lessfull(Flag_RECV_ADDRESS_NUM - CNT_FULL_Num,num_lessfull);
		break;
	  default:
		break;									  
	}	
}