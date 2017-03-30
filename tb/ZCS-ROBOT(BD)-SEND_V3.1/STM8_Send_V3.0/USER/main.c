/******************************************************************************/
/*					                                      */
/*	Project Name :	发射机（接收）		                                      */
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
#define  root
//#undef   root

/*******************************************************************************
-----------------------------    Include files   -------------------------------
*******************************************************************************/
#include "type_def.h"
#include "Stream2Char.h"
#include "MacProtect.h"
#include "PWM_Control.h"
#include "QueueMsg.h"
#include "SysInit.h"
#include "Nrf24l01.h"
#include "delayTime.h"
#include "FAN_Control.h"
#include "Clock.h"
#include "Eeprom.h"
#include "ADSample.h"
#include "Buzz.h"

int count_time[5] = {0};                //
extern unsigned char* errmsg[];
extern char errno;

//******************************************************************************
//主函数
//******************************************************************************
void main(void)
{
	//////////////////////变量定义区///////////////////////////////
	static unsigned int count_over = 1;
	static unsigned int count_over_f = 0;
	static unsigned char num_lessfull = 0;
	static unsigned int count_add_c = 0;
	//static unsigned char Flag_lessfull_bool = 0;
	//static char count_pwm_start = 0;

	static unsigned char count_succ_check = 0;

	static unsigned char RS_Array_Pair[32];
	static unsigned char RS_Array_Check[32];
	static TMsg msgMain = {0,NULL,0,0};

	static unsigned char Frm_count_Temp = 0;
	static unsigned char Num4Check_CountChecked = 0;
	//////////////////////初始化定义区 关中断///////////////////////////////

	asm("sim");//关闭中断	                       
    SysInit();                          //系统初始化
    asm("rim");                         //打开中断 
	//////////////////////程序区，在此之前开中断///////////////////////////////
    /*while(NRF24L01_Check())             //检测不到24L01
    {
        Delay(100);                    //延时1ms
    }*/
    printf("CLS(8);\n\r");
    _delay_us(100);
    printf("CLS(8);\n\r");
	//////////////////////程序区，在此之前检测NRF模块///////////////////////////////
    for(;;)	
	{	
		Clock(); 						//时间
		UniqueID_Check();               //保密检测
		//Flag_Eeprom_Ero = 0;
		if (Flag_Eeprom_Ero == 0) 		//保密检测正常
        {
			Flag_LED2_ENABLE = 0;  //LED2 灭
            ADSample(); 				//AD采样
			//Buzzer(); 					//蜂鸣器			
			MacProtect(); 				//异常检测与处理
            
            /*20170304,找不到当2个线盘取下后无法配对，零时用来喂狗以保证样品展示正常运行*/
            if(flag_p <= 5)
            {
               IWDG_KR = 0xAA;        //喂狗
            }
		    if(Flag_Mac_On2s == 1)
		    {									
				  if(MacStatus == C_MSNORMAL )
				  {
					  switch(status)
					  {
						case C_MSIdle:	
						  if(flag_statu[3] == 1)
						  {
							  status = C_MSPair;
							  if((flag_statu[0] == 1) && (FLAG_PWM_START ==1))
							  {
								  Time1_PWM_Close_Mode_Fast(); //快速关闭PWM输出								  
								  flag_statu[0] = 0;
								  FLAG_PWM_START = 0;
								  //Printf("DS16(0,85,'Close Pwm',12);\n\r");
                                  
                                  if(flag_p == 2)
                                  {
                                    //asm("trap");      
                                      flag_p = 4;
                                  }
							  }
							  flag_inwstatu[0] = 1;
						  }
						  break;
						case C_MSPair:
						  if(flag_inwstatu[0] == 1)
						  {
							  if(flag_statu[1] == 1)// 400ms
							  {
								  //Delay(100);
								  //切换到0通道
								  if(Flag_ADDRESS_P0 == 0)	//20170213 减少P0通道切换
                                  {
									  TX_P0_SET(); 		// 如果不添加此代码将加长初次配对时间	
                                      Flag_ADDRESS_P0 = 1; 
                                      flag_p = 1;
                                  }
								  if((flag_statu[4] == 1) && (FLAG_PWM_START == 0))	
								  {
									  //添加缓慢增加pwm的代码
									  Adjust_Time1_cycle2(0);//10%
									  FLAG_PWM_START = 1;
									  flag_statu[4] = 0;
								  }
                                  
								  Child_Count_Num = 1;
								  Child_Comm = 0xaa;//配对
								  Child_Num = Child_Count_Num;
								  for(int j = 0;j<5;j++)
									  Address[j] = Address_Pair[j];
								  SendDataUpdate();
								  //发射配对查询信息，成功后将收到待配对设备的返回信息，返回信息中带有待配对设备的ID
								  if(NRF24L01_TxPacket(TD_Array) == 0x40)
								  {
                                      //Printf("DS16(0,85,'Open Pwm',12);\n\r");
									  memcpy(RS_Array_Pair,RD_Array,RX_PLOAD_WIDTH);
									  for(int i = 0;i<5;i++)
									  {
										  Address_Pair_Child[i] = RS_Array_Pair[i+6];
										  Address_Pair_Parent[i] = RS_Array_Pair[i+11];
									  }
									  if(strncmp((char*)Address_Pair_Parent,(char*)Address_Pair,5) == 0)//这一步为将来多对多使用，现在不影响配对，现在这一步主要是防止收到其他设备的查询返回指令
									  {
										  for(int i = 0;i<5;i++)
										  {
											  count_add_c += Address_Pair_Child[i];
										  }
										  if(count_add_c > 0)
										  {
                                              //Printf("DS16(0,85,'Open Pwm',12);\n\r");
                                              Variable_Init_Second();//20170227
											  for(int i = 0;i<5;i++)
											  {
												  AUTO_Array[Flag_RECV_ADDRESS_NUM_SAME][i] = Address_Pair_Child[i];
											  }
											    
											  for(int j = 0;j<5;j++)
												  Address_Sure[j] = AUTO_Array[Flag_RECV_ADDRESS_NUM_SAME][j];//对应查询接收机的地址
											  SendDataUpdate();
                                              //20170307此处可以更严谨一些加入返回值等于0x40的判断，这样主机不会轻易进入配对状态
											  //20130307无需如此if(NRF24L01_TxPacket(TD_Array) == 0x40)
											  NRF24L01_TxPacket(TD_Array);
											  Flag_RECV_ADDRESS_NUM_SAME++;
											  Flag_RECV_ADDRESS_NUM  = Flag_RECV_ADDRESS_NUM_SAME; //20170220 充满后用于标记，同时减去pwm
											 
											  /*for(int j = 0;j<5;j++) //2017.01.18删除后配对随机性增加，但是如果不删除，会出现配对失败
												  Address_Sure[j] = 0;*/								
											  Child_Count_Num = Flag_RECV_ADDRESS_NUM_SAME;//这一步是否多余，以后观察？？？？？
											  count_add_c = 0;			
										  }
										  //else
											  //Child_Count_Num--;
									  }
									  //else
										  //Child_Count_Num--;
								  }
								  //else
									  //Child_Count_Num--;

								  if(Flag_RECV_ADDRESS_NUM_SAME > 0)//一旦有配对设备，则进入查询分支，同时，只要Flag_RECV_ADDRESS_NUM_SAME ！=0，则不会进入该分支
								  {
									  status = C_MSWork;
								  }
								  else
								  {
									  status = C_MSIdle;
									  flag_statu[1] = 0;
								  }
								  flag_inwstatu[0] = 0;
							  }												
						  }
						  else
						  {
							  if(flag_inwstatu[1] == 1)
							  {
								  if(flag_statu[1] == 1)
								  {
									  //Flag_RECV_ADDRESS_NUM_SAME为4时挂载设备数量为5
									  if(Flag_RECV_ADDRESS_NUM_SAME < ALLOWED_PAIR)//连接设备数量小于允许连接值则继续，若大于则退出配对查询，将查询开始值置1
									  {
										  //切换到0通道
										  TX_P0_SET();
										  _delay_us(100);
                                          //flag_p = 2;
										  //printf("TX_P_SET(0);\n");
										  Flag_ADDRESS_P0 = 1; //20170213 用于标识在配对阶段已经切换至p0通道减少空载时P0切换
										 
										  //2017.01.18 增加查找哪一个线盘可以放置新电池
										  for(int i = 0;i < ALLOWED_PAIR;i++)
										  {
											 if(Flg_Chenal_OK[i] == 0)//该通道配对设备已拿走
											 {
												 Child_Count_Num = i;
												 break;
											 }
										  }
										  Child_Count_Num++;//该值随连接设备数量变化
										  Child_Comm = 0xaa;//配对指令
										  Child_Num = Child_Count_Num;//指定下一个配对设备的序号
										  for(int j = 0;j<5;j++)
											  Address[j] = Address_Pair[j]; //主机地址（MAC_address)
										  SendDataUpdate();
										  if(NRF24L01_TxPacket(TD_Array) == 0x40)//发送配对查询指令
										  {
											  memcpy(RS_Array_Pair,RD_Array,RX_PLOAD_WIDTH);
											  for(int i = 0;i<5;i++)
											  {
												  Address_Pair_Child[i] = RS_Array_Pair[i+6];//返回内容中6~10位为待连接设备地址
												  Address_Pair_Parent[i] = RS_Array_Pair[i+11];//11~15位主机地址
											  }
											  if((strncmp((char*)Address_Pair_Parent,(char*)Address_Pair,5) == 0) && (Child_Comm_Back == 0xDD))//判断返回内容是否为需要的内容，配对查询指令返回值为OXDD
											  {
												  for(int i = 0;i<5;i++)
													  count_add_c += Address_Pair_Child[i];
												  if(count_add_c > 0)
												  {
													  for(int i = 0;i<10;i++)//由于系统原因导致重复配对的，标号时候要剔除
													  {
														  if(strncmp((char*)AUTO_Array[i],(char*)Address_Pair_Child,5) == 0)
														  {
															  Flag_SAME_ADDR = 1;
															  FLAG_Re_WHOHAVE = i;
															  break;
														  }
													  }
													  //有重复地址时，不予配对
													  if(Flag_SAME_ADDR == 1)
													  {
														  Flag_SAME_ADDR = 0;
														  for(int j = 0;j<5;j++) //2017.01.18 配对确认信息删除
															  Address_Sure[j] = 0;
														  //此处是否应该添加如果同样地址请求100次则给予配对的权限？？？20170222
														  CNT_Re_WHOHAVE++;
														  if(CNT_Re_WHOHAVE >= 100)
														  {
															  for(int j = 0;j < ALLOWED_PAIR;j++)
									  								AUTO_Array[FLAG_Re_WHOHAVE][j] = 0;
															  CNT_Re_WHOHAVE = 0;
														  }
													  }
													  else
													  {
														  //主要用于查询那个接收端可以放置新的配对地址
														   for(int i = 0;i<ALLOWED_PAIR;i++)
														   {
															   if(Flg_Chenal_OK[i] == 0)//该通道配对设备已拿走
															   {
																   Check_Num = i; //记录可以存放数据的位置
																   Flg_Chenal_OK[i] = 1;
																   Flg_Chenal_Fail[i] = 0;
																   break;
															   }
														   }
														   //以上的for可以和以下 的if合并，可以减少一个5字节的数组使用，以后要优化
														   //有充满拿走后的使用这个(检查是否被标记)
														  if(flg_stop_send_in[Check_Num])
														  {	
															  for(int i = 0;i<5;i++)
															  {
																  AUTO_Array[Check_Num][i] = Address_Pair_Child[i];
															  }
															  flg_stop_send_in[Check_Num] = 0;
															  //Check_Num = 0;
														  }
														  else//这应该是第一次上电后使用的，直到满后
														  {
															  for(int i = 0;i<5;i++)
															  {
																  AUTO_Array[Flag_RECV_ADDRESS_NUM_SAME][i] = Address_Pair_Child[i];
															  }	
															  //flg_stop_send_in[Flag_RECV_ADDRESS_NUM_SAME] = false;
														  }
														  
														  for(int j = 0;j<5;j++)
															  Address_Sure[j] = AUTO_Array[Check_Num][j];//对应查询接收机的地址
														   
														  Check_Num = 0;//2017.01.20  从240行移植到此处，保证上面的Address_Sure从AUTO_Array里拿到正确的地址信息
														  SendDataUpdate();
														  
														  //20170307if(NRF24L01_TxPacket(TD_Array) == 0x40)//无需如此，因为主机无法确定是否是该机回复的内容
														  NRF24L01_TxPacket(TD_Array);
														  
														  Flag_RECV_ADDRESS_NUM_SAME++;
														  Flag_RECV_ADDRESS_NUM  = Flag_RECV_ADDRESS_NUM_SAME; //20170220 充满后用于标记，同时减去pwm
														  //for(int j = 0;j<5;j++)
															  //Address_Sure[j] = 0; //2017.01.18 放在此处保留会影响配对效果
													  }
													  Child_Count_Num = Flag_RECV_ADDRESS_NUM_SAME;
													  count_add_c = 0;
												  }
												  else
													  Child_Count_Num--;
											  }
											  else
												  Child_Count_Num--;
										  }
										  else
											  Child_Count_Num--;
										  
										  if(Flag_RECV_ADDRESS_NUM_SAME > 0)//如果小于零则说明所有设备都已经下线，则进入空闲和配对查询交替分支
										  {
											  status = C_MSWork;
											  flag_statu[1] = 0;
										  }
										  else
										  {
											  status = C_MSIdle;
											  flag_statu[0] = 1;	
											  flag_statu[2] = 0;//20170303
										  }			
									  }
									  else//多于设定可充电数量时执行此分支，不再查询配对设备
									  {
										  status = C_MSWork;
										  flag_statu[1] = 0;
										  //flag_inwstatu[2] = true; 2017.01.17 因为工作阶段随不同的子模块都会切换地址，所以该值失去辨别意义
									  }
									  flag_inwstatu[1] = 0;
									  count_over = 1;
									  count_over_f = 1;//20170308
									  Num4Check_CountChecked = 0;
								  }
							  }
						  }
						  break;
						case C_MSWork:
						  if(flag_statu[2] == 1)//500ms
						  {	
							  if(flag_recheck_over == 1) // 是否有查询失败的情况，若有，则继续查询没有查询成功的配对设备
								  Child_Num = count_over_f;
							  else
								  Child_Num = count_over % ALLOWED_PAIR;//查询哪一个
							  //切换查询模式
							  //printf("Child_Num = %d :count_over_f = %d\n",Child_Num,count_over_f);
							  if(Flg_Chenal_Fail[Child_Num-1]) //2017.01.18 如果该位置产品被拿走，则不再查询该位置
							  {
								  for(int j = 0;j < ALLOWED_PAIR;j++)
									  AUTO_Array[Child_Num-1][j] = 0;
								  //flag_check_succ[Child_Num-1] = true;
								  //Flg_Chenal_Fail[Child_Num-1] = false;
								  count_over++;//查询下一个
								  
								  if(flag_recheck_over == 1)
									  flag_recheck_over = 0;
								  
								  if(count_over >= ALLOWED_PAIR)
									  count_over = 0;
								  break;	
							  }
							  else
								  Num4Check_CountChecked++;
							
							  Flag_ADDRESS_P0 = 0; //20170213 用于标识在配对阶段已经切换至p0通道减少空载时P0切换
							  
                              //flag_p = 3;
                              
							  TX_P_SET(Child_Num);//Delay(400);
							  //printf("TX_P_SET(%d);\n",Child_Num-1);
							  _delay_us(100);
							  Child_Comm = 0xbb;//查询命令
							  for(int j = 0;j<5;j++)
								  Address[j] = AUTO_Array[Child_Num-1][j];//对应查询接收机的地址
							  if(Frm_count_Temp >= 245)
								  Frm_count_Temp = 0;
							  Frm_count[Child_Num-1] = (Frm_count_Temp++) % 255;
							  Frm_num = Frm_count[Child_Num-1];
							  SendDataUpdate();
							  
							  if((NRF24L01_TxPacket(TD_Array) == 0x40) && (strncmp((char*)Address4Check,(char*)Address,5) == 0x00))//收到查询返回信息，并验证地址正确性
							  {	
								  flag_check_succ[Child_Num-1] = 1; // 标记查询正确
								  flag_recheck_over = 0;
								  count_false_check = 0;				 //计数清零
								  Flag_False_Check_Pass = 0;
								  CNT_Rec_Check_Fail[Child_Num-1] = 0;
								  Falg_ForeignBody_Check[Child_Num-1] = 1;//20170320 如果为1，则可以将反馈的功率值作为有效值相加
							  }
							  else
							  {
								  Falg_ForeignBody_Check[Child_Num-1] = 0;
								  CNT_Rec_Check_Fail[Child_Num-1]++;
								  if(Flag_False_Check_Pass == 1)
								  {
									  flag_check_succ[Child_Num-1] = 1;//3次查询失败后 标记成功
									  count_false_check = 0;//计数清零
									  Flag_False_Check_Pass = 0;
								  }
								  else
								  {
									  flag_check_succ[Child_Num-1] = 0;//标记查询失败
								  }
							  }	
							  
							  if(Child_Num >= 3)
								  printf("TX_P_SET(%d);\n",Child_Num-1);
							  if(Num4Check_CountChecked >= Flag_RECV_ADDRESS_NUM_SAME)//如果查询数量=连接设备数量则说明已查询所有连接设备，如果不等则++，进入下一个设备查询
							  {
								  for(int i = 0;i < ALLOWED_PAIR;i++)
								  {
									  //2017.01.19 注销，使用直接修改flag_check_succ的方法,flg_stop_send_in此变量值不易轻易修改
									  //2017.01.18将取下的排除在外，确保不进入死循环
									  //if(flg_stop_send_in[i])
										  //flag_check_succ[i] = false;
									  if((!Flg_Chenal_Fail[i])&&(flag_check_succ[i] == 1))
									  {	
										  count_succ_check++;
									  }
								  }
								  if(count_succ_check == Flag_RECV_ADDRESS_NUM_SAME)//若相等则证明所有连接设备都已查询，退出分支进入配对查询分支
								  {
									  if(flag_inwstatu[1] == 0)
									  {
										  for(int j = 0;j<5;j++) //2017.01.18删除后配对随机性增加，但是如果不删除，会出现配对失败
											  Address_Sure[j] = 0;
										  flag_inwstatu[1] = 1;
									  }
									  status = C_MSPair;
									  count_over_f = 1;
									  flag_recheck_over = 0;
									  count_false_check = 0;
									  count_over = 1;
									  Num4Check_CountChecked = 0; //2017.01.18 恢复记录已查询产品个数计数变量初始值
								  }
								  else//不等，需要轮询查看那个设备没有查询成功
								  {
									  //2017.01.19 注销，使用直接修改flag_check_succ的方法,flg_stop_send_in此变量值不易轻易修改
									  //2017.01.18将取下的排除在外，确保不进入死循环
									  /*for(int i = 0;i <ALLOWED_PAIR;i++)
									  {
										  if(flg_stop_send_in[i])
											  flag_check_succ[i] = true;
									  }*/
									  for(int i = 1;i <= ALLOWED_PAIR;i++)
									  {
										  //2017.01.19 添加(!Flg_Chenal_Fail[i])条件，保证若果1掉了，则不查询1，查询2.3.。。
										  if((!Flg_Chenal_Fail[i-1]) && (flag_check_succ[i-1] == 0))//查到那个没有查询成功
										  {
											  flag_recheck_over = 1;//标记进入待查询设备号选择
											  count_over_f = i;//记录要重复查询的子设备标号
											  count_false_check++;//记录查询次数，跳出
											  break;
										  }
									  }
								  }
								  count_succ_check = 0;
							  }
							  else
							  {
								  count_over++;
							  }

							  if(count_false_check >= 3)//若查询失败的子设备在重复查询3次后尚无回复信息，则放弃查询，进入下一个待查
							  {
								  Flag_False_Check_Pass = 1;//实质上第二次查完就置ture了，如果第三次查询失败，则进入失败程序置成功并false，成功就进入成功程序并false;
							  }
							  
							  FunDealChildLostWork(Child_Num,&num_lessfull);
							                              
							  if(Flag_RECV_ADDRESS_NUM_SAME <= 0)
							  {
								  status = C_MSPair;
								  flag_inwstatu[1] = 1;
								  Flag_RECV_ADDRESS_NUM = 0;
								  NUM_PWM_UPload = 0;
							  }
							  
 							  flag_statu[2] = 0;//20170303
							  
							  if(((Flag_RECV_ADDRESS_NUM - CNT_FULL_Num) > 0) && (Flag_Fan_Open == 0))
							  {
								  Fan_Open();
							  }
							  else if(((Flag_RECV_ADDRESS_NUM - CNT_FULL_Num) <= 0) && (Flag_Fan_Open == 1))
							  {
								  Fan_Close();
							  }
						  }
						  break;
						default:
						  break;			
					  }
					  
					  if(deQueue(&queSEND,&msgMain) == 1)//2017.01.18修改后可以显示说有连接查询回复情况，增加后只能显示最后查询情况 && flag_inwstatu[1]
					  {
						  memcpy(RS_Array_Check,(unsigned char *)msgMain.pInf,msgMain.datalenth);
						  //以下添加解码程序
						  parseByteStream2FrameStreamsp1(RS_Array_Check,msgMain.datalenth);
						  for(int i = 0;i<5;i++)
						  {
							  if(Falg_Bettery_Lessfull[i] == 1)
								  num_lessfull++;
							  if(Falg_ForeignBody_Check[i] == 1)
								  Cnt_ForeignBody_Available++;
						  }

						  if(Falg_ForeignBody_Check[ZoneChargWiLess.SlfNum-1] == 1)
						  {
							  strncpy((char*)TempUsed,(char*)ZoneChargWiLess.PowerS,4);
							  Float_ForeignBody_Value[ZoneChargWiLess.SlfNum-1] = PowerChild;
						  }
  	  
						  if(ZoneChargWiLess.PairComm == 0x00)//2017.01.17 添加当离开线圈后的处理方式
						  {
							  FunDealChildLost(ZoneChargWiLess.SlfNum,&num_lessfull);
						  }
						  else
						  {
							  //在此添加PWM等相关操作								  
							  FunDealChildPwm(ZoneChargWiLess.SlfNum,ZoneChargWiLess.Status,&num_lessfull);
						  }  
						  //20170317清空待充满电池数量，下次进入时再次统计
						  num_lessfull = 0;
						  
						  if(((Flag_RECV_ADDRESS_NUM - CNT_FULL_Num) > 0) && (Flag_Fan_Open == 0))
						  {
							  Fan_Open();
						  }
						  else if(((Flag_RECV_ADDRESS_NUM - CNT_FULL_Num) <= 0) && (Flag_Fan_Open == 1))
						  {
							  Fan_Close();
						  }
					  }					  
				 
				  }
				  else if(MacStatus == C_MSProt)
				  {	
					  for(int i = 0;i<16;i++)
					  {
						  if(ProtectFlag[i])
								DEAL_ABNORMAL_FUN(i);	
					  }
                      flag_p = 5;//异常，不喂狗，mcu重启
				   }							
			}			
		}
		else
			Flag_LED2_ENABLE = 1;
		
#if 1
			if (Flag_10ms_P == 1)   
			{
				Flag_10ms_P = 0;
				CNT_PRINT++;
				if (CNT_PRINT % 100 == 0)
					printf("DS16(0,0,'充电状态:%d 挂载终端数：%d   ',12);\n\r", ZoneChargWiLess.Status,Flag_RECV_ADDRESS_NUM_SAME);
				if (CNT_PRINT % 15 == 0) 
					printf("DS16(0,17,'当前查询终端号:%d   ',12);\n\r", ZoneChargWiLess.SlfNum);
				if (CNT_PRINT % 2 == 0)
					printf("DS16(0,34,'%d mV  %d  %d   ',12);\n\r", ACVolt_DD*10,ACVolt_AD,(int)(Power*1000));
				if (CNT_PRINT % 100 == 0)
                  printf("DS16(0,51,'pwmClass:%d full:%d Upload:%d',12);\n\r", Flag_RECV_ADDRESS_NUM - CNT_FULL_Num,CNT_FULL_Num ,NUM_PWM_UPload);
				if (CNT_PRINT % 100 == 0)
                  printf("DS16(0,68,'流程控制量:%d  频道标识: %d     ',12);\n\r",ZoneChargWiLess.PairComm,flag_p);
				/*if (CNT_PRINT % 18 == 0)
					printf("DS16(0,85,'线圈电压:%d mV   ',12);\n\r",ACSupply_Volt_DD*10);*/

				if (CNT_PRINT % 15 == 0)
				{
					printf("DS16(0,136,'错误信息：%s',12);\n\r",errmsg[errno]);
					//printf("DS16(0,153,'348为第三等级，400为第四等级',12);\n\r");
				
					/*printf("DS16(0,119,'ACTemp_DD:%d ℃ ',12);\n\r",Touch_Coil_On);
					
					printf("DS16(0,136,'MacStatus:%d - %d     ',12);\n\r", STA_PAIR_CODE,Flag_Supply_Volt_OK);
					
					printf("DS16(0,153,'ErrStatus:%s    ',12);\n\r", errmsg[errno]);*/
				}
				//if (CNT_PRINT == 80)printf("DS16(0,153,'RXworkCycle:%d    ',12);\n\r", RX_Time1_Work_cycle);
				if (CNT_PRINT >= 254)
				{	
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