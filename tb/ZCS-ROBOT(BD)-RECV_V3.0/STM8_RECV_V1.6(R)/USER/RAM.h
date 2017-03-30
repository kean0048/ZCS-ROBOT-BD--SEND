/******************************************************************************/
/*					                                      */
/*	Project Name :	���騦??��		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	?D?Y���??�ꡧ��??����??T??1?��???��?��D?T1???                    */
/*						                              */
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
*******************************************************************************/
#ifndef _RAM_
#define _RAM_
#define ALLOWED_PAIR 5
#define CNT_RECV_ACK 10
#define APLH_C 0x43
#define APLH_J 0x4A
/*******************************************************************************
-----------------------------    Macro define    -------------------------------
*******************************************************************************/
#ifdef root
#define ramExtern 	 //?��main.c?D?����?"#define root", ?�� ramExtern ��??����??a??��?
#else			 //?��????��?.c???t?D??��D"#define root",��2�㨹o?��????t������?
#define ramExtern extern//ramExtern ��??����??a"extern?����?����?a?��???����?��??����a?��
#endif

/*******************************************************************************
----------------------------     Global define    ------------------------------
*******************************************************************************/
ramExtern unsigned long 		globetimer;//ϵͳ1ms�δ�
ramExtern unsigned int 		PowOn2s;//ϵͳ1ms�δ�
ramExtern bool					CJ_SEND;
ramExtern bool					Sys_Start;
//������
ramExtern unsigned char 		myStatus;    //�������ջ�״̬
ramExtern unsigned int  		CNT_TrickleCharge;//������ʱ����ʱ2��ͣ60��
ramExtern unsigned char  		Flag_TrickleCharge;//������ʱ�����
ramExtern bool  				NOT_TACH;//�쳣��ʱ
ramExtern unsigned char 		CNT_PRINT;
//������ʱ������ʱ
    
ramExtern unsigned char 		con;
ramExtern unsigned char 		Flag_NRF24L01_Change_EN;
//ԭ���� ��Թ���
ramExtern unsigned char 		MacStatus;
ramExtern unsigned char 		ProcesstStatus;
ramExtern unsigned char		HaveChangedOver;
ramExtern bool			 		Queue_Full;
ramExtern bool			 		Queue_Full_P0_Changed;
ramExtern unsigned int 		add_master_add;
ramExtern bool			 		Pair_Succ;
ramExtern unsigned int 		Fail_Num;
ramExtern bool 					Recv_Msg;
//***********************************************
//��ʱ
ramExtern unsigned char         CNT_T2ms;
ramExtern unsigned char         CNT_T10ms;
ramExtern unsigned char         CNT_T1ms;
ramExtern unsigned int          CNT_T2s;
ramExtern unsigned int          CNT_T1s;
ramExtern unsigned char         STA_SEND_SUCC;
ramExtern unsigned char         STA_SYS_ERR;
ramExtern bool 					 STA_PAIR_CODE;
//***********************************************
//�����㷨��ֵ
ramExtern unsigned char         ChipUniqueID[12];
ramExtern unsigned char		  CHECK_ID[6];
ramExtern unsigned int          Key_Check_ID1;
ramExtern unsigned char         Key_Check_ID2;
ramExtern unsigned int          Key_Check_ID3;
ramExtern unsigned char         Flag_Eeprom_Ero;
ramExtern unsigned char         Flag_1hour_A;
ramExtern unsigned char         Flag_Eeprom_Check;
ramExtern unsigned char         CNT_Eeprom_Check;
ramExtern unsigned int          CNT_T1min;
ramExtern unsigned int          CNT_T1hour;
//***********************************************
//AD������ֵ
ramExtern unsigned char 		ADC_RESULT_L; //ADC��ʱ��¼��λ
ramExtern unsigned char 		ADC_RESULT_H; //ADC��ʱ��¼��λ
ramExtern unsigned int 		ADC_RESULT; //ADC��ʱ��¼�ߵ�λ�ϲ�
ramExtern unsigned int 		AD_Value_SUM[12]; //����ADCͨ��ѡ���ֵ֮�ʹ洢
ramExtern unsigned char 		SUM_CNT[12]; //����ADCͨ��ѡ��Ĳ��������������������˲��㷨
ramExtern unsigned int 		AD_Value[12]; //����ADCͨ��ѡ���ֵ�洢
ramExtern unsigned int 		ACSupply_Volt_AD; //�����ѹADCֵ
ramExtern unsigned int 		ACVolt_AD; //��ص�ѹADCֵ
ramExtern unsigned int 		ACCurr_AD; //��ص���ADCֵ
ramExtern unsigned int 		ACTemp_AD; //???����AD?|��
ramExtern unsigned int 		ACSupply_Volt_DD; //�����ѹ��ʵֵ ��λ10mV
ramExtern unsigned int 		ACVolt_DD; //��ѹ��ʵֵ ��λ10mV
ramExtern unsigned int 		ACCurr_DD; //��ص�����ʵֵ ��λ1mA
ramExtern unsigned int 		ACTemp_DD; //???������o|��?��o?|��
ramExtern unsigned int 		AD_Curr_Buff[4]; //��ʱûʹ��
//ramExtern unsigned int 		AD_Curr_Array[128]; //�������ADC����ֵ�洢
ramExtern unsigned char 		CNT_AD_Curr;
ramExtern unsigned int 		AD_Curr_Tab[128];//��������

ramExtern unsigned long 		AD_Curr_SUM; //�������ADC����ֵ�ʹ洢
ramExtern unsigned char 		CNT_Curr_Scan; //��ʱûʹ��
ramExtern unsigned char 		CNT_Curr_Time; //��ʱûʹ��
ramExtern unsigned char 		Cut_OffPower; //��ص�����ʶ 0x01����س����ɶϵ磬0x00:���ڳ��
ramExtern bool 					over_input_vol; //������Ȧ�˹�ѹ
ramExtern unsigned char 		CNT_Power_Add; //��ʱûʹ��
ramExtern bool 					CNT_Send_Time; //��ʱûʹ��
ramExtern unsigned char 		Flag_Word; //��ʱûʹ��
ramExtern bool			 		Flag_Right_Check; //��ʱûʹ��
ramExtern unsigned char 		CNT_AD_Volt;
ramExtern unsigned int 		AD_Volt_Array[128]; //��ѹ���ADC����ֵ�洢
ramExtern unsigned long 		AD_Volt_SUM; //��ѹ���ADC����ֵ�ʹ洢
ramExtern unsigned int 		AD_Supply_Volt_Array[64]; //�����ѹ���ADC����ֵ�洢
ramExtern unsigned long 		AD_Supply_Volt_SUM; //�����ѹ���ADC����ֵ�ʹ洢

//***********************************************
//����������
ramExtern unsigned char         Buzz_Control;
ramExtern unsigned char         Command_Old;
ramExtern unsigned char         Buzz_Keep_CNT;
ramExtern unsigned char         Buzz_Times_CNT;
ramExtern unsigned char         Buzz_Step;
ramExtern unsigned char         Buzz_Buffer;
ramExtern unsigned char         CNT_Buzzer;
//***********************************************
//PWM��������� //DCDCpwm 
ramExtern unsigned int          CNT_PHeat;
ramExtern unsigned int          TIM1_ARR;
ramExtern unsigned int          TIM1_CCR1;
ramExtern unsigned char 		  Step_Work;
ramExtern unsigned char         Flag_PHCEn;
ramExtern unsigned char         Time1_Work_cycle;//�̡�?��1�����????����
ramExtern unsigned char         Time1_Need_cycle;//?����??��D����a��?????����
ramExtern unsigned char         Flag_Time1_PWM_OnOff;//0������?1?1������??a
ramExtern unsigned char         Flag_PWM_ENable;
//***********************************************
//NRF24L01���������
ramExtern unsigned char 		 self_cpd[6];
ramExtern unsigned char         master_cpd[6];
ramExtern unsigned char         self_cpd_send[6];
ramExtern unsigned char         TX_ADDRESS[5]; //���յ�ַ; //����?����??��
ramExtern unsigned char         RX_ADDRESS[5]; //���յ�ַ; //����?����??��
ramExtern unsigned char         Num_RF;
ramExtern unsigned char         TD_Array[32]	;
ramExtern unsigned char         RD_Array[32]	;
ramExtern unsigned char         RESV_Array[32]	;
ramExtern unsigned char         Address_Rec[7][6];
ramExtern unsigned char         Address_Pair[5];
ramExtern unsigned char         CNT_Send_Fail;
ramExtern unsigned char         CNT_Send_OK;
ramExtern unsigned char         CNT_Rec_Fail;
ramExtern unsigned char         Self_Num;
ramExtern unsigned char         Self_Num_Re;
ramExtern unsigned char         Master_Comm;
ramExtern unsigned char         Master_Comm_Re;
ramExtern unsigned char         Flag_NRF24L01_OK;
ramExtern unsigned int			  MODE_R_S;
ramExtern bool         			  Flag_ADDRESS_SET_OK;
ramExtern unsigned char 		  RX_Time1_Work_cycle; //���յ��ĵ�ǰռ�ձ�
ramExtern unsigned char 		  TX_Cycle; 		   //����ռ�ձȣ�ÿ0.5%Ϊ1
ramExtern unsigned char 		  Chanrg_Over; 		   //����ռ�ձȣ�ÿ0.5%Ϊ1
ramExtern unsigned char 		  Can_Pow_On;			//��ʾ�����ϵ��ˣ���⵽��Ȧ��ѹ0����Ȧ���ˣ�1����Ȧ�Ӵ�
ramExtern unsigned char 		  Statu_Word_A;			//���״̬��
ramExtern unsigned char 		  Statu_Word_B;			//���״̬��
ramExtern unsigned char 		  CNT_TOUCH_SET;        //�����Ƿ�Ӵ��ļ�������
ramExtern bool			 		  FLAG_CNT_TOUCH_SET;   //�ﵽ�������ʾ�Ӵ�
ramExtern unsigned int 		  CNT_TOUCH_RE;        //�����Ƿ�Ӵ��ļ����������Ӵ�
ramExtern bool			 		  FLAG_CNT_TOUCH_RE;   //�ﵽ�������ʾ���Ӵ�
//***********************************************
//����ֵ
ramExtern unsigned char			Key_Save;         //??��?���?��IO?��           
ramExtern unsigned char			Key_Temp;         //���?��?o��?IO?��
ramExtern unsigned char			Key_Value;        //���?��?��
ramExtern unsigned char			Key_Hit_CNT;      //���?��?�����??��y��?��y
ramExtern unsigned char			Key_Long_CNT;     //���?��3����??��y��?��y
ramExtern unsigned char			Key_Status;       //���?�����䨬?�ꡧ?T��??������?3�����?
//***********************************************
//����״̬��
ramExtern unsigned char			Flag_Mac_On2s;//?a?��2???��2a1��??
ramExtern unsigned int				CNT_Prot[15];
ramExtern unsigned int				CNT_ProtB[15];
ramExtern unsigned char			ProtectFlag[15];
ramExtern unsigned char			ProNum;
ramExtern unsigned char			Flag_enable_work;
ramExtern unsigned int				CNT_MPSub_Beep;
ramExtern unsigned char			Flag_NTCOpen_Check_EN;
ramExtern unsigned int				CNT_T2min;
ramExtern unsigned long			Power;
ramExtern unsigned char			TX_Pro_Code_A;
ramExtern unsigned char			TX_Pro_Code_B;
ramExtern unsigned char			RX_Pro_Code_A;
ramExtern unsigned char			RX_Pro_Code_B;
ramExtern unsigned char			Flag_NRF24L01_Have;
ramExtern unsigned char			CNT_Current_Over;
ramExtern unsigned char			Flag_Current_Over;
ramExtern unsigned char			Flag_Temp_Over;

ramExtern unsigned char 		Flag_Remove_load_EN;//�ƿ����̱���
ramExtern unsigned char 		CNT_Remove_load_EN; //�ƿ����̱���

//�жϱ���
ramExtern unsigned char 		Flag_EXTI_Pro;
ramExtern unsigned int 		CNT_EXTI_Pro;
ramExtern unsigned char 		Flag_Curr_OVER_IT;//�����жϱ���
ramExtern unsigned int 		CNT_Curr_OVER_IT;
ramExtern bool                  FULL_DOWN_BETTERFLY;
//***********************************************
//���ȿ���
ramExtern unsigned int          CNT_Fan_Open;
ramExtern unsigned char         Flag_Fan_First;
ramExtern unsigned char         Flag_Fan_Open;
ramExtern unsigned char         CNT_Fan_Check;
ramExtern unsigned int          CNT_Fan_Speed;
//***********************************************
//UART����
ramExtern unsigned char         Uart_Buf[16];
ramExtern unsigned char         UART2_RX_BUF[64];
ramExtern unsigned char         UART2_pRead;
ramExtern unsigned char         UART2_pWrite;
ramExtern unsigned char         RobotCommandProcStep;
ramExtern unsigned char         checkSum;
ramExtern unsigned char         err;
ramExtern unsigned char         cmdCounter;
ramExtern unsigned char         wCmdAckBuf[32];
ramExtern unsigned char         rCmdContent;
ramExtern unsigned char         FrmNumb;
//***********************************************
//�յ�����������
ramExtern bool         			 Touch_Coil_On;
ramExtern unsigned char         LED[16];
ramExtern unsigned char         CNT_Display;
ramExtern unsigned int          CNT_TEST_ON;
ramExtern unsigned int          CNT_TEST_OFF;
ramExtern unsigned int          RX_ACVolt_DD;
ramExtern unsigned int          RX_ACCurr_DD;
ramExtern unsigned int          RX_Power;
ramExtern unsigned int          RX_ACTemp_DD;
ramExtern unsigned int          RX_ACCurr_AD;
ramExtern unsigned int          RX_ACVolt_AD;
//***********************************************
//�̵�������
ramExtern unsigned char		    Flag_Relay_Connect;
ramExtern unsigned char         Flag_Need_Close;
ramExtern unsigned char         Flag_Relsy_Busy;
ramExtern unsigned char         CNT_Relay_Open;
ramExtern unsigned char         CNT_Relay_Close;

ramExtern unsigned int		    CNT_Relay_Open_Delay;
ramExtern unsigned int		    CNT_Relay_Close_Delay;
ramExtern unsigned int		    CNT_Relsy_Shut;
ramExtern unsigned int		    Flag_Relsy_Shut;

//������
ramExtern unsigned char 		Flag_Charge_Open;
ramExtern unsigned char 		Flag_Charge_Finish;
ramExtern unsigned char 		Step_Charge;
ramExtern unsigned char 		Flag_Con_Power_1; //��ʼ���򿪷����PWM����
ramExtern unsigned char 		Flag_Curr_OK;
ramExtern unsigned char 		Flag_Volt_OK;
ramExtern unsigned char 		Flag_Supply_Volt_OK; // ���Ա�ʶ������Գ���
ramExtern unsigned char 		Flag_Supply_Volt_NO; // ���Ա�ʶ�Ͽ�����Ȧ�Ӵ�
ramExtern unsigned int 		FlagChange;    //����ռ�ձȱ��

ramExtern unsigned char 		CNT_AD_Volt;
ramExtern unsigned int 		AD_Volt_Array[128]; //��ѹ���ADC����ֵ�洢
ramExtern unsigned long 		AD_Volt_SUM; //��ѹ���ADC����ֵ�ʹ洢
ramExtern unsigned int 		AD_Supply_Volt_Array[64]; //�����ѹ���ADC����ֵ�洢
ramExtern unsigned long 		AD_Supply_Volt_SUM; //�����ѹ���ADC����ֵ�ʹ洢

ramExtern unsigned char Flag_First_Charge;
ramExtern unsigned char CNT_Battery_Full;
//***********************************************
//���߱�������
ramExtern unsigned char         BusStatus;
#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/
