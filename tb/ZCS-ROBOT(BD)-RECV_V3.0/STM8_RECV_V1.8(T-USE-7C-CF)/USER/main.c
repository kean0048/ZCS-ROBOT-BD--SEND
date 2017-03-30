/********************************************************************************/
/*					                                      						*/
/*	Project Name :	发射机		                                      			*/
/*	Version      :	1.0			                              					*/
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              		*/
/*	Clock        :	16MHz			                              				*/
/*	Author	     :	mengzhuozhuo   		                              			*/
/*      Date	     :	2016/04/26	                                      		*/
/*	Corporation  :	中惠创智（深圳）无线供电技术有限公司                    	*/
/*						                              							*/
/********************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
//2017.01.23  

*******************************************************************************/
#define  root
#define  fcaty(y)  RX_ADDRESS_##y
#define  fcatx(x)  RX_ADDR_P##x
/*******************************************************************************
-----------------------------    Include files   -------------------------------
*******************************************************************************/
#include "type_def.h"
extern unsigned char* errmsg[];
extern unsigned char  errno;
//******************************************************************************
//主函数
//******************************************************************************
int main(void)
{
	static unsigned int frm_count = 0;
	static unsigned int add_self_add = 0;
	static TMsg msgMain = {0,NULL,0,0};
	static unsigned char Last_send_count = 0;
    
    asm("sim");	
	//关闭中断	
    if(SysInit() != 1)
	{
		//系统初始化失败
		PC_ODR_ODR1 = 0;//LED2
		PC_ODR_ODR2 = 0;//LED1
		return 0;
	}
    asm("rim");                         //打开中断
	
	while(NRF24L01_Check())             //检测不到24L01
    {
        Delay(1000);                    //延时380um
    }
    printf("CLS(8);\n\r");
    _delay_us(50);
    printf("CLS(8);\n\r");
    for (;;)
    {	
		UniqueID_Check();               //保密检测 
		Flag_Eeprom_Ero = 0;
		if(Flag_Eeprom_Ero == 0) 		//保密检测正常
        {
			ADSample(); 				//AD采样
			MacProtect(); 				//异常检测与处理
			//Buzzer();           
			if(globetimer >= 200)
			{
				Sys_Start = true;
				//Touch_Coil_On = true;
				if(Touch_Coil_On)
				{
					NOT_TACH = true; 
					//if((Flag_Supply_Volt_OK == 2) || (Flag_Supply_Volt_OK == 3))//20170227与ADSample.c中合并使用
					Flag_Supply_Volt_OK = 1;
					if(MacStatus == C_MSWork)
					{						
						//此为配对及查询程序
						if(deQueue(&queSEND,&msgMain) == 1)
						{	
							switch(ProcesstStatus)
							{
							  case C_MSPair:
								  if((!STA_PAIR_CODE) && (Master_Comm == 0xaa) && (Self_Num <= ALLOWED_PAIR) && (myStatus == 0))
								  {	
									  //printf("Come In");
									  for(int i = 0;i<5;i++)
									  {
										  self_cpd_send[i] = Address_Pair[i];
										  add_self_add ^= self_cpd_send[i];
									  }
									  //random_delay = (int)globetimer/720000 + (add_master_add | add_self_add) * 5000;//随机数 2017.01.16由于中断原因最好取消延时
									  //Delay(random_delay);
									  Master_Comm_Re = 0xDD;
									  SendDataUpdate_Pair();
									  nrfWriteAck(0,TD_Array,TX_PLOAD_WIDTH);

									  if(strncmp((char*)self_cpd,(char*)Address_Pair,5) == 0)
									  {
										  Self_Num_Re = Self_Num;
										  //切换通道
										  if(Self_Num_Re == 1)
											TX_P_SET(RX_ADDRESS_1);
										  else if(Self_Num_Re == 2) 
											TX_P_SET(RX_ADDRESS_2);
										  else if(Self_Num_Re == 3)
											TX_P_SET(RX_ADDRESS_3);
										  else if(Self_Num_Re == 4)
											TX_P_SET(RX_ADDRESS_4);
										  else if(Self_Num_Re == 5)
											TX_P_SET(RX_ADDRESS_5);
                                          
										  CNT_Send_Time = true;
										  //PC_ODR_ODR2 = 1;
										  _delay_us(500);//20170213 测试是否影响LD1灭
										  ProcesstStatus = C_MSScan;
										  STA_PAIR_CODE = true;
										  NRF24L01_Write_Reg(FLUSH_TX,0xff);//清除RX FIFO寄存器
									  }
								  }	
								  break;
								  
							  case C_MSScan:
									Recv_Msg = true;
									if((PC_IDR_IDR2 != 1) && (!Pair_Succ))
										PC_ODR_ODR2 = 1;
									if((Master_Comm == 0xbb) && (strncmp((char*)self_cpd,(char*)Address_Pair,5) == 0))
									{	
										FrmNumb = (frm_count++) % 255;
									  	if(frm_count >= 254)
										  	frm_count = 0;

										Pair_Succ = true;
										Flag_Word = 0xCC;
										SendDataUpdate();
										nrfWriteAck(1,TD_Array,TX_PLOAD_WIDTH);	//TX_PLOAD_WIDTH			
									}
								  break;
								  
							  default:
								  break;
							}
						}
						//系统正常处理程序
						switch(HaveChangedOver)
						{
						  case 0://正常充电状态
							if(STA_PAIR_CODE)
							{
								switch(myStatus)
								{
								  case 0:
									CC_CVcharging();//充电
									Statu_Word_A = 0;//20170221充电识别码
									Statu_Word_B = 0;
									Chanrg_Over = 0;
									break;
								  case 5:
									PF_ODR_ODR4 = 1; //断开继电器
									HaveChangedOver = 2;
									break;
								  case 6:
									chargeComplete();
									break;
								  default:
									break;
								}						
							}
							else
							{
								//PC_ODR_ODR1 = 1;
								//PC_ODR_ODR2 = 1;
							}
							break;
						  case 1: //电池未用完时充电过程						
							if(ACVolt_DD >= 2050)//认为电池为满的状态，不需要充电
							{
                                HaveChangedOver = 2;
								Chanrg_Over = 1; //20170223充满电内部标识
								Statu_Word_A = 0;//20170221充电完成识别码
								Statu_Word_B = 1;	
								PF_ODR_ODR4 = 1; //断开继电器								
							}
							else if(ACVolt_DD < 2050)//认为电池未充满，可以按正常方式充电
							{
								HaveChangedOver = 0;
							}												
							break;
						  case 2:
                            FULL_DOWN_BETTERFLY = true;
                            LED_TEST_INT();
							break;
						  default:
							break;					  
						}
					}
					else if (MacStatus == C_MSProt)
					{						
						switch(ProNum)
						{
						  case 0:
							//过流处理方法
							errno = 1;
							break;
						  case 1:
							//过压处理方法
							errno = 2;
							break;
						  case 8:
							//队列无故满
							break;
						  case 9:
							//输入电压过高处理办法
							errno = 3;
							break;
						  default:
							break;						
						}					
					}						  
				}
				else
				{		
					if(deQueue(&queSEND,&msgMain) == 1)
					{
						if((CNT_Send_Time) && (Master_Comm == 0xbb) && (strncmp((char*)self_cpd,(char*)Address_Pair,5) == 0))
						{
							Flag_Word = 0x00; //离开发射线圈
							SendDataUpdate();
							nrfWriteAck(1,TD_Array,TX_PLOAD_WIDTH);
							Last_send_count++;
							if(Last_send_count >= 2)
							{
								CNT_Send_Time = false;
								CLEAR_P_SET();     //2017.01.18 用于清空频域 替换原来的CHECK_P0_SET（）函数
								Last_send_count = 0;
                                PF_ODR_ODR4 = 0;//继电器闭合
                                Variable_Init_Second();
                                FLAG_CNT_TOUCH_SET = 2;
							}
                            Flag_Supply_Volt_OK = 2;//标识进入过线圈脱离程序
                            
						}
						else if((Flag_Supply_Volt_OK == 0) || (Flag_Supply_Volt_OK == 1))
						{
							CLEAR_P_SET();
							PF_ODR_ODR4 = 0;//继电器闭合
							Flag_Supply_Volt_OK = 2;
							Variable_Init_Second();
                            FLAG_CNT_TOUCH_SET = 3;
						}
					}
                    else if((Flag_Supply_Volt_OK == 0) || (Flag_Supply_Volt_OK == 1))
                    {
                        if(!NOT_TACH)
                        {
                             FLAG_CNT_TOUCH_SET = 4;
                             CLEAR_P_SET();
                             Variable_Init_Second();
                             Flag_Supply_Volt_OK = 2;//标识进入过线圈脱离程序
                             PF_ODR_ODR4 = 0;//继电器闭合
                        }
                        else if(!STA_PAIR_CODE)
                        {
                             FLAG_CNT_TOUCH_SET = 4;
                             CLEAR_P_SET();
                             Variable_Init_Second();
                             Flag_Supply_Volt_OK = 2;//标识进入过线圈脱离程序
                             PF_ODR_ODR4 = 0;//继电器闭合
                        }
                    }
					else //正常状态
					{	
                        if(Step_ERR_Main)
                        {
                          PC_ODR_ODR1 = 1; //正常充电完成后拿开电池关闭LED灯	
                        }
                        PC_ODR_ODR2 = 1;
						//NOT_TACH = false;
					}					  
				}
			}

#if 1
			if (Flag_10ms_H == 1)   
			{
				Flag_10ms_H = 0;
				CNT_PRINT++;
				if (CNT_PRINT % 15 == 0)
					printf("DS16(0,17,'采集电压:%d    ',12);\n\r", ACVolt_AD);
				if (CNT_PRINT % 15 == 0) 
					printf("DS16(0,0,'电池电压:%d mV  ',12);\n\r", ACVolt_DD*10);
				if (CNT_PRINT % 15 == 0)
					printf("DS16(0,34,'采集电流:%d    ',12);\n\r", ACCurr_AD);
				if (CNT_PRINT % 16 == 0)
					//printf("DS16(0,51,'ACCurr_DD:%d mA ',12);\n\r", ACCurr_DD);
					printf("DS16(0,51,'电池电流:%d mA ',12);\n\r", ACCurr_DD);
				if (CNT_PRINT % 17 == 0)
					printf("DS16(0,68,'采集感应电压:%d      ',12);\n\r",ACSupply_Volt_AD);
				if (CNT_PRINT % 18 == 0)
					printf("DS16(0,85,'线圈电压:%d mV   ',12);\n\r",ACSupply_Volt_DD*10);

				if (CNT_PRINT % 35 == 0)
				{
					printf("DS16(0,119,'与线盘接触否:%d ',12);\n\r",Touch_Coil_On);
					
					printf("DS16(0,136,'配对情况:%d      ',12);\n\r", STA_PAIR_CODE);
					
					printf("DS16(0,153,'ErrStatus:%s    ',12);\n\r", errmsg[errno]);
				}
				//if (CNT_PRINT == 80)printf("DS16(0,153,'RXworkCycle:%d    ',12);\n\r", RX_Time1_Work_cycle);
				if (CNT_PRINT >= 254)
				{	
					//printf("CLS(8);\n\r");
					CNT_PRINT = 0;
				}
			
				/*count_re++;
				if(count_re > 1000)
				{
					count_re = 0;
					Touch_Coil_On = false;
				}*/
					
			}
#endif			
		}
	}
}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
	while (1)
	{
		
	}
}
#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/