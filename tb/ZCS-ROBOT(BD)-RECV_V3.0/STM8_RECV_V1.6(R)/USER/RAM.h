/******************************************************************************/
/*					                                      */
/*	Project Name :	·￠é??ú		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	?D?Y′′??￡¨é??ú￡??T??1?μ???ê?óD?T1???                    */
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
#define ramExtern 	 //?úmain.c?D?óé?"#define root", ?ò ramExtern ±??¨ò??a??￡?
#else			 //?ú????μ?.c???t?D??óD"#define root",ò2°üo?±????tê±￡?
#define ramExtern extern//ramExtern ±??¨ò??a"extern?±￡?±ü?a?à???¨ò?μ??êìa?￡
#endif

/*******************************************************************************
----------------------------     Global define    ------------------------------
*******************************************************************************/
ramExtern unsigned long 		globetimer;//系统1ms滴答
ramExtern unsigned int 		PowOn2s;//系统1ms滴答
ramExtern bool					CJ_SEND;
ramExtern bool					Sys_Start;
//充电控制
ramExtern unsigned char 		myStatus;    //本充电接收机状态
ramExtern unsigned int  		CNT_TrickleCharge;//涓流充电时充电计时2秒停60秒
ramExtern unsigned char  		Flag_TrickleCharge;//涓流充电时充电标记
ramExtern bool  				NOT_TACH;//异常延时
ramExtern unsigned char 		CNT_PRINT;
//涓流充电时不充电计时
    
ramExtern unsigned char 		con;
ramExtern unsigned char 		Flag_NRF24L01_Change_EN;
//原定义 配对管理
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
//计时
ramExtern unsigned char         CNT_T2ms;
ramExtern unsigned char         CNT_T10ms;
ramExtern unsigned char         CNT_T1ms;
ramExtern unsigned int          CNT_T2s;
ramExtern unsigned int          CNT_T1s;
ramExtern unsigned char         STA_SEND_SUCC;
ramExtern unsigned char         STA_SYS_ERR;
ramExtern bool 					 STA_PAIR_CODE;
//***********************************************
//加密算法数值
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
//AD采样数值
ramExtern unsigned char 		ADC_RESULT_L; //ADC临时记录低位
ramExtern unsigned char 		ADC_RESULT_H; //ADC临时记录高位
ramExtern unsigned int 		ADC_RESULT; //ADC临时记录高低位合并
ramExtern unsigned int 		AD_Value_SUM[12]; //根据ADC通道选择的值之和存储
ramExtern unsigned char 		SUM_CNT[12]; //根据ADC通道选择的采样次数计数，用于做滤波算法
ramExtern unsigned int 		AD_Value[12]; //根据ADC通道选择的值存储
ramExtern unsigned int 		ACSupply_Volt_AD; //供电电压ADC值
ramExtern unsigned int 		ACVolt_AD; //电池电压ADC值
ramExtern unsigned int 		ACCurr_AD; //电池电流ADC值
ramExtern unsigned int 		ACTemp_AD; //???¨¨AD?|ì
ramExtern unsigned int 		ACSupply_Volt_DD; //供电电压真实值 单位10mV
ramExtern unsigned int 		ACVolt_DD; //电压真实值 单位10mV
ramExtern unsigned int 		ACCurr_DD; //电池电流真实值 单位1mA
ramExtern unsigned int 		ACTemp_DD; //???¨¨¨o|ì?¨o?|ì
ramExtern unsigned int 		AD_Curr_Buff[4]; //暂时没使用
//ramExtern unsigned int 		AD_Curr_Array[128]; //电流多次ADC采样值存储
ramExtern unsigned char 		CNT_AD_Curr;
ramExtern unsigned int 		AD_Curr_Tab[128];//排序后电流

ramExtern unsigned long 		AD_Curr_SUM; //电流多次ADC采样值和存储
ramExtern unsigned char 		CNT_Curr_Scan; //暂时没使用
ramExtern unsigned char 		CNT_Curr_Time; //暂时没使用
ramExtern unsigned char 		Cut_OffPower; //电池电量标识 0x01：电池充满可断电，0x00:正在充电
ramExtern bool 					over_input_vol; //输入线圈端过压
ramExtern unsigned char 		CNT_Power_Add; //暂时没使用
ramExtern bool 					CNT_Send_Time; //暂时没使用
ramExtern unsigned char 		Flag_Word; //暂时没使用
ramExtern bool			 		Flag_Right_Check; //暂时没使用
ramExtern unsigned char 		CNT_AD_Volt;
ramExtern unsigned int 		AD_Volt_Array[128]; //电压多次ADC采样值存储
ramExtern unsigned long 		AD_Volt_SUM; //电压多次ADC采样值和存储
ramExtern unsigned int 		AD_Supply_Volt_Array[64]; //供电电压多次ADC采样值存储
ramExtern unsigned long 		AD_Supply_Volt_SUM; //供电电压多次ADC采样值和存储

//***********************************************
//蜂鸣器控制
ramExtern unsigned char         Buzz_Control;
ramExtern unsigned char         Command_Old;
ramExtern unsigned char         Buzz_Keep_CNT;
ramExtern unsigned char         Buzz_Times_CNT;
ramExtern unsigned char         Buzz_Step;
ramExtern unsigned char         Buzz_Buffer;
ramExtern unsigned char         CNT_Buzzer;
//***********************************************
//PWM控制与计数 //DCDCpwm 
ramExtern unsigned int          CNT_PHeat;
ramExtern unsigned int          TIM1_ARR;
ramExtern unsigned int          TIM1_CCR1;
ramExtern unsigned char 		  Step_Work;
ramExtern unsigned char         Flag_PHCEn;
ramExtern unsigned char         Time1_Work_cycle;//μ±?°1¤×÷????±è
ramExtern unsigned char         Time1_Need_cycle;//?óê??úDèòaμ?????±è
ramExtern unsigned char         Flag_Time1_PWM_OnOff;//0±íê?1?1±íê??a
ramExtern unsigned char         Flag_PWM_ENable;
//***********************************************
//NRF24L01数据与控制
ramExtern unsigned char 		 self_cpd[6];
ramExtern unsigned char         master_cpd[6];
ramExtern unsigned char         self_cpd_send[6];
ramExtern unsigned char         TX_ADDRESS[5]; //接收地址; //·￠?íμ??·
ramExtern unsigned char         RX_ADDRESS[5]; //接收地址; //·￠?íμ??·
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
ramExtern unsigned char 		  RX_Time1_Work_cycle; //接收到的当前占空比
ramExtern unsigned char 		  TX_Cycle; 		   //请求占空比，每0.5%为1
ramExtern unsigned char 		  Chanrg_Over; 		   //请求占空比，每0.5%为1
ramExtern unsigned char 		  Can_Pow_On;			//表示可以上电了，检测到线圈电压0：线圈掉了，1：线圈接触
ramExtern unsigned char 		  Statu_Word_A;			//充电状态字
ramExtern unsigned char 		  Statu_Word_B;			//充电状态字
ramExtern unsigned char 		  CNT_TOUCH_SET;        //控制是否接触的计数标量
ramExtern bool			 		  FLAG_CNT_TOUCH_SET;   //达到标量后表示接触
ramExtern unsigned int 		  CNT_TOUCH_RE;        //控制是否接触的计数标量不接触
ramExtern bool			 		  FLAG_CNT_TOUCH_RE;   //达到标量后表示不接触
//***********************************************
//按键值
ramExtern unsigned char			Key_Save;         //??è?°′?üIO?μ           
ramExtern unsigned char			Key_Temp;         //°′?ü?o′?IO?μ
ramExtern unsigned char			Key_Value;        //°′?ü?μ
ramExtern unsigned char			Key_Hit_CNT;      //°′?ü?ì°′??êy′?êy
ramExtern unsigned char			Key_Long_CNT;     //°′?ü3¤°′??êy′?êy
ramExtern unsigned char			Key_Status;       //°′?ü×′ì?￡¨?T￡??ì°′￡?3¤°′￡?
//***********************************************
//保护状态码
ramExtern unsigned char			Flag_Mac_On2s;//?a?ú2???ì2a1ê??
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

ramExtern unsigned char 		Flag_Remove_load_EN;//移开线盘保护
ramExtern unsigned char 		CNT_Remove_load_EN; //移开线盘保护

//中断保护
ramExtern unsigned char 		Flag_EXTI_Pro;
ramExtern unsigned int 		CNT_EXTI_Pro;
ramExtern unsigned char 		Flag_Curr_OVER_IT;//电流中断保护
ramExtern unsigned int 		CNT_Curr_OVER_IT;
ramExtern bool                  FULL_DOWN_BETTERFLY;
//***********************************************
//风扇控制
ramExtern unsigned int          CNT_Fan_Open;
ramExtern unsigned char         Flag_Fan_First;
ramExtern unsigned char         Flag_Fan_Open;
ramExtern unsigned char         CNT_Fan_Check;
ramExtern unsigned int          CNT_Fan_Speed;
//***********************************************
//UART数据
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
//收到主机的数据
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
//继电器控制
ramExtern unsigned char		    Flag_Relay_Connect;
ramExtern unsigned char         Flag_Need_Close;
ramExtern unsigned char         Flag_Relsy_Busy;
ramExtern unsigned char         CNT_Relay_Open;
ramExtern unsigned char         CNT_Relay_Close;

ramExtern unsigned int		    CNT_Relay_Open_Delay;
ramExtern unsigned int		    CNT_Relay_Close_Delay;
ramExtern unsigned int		    CNT_Relsy_Shut;
ramExtern unsigned int		    Flag_Relsy_Shut;

//充电管理
ramExtern unsigned char 		Flag_Charge_Open;
ramExtern unsigned char 		Flag_Charge_Finish;
ramExtern unsigned char 		Step_Charge;
ramExtern unsigned char 		Flag_Con_Power_1; //开始充电打开发射机PWM命令
ramExtern unsigned char 		Flag_Curr_OK;
ramExtern unsigned char 		Flag_Volt_OK;
ramExtern unsigned char 		Flag_Supply_Volt_OK; // 用以标识进过配对程序
ramExtern unsigned char 		Flag_Supply_Volt_NO; // 用以标识断开过线圈接触
ramExtern unsigned int 		FlagChange;    //调整占空比标记

ramExtern unsigned char 		CNT_AD_Volt;
ramExtern unsigned int 		AD_Volt_Array[128]; //电压多次ADC采样值存储
ramExtern unsigned long 		AD_Volt_SUM; //电压多次ADC采样值和存储
ramExtern unsigned int 		AD_Supply_Volt_Array[64]; //供电电压多次ADC采样值存储
ramExtern unsigned long 		AD_Supply_Volt_SUM; //供电电压多次ADC采样值和存储

ramExtern unsigned char Flag_First_Charge;
ramExtern unsigned char CNT_Battery_Full;
//***********************************************
//总线变量定义
ramExtern unsigned char         BusStatus;
#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/
