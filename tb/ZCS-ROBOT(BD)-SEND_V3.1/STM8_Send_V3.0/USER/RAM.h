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

/*******************************************************************************
-----------------------------    Macro define    -------------------------------
*******************************************************************************/
#ifdef root
#define ramExtern 	 
#else			 
#define ramExtern extern
#endif
/*******************************************************************************/
//检测宏
#define ProtectVolValue 160
/******************************************************************************/
//配对宏
#define ALLOWED_PAIR 5
#define CNT_ZERO 0
#define CNT_ONE  1
#define NRF_CHENNAL 5
#define DEBUG_ACK_COUNT_NORMAL 12
#define DEBUG_ACK_COUNT_ERR 7
#define DEBUG_ACK_COUNT_ISR 2
#define DEBUG_NRF_ADDRESS 7
#define DEBUG_NRF_REQS_PAIR 0
/******************************************************************************/
/* 声明出错代码 */ 
#define NRF_NOTFIND_ERR 0 /* No error */ 
#define IGBT_M_UP_ERR 1 /* Open file error */ 
#define IGBT_M_DN_ERR 2 /* sending a message error */ 
#define O_INPUT_VOL_HIGH_PORTECT 3 /* Bad arguments */ 
#define O_INPUT_CUR_HIGH_PORTECT 4 /* Memeroy is not enough */ 
#define O_COIL_VOL_HIGH_PORTECT 5 /* Service down try later */ 
#define O_COIL_CUR_HIGH_PORTECT 6 /* Unknow information */ 
#define NTC_IGBT_DET_ERR 7 /* Socket operation failed */ 
#define NTC_COIL_DET_ERR 8 /* Permission denied */ 
#define IGBT_ERR 9 /* Bad configuration file */ 
#define PWR_VOL_DET_LOW_PORTECT 10 /* Communication time out */
#define NO_ERR 11
/******************************************************************************/
//igbt温度采样
#define ERR_0_5_Sensor_IGBT_ERR  0
#define ERR_62_Stop_Work    1
#define ERR_60_DN_5_Work    5
#define ERR_58_DN_3_Work    3
#define IGBT_TEMP_VALUE_UP  62
#define IGBT_TEMP_VALUE_MID 60
#define IGBT_TEMP_VALUE_LOW 58
//线圈温度采样
#define ERR_0_5_Sensor_COIL_ERR  0
#define ERR_120_Stop_Work    1
#define ERR_100_DN_5_Work    5
#define ERR_90_DN_3_Work    3
#define COIL_TEMP_VALUE_UP  120
#define COIL_TEMP_VALUE_MID 100
#define COIL_TEMP_VALUE_LOW 90
/******************************************************************************/
//发射机工作的状态
#define  C_MSIdle	0		// 待机
#define  C_MSScan	1		// 查询
#define  C_MSPair	2		// 配对
#define  C_MSWork	3		// 供电
#define  C_MSProt	4       //异常
#define  C_MSNORMAL 5		//正常工作
#define NORMAL_STA_VALUE  77
/******************************************************************************/
//系统晶振值
#define FOSC_24M	24000000UL
#define FOSC_16M	16000000UL
#define FOSC_8M		8000000UL
#define FOSC_4M		4000000UL

#define FOSC 		FOSC_16M
/*******************************************************************************
----------------------------     Global define    ------------------------------
*******************************************************************************/
//电压电流计算变量
ramExtern unsigned char num1l, num1h;
ramExtern unsigned char FlagTrig; //可控硅开关标记 pwm_control.c中100行
//系统时标
ramExtern unsigned long globetimer;  //2^32-1 = 4294967295ms = 49.7天
//系统主要存储变量
ramExtern unsigned char         flag_p;
ramExtern unsigned char         MacStatus;
ramExtern unsigned char 		 Child_Count_Num;
ramExtern unsigned char 		 Child_Comm;
ramExtern unsigned char 		 Child_Comm_Back;
ramExtern unsigned char 		 Child_Count_Num_Back;
ramExtern unsigned char 		 Address_Rec[10][6];
ramExtern unsigned char 		 Check_Num;
ramExtern unsigned char 		 CNT_FULL_Num;
ramExtern unsigned char         status;
//***********************************************
//系统所用时间计数变量
ramExtern unsigned char         CNT_T100us;
ramExtern unsigned char         CNT_T10us;
ramExtern unsigned char         CNT_T500ms;
ramExtern unsigned int          CNT_T10ms;
ramExtern unsigned int          CNT_T1ms;
ramExtern unsigned int          CNT_T2ms;
ramExtern unsigned int          CNT_T1s;
ramExtern unsigned int          CNT_T2s;
ramExtern unsigned int          CNT_T5s;
ramExtern unsigned char         Flag_1hour_A;
ramExtern unsigned int          CNT_T1min;
ramExtern unsigned int          CNT_T1hour;
//***********************************************
//系统初始化EPROM等所用变量
ramExtern unsigned char         ChipUniqueID[12];
ramExtern unsigned char		  CHECK_ID[19]; //6+10 后10个用来存放占空比和频率
ramExtern unsigned int          Key_Check_ID1;
ramExtern unsigned char         Key_Check_ID2;
ramExtern unsigned int          Key_Check_ID3;
ramExtern unsigned char         Flag_Eeprom_Ero;
ramExtern unsigned char         Flag_Eeprom_Check;
ramExtern unsigned char         CNT_Eeprom_Check;
ramExtern unsigned char 		  CNT_PRINT;
ramExtern unsigned char 		  Flag_RestartEhours;

//***********************************************
//通讯结构体所用变量（配对和查询）
ramExtern unsigned char			ADC_RESULT_L;
ramExtern unsigned char			ADC_RESULT_H;
ramExtern unsigned int          	ADC_RESULT;
ramExtern unsigned int				AD_Value_SUM[6];
ramExtern unsigned char			SUM_CNT[6];
ramExtern unsigned int				AD_Value[6];
ramExtern unsigned int				ACVolt_AD;//μ??1AD?μ
ramExtern unsigned int				ACCurr_AD;//μ?á÷AD?μ
ramExtern unsigned int				ACTemp_AD;//???èAD?μ
ramExtern unsigned int 			ACVolt_DD;//μ??1êμ?ê?μ
ramExtern unsigned int 			ACCurr_DD;//μ?á÷êμ?ê?μ
ramExtern unsigned int 			ACTemp_DD;//???èêμ?ê?μ
//***********************************************
//蜂鸣器相关变量
ramExtern unsigned char         Buzz_Control;
ramExtern unsigned char         Command_Old;
ramExtern unsigned char         Buzz_Keep_CNT;
ramExtern unsigned char         Buzz_Times_CNT;
ramExtern unsigned char         Buzz_Step;
ramExtern unsigned char         Buzz_Buffer;
ramExtern unsigned char         CNT_Buzzer;
//***********************************************
//PWM调整标量
ramExtern unsigned int          CNT_PHeat;
ramExtern unsigned int          TIM1_ARR;
ramExtern unsigned int          TIM1_CCR1;
ramExtern unsigned char 		  Step_Work;
ramExtern unsigned char         Flag_PHCEn;
ramExtern unsigned char         Time1_Work_cycle;//μ±?°1¤×÷????±è
ramExtern unsigned char         Time1_Need_cycle;//?óê??úDèòaμ?????±è
ramExtern unsigned char         Flag_Time1_PWM_OnOff;//0±íê?1?1±íê??a
ramExtern unsigned char         Flag_PWM_ENable;
ramExtern unsigned char         NUM_PWM_UPload;
ramExtern unsigned char         NUM_PWM_UPload_LessFull;
ramExtern unsigned char         FLAG_PWM_START;
ramExtern int         Pwm_Frequent_Value;
ramExtern int         Pwm_Ratio_Value;
ramExtern unsigned char         Pwm_Product_numValue;
ramExtern unsigned char 		  Stor_Commd[5];
ramExtern unsigned char 		  Falg_Bettery_Lessfull[5];
ramExtern unsigned char 		  Stor_Frequen_eeprom[6];
ramExtern unsigned char 		  Stor_Ratio_eeprom[6];

//***********************************************
//NRF24L01主程序使用变量
ramExtern unsigned char         RX_ADDRESS[6]; //
ramExtern unsigned char         Num_RF;
ramExtern unsigned char         TD_Array[32];
ramExtern unsigned char         RD_Array[32];
ramExtern unsigned char 		  Child_Num;
ramExtern unsigned char         Address_Rec_Send[5][13];
ramExtern unsigned char         AUTO_Array[10][6];
ramExtern unsigned char         Address_Pair[6];
ramExtern unsigned char         Address[6];
ramExtern unsigned char         Address_Sure[6];
ramExtern unsigned char         Address4Check[6];
ramExtern unsigned char         Address_Pair_Child[6];
ramExtern unsigned char         Address_Pair_Parent[6];
ramExtern unsigned int          CNT_Rec_Check_Fail[5];
ramExtern unsigned char         Address_Pair[6];
ramExtern unsigned char           FLAG_Re_WHOHAVE;
ramExtern unsigned char           CNT_Re_WHOHAVE;
ramExtern unsigned char        	Flag_NRF24L01_OK;
ramExtern unsigned char			Flag_ADDRESS_P0;
ramExtern unsigned char         	Flag_SAME_ADDR;
ramExtern unsigned char         	Flag_False_Check_Pass;
ramExtern unsigned char 			Flag_RECV_ADDRESS_NUM;
ramExtern unsigned char 			Flag_RECV_ADDRESS_NUM_SAME;
ramExtern unsigned char 			Flag_FRIST_IN[5];
ramExtern unsigned char 			Flag_NEW_DEV[5];
ramExtern unsigned char       		Frm_num;
ramExtern unsigned char 			Frm_count[4];
//***********************************************
//异常处理相关变量
ramExtern unsigned char			Flag_Mac_On2s;//?a?ú2???ì2a1ê??
ramExtern unsigned int			    CNT_Prot[16];
ramExtern unsigned int			    CNT_ProtB[16];
ramExtern unsigned int			    CNT_ProtF[16];
ramExtern unsigned char			ProtectFlag[16];
ramExtern unsigned char			ProNum;
ramExtern unsigned char			Flag_enable_work;
ramExtern unsigned int			    CNT_MPSub_Beep;
ramExtern float						Power;
ramExtern unsigned long			Power_Rec;
ramExtern unsigned long            Power_Rec_ch[5];
ramExtern unsigned char			TX_Pro_Code_A;
ramExtern unsigned char			TX_Pro_Code_B;
ramExtern unsigned char			RX_Pro_Code_A;
ramExtern unsigned char			RX_Pro_Code_B;
ramExtern unsigned char			Broken_Code;
ramExtern unsigned char			Flag_NRF24L01_Have;
ramExtern unsigned char			RecordPwmInfo[2];
//***********************************************
//风扇相关变量
ramExtern unsigned int          CNT_Fan_Open;
ramExtern unsigned char         Flag_Fan_First;
ramExtern unsigned char         Flag_Fan_Open;
ramExtern unsigned char         CNT_Fan_Check;
ramExtern unsigned int          CNT_Fan_Speed;
//***********************************************
//UART相关变量
ramExtern unsigned char         Uart_Buf[23];
ramExtern unsigned char         UART2_RX_BUF[64];
ramExtern unsigned char         UART2_pRead;
ramExtern unsigned char         UART2_pWrite;
ramExtern unsigned char         RobotCommandProcStep;
ramExtern unsigned char         checkSum;
ramExtern unsigned char         err;
ramExtern unsigned char         cmdCounter;
ramExtern unsigned char         wCmdAckBuf[32];
ramExtern unsigned char         rCmdContent;

ramExtern unsigned char 		Stor_Frequent[5];
ramExtern unsigned char 		Stor_Ratio[5];
//***********************************************
//LED
ramExtern unsigned char         Flag_LED2_ENABLE;
//***********************************************
//总线变量定义
ramExtern unsigned char         BusStatus;

//配对使用的变量
ramExtern unsigned char  flag_inwstatu[5];        //i=0,0 
ramExtern unsigned char  flag_statu[5];
ramExtern unsigned char  count_false_check;
ramExtern unsigned char  flag_recheck_over;
ramExtern unsigned char  Flg_Chenal_OK[6];
ramExtern unsigned char  Flg_Chenal_Fail[6];
ramExtern unsigned char  flg_stop_send_in[8];
ramExtern unsigned char  flag_check_succ[5];

//异物检测使用变量
ramExtern unsigned char  Falg_ForeignBody_Check[5];
ramExtern unsigned char  Cnt_ForeignBody_Available;
ramExtern float  Float_ForeignBody_Value[5];
ramExtern float  Float_ForeignBody_Value_Sum;
#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/
