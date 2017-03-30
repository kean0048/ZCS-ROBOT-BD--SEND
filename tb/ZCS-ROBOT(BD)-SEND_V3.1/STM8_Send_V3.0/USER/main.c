/******************************************************************************/
/*					                                      */
/*	Project Name :	����������գ�		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	�лݴ��ǣ����ڣ����߹��缼�����޹�˾                  */
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
//������
//******************************************************************************
void main(void)
{
	//////////////////////����������///////////////////////////////
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
	//////////////////////��ʼ�������� ���ж�///////////////////////////////

	asm("sim");//�ر��ж�	                       
    SysInit();                          //ϵͳ��ʼ��
    asm("rim");                         //���ж� 
	//////////////////////���������ڴ�֮ǰ���ж�///////////////////////////////
    /*while(NRF24L01_Check())             //��ⲻ��24L01
    {
        Delay(100);                    //��ʱ1ms
    }*/
    printf("CLS(8);\n\r");
    _delay_us(100);
    printf("CLS(8);\n\r");
	//////////////////////���������ڴ�֮ǰ���NRFģ��///////////////////////////////
    for(;;)	
	{	
		Clock(); 						//ʱ��
		UniqueID_Check();               //���ܼ��
		//Flag_Eeprom_Ero = 0;
		if (Flag_Eeprom_Ero == 0) 		//���ܼ������
        {
			Flag_LED2_ENABLE = 0;  //LED2 ��
            ADSample(); 				//AD����
			//Buzzer(); 					//������			
			MacProtect(); 				//�쳣����봦��
            
            /*20170304,�Ҳ�����2������ȡ�º��޷���ԣ���ʱ����ι���Ա�֤��Ʒչʾ��������*/
            if(flag_p <= 5)
            {
               IWDG_KR = 0xAA;        //ι��
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
								  Time1_PWM_Close_Mode_Fast(); //���ٹر�PWM���								  
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
								  //�л���0ͨ��
								  if(Flag_ADDRESS_P0 == 0)	//20170213 ����P0ͨ���л�
                                  {
									  TX_P0_SET(); 		// �������Ӵ˴��뽫�ӳ��������ʱ��	
                                      Flag_ADDRESS_P0 = 1; 
                                      flag_p = 1;
                                  }
								  if((flag_statu[4] == 1) && (FLAG_PWM_START == 0))	
								  {
									  //��ӻ�������pwm�Ĵ���
									  Adjust_Time1_cycle2(0);//10%
									  FLAG_PWM_START = 1;
									  flag_statu[4] = 0;
								  }
                                  
								  Child_Count_Num = 1;
								  Child_Comm = 0xaa;//���
								  Child_Num = Child_Count_Num;
								  for(int j = 0;j<5;j++)
									  Address[j] = Address_Pair[j];
								  SendDataUpdate();
								  //������Բ�ѯ��Ϣ���ɹ����յ�������豸�ķ�����Ϣ��������Ϣ�д��д�����豸��ID
								  if(NRF24L01_TxPacket(TD_Array) == 0x40)
								  {
                                      //Printf("DS16(0,85,'Open Pwm',12);\n\r");
									  memcpy(RS_Array_Pair,RD_Array,RX_PLOAD_WIDTH);
									  for(int i = 0;i<5;i++)
									  {
										  Address_Pair_Child[i] = RS_Array_Pair[i+6];
										  Address_Pair_Parent[i] = RS_Array_Pair[i+11];
									  }
									  if(strncmp((char*)Address_Pair_Parent,(char*)Address_Pair,5) == 0)//��һ��Ϊ������Զ�ʹ�ã����ڲ�Ӱ����ԣ�������һ����Ҫ�Ƿ�ֹ�յ������豸�Ĳ�ѯ����ָ��
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
												  Address_Sure[j] = AUTO_Array[Flag_RECV_ADDRESS_NUM_SAME][j];//��Ӧ��ѯ���ջ��ĵ�ַ
											  SendDataUpdate();
                                              //20170307�˴����Ը��Ͻ�һЩ���뷵��ֵ����0x40���жϣ����������������׽������״̬
											  //20130307�������if(NRF24L01_TxPacket(TD_Array) == 0x40)
											  NRF24L01_TxPacket(TD_Array);
											  Flag_RECV_ADDRESS_NUM_SAME++;
											  Flag_RECV_ADDRESS_NUM  = Flag_RECV_ADDRESS_NUM_SAME; //20170220 ���������ڱ�ǣ�ͬʱ��ȥpwm
											 
											  /*for(int j = 0;j<5;j++) //2017.01.18ɾ���������������ӣ����������ɾ������������ʧ��
												  Address_Sure[j] = 0;*/								
											  Child_Count_Num = Flag_RECV_ADDRESS_NUM_SAME;//��һ���Ƿ���࣬�Ժ�۲죿��������
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

								  if(Flag_RECV_ADDRESS_NUM_SAME > 0)//һ��������豸��������ѯ��֧��ͬʱ��ֻҪFlag_RECV_ADDRESS_NUM_SAME ��=0���򲻻����÷�֧
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
									  //Flag_RECV_ADDRESS_NUM_SAMEΪ4ʱ�����豸����Ϊ5
									  if(Flag_RECV_ADDRESS_NUM_SAME < ALLOWED_PAIR)//�����豸����С����������ֵ����������������˳���Բ�ѯ������ѯ��ʼֵ��1
									  {
										  //�л���0ͨ��
										  TX_P0_SET();
										  _delay_us(100);
                                          //flag_p = 2;
										  //printf("TX_P_SET(0);\n");
										  Flag_ADDRESS_P0 = 1; //20170213 ���ڱ�ʶ����Խ׶��Ѿ��л���p0ͨ�����ٿ���ʱP0�л�
										 
										  //2017.01.18 ���Ӳ�����һ�����̿��Է����µ��
										  for(int i = 0;i < ALLOWED_PAIR;i++)
										  {
											 if(Flg_Chenal_OK[i] == 0)//��ͨ������豸������
											 {
												 Child_Count_Num = i;
												 break;
											 }
										  }
										  Child_Count_Num++;//��ֵ�������豸�����仯
										  Child_Comm = 0xaa;//���ָ��
										  Child_Num = Child_Count_Num;//ָ����һ������豸�����
										  for(int j = 0;j<5;j++)
											  Address[j] = Address_Pair[j]; //������ַ��MAC_address)
										  SendDataUpdate();
										  if(NRF24L01_TxPacket(TD_Array) == 0x40)//������Բ�ѯָ��
										  {
											  memcpy(RS_Array_Pair,RD_Array,RX_PLOAD_WIDTH);
											  for(int i = 0;i<5;i++)
											  {
												  Address_Pair_Child[i] = RS_Array_Pair[i+6];//����������6~10λΪ�������豸��ַ
												  Address_Pair_Parent[i] = RS_Array_Pair[i+11];//11~15λ������ַ
											  }
											  if((strncmp((char*)Address_Pair_Parent,(char*)Address_Pair,5) == 0) && (Child_Comm_Back == 0xDD))//�жϷ��������Ƿ�Ϊ��Ҫ�����ݣ���Բ�ѯָ���ֵΪOXDD
											  {
												  for(int i = 0;i<5;i++)
													  count_add_c += Address_Pair_Child[i];
												  if(count_add_c > 0)
												  {
													  for(int i = 0;i<10;i++)//����ϵͳԭ�����ظ���Եģ����ʱ��Ҫ�޳�
													  {
														  if(strncmp((char*)AUTO_Array[i],(char*)Address_Pair_Child,5) == 0)
														  {
															  Flag_SAME_ADDR = 1;
															  FLAG_Re_WHOHAVE = i;
															  break;
														  }
													  }
													  //���ظ���ַʱ���������
													  if(Flag_SAME_ADDR == 1)
													  {
														  Flag_SAME_ADDR = 0;
														  for(int j = 0;j<5;j++) //2017.01.18 ���ȷ����Ϣɾ��
															  Address_Sure[j] = 0;
														  //�˴��Ƿ�Ӧ��������ͬ����ַ����100���������Ե�Ȩ�ޣ�����20170222
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
														  //��Ҫ���ڲ�ѯ�Ǹ����ն˿��Է����µ���Ե�ַ
														   for(int i = 0;i<ALLOWED_PAIR;i++)
														   {
															   if(Flg_Chenal_OK[i] == 0)//��ͨ������豸������
															   {
																   Check_Num = i; //��¼���Դ�����ݵ�λ��
																   Flg_Chenal_OK[i] = 1;
																   Flg_Chenal_Fail[i] = 0;
																   break;
															   }
														   }
														   //���ϵ�for���Ժ����� ��if�ϲ������Լ���һ��5�ֽڵ�����ʹ�ã��Ժ�Ҫ�Ż�
														   //�г������ߺ��ʹ�����(����Ƿ񱻱��)
														  if(flg_stop_send_in[Check_Num])
														  {	
															  for(int i = 0;i<5;i++)
															  {
																  AUTO_Array[Check_Num][i] = Address_Pair_Child[i];
															  }
															  flg_stop_send_in[Check_Num] = 0;
															  //Check_Num = 0;
														  }
														  else//��Ӧ���ǵ�һ���ϵ��ʹ�õģ�ֱ������
														  {
															  for(int i = 0;i<5;i++)
															  {
																  AUTO_Array[Flag_RECV_ADDRESS_NUM_SAME][i] = Address_Pair_Child[i];
															  }	
															  //flg_stop_send_in[Flag_RECV_ADDRESS_NUM_SAME] = false;
														  }
														  
														  for(int j = 0;j<5;j++)
															  Address_Sure[j] = AUTO_Array[Check_Num][j];//��Ӧ��ѯ���ջ��ĵ�ַ
														   
														  Check_Num = 0;//2017.01.20  ��240����ֲ���˴�����֤�����Address_Sure��AUTO_Array���õ���ȷ�ĵ�ַ��Ϣ
														  SendDataUpdate();
														  
														  //20170307if(NRF24L01_TxPacket(TD_Array) == 0x40)//������ˣ���Ϊ�����޷�ȷ���Ƿ��Ǹû��ظ�������
														  NRF24L01_TxPacket(TD_Array);
														  
														  Flag_RECV_ADDRESS_NUM_SAME++;
														  Flag_RECV_ADDRESS_NUM  = Flag_RECV_ADDRESS_NUM_SAME; //20170220 ���������ڱ�ǣ�ͬʱ��ȥpwm
														  //for(int j = 0;j<5;j++)
															  //Address_Sure[j] = 0; //2017.01.18 ���ڴ˴�������Ӱ�����Ч��
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
										  
										  if(Flag_RECV_ADDRESS_NUM_SAME > 0)//���С������˵�������豸���Ѿ����ߣ��������к���Բ�ѯ�����֧
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
									  else//�����趨�ɳ������ʱִ�д˷�֧�����ٲ�ѯ����豸
									  {
										  status = C_MSWork;
										  flag_statu[1] = 0;
										  //flag_inwstatu[2] = true; 2017.01.17 ��Ϊ�����׶��治ͬ����ģ�鶼���л���ַ�����Ը�ֵʧȥ�������
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
							  if(flag_recheck_over == 1) // �Ƿ��в�ѯʧ�ܵ���������У��������ѯû�в�ѯ�ɹ�������豸
								  Child_Num = count_over_f;
							  else
								  Child_Num = count_over % ALLOWED_PAIR;//��ѯ��һ��
							  //�л���ѯģʽ
							  //printf("Child_Num = %d :count_over_f = %d\n",Child_Num,count_over_f);
							  if(Flg_Chenal_Fail[Child_Num-1]) //2017.01.18 �����λ�ò�Ʒ�����ߣ����ٲ�ѯ��λ��
							  {
								  for(int j = 0;j < ALLOWED_PAIR;j++)
									  AUTO_Array[Child_Num-1][j] = 0;
								  //flag_check_succ[Child_Num-1] = true;
								  //Flg_Chenal_Fail[Child_Num-1] = false;
								  count_over++;//��ѯ��һ��
								  
								  if(flag_recheck_over == 1)
									  flag_recheck_over = 0;
								  
								  if(count_over >= ALLOWED_PAIR)
									  count_over = 0;
								  break;	
							  }
							  else
								  Num4Check_CountChecked++;
							
							  Flag_ADDRESS_P0 = 0; //20170213 ���ڱ�ʶ����Խ׶��Ѿ��л���p0ͨ�����ٿ���ʱP0�л�
							  
                              //flag_p = 3;
                              
							  TX_P_SET(Child_Num);//Delay(400);
							  //printf("TX_P_SET(%d);\n",Child_Num-1);
							  _delay_us(100);
							  Child_Comm = 0xbb;//��ѯ����
							  for(int j = 0;j<5;j++)
								  Address[j] = AUTO_Array[Child_Num-1][j];//��Ӧ��ѯ���ջ��ĵ�ַ
							  if(Frm_count_Temp >= 245)
								  Frm_count_Temp = 0;
							  Frm_count[Child_Num-1] = (Frm_count_Temp++) % 255;
							  Frm_num = Frm_count[Child_Num-1];
							  SendDataUpdate();
							  
							  if((NRF24L01_TxPacket(TD_Array) == 0x40) && (strncmp((char*)Address4Check,(char*)Address,5) == 0x00))//�յ���ѯ������Ϣ������֤��ַ��ȷ��
							  {	
								  flag_check_succ[Child_Num-1] = 1; // ��ǲ�ѯ��ȷ
								  flag_recheck_over = 0;
								  count_false_check = 0;				 //��������
								  Flag_False_Check_Pass = 0;
								  CNT_Rec_Check_Fail[Child_Num-1] = 0;
								  Falg_ForeignBody_Check[Child_Num-1] = 1;//20170320 ���Ϊ1������Խ������Ĺ���ֵ��Ϊ��Чֵ���
							  }
							  else
							  {
								  Falg_ForeignBody_Check[Child_Num-1] = 0;
								  CNT_Rec_Check_Fail[Child_Num-1]++;
								  if(Flag_False_Check_Pass == 1)
								  {
									  flag_check_succ[Child_Num-1] = 1;//3�β�ѯʧ�ܺ� ��ǳɹ�
									  count_false_check = 0;//��������
									  Flag_False_Check_Pass = 0;
								  }
								  else
								  {
									  flag_check_succ[Child_Num-1] = 0;//��ǲ�ѯʧ��
								  }
							  }	
							  
							  if(Child_Num >= 3)
								  printf("TX_P_SET(%d);\n",Child_Num-1);
							  if(Num4Check_CountChecked >= Flag_RECV_ADDRESS_NUM_SAME)//�����ѯ����=�����豸������˵���Ѳ�ѯ���������豸�����������++��������һ���豸��ѯ
							  {
								  for(int i = 0;i < ALLOWED_PAIR;i++)
								  {
									  //2017.01.19 ע����ʹ��ֱ���޸�flag_check_succ�ķ���,flg_stop_send_in�˱���ֵ���������޸�
									  //2017.01.18��ȡ�µ��ų����⣬ȷ����������ѭ��
									  //if(flg_stop_send_in[i])
										  //flag_check_succ[i] = false;
									  if((!Flg_Chenal_Fail[i])&&(flag_check_succ[i] == 1))
									  {	
										  count_succ_check++;
									  }
								  }
								  if(count_succ_check == Flag_RECV_ADDRESS_NUM_SAME)//�������֤�����������豸���Ѳ�ѯ���˳���֧������Բ�ѯ��֧
								  {
									  if(flag_inwstatu[1] == 0)
									  {
										  for(int j = 0;j<5;j++) //2017.01.18ɾ���������������ӣ����������ɾ������������ʧ��
											  Address_Sure[j] = 0;
										  flag_inwstatu[1] = 1;
									  }
									  status = C_MSPair;
									  count_over_f = 1;
									  flag_recheck_over = 0;
									  count_false_check = 0;
									  count_over = 1;
									  Num4Check_CountChecked = 0; //2017.01.18 �ָ���¼�Ѳ�ѯ��Ʒ��������������ʼֵ
								  }
								  else//���ȣ���Ҫ��ѯ�鿴�Ǹ��豸û�в�ѯ�ɹ�
								  {
									  //2017.01.19 ע����ʹ��ֱ���޸�flag_check_succ�ķ���,flg_stop_send_in�˱���ֵ���������޸�
									  //2017.01.18��ȡ�µ��ų����⣬ȷ����������ѭ��
									  /*for(int i = 0;i <ALLOWED_PAIR;i++)
									  {
										  if(flg_stop_send_in[i])
											  flag_check_succ[i] = true;
									  }*/
									  for(int i = 1;i <= ALLOWED_PAIR;i++)
									  {
										  //2017.01.19 ���(!Flg_Chenal_Fail[i])��������֤����1���ˣ��򲻲�ѯ1����ѯ2.3.����
										  if((!Flg_Chenal_Fail[i-1]) && (flag_check_succ[i-1] == 0))//�鵽�Ǹ�û�в�ѯ�ɹ�
										  {
											  flag_recheck_over = 1;//��ǽ������ѯ�豸��ѡ��
											  count_over_f = i;//��¼Ҫ�ظ���ѯ�����豸���
											  count_false_check++;//��¼��ѯ����������
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

							  if(count_false_check >= 3)//����ѯʧ�ܵ����豸���ظ���ѯ3�κ����޻ظ���Ϣ���������ѯ��������һ������
							  {
								  Flag_False_Check_Pass = 1;//ʵ���ϵڶ��β������ture�ˣ���������β�ѯʧ�ܣ������ʧ�ܳ����óɹ���false���ɹ��ͽ���ɹ�����false;
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
					  
					  if(deQueue(&queSEND,&msgMain) == 1)//2017.01.18�޸ĺ������ʾ˵�����Ӳ�ѯ�ظ���������Ӻ�ֻ����ʾ����ѯ��� && flag_inwstatu[1]
					  {
						  memcpy(RS_Array_Check,(unsigned char *)msgMain.pInf,msgMain.datalenth);
						  //������ӽ������
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
  	  
						  if(ZoneChargWiLess.PairComm == 0x00)//2017.01.17 ��ӵ��뿪��Ȧ��Ĵ���ʽ
						  {
							  FunDealChildLost(ZoneChargWiLess.SlfNum,&num_lessfull);
						  }
						  else
						  {
							  //�ڴ����PWM����ز���								  
							  FunDealChildPwm(ZoneChargWiLess.SlfNum,ZoneChargWiLess.Status,&num_lessfull);
						  }  
						  //20170317��մ���������������´ν���ʱ�ٴ�ͳ��
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
                      flag_p = 5;//�쳣����ι����mcu����
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
					printf("DS16(0,0,'���״̬:%d �����ն�����%d   ',12);\n\r", ZoneChargWiLess.Status,Flag_RECV_ADDRESS_NUM_SAME);
				if (CNT_PRINT % 15 == 0) 
					printf("DS16(0,17,'��ǰ��ѯ�ն˺�:%d   ',12);\n\r", ZoneChargWiLess.SlfNum);
				if (CNT_PRINT % 2 == 0)
					printf("DS16(0,34,'%d mV  %d  %d   ',12);\n\r", ACVolt_DD*10,ACVolt_AD,(int)(Power*1000));
				if (CNT_PRINT % 100 == 0)
                  printf("DS16(0,51,'pwmClass:%d full:%d Upload:%d',12);\n\r", Flag_RECV_ADDRESS_NUM - CNT_FULL_Num,CNT_FULL_Num ,NUM_PWM_UPload);
				if (CNT_PRINT % 100 == 0)
                  printf("DS16(0,68,'���̿�����:%d  Ƶ����ʶ: %d     ',12);\n\r",ZoneChargWiLess.PairComm,flag_p);
				/*if (CNT_PRINT % 18 == 0)
					printf("DS16(0,85,'��Ȧ��ѹ:%d mV   ',12);\n\r",ACSupply_Volt_DD*10);*/

				if (CNT_PRINT % 15 == 0)
				{
					printf("DS16(0,136,'������Ϣ��%s',12);\n\r",errmsg[errno]);
					//printf("DS16(0,153,'348Ϊ�����ȼ���400Ϊ���ĵȼ�',12);\n\r");
				
					/*printf("DS16(0,119,'ACTemp_DD:%d �� ',12);\n\r",Touch_Coil_On);
					
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