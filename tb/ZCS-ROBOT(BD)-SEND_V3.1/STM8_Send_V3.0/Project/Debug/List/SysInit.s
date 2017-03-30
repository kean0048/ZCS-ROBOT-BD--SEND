///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.20.1.176 for STM8                29/Mar/2017  16:23:49
// Copyright 2010-2015 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\SysInit.c
//    Command line =  
//        "E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\SysInit.c"
//        -e -Ol --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_cross_call --debug --code_model medium --data_model medium -o
//        "E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\Obj"
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.3\stm8\LIB\dlstm8mmn.h" -lB
//        "E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List"
//        -I
//        "E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\..\USER\"
//        -I "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.3\stm8\inc\" --vregs 16
//    List file    =  
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List\SysInit.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_w4
        EXTERN ?load32_0x_l1
        EXTERN ?mul16_x_x_w0
        EXTERN ?push_l2
        EXTERN ?push_w4
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5
        EXTERN AUTO_Array
        EXTERN Address_Pair
        EXTERN Address_Pair_Child
        EXTERN Address_Pair_Parent
        EXTERN BuzzChange
        EXTERN BuzzInit
        EXTERN Buzz_Control
        EXTERN CHECK_ID
        EXTERN CNT_FULL_Num
        EXTERN CNT_Prot
        EXTERN CNT_ProtB
        EXTERN CNT_Rec_Check_Fail
        EXTERN Check_Num
        EXTERN Child_Num
        EXTERN ChipUniqueID
        EXTERN Clear_Nrf24l01
        EXTERN Eeprom_Init
        EXTERN FLAG_PWM_START
        EXTERN Flag_ADDRESS_P0
        EXTERN Flag_FRIST_IN
        EXTERN Flag_False_Check_Pass
        EXTERN Flag_Fan_Open
        EXTERN Flag_LED2_ENABLE
        EXTERN Flag_NEW_DEV
        EXTERN Flag_RECV_ADDRESS_NUM
        EXTERN Flag_RECV_ADDRESS_NUM_SAME
        EXTERN Flg_Chenal_Fail
        EXTERN Flg_Chenal_OK
        EXTERN Float_ForeignBody_Value_Sum
        EXTERN Frm_count
        EXTERN GetEeprom
        EXTERN GetUniqueID
        EXTERN Key_Check_ID1
        EXTERN Key_Check_ID2
        EXTERN Key_Check_ID3
        EXTERN MacStatus
        EXTERN NRF24L01_Init
        EXTERN NUM_PWM_UPload
        EXTERN NUM_PWM_UPload_LessFull
        EXTERN Power
        EXTERN Power_Rec
        EXTERN Power_Rec_ch
        EXTERN ProtectFlag
        EXTERN Pwm_Frequent_Value
        EXTERN Pwm_Product_numValue
        EXTERN Pwm_Ratio_Value
        EXTERN RX_ADDRESS
        EXTERN Set_TX_Com_Mode
        EXTERN Stor_Frequen_eeprom
        EXTERN Stor_Frequent
        EXTERN Stor_Ratio
        EXTERN Stor_Ratio_eeprom
        EXTERN TIM1_ARR
        EXTERN TIM1_CCR1
        EXTERN Time1_Need_cycle
        EXTERN Time1_Work_cycle
        EXTERN Uart2_Init
        EXTERN __iar_EmptyStepPoint
        EXTERN __stm8abi_assert
        EXTERN _delay_1_ms
        EXTERN count_false_check
        EXTERN crc_cal_value
        EXTERN crc_check_value
        EXTERN crc_sum_value
        EXTERN flag_check_succ
        EXTERN flag_inwstatu
        EXTERN flag_p
        EXTERN flag_recheck_over
        EXTERN flag_statu
        EXTERN flg_stop_send_in
        EXTERN globetimer
        EXTERN memset
        EXTERN status

        PUBLIC AD_Init
        PUBLIC CLK_SWR
        PUBLIC CalculatedPower
        PUBLIC CheckRecvDate
        PUBLIC Clock_Init
        PUBLIC Cycle_Deal_FormDate
        PUBLIC EXTI3_Init
        PUBLIC Find_Max
        PUBLIC GetPwmValueFromCOILtemp
        PUBLIC GetPwmValueFromIGBTtemp
        PUBLIC IWDG_Init
        PUBLIC IWDG_KR
        PUBLIC IWDG_RLR
        PUBLIC IsNewAddr
        PUBLIC Port_Init
        PUBLIC ProtectLowVoltage
        PUBLIC SPI_Init
        PUBLIC SysInit
        PUBLIC TIM1_ARRH
        PUBLIC TIM1_ARRL
        PUBLIC TIM1_CCR1H
        PUBLIC TIM1_CCR1L
        PUBLIC TIM1_CCR2H
        PUBLIC TIM1_CCR2L
        PUBLIC TIM1_CCR3H
        PUBLIC TIM1_CCR3L
        PUBLIC TIM1_CCR4H
        PUBLIC TIM1_CCR4L
        PUBLIC TIM1_DTR
        PUBLIC TIM4_ARR
        PUBLIC Time1_Init
        PUBLIC Time4_Init
        PUBLIC Variable_Init
        PUBLIC Variable_Init_Second
        PUBLIC _A_ADC_CR1
        PUBLIC _A_ADC_CR2
        PUBLIC _A_ADC_CSR
        PUBLIC _A_CLK_CKDIVR
        PUBLIC _A_CLK_ECKR
        PUBLIC _A_CLK_SWCR
        PUBLIC _A_EXTI_CR1
        PUBLIC _A_IWDG_PR
        PUBLIC _A_PA_CR1
        PUBLIC _A_PA_CR2
        PUBLIC _A_PA_DDR
        PUBLIC _A_PA_ODR
        PUBLIC _A_PB_CR1
        PUBLIC _A_PB_CR2
        PUBLIC _A_PB_DDR
        PUBLIC _A_PB_ODR
        PUBLIC _A_PC_CR1
        PUBLIC _A_PC_CR2
        PUBLIC _A_PC_DDR
        PUBLIC _A_PC_ODR
        PUBLIC _A_PD_CR1
        PUBLIC _A_PD_CR2
        PUBLIC _A_PD_DDR
        PUBLIC _A_PD_ODR
        PUBLIC _A_PE_CR1
        PUBLIC _A_PE_CR2
        PUBLIC _A_PE_DDR
        PUBLIC _A_PE_ODR
        PUBLIC _A_PF_ODR
        PUBLIC _A_PG_CR1
        PUBLIC _A_PG_CR2
        PUBLIC _A_PG_DDR
        PUBLIC _A_PG_ODR
        PUBLIC _A_SPI_CR1
        PUBLIC _A_SPI_CR2
        PUBLIC _A_TIM1_BKR
        PUBLIC _A_TIM1_CCER1
        PUBLIC _A_TIM1_CCER2
        PUBLIC _A_TIM1_CCMR1
        PUBLIC _A_TIM1_CCMR2
        PUBLIC _A_TIM1_CCMR3
        PUBLIC _A_TIM1_CCMR4
        PUBLIC _A_TIM1_CR1
        PUBLIC _A_TIM1_EGR
        PUBLIC _A_TIM4_CR1
        PUBLIC _A_TIM4_EGR
        PUBLIC _A_TIM4_IER
        PUBLIC _A_TIM4_PSCR
        PUBLIC errmsg
        PUBLIC errno
        PUBLIC streamTodecode

// E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\SysInit.c
//    1 /******************************************************************************/
//    2 /*					                                      */
//    3 /*	Project Name :	发射机		                                      */
//    4 /*	Version      :	1.0			                              */
//    5 /*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
//    6 /*	Clock        :	16MHz			                              */
//    7 /*	Author	     :	mengzhuozhuo   		                              */
//    8 /*      Date	     :	2016/04/26	                                      */
//    9 /*	Corporation  :	中惠创智（深圳）无线供电技术有限公司                  */
//   10 /*						                              */
//   11 /******************************************************************************/
//   12 /*******************************************************************************
//   13 -----------------------------     File start    --------------------------------
//   14 *******************************************************************************/
//   15 
//   16 
//   17 /*******************************************************************************
//   18 -----------------------------    Include files   -------------------------------
//   19 *******************************************************************************/
//   20 #include "type_def.h"

        ASEGN `.near.noinit`:DATA:NOROOT,05000H
        SECTION_GROUP _A_PA_ODR
// union <unnamed> volatile _A_PA_ODR
_A_PA_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05002H
        SECTION_GROUP _A_PA_DDR
// union <unnamed> volatile _A_PA_DDR
_A_PA_DDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05003H
        SECTION_GROUP _A_PA_CR1
// union <unnamed> volatile _A_PA_CR1
_A_PA_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05004H
        SECTION_GROUP _A_PA_CR2
// union <unnamed> volatile _A_PA_CR2
_A_PA_CR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05005H
        SECTION_GROUP _A_PB_ODR
// union <unnamed> volatile _A_PB_ODR
_A_PB_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05007H
        SECTION_GROUP _A_PB_DDR
// union <unnamed> volatile _A_PB_DDR
_A_PB_DDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05008H
        SECTION_GROUP _A_PB_CR1
// union <unnamed> volatile _A_PB_CR1
_A_PB_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05009H
        SECTION_GROUP _A_PB_CR2
// union <unnamed> volatile _A_PB_CR2
_A_PB_CR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0500aH
        SECTION_GROUP _A_PC_ODR
// union <unnamed> volatile _A_PC_ODR
_A_PC_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0500cH
        SECTION_GROUP _A_PC_DDR
// union <unnamed> volatile _A_PC_DDR
_A_PC_DDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0500dH
        SECTION_GROUP _A_PC_CR1
// union <unnamed> volatile _A_PC_CR1
_A_PC_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0500eH
        SECTION_GROUP _A_PC_CR2
// union <unnamed> volatile _A_PC_CR2
_A_PC_CR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0500fH
        SECTION_GROUP _A_PD_ODR
// union <unnamed> volatile _A_PD_ODR
_A_PD_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05011H
        SECTION_GROUP _A_PD_DDR
// union <unnamed> volatile _A_PD_DDR
_A_PD_DDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05012H
        SECTION_GROUP _A_PD_CR1
// union <unnamed> volatile _A_PD_CR1
_A_PD_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05013H
        SECTION_GROUP _A_PD_CR2
// union <unnamed> volatile _A_PD_CR2
_A_PD_CR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05014H
        SECTION_GROUP _A_PE_ODR
// union <unnamed> volatile _A_PE_ODR
_A_PE_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05016H
        SECTION_GROUP _A_PE_DDR
// union <unnamed> volatile _A_PE_DDR
_A_PE_DDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05017H
        SECTION_GROUP _A_PE_CR1
// union <unnamed> volatile _A_PE_CR1
_A_PE_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05018H
        SECTION_GROUP _A_PE_CR2
// union <unnamed> volatile _A_PE_CR2
_A_PE_CR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05019H
        SECTION_GROUP _A_PF_ODR
// union <unnamed> volatile _A_PF_ODR
_A_PF_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0501eH
        SECTION_GROUP _A_PG_ODR
// union <unnamed> volatile _A_PG_ODR
_A_PG_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05020H
        SECTION_GROUP _A_PG_DDR
// union <unnamed> volatile _A_PG_DDR
_A_PG_DDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05021H
        SECTION_GROUP _A_PG_CR1
// union <unnamed> volatile _A_PG_CR1
_A_PG_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05022H
        SECTION_GROUP _A_PG_CR2
// union <unnamed> volatile _A_PG_CR2
_A_PG_CR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,050a0H
        SECTION_GROUP _A_EXTI_CR1
// union <unnamed> volatile _A_EXTI_CR1
_A_EXTI_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,050c1H
        SECTION_GROUP _A_CLK_ECKR
// union <unnamed> volatile _A_CLK_ECKR
_A_CLK_ECKR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,050c4H
        SECTION_GROUP CLK_SWR
// unsigned char volatile CLK_SWR
CLK_SWR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,050c5H
        SECTION_GROUP _A_CLK_SWCR
// union <unnamed> volatile _A_CLK_SWCR
_A_CLK_SWCR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,050c6H
        SECTION_GROUP _A_CLK_CKDIVR
// union <unnamed> volatile _A_CLK_CKDIVR
_A_CLK_CKDIVR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,050e0H
        SECTION_GROUP IWDG_KR
// unsigned char volatile IWDG_KR
IWDG_KR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,050e1H
        SECTION_GROUP _A_IWDG_PR
// union <unnamed> volatile _A_IWDG_PR
_A_IWDG_PR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,050e2H
        SECTION_GROUP IWDG_RLR
// unsigned char volatile IWDG_RLR
IWDG_RLR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05200H
        SECTION_GROUP _A_SPI_CR1
// union <unnamed> volatile _A_SPI_CR1
_A_SPI_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05201H
        SECTION_GROUP _A_SPI_CR2
// union <unnamed> volatile _A_SPI_CR2
_A_SPI_CR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05250H
        SECTION_GROUP _A_TIM1_CR1
// union <unnamed> volatile _A_TIM1_CR1
_A_TIM1_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05257H
        SECTION_GROUP _A_TIM1_EGR
// union <unnamed> volatile _A_TIM1_EGR
_A_TIM1_EGR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05258H
        SECTION_GROUP _A_TIM1_CCMR1
// union <unnamed> volatile _A_TIM1_CCMR1
_A_TIM1_CCMR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05259H
        SECTION_GROUP _A_TIM1_CCMR2
// union <unnamed> volatile _A_TIM1_CCMR2
_A_TIM1_CCMR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0525aH
        SECTION_GROUP _A_TIM1_CCMR3
// union <unnamed> volatile _A_TIM1_CCMR3
_A_TIM1_CCMR3:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0525bH
        SECTION_GROUP _A_TIM1_CCMR4
// union <unnamed> volatile _A_TIM1_CCMR4
_A_TIM1_CCMR4:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0525cH
        SECTION_GROUP _A_TIM1_CCER1
// union <unnamed> volatile _A_TIM1_CCER1
_A_TIM1_CCER1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0525dH
        SECTION_GROUP _A_TIM1_CCER2
// union <unnamed> volatile _A_TIM1_CCER2
_A_TIM1_CCER2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05262H
        SECTION_GROUP TIM1_ARRH
// unsigned char volatile TIM1_ARRH
TIM1_ARRH:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05263H
        SECTION_GROUP TIM1_ARRL
// unsigned char volatile TIM1_ARRL
TIM1_ARRL:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05265H
        SECTION_GROUP TIM1_CCR1H
// unsigned char volatile TIM1_CCR1H
TIM1_CCR1H:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05266H
        SECTION_GROUP TIM1_CCR1L
// unsigned char volatile TIM1_CCR1L
TIM1_CCR1L:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05267H
        SECTION_GROUP TIM1_CCR2H
// unsigned char volatile TIM1_CCR2H
TIM1_CCR2H:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05268H
        SECTION_GROUP TIM1_CCR2L
// unsigned char volatile TIM1_CCR2L
TIM1_CCR2L:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05269H
        SECTION_GROUP TIM1_CCR3H
// unsigned char volatile TIM1_CCR3H
TIM1_CCR3H:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0526aH
        SECTION_GROUP TIM1_CCR3L
// unsigned char volatile TIM1_CCR3L
TIM1_CCR3L:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0526bH
        SECTION_GROUP TIM1_CCR4H
// unsigned char volatile TIM1_CCR4H
TIM1_CCR4H:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0526cH
        SECTION_GROUP TIM1_CCR4L
// unsigned char volatile TIM1_CCR4L
TIM1_CCR4L:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0526dH
        SECTION_GROUP _A_TIM1_BKR
// union <unnamed> volatile _A_TIM1_BKR
_A_TIM1_BKR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0526eH
        SECTION_GROUP TIM1_DTR
// unsigned char volatile TIM1_DTR
TIM1_DTR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05340H
        SECTION_GROUP _A_TIM4_CR1
// union <unnamed> volatile _A_TIM4_CR1
_A_TIM4_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05341H
        SECTION_GROUP _A_TIM4_IER
// union <unnamed> volatile _A_TIM4_IER
_A_TIM4_IER:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05343H
        SECTION_GROUP _A_TIM4_EGR
// union <unnamed> volatile _A_TIM4_EGR
_A_TIM4_EGR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05345H
        SECTION_GROUP _A_TIM4_PSCR
// union <unnamed> volatile _A_TIM4_PSCR
_A_TIM4_PSCR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05346H
        SECTION_GROUP TIM4_ARR
// unsigned char volatile TIM4_ARR
TIM4_ARR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05400H
        SECTION_GROUP _A_ADC_CSR
// union <unnamed> volatile _A_ADC_CSR
_A_ADC_CSR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05401H
        SECTION_GROUP _A_ADC_CR1
// union <unnamed> volatile _A_ADC_CR1
_A_ADC_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05402H
        SECTION_GROUP _A_ADC_CR2
// union <unnamed> volatile _A_ADC_CR2
_A_ADC_CR2:
        DS8 1
//   21 #include "string.h"
//   22 
//   23 #include "SysInit.h"
//   24 #include "Nrf24l01.h"
//   25 #include "Clock.h"
//   26 #include "uart.h"
//   27 #include "delayTime.h"
//   28 #include "Eeprom.h"
//   29 #include "ADSample.h"
//   30 #include "Buzz.h"
//   31 //#include "FAN_Control.h"
//   32 #include "PWM_Control.h"
//   33 #include "assert.h"
//   34 #include "MacProtect.h"
//   35 
//   36 #define FREQUET 30000ul
//   37 
//   38 /* 声明出错信息 */ 

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   39 ramExtern unsigned char* errmsg[] = { 
errmsg:
        DC16 ?_0, ?_1, ?_2, ?_3, ?_4, ?_5, ?_6, ?_7, ?_8, ?_9, ?_10
//   40 	/* 0 */ "No error", 
//   41 	/* 1 */ "IGBT_M_UP_ERR", 
//   42 	/* 2 */ "IGBT_M_DN_ERR", 
//   43 	/* 3 */ "O_INPUT_VOL_HIGH_PORTECT", 
//   44 	/* 4 */ "O_INPUT_CUR_HIGH_PORTECT", 
//   45 	/* 5 */ "O_COIL_VOL_HIGH_PORTECT",
//   46 	/* 6 */ "O_COIL_CUR_HIGH_PORTECT", 
//   47 	/* 7 */ "Efficiency_abnormal", 
//   48 	/* 8 */ "NTC_COIL_DET_ERR", 
//   49 	/* 9 */ "IGBT_ERR", 
//   50 	/* 10 */ "PWR_VOL_DET_LOW_PORTECT"
//   51 };

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   52 char errno = 0;
errno:
        DS8 1
//   53 
//   54 //******************************************************************************
//   55 //系统初始化
//   56 //******************************************************************************
//   57 void  SysInit(void)
//   58 {   
//   59     Clock_Init();               //系统时钟初始化16M内部/外部 
//   60     Port_Init();                //IO口初始化 
//   61     EXTI3_Init();               //外部中断初始化
//   62     SPI_Init();                 //SPI初始化
//   63 	AD_Init(); 					//AD采样初始化
//   64     //IWDG_Init();
//   65 	Time1_Init(); 				//4路还PWM输出初始化（输出互补波形）
//   66     Time4_Init();               //定时器初始化定时1ms
//   67     GetUniqueID(ChipUniqueID);  //获取器件ID    
//   68     Key_Check_ID1 = crc_cal_value(ChipUniqueID, Length_ChipUniqueID);
//   69     Key_Check_ID2 = crc_check_value(ChipUniqueID,Length_ChipUniqueID);
//   70     Key_Check_ID3 = crc_sum_value(ChipUniqueID,Length_ChipUniqueID);
//   71     Eeprom_Init();	
//   72 	GetEeprom(CHECK_ID); 		//读取EEprom中数据
//   73 	BuzzInit(); 				//蜂鸣器初始化
//   74     NRF24L01_Init();            //初始化NRF24L01
//   75 	_delay_1_ms();
//   76 	Uart2_Init();               //串口通信初始化
//   77     Variable_Init();            //清RAM变量值初始化
//   78 }
//   79 //******************************************************************************
//   80 
//   81 
//   82 //******************************************************************************
//   83 //系统时钟初始化
//   84 //******************************************************************************
//   85 void  Clock_Init(void)
//   86 {
//   87     //使用外部晶振16M
//   88     CLK_ECKR |=0x01; // 开启外部时钟
//   89     while(!(CLK_ECKR & 0x02)); // 等待外部时钟 rdy
//   90     CLK_CKDIVR &= 0x08; //CPU 无分频/8  0x18
//   91     CLK_SWR = 0xB4; // 选择外部时钟
//   92     while(!(CLK_SWCR & 0x08)); // 这里要等
//   93     CLK_SWCR |=0x02; // 使能外部时     
//   94 }
//   95 //******************************************************************************
//   96 
//   97 
//   98 //******************************************************************************
//   99 //I/O口初始化
//  100 //******************************************************************************
//  101 
//  102 void  Port_Init(void)
//  103 {                    
//  104 	/* PA3  IGBT_M_UP_ERR  输入
//  105      * PA4  IGBT_M_DN_ERR  输入
//  106      * PA5  O_INPUT_VOL    输入
//  107      * PA6  O_INPUT_CUR    输入
//  108      */
//  109     PA_DDR = 0x00; //PA_DDR=0b00000000;
//  110     PA_CR1 = 0x00; //PA_CR1=0b00000000;
//  111     PA_CR2 = 0x78; //PA_CR2=0b01111000;
//  112     PA_ODR = 0x00; //PA_ODR=0b00000000;
//  113     /* PB0  NTC_COIL_DET  输入
//  114      * PB1  NTC_IGBT_DET  输入
//  115      * PB2  PWR_VOL_DET   输入
//  116      * PB3  PWR_CUR_DET   输入
//  117      * PB4  空            输出
//  118      * PB5  空            输出
//  119      * PB6  O_COIL_CUR    输入
//  120      * PB7  O_COIL_VOL    输入
//  121      */
//  122     PB_DDR = 0x30; //PB_DDR=0b00110000;
//  123     PB_CR1 = 0x30; //PB_CR1=0b00110000;  上拉输入推挽输出
//  124     PB_CR2 = 0xC0; //PB_CR2=0b11000000;  输入中断输出高速
//  125     PB_ODR = 0x00; //PB_ODR=0b00000000;  输出信号锁存
//  126     /* PC1  PWM_HIGH_1    输出
//  127      * PC2  PWM_LOW_1     输出
//  128      * PC3  SPI_CE        输出
//  129      * PC4  SPI_IRQ       输入
//  130      * PC5  SPI_CLK       输出
//  131      * PC6  SPI_MOSI      输出
//  132      * PC7  SPI_MISO      输入
//  133      */
//  134     PC_DDR = 0x6f; //PC_DDR=0b01101111;     数据方向 
//  135 
//  136     PC_CR1 = 0xff; //PC_CR1=0b11111111;  上拉输入推挽输出
//  137     PC_CR2 = 0x40; //PC_CR02=0b01000000;//输入中断输出高速
//  138     PC_ODR = 0x00; //PC_ODR=0b00000000; //输出信号锁存
//  139 
//  140     /* PD0  1_WIRE       输出
//  141      * PD1  SWIM         输出
//  142      * PD2  MCU_DAC_PWM  输出     
//  143      * PD3  FAN_PWM      输出
//  144      * PD4  BEEP_EN      输出
//  145      * PD5  UART_TX      输出
//  146      * PD6  UART_RX      输入
//  147      * PD7  UP_DN_WAVE   输入
//  148      */
//  149     PD_DDR = 0x3f; //PD_DDR=0b00111111;
//  150     PD_CR1 = 0xff; //PD_CR1=0b11111111;
//  151     PD_CR2 = 0x00; //PD_CR2=0b00000000;
//  152     PD_ODR = 0x00; //PD_ODR=0b00000000;
//  153     /* PE0  MCU_OPEN     输出（高）
//  154      * PE1  SCL          输出
//  155      * PE2  SDA          输入
//  156      * PE3  IGBT_ERR     输入（浮空）
//  157      * PE5  SPI_NSS      输出
//  158      * PE6               输出
//  159      * PE7               输出
//  160      */
//  161     PE_DDR = 0xe3; //PE_DDR=0b11100011;
//  162     PE_CR1 = 0xf6; //PE_CR1=0b11110110;
//  163     PE_CR2 = 0x00; //PE_CR2=0b01000000;
//  164     PE_ODR = 0x00; //PE_ODR=0b00000000;
//  165 	
//  166 	PF_ODR_ODR4 = 1;
//  167     /*
//  168      * PG0 LED2
//  169      * PG1 LED1
//  170      */
//  171     PG_DDR = 0x03; //PF_DDR=0b00000011;
//  172 
//  173     PG_CR1 = 0xff; //PF_CR1=0b11111111;
//  174     PG_CR2 = 0x00; //PF_CR2=0b00000000;
//  175     PG_ODR = 0x00; //PF_ODR=0b00000000;
//  176 }
//  177 
//  178 //******************************************************************************
//  179 
//  180 //******************************************************************************
//  181 //AD转换初始化
//  182 //******************************************************************************
//  183 
//  184 void AD_Init(void)
//  185 {
//  186     ADC_CSR = 0x05; //选着AD采样通道5禁止中断
//  187     ADC_CR1 |= 0x71; // 使能 ADC ， 18 分频
//  188     ADC_CR2 |= 0x08; // 数据 右对齐， low 8BIT AT ADC_DRL;
//  189 }
//  190 //******************************************************************************
//  191 
//  192 //******************************************************************************
//  193 //外部中断
//  194 //******************************************************************************
//  195 void  EXTI3_Init(void)
//  196 {
//  197     //PORTA仅下降沿触发PA3/4/5/6 
//  198     //PORTB仅下降沿触发PB6/7
//  199 	//PORTC仅下降沿触发PC4
//  200     //EXTI_CR1 = 0x00;
//  201 	EXTI_CR1 = 0x2a;//00下降沿和低电平触发 01仅上升沿触发 10仅下降沿触发 11上升沿和下降沿触发000000
//  202 }
//  203 //******************************************************************************
//  204 
//  205 
//  206 //******************************************************************************
//  207 //SPI初始化
//  208 //******************************************************************************
//  209 void  SPI_Init(void)
//  210 {
//  211     SPI_CR1 =0x0C;  // 16M/128/256； MSB 先；主设备；CPOL = 1；CPHA= 0  
//  212     SPI_CR2 =0x03;  // 双线全双工；软件管理；无CRC 
//  213     SPI_CR1|=0x40;  // 开启SPI总线
//  214 }
//  215 //******************************************************************************
//  216 
//  217 
//  218 //******************************************************************************
//  219 //变量值初始化
//  220 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  221 void Variable_Init(void)
//  222 {
//  223 	//发送模式初始化
//  224     Set_TX_Com_Mode();
Variable_Init:
        CALLF     Set_TX_Com_Mode
//  225 	
//  226     Clear_Nrf24l01();
        CALLF     Clear_Nrf24l01
//  227     Address_Pair[0]= Key_Check_ID1&0xff;//低位
        LDW       X, L:Key_Check_ID1
        LD        A, XL
        LD        L:Address_Pair, A
//  228     Address_Pair[1]= Key_Check_ID1>>8;//高位
        LDW       X, L:Key_Check_ID1
        LD        A, XH
        LD        L:Address_Pair + 1, A
//  229     Address_Pair[2]= Key_Check_ID2;
        MOV       L:Address_Pair + 2, L:Key_Check_ID2
//  230     Address_Pair[3]= Key_Check_ID3&0xff;//低位
        LDW       X, L:Key_Check_ID3
        LD        A, XL
        LD        L:Address_Pair + 3, A
//  231     Address_Pair[4]= Key_Check_ID3>>8;//高位
        LDW       X, L:Key_Check_ID3
        LD        A, XH
        LD        L:Address_Pair + 4, A
//  232 	Address_Pair[5]= 0;
        MOV       L:Address_Pair + 5, #0x0
//  233 	if(CHECK_ID[16] == 0x11)
        LD        A, #0x11
        CP        A, L:CHECK_ID + 16
        JRNE      L:??Variable_Init_0
//  234 	{
//  235 		for(int i = 0;i<5;i++)
        CLRW      X
        JRA       L:??Variable_Init_1
//  236 		{
//  237 			Stor_Frequen_eeprom[i] = CHECK_ID[i+6];
??Variable_Init_2:
        LDW       Y, X
        ADDW      Y, #CHECK_ID + 6
        LD        A, (Y)
        LD        (L:Stor_Frequen_eeprom,X), A
//  238 			Stor_Ratio_eeprom[i] = CHECK_ID[i+11];
        LDW       Y, X
        ADDW      Y, #CHECK_ID + 11
        LD        A, (Y)
        LD        (L:Stor_Ratio_eeprom,X), A
//  239             Stor_Frequent[i] = Stor_Frequen_eeprom[i];
        LD        A, (L:Stor_Frequen_eeprom,X)
        LD        (L:Stor_Frequent,X), A
//  240             Stor_Ratio[i] = Stor_Ratio_eeprom[i];
        LD        A, (L:Stor_Ratio_eeprom,X)
        LD        (L:Stor_Ratio,X), A
//  241 		}
        ADDW      X, #0x1
??Variable_Init_1:
        CPW       X, #0x5
        JRSLT     L:??Variable_Init_2
//  242 		Stor_Frequen_eeprom[5] = CHECK_ID[17];
        MOV       L:Stor_Frequen_eeprom + 5, L:CHECK_ID + 17
//  243 		Stor_Ratio_eeprom[5] = CHECK_ID[18];
        MOV       L:Stor_Ratio_eeprom + 5, L:CHECK_ID + 18
//  244 	}
//  245 
//  246 	//初始化放置主机和从机地址的数组
//  247 	memset(Address_Pair_Child,0,sizeof(Address_Pair_Child));
??Variable_Init_0:
        LDW       X, #0x6
        LDW       S:?w0, X
        CLRW      Y
        LDW       X, #Address_Pair_Child
        CALLF     memset
//  248 	memset(Address_Pair_Parent,0,sizeof(Address_Pair_Parent));
        LDW       X, #0x6
        LDW       S:?w0, X
        CLRW      Y
        LDW       X, #Address_Pair_Parent
        CALLF     memset
//  249 	//时标初始化
//  250 	globetimer = 0;
        LDW       X, #0x0
        LDW       L:globetimer, X
        LDW       X, #0x0
        LDW       L:globetimer + 2, X
//  251 	//add init
//  252 	for(int j = 0;j < 5;j++)
        CLRW      Y
        JRA       L:??Variable_Init_3
//  253 	{
//  254 		Flg_Chenal_OK[j] = 0x02;
??Variable_Init_4:
        LD        A, #0x2
        LD        (L:Flg_Chenal_OK,Y), A
//  255 		flg_stop_send_in[j] = 0;
        CLR       A
        LD        (L:flg_stop_send_in,Y), A
//  256 		Flg_Chenal_Fail[j] = 0;
        CLR       A
        LD        (L:Flg_Chenal_Fail,Y), A
//  257 		RX_ADDRESS[j] = 0;
        CLR       A
        LD        (L:RX_ADDRESS,Y), A
//  258 		Power_Rec_ch[j] = 0;
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        ADDW      X, #Power_Rec_ch
        LDW       S:?w0, X
        CLRW      X
        LDW       S:?w3, X
        LDW       S:?w2, X
        LDW       X, S:?w0
        CALLF     L:?load32_0x_l1
//  259 		flag_inwstatu[j] = 0;
        CLR       A
        LD        (L:flag_inwstatu,Y), A
//  260 		flag_statu[j] = 0;
        CLR       A
        LD        (L:flag_statu,Y), A
//  261 	}
        ADDW      Y, #0x1
??Variable_Init_3:
        CPW       Y, #0x5
        JRSLT     L:??Variable_Init_4
//  262 	
//  263 	Float_ForeignBody_Value_Sum = 0.64;
        LDW       X, #0x3f23
        LDW       L:Float_ForeignBody_Value_Sum, X
        LDW       X, #0xd70a
        LDW       L:Float_ForeignBody_Value_Sum + 2, X
//  264 	Power = 1.0;
        LDW       X, #0x3f80
        LDW       L:Power, X
        LDW       X, #0x0
        LDW       L:Power + 2, X
//  265 	
//  266 	FLAG_PWM_START = 0;
        MOV       L:FLAG_PWM_START, #0x0
//  267 	Pwm_Product_numValue = 0;
        MOV       L:Pwm_Product_numValue, #0x0
//  268 	Flag_Fan_Open = 0;
        MOV       L:Flag_Fan_Open, #0x0
//  269     CNT_FULL_Num = 0;
        MOV       L:CNT_FULL_Num, #0x0
//  270 	Time1_Work_cycle = 10;
        MOV       L:Time1_Work_cycle, #0xa
//  271 	NUM_PWM_UPload = 0;
        MOV       L:NUM_PWM_UPload, #0x0
//  272 	NUM_PWM_UPload_LessFull = 0;
        MOV       L:NUM_PWM_UPload_LessFull, #0x0
//  273 	Flg_Chenal_OK[5] = 0;
        MOV       L:Flg_Chenal_OK + 5, #0x0
//  274 	flg_stop_send_in[5] = 0;	
        MOV       L:flg_stop_send_in + 5, #0x0
//  275 	Power_Rec = 0;
        LDW       X, #0x0
        LDW       L:Power_Rec, X
        LDW       X, #0x0
        LDW       L:Power_Rec + 2, X
//  276 	Flag_LED2_ENABLE = 0;	
        MOV       L:Flag_LED2_ENABLE, #0x0
//  277 	MacStatus = C_MSNORMAL;
        MOV       L:MacStatus, #0x5
//  278 	Buzz_Control = BUZZ_POWER_ON;
        MOV       L:Buzz_Control, #0x1
//  279 	Child_Num = 0;
        MOV       L:Child_Num, #0x0
//  280 	Check_Num = 0;
        MOV       L:Check_Num, #0x0
//  281 	Flag_False_Check_Pass = 0;
        MOV       L:Flag_False_Check_Pass, #0x0
//  282 	Flag_ADDRESS_P0 = 1;
        MOV       L:Flag_ADDRESS_P0, #0x1
//  283 	status = C_MSIdle;
        MOV       L:status, #0x0
//  284 	flag_recheck_over = 0;
        MOV       L:flag_recheck_over, #0x0
//  285 	count_false_check = 0;
        MOV       L:count_false_check, #0x0
//  286 	memset(AUTO_Array,0,sizeof(AUTO_Array));
        LDW       X, #0x3c
        LDW       S:?w0, X
        CLRW      Y
        LDW       X, #AUTO_Array
        CALLF     memset
//  287 	memset(Frm_count,0,sizeof(Frm_count));
        LDW       X, #0x4
        LDW       S:?w0, X
        CLRW      Y
        LDW       X, #Frm_count
        CALLF     memset
//  288 	
//  289 	memset(CNT_Prot,0,sizeof(CNT_Prot));
        LDW       X, #0x20
        LDW       S:?w0, X
        CLRW      Y
        LDW       X, #CNT_Prot
        CALLF     memset
//  290 	memset(CNT_ProtB,0,sizeof(CNT_ProtB));
        LDW       X, #0x20
        LDW       S:?w0, X
        CLRW      Y
        LDW       X, #CNT_ProtB
        CALLF     memset
//  291 	memset(ProtectFlag,0,sizeof(ProtectFlag));
        LDW       X, #0x10
        LDW       S:?w0, X
        CLRW      Y
        LDW       X, #ProtectFlag
        CALLF     memset
//  292 	memset(Flag_NEW_DEV,0,sizeof(Flag_NEW_DEV));
        LDW       X, #0x5
        LDW       S:?w0, X
        CLRW      Y
        LDW       X, #Flag_NEW_DEV
        CALLF     memset
//  293 	memset(Flag_FRIST_IN,0,sizeof(Flag_FRIST_IN));
        LDW       X, #0x5
        LDW       S:?w0, X
        CLRW      Y
        LDW       X, #Flag_FRIST_IN
        CALLF     memset
//  294 	/*printf("sizeof(char) = %d\n",(int)sizeof(char));
//  295 	printf("sizeof(short) = %d\n",(int)sizeof(short));
//  296 	printf("sizeof(int) = %d\n",(int)sizeof(int));
//  297 	printf("sizeof(long) = %d\n",(int)sizeof(long));
//  298 	printf("sizeof(long long) = %d\n",(int)sizeof(long long));
//  299 	printf("sizeof(float) = %d\n",(int)sizeof(float));
//  300 	printf("sizeof(double) = %d\n",(int)sizeof(double));*/
//  301 	flag_p = 0;
        MOV       L:flag_p, #0x0
//  302 	Pwm_Frequent_Value = 28;
        LDW       X, #0x1c
        LDW       L:Pwm_Frequent_Value, X
//  303 	Pwm_Ratio_Value = 10;
        LDW       X, #0xa
        LDW       L:Pwm_Ratio_Value, X
//  304 	Pwm_Product_numValue = 10;
        MOV       L:Pwm_Product_numValue, #0xa
//  305 	
//  306 }
        RETF
//  307 //******************************************************************************
//  308 void Variable_Init_Second(void)
//  309 {
//  310 	memset(AUTO_Array,0,sizeof(AUTO_Array));//20170225 确保万一，本人无法想到什么情况下会会出现这种情况
//  311     
//  312 	if(Flag_RECV_ADDRESS_NUM_SAME != 0)
//  313 	{
//  314 		Flag_RECV_ADDRESS_NUM_SAME = 0;
//  315 		Flag_RECV_ADDRESS_NUM = 0;
//  316 	}
//  317 	CNT_FULL_Num = 0;//20170227
//  318 	flag_recheck_over = 0;
//  319 	for(int k = 0;k < 5;k++)
//  320 	{
//  321 		flg_stop_send_in[k] = 0;//每次进入这里就开启一个新的轮回，从零开始保存数据	
//  322 		Flg_Chenal_OK[k] = 0x02;
//  323 		Flg_Chenal_Fail[k] = 0;
//  324 		CNT_Rec_Check_Fail[k] = 1;
//  325 		Flag_FRIST_IN[k] = 0;
//  326 		flag_check_succ[k] = 0;
//  327 	}
//  328 }
//  329 
//  330 //******************************************************************************
//  331 //定时器4初始化 8M
//  332 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  333 void  Time4_Init(void)
//  334 {
//  335     /*TIM4_IER = 0x00; // 禁止中断
//  336     TIM4_EGR = 0x01; // 允许产生更新事件
//  337     TIM4_PSCR = 0x07; // 计数器时钟 = 主时钟 /64=8MHZ/64=125000
//  338     TIM4_ARR = 0x7c; // 设定重装载时的寄存器值， 255 是最大值
//  339     TIM4_CNTR = 0x7c; // 设定计数器的初值
//  340     //定时周期 =(ARR+1)*125=1000uS
//  341     TIM4_CR1 = 0x01; // b0 = 1, 允许计数器工作
//  342     //b1 = 0, 允许更新
//  343     //设置控制器，启动定时器
//  344     TIM4_IER = 0x01; // 允许更新中断*/
//  345 	
//  346 	TIM4_CR1 = 0x80; // b0 = 1, 允许计数器工作
Time4_Init:
        MOV       L:0x5340, #0x80
//  347 	TIM4_PSCR = 0x07; // 计数器时钟 = 主时钟 /128=16MHZ/128=8us
        MOV       L:0x5345, #0x7
//  348 	TIM4_ARR = 0xfa; // 设定重装载时的寄存器值250， 255 是最大值
        MOV       L:0x5346, #0xfa
//  349 	TIM4_IER = 0x01; // 允许更新中断
        MOV       L:0x5341, #0x1
//  350     TIM4_EGR = 0x01; // 允许产生更新事件
        MOV       L:0x5343, #0x1
//  351 	TIM4_CR1 |= 0x01;
        BSET      L:0x5340, #0x0
//  352 }
        RETF
        REQUIRE _A_TIM4_CR1
        REQUIRE _A_TIM4_PSCR
        REQUIRE TIM4_ARR
        REQUIRE _A_TIM4_IER
        REQUIRE _A_TIM4_EGR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
Time1_Init:
        MOV       L:0x5250, #0x27
        MOV       L:0x5258, #0x60
        MOV       L:0x5259, #0x70
        MOV       L:0x525c, #0x11
        MOV       L:0x525a, #0x0
        MOV       L:0x525b, #0x0
        MOV       L:0x525d, #0x0
        MOV       L:0x5262, #0x1
        MOV       L:0x5263, #0xa
        LD        A, L:0x5262
        CLRW      Y
        LD        YL, A
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LD        A, L:0x5263
        CLR       S:?b0
        LD        S:?b1, A
        ADDW      X, S:?w0
        LDW       L:TIM1_ARR, X
        MOV       L:0x5265, #0x0
        MOV       L:0x5266, #0x0
        LD        A, L:0x5265
        CLRW      Y
        LD        YL, A
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LD        A, L:0x5266
        CLR       S:?b0
        LD        S:?b1, A
        ADDW      X, S:?w0
        LDW       L:TIM1_CCR1, X
        MOV       L:0x5269, L:0x5265
        MOV       L:0x526a, L:0x5266
        LDW       X, L:TIM1_ARR
        SUBW      X, L:TIM1_CCR1
        LD        A, XH
        LD        L:0x5267, A
        LDW       X, L:TIM1_ARR
        SUBW      X, L:TIM1_CCR1
        LDW       Y, #0x100
        DIVW      X, Y
        LD        A, YL
        LD        L:0x5268, A
        MOV       L:0x526b, L:0x5267
        MOV       L:0x526c, L:0x5268
        MOV       L:0x526e, #0x5
        MOV       L:0x526d, #0x80
        BSET      L:0x5257, #0x0
        RETF
        REQUIRE _A_TIM1_CR1
        REQUIRE _A_TIM1_CCMR1
        REQUIRE _A_TIM1_CCMR2
        REQUIRE _A_TIM1_CCER1
        REQUIRE _A_TIM1_CCMR3
        REQUIRE _A_TIM1_CCMR4
        REQUIRE _A_TIM1_CCER2
        REQUIRE TIM1_ARRH
        REQUIRE TIM1_ARRL
        REQUIRE TIM1_CCR1H
        REQUIRE TIM1_CCR1L
        REQUIRE TIM1_CCR3H
        REQUIRE TIM1_CCR3L
        REQUIRE TIM1_CCR2H
        REQUIRE TIM1_CCR2L
        REQUIRE TIM1_CCR4H
        REQUIRE TIM1_CCR4L
        REQUIRE TIM1_DTR
        REQUIRE _A_TIM1_BKR
        REQUIRE _A_TIM1_EGR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
AD_Init:
        MOV       L:0x5400, #0x5
        LD        A, #0x71
        OR        A, L:0x5401
        LD        L:0x5401, A
        BSET      L:0x5402, #0x3
        RETF
        REQUIRE _A_ADC_CSR
        REQUIRE _A_ADC_CR1
        REQUIRE _A_ADC_CR2

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
SPI_Init:
        MOV       L:0x5200, #0xc
        MOV       L:0x5201, #0x3
        BSET      L:0x5200, #0x6
        RETF
        REQUIRE _A_SPI_CR1
        REQUIRE _A_SPI_CR2

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
EXTI3_Init:
        MOV       L:0x50a0, #0x2a
        RETF
        REQUIRE _A_EXTI_CR1

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
Port_Init:
        MOV       L:0x5002, #0x0
        MOV       L:0x5003, #0x0
        MOV       L:0x5004, #0x78
        MOV       L:0x5000, #0x0
        MOV       L:0x5007, #0x30
        MOV       L:0x5008, #0x30
        MOV       L:0x5009, #0xc0
        MOV       L:0x5005, #0x0
        MOV       L:0x500c, #0x6f
        MOV       L:0x500d, #0xff
        MOV       L:0x500e, #0x40
        MOV       L:0x500a, #0x0
        MOV       L:0x5011, #0x3f
        MOV       L:0x5012, #0xff
        MOV       L:0x5013, #0x0
        MOV       L:0x500f, #0x0
        MOV       L:0x5016, #0xe3
        MOV       L:0x5017, #0xf6
        MOV       L:0x5018, #0x0
        MOV       L:0x5014, #0x0
        BSET      L:0x5019, #0x4
        MOV       L:0x5020, #0x3
        MOV       L:0x5021, #0xff
        MOV       L:0x5022, #0x0
        MOV       L:0x501e, #0x0
        RETF
        REQUIRE _A_PA_DDR
        REQUIRE _A_PA_CR1
        REQUIRE _A_PA_CR2
        REQUIRE _A_PA_ODR
        REQUIRE _A_PB_DDR
        REQUIRE _A_PB_CR1
        REQUIRE _A_PB_CR2
        REQUIRE _A_PB_ODR
        REQUIRE _A_PC_DDR
        REQUIRE _A_PC_CR1
        REQUIRE _A_PC_CR2
        REQUIRE _A_PC_ODR
        REQUIRE _A_PD_DDR
        REQUIRE _A_PD_CR1
        REQUIRE _A_PD_CR2
        REQUIRE _A_PD_ODR
        REQUIRE _A_PE_DDR
        REQUIRE _A_PE_CR1
        REQUIRE _A_PE_CR2
        REQUIRE _A_PE_ODR
        REQUIRE _A_PF_ODR
        REQUIRE _A_PG_DDR
        REQUIRE _A_PG_CR1
        REQUIRE _A_PG_CR2
        REQUIRE _A_PG_ODR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
Clock_Init:
        BSET      L:0x50c1, #0x0
??Clock_Init_0:
        BTJF      L:0x50c1, #0x1, L:??Clock_Init_0
        LD        A, #0x8
        AND       A, L:0x50c6
        LD        L:0x50c6, A
        MOV       L:0x50c4, #0xb4
??Clock_Init_1:
        BTJF      L:0x50c5, #0x3, L:??Clock_Init_1
        BSET      L:0x50c5, #0x1
        RETF
        REQUIRE _A_CLK_ECKR
        REQUIRE _A_CLK_CKDIVR
        REQUIRE CLK_SWR
        REQUIRE _A_CLK_SWCR

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SysInit:
        CALLF     Clock_Init
        CALLF     Port_Init
        CALLF     EXTI3_Init
        CALLF     SPI_Init
        CALLF     AD_Init
        CALLF     Time1_Init
        CALLF     Time4_Init
        LDW       X, #ChipUniqueID
        CALLF     GetUniqueID
        LD        A, #0xc
        LDW       X, #ChipUniqueID
        CALLF     crc_cal_value
        LDW       L:Key_Check_ID1, X
        LD        A, #0xc
        LDW       X, #ChipUniqueID
        CALLF     crc_check_value
        LD        L:Key_Check_ID2, A
        LD        A, #0xc
        LDW       X, #ChipUniqueID
        CALLF     crc_sum_value
        LDW       L:Key_Check_ID3, X
        CALLF     Eeprom_Init
        LDW       X, #CHECK_ID
        CALLF     GetEeprom
        CALLF     BuzzInit
        CALLF     NRF24L01_Init
        CALLF     _delay_1_ms
        CALLF     Uart2_Init
        JPF       Variable_Init

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
Variable_Init_Second:
        LDW       X, #0x3c
        LDW       S:?w0, X
        CLRW      Y
        LDW       X, #AUTO_Array
        CALLF     memset
        LD        A, L:Flag_RECV_ADDRESS_NUM_SAME
        TNZ       A
        JREQ      L:??Variable_Init_Second_0
        MOV       L:Flag_RECV_ADDRESS_NUM_SAME, #0x0
        MOV       L:Flag_RECV_ADDRESS_NUM, #0x0
??Variable_Init_Second_0:
        MOV       L:CNT_FULL_Num, #0x0
        MOV       L:flag_recheck_over, #0x0
        CLR       S:?b1
        CLR       S:?b0
        JRA       L:??Variable_Init_Second_1
??Variable_Init_Second_2:
        CLR       A
        LDW       X, S:?w0
        LD        (L:flg_stop_send_in,X), A
        LD        A, #0x2
        LDW       X, S:?w0
        LD        (L:Flg_Chenal_OK,X), A
        CLR       A
        LDW       X, S:?w0
        LD        (L:Flg_Chenal_Fail,X), A
        LDW       Y, S:?w0
        SLLW      Y
        CLRW      X
        INCW      X
        LDW       (L:CNT_Rec_Check_Fail,Y), X
        CLR       A
        LDW       X, S:?w0
        LD        (L:Flag_FRIST_IN,X), A
        CLR       A
        LDW       X, S:?w0
        LD        (L:flag_check_succ,X), A
        LDW       X, S:?w0
        ADDW      X, #0x1
        LDW       S:?w0, X
??Variable_Init_Second_1:
        LDW       X, S:?w0
        CPW       X, #0x5
        JRSLT     L:??Variable_Init_Second_2
        RETF
//  353 //******************************************************************************
//  354 
//  355 //******************************************************************************
//  356 //定时器1初始化
//  357 //******************************************************************************
//  358 void  Time1_Init(void)
//  359 {
//  360 	unsigned int data;
//  361 	
//  362 	TIM1_CR1 = 0x27; //TIM1_CR1 = 0B00100111;
//  363     //通道1和2输出
//  364     TIM1_CCMR1 = 0x60; //TIM1_CCMR1=0B01100000;//TIM1_CH1模式1
//  365     TIM1_CCMR2 = 0x70; //TIM1_CCMR2=0B01110000;//TIM1_CH2模式2
//  366     TIM1_CCER1 = 0x11; //TIM1_CCER1=0B00010001;//TIM1_CH1		
//  367     //通道3和4输出
//  368     TIM1_CCMR3 = 0x00; //0x60; //TIM1_CCMR3 = 0B01100000;//TIM1_CH3模式1
//  369     TIM1_CCMR4 = 0x00; //0x70; //TIM1_CCMR4 = 0B01110000;//TIM1_CH4模式2
//  370     TIM1_CCER2 =0x00; // 0x11; //TIM1_CCER2 = 0B00010001;//TIM3_CH4
//  371     //指定工作频率
//  372 	//20170223频率为30K，死区时间为30us
//  373     /*TIM1_ARRH = (8000 / 30) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率20K
//  374     TIM1_ARRL = (8000 / 30) % 256;
//  375 	//TIM1_ARR = 308; f = 26k
//  376 	TIM1_ARR = 267; //f = 30k*/
//  377 	
//  378 	TIM1_ARRH = (FOSC_16M/2 / FREQUET) / 256; //（16M/2/30K）16M时钟，中央对齐模式除以2，频率30K
//  379     TIM1_ARRL = (FOSC_16M/2 / FREQUET) % 256;
//  380 	data = TIM1_ARRH;
//  381 	TIM1_ARR = data * 256 + TIM1_ARRL;
//  382 
//  383     //指定占空比 ch1 和 ch2互补
//  384     TIM1_CCR1H = 0;
//  385     TIM1_CCR1L = 0;
//  386 	data = TIM1_CCR1H;
//  387     TIM1_CCR1 = data * 256 + TIM1_CCR1L;
//  388     TIM1_CCR3H = TIM1_CCR1H;
//  389     TIM1_CCR3L = TIM1_CCR1L;
//  390     TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
//  391     TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
//  392     TIM1_CCR4H = TIM1_CCR2H;
//  393     TIM1_CCR4L = TIM1_CCR2L;
//  394 	
//  395 	TIM1_DTR = 0X05;
//  396     TIM1_BKR = 0x80; //TIM1_BKR = 0B10000000;   
//  397     TIM1_EGR |= 0X01;
//  398 }
//  399 //******************************************************************************
//  400 
//  401 /*******************************************************************************
//  402 -----------------------------    看门狗初始化   -------------------------------
//  403 *******************************************************************************/

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  404 void  IWDG_Init(void)
//  405 {
//  406     IWDG_KR = 0xCC; //当IWDG_KR被写入数值0xCC，独立看门狗被启动了
IWDG_Init:
        MOV       L:0x50e0, #0xcc
//  407     IWDG_KR = 0x55;  //解除 PR 及 RLR 的写保护
        MOV       L:0x50e0, #0x55
//  408     IWDG_RLR = 0xff; //看门狗计数器重装载数值         
        MOV       L:0x50e2, #0xff
//  409     IWDG_PR = 0x06; //分频系数为4，最长超时时间为：1.02S
        MOV       L:0x50e1, #0x6
//  410     IWDG_KR = 0xAA; //恢复 PR 及 RLR 的写保护状态
        MOV       L:0x50e0, #0xaa
//  411 }
        RETF
        REQUIRE IWDG_KR
        REQUIRE IWDG_RLR
        REQUIRE _A_IWDG_PR
//  412 /******************************************************************************/
//  413 
//  414 //******************************************************************************
//  415 //数据校验函数
//  416 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  417 unsigned char CheckRecvDate(unsigned char *pCode)
//  418 {
//  419     return 0;
CheckRecvDate:
        CLR       A
        RETF
//  420 }
//  421 //******************************************************************************
//  422 
//  423 //******************************************************************************
//  424 //数据解码函数
//  425 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  426 void streamTodecode(unsigned char *pFrmCode)
//  427 {
//  428 
//  429 }
streamTodecode:
        RETF
//  430 //******************************************************************************
//  431 
//  432 //******************************************************************************
//  433 //新地址检查函数
//  434 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  435 int IsNewAddr(unsigned char * Resv_Address)
//  436 {
//  437 	return 0;
IsNewAddr:
        CLRW      X
        RETF
//  438 }
//  439 //******************************************************************************
//  440 //FIND THE MAX
//  441 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  442 int Find_Max(int *LostP,int k)
//  443 {
Find_Max:
        LDW       S:?w1, X
        LDW       S:?w2, Y
//  444 	int a;
//  445 	a = LostP[0];
        LDW       X, [S:?w1.w]
        LDW       Y, X
//  446 	for(int j = 1;j < k;j++)
        CLRW      X
        INCW      X
        LDW       S:?w0, X
        JRA       L:??Find_Max_0
//  447 	{
//  448 		if(LostP[j]>a)
??Find_Max_1:
        LDW       X, S:?w0
        SLLW      X
        ADDW      X, S:?w1
        CPW       Y, (X)
        JRSGE     L:??Find_Max_2
//  449 	  		a = LostP[j];
        LDW       X, S:?w0
        SLLW      X
        ADDW      X, S:?w1
        LDW       X, (X)
        LDW       Y, X
//  450 	}
??Find_Max_2:
        LDW       X, S:?w0
        ADDW      X, #0x1
        LDW       S:?w0, X
??Find_Max_0:
        LDW       X, S:?w0
        CPW       X, S:?w2
        JRSLT     L:??Find_Max_1
//  451 	return a;
        LDW       X, Y
        RETF
//  452 }
//  453 //******************************************************************************
//  454 //计算功率函数
//  455 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  456 unsigned short CalculatedPower(const unsigned short *current,const unsigned short *voltage)
//  457 {
CalculatedPower:
        CALLF     L:?push_l2
        LDW       S:?w5, X
        LDW       S:?w4, Y
//  458 	assert(current == NULL || voltage == NULL);
        LDW       X, S:?w5
        TNZW      X
        JREQ      L:??CalculatedPower_0
        LDW       X, S:?w4
        TNZW      X
        JREQ      L:??CalculatedPower_0
        LDW       X, #0x1ca
        LDW       S:?w0, X
        LDW       Y, #?_12
        LDW       X, #?_11
        CALLF     __stm8abi_assert
        CALLF     __iar_EmptyStepPoint
//  459 	unsigned int tempI = *current;
??CalculatedPower_0:
        LDW       X, [S:?w5.w]
        LDW       Y, X
//  460 	unsigned int tempV = *voltage;
        LDW       X, [S:?w4.w]
        LDW       S:?w0, X
//  461 	return tempI*tempV;	
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        JPF       L:?epilogue_l2
//  462 }
//  463 
//  464 //******************************************************************************
//  465 //低电压保护函数
//  466 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  467 void ProtectLowVoltage(const unsigned short *voltage)
//  468 {
ProtectLowVoltage:
        CALLF     L:?push_w4
        LDW       S:?w4, X
//  469 	assert(voltage == NULL);
        LDW       X, S:?w4
        TNZW      X
        JREQ      L:??ProtectLowVoltage_0
        LDW       X, #0x1d5
        LDW       S:?w0, X
        LDW       Y, #?_12
        LDW       X, #?_13
        CALLF     __stm8abi_assert
        CALLF     __iar_EmptyStepPoint
//  470 	unsigned short tempV = *voltage;
??ProtectLowVoltage_0:
        LDW       X, [S:?w4.w]
//  471 	if(tempV <= ProtectVolValue)
        CPW       X, #0xa1
        JRNC      L:??ProtectLowVoltage_1
//  472 	{
//  473 		//蜂鸣器：一长一短 告警
//  474 		BuzzChange(60,20,2);
        MOV       S:?b1, #0x2
        MOV       S:?b0, #0x14
        LD        A, #0x3c
        CALLF     BuzzChange
//  475 	}		
//  476 }
??ProtectLowVoltage_1:
        JPF       L:?epilogue_w4
//  477 
//  478 //******************************************************************************
//  479 //IGBT温度采样处理函数
//  480 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  481 short GetPwmValueFromIGBTtemp(const unsigned short *IgbtValue)
//  482 {
GetPwmValueFromIGBTtemp:
        CALLF     L:?push_w4
        LDW       S:?w4, X
//  483 	assert(NULL == IgbtValue);
        LDW       X, S:?w4
        TNZW      X
        JREQ      L:??GetPwmValueFromIGBTtemp_0
        LDW       X, #0x1e3
        LDW       S:?w0, X
        LDW       Y, #?_12
        LDW       X, #?_14
        CALLF     __stm8abi_assert
        CALLF     __iar_EmptyStepPoint
//  484 	unsigned short tempIgbtV = *IgbtValue;
??GetPwmValueFromIGBTtemp_0:
        LDW       X, [S:?w4.w]
//  485 	/*if(tempIgbtV == 0 || tempIgbtV == 5)
//  486 	{
//  487 		//一长两短报警
//  488 		BuzzChange(60,20,3);
//  489 		return ERR_0_5_Sensor_IGBT_ERR;
//  490 	}
//  491 	else */
//  492 	if(tempIgbtV >= IGBT_TEMP_VALUE_UP)
        CPW       X, #0x3e
        JRC       L:??GetPwmValueFromIGBTtemp_1
//  493 	{
//  494 		//停止工作
//  495 		PE_ODR_ODR0 = 1;//关断IGBT
        BSET      L:0x5014, #0x0
//  496 		return ERR_62_Stop_Work;
        CLRW      X
        INCW      X
        JPF       L:?epilogue_w4
//  497 	}
//  498 	else if(tempIgbtV  == IGBT_TEMP_VALUE_MID)
??GetPwmValueFromIGBTtemp_1:
        CPW       X, #0x3c
        JRNE      L:??GetPwmValueFromIGBTtemp_2
//  499 	{
//  500 		Time1_Work_cycle -= 5;
        LD        A, #0xfb
        ADD       A, L:Time1_Work_cycle
        LD        L:Time1_Work_cycle, A
//  501 		return ERR_60_DN_5_Work;
        LDW       X, #0x5
        JPF       L:?epilogue_w4
//  502 	}
//  503 	else if(tempIgbtV  == IGBT_TEMP_VALUE_LOW)
??GetPwmValueFromIGBTtemp_2:
        CPW       X, #0x3a
        JRNE      L:??GetPwmValueFromIGBTtemp_3
//  504 	{
//  505 		Time1_Work_cycle -= 3;
        LD        A, #0xfd
        ADD       A, L:Time1_Work_cycle
        LD        L:Time1_Work_cycle, A
//  506 		return ERR_58_DN_3_Work;
        LDW       X, #0x3
        JPF       L:?epilogue_w4
//  507 	}
//  508 	else 
//  509 		return NORMAL_STA_VALUE;
??GetPwmValueFromIGBTtemp_3:
        LDW       X, #0x4d
        JPF       L:?epilogue_w4
        REQUIRE _A_PE_ODR
//  510 }
//  511 
//  512 //******************************************************************************
//  513 //线圈温度采样处理函数
//  514 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  515 short GetPwmValueFromCOILtemp(const unsigned short *CoilValue)
//  516 {
GetPwmValueFromCOILtemp:
        CALLF     L:?push_w4
        LDW       S:?w4, X
//  517 	assert(NULL == CoilValue);
        LDW       X, S:?w4
        TNZW      X
        JREQ      L:??GetPwmValueFromCOILtemp_0
        LDW       X, #0x205
        LDW       S:?w0, X
        LDW       Y, #?_12
        LDW       X, #?_15
        CALLF     __stm8abi_assert
        CALLF     __iar_EmptyStepPoint
//  518 	unsigned short tempCoilV = *CoilValue;
??GetPwmValueFromCOILtemp_0:
        LDW       X, [S:?w4.w]
//  519 	/*if(tempCoilV == 0 || tempCoilV == 5)
//  520 	{
//  521 		//一长三短报警
//  522 		BuzzChange(60,20,4);
//  523 		return ERR_0_5_Sensor_COIL_ERR;
//  524 	}
//  525 	else */
//  526 	if(tempCoilV >= COIL_TEMP_VALUE_UP)
        CPW       X, #0x78
        JRC       L:??GetPwmValueFromCOILtemp_1
//  527 	{
//  528 		//停止工作
//  529 		PE_ODR_ODR0 = 1;							//关断IGBT
        BSET      L:0x5014, #0x0
//  530 		return ERR_120_Stop_Work;
        CLRW      X
        INCW      X
        JPF       L:?epilogue_w4
//  531 	}
//  532 	else if(tempCoilV  == COIL_TEMP_VALUE_MID)
??GetPwmValueFromCOILtemp_1:
        CPW       X, #0x64
        JRNE      L:??GetPwmValueFromCOILtemp_2
//  533 	{
//  534 		Time1_Work_cycle -= 5;
        LD        A, #0xfb
        ADD       A, L:Time1_Work_cycle
        LD        L:Time1_Work_cycle, A
//  535 		return ERR_100_DN_5_Work;
        LDW       X, #0x5
        JPF       L:?epilogue_w4
//  536 	}
//  537 	else if(tempCoilV  <= COIL_TEMP_VALUE_LOW)
??GetPwmValueFromCOILtemp_2:
        CPW       X, #0x5b
        JRNC      L:??GetPwmValueFromCOILtemp_3
//  538 	{
//  539 		Time1_Work_cycle -= 3;
        LD        A, #0xfd
        ADD       A, L:Time1_Work_cycle
        LD        L:Time1_Work_cycle, A
//  540 		return ERR_90_DN_3_Work;
        LDW       X, #0x3
        JPF       L:?epilogue_w4
//  541 	}
//  542 	else 
//  543 		return NORMAL_STA_VALUE;
??GetPwmValueFromCOILtemp_3:
        LDW       X, #0x4d
        JPF       L:?epilogue_w4
        REQUIRE _A_PE_ODR
//  544 }
//  545 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  546 void Cycle_Deal_FormDate(const unsigned char *fromRSdate)
//  547 {
//  548 	//unsigned char temp_cycle = *(fromRSdate+24);
//  549 	//Time1_Need_cycle = temp_cycle/(4*2);			//四分之一，因为四个产品，每一个发送过来的都只是发射端的1/4,再除以2是因为数值比例为1:2，即1代表输出pwm值为2%
//  550 	Time1_Need_cycle = 50;//25%
Cycle_Deal_FormDate:
        MOV       L:Time1_Need_cycle, #0x32
//  551 }
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_0:
        DC8 "No error"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_1:
        DC8 "IGBT_M_UP_ERR"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_2:
        DC8 "IGBT_M_DN_ERR"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_3:
        DC8 "O_INPUT_VOL_HIGH_PORTECT"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_4:
        DC8 "O_INPUT_CUR_HIGH_PORTECT"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_5:
        DC8 "O_COIL_VOL_HIGH_PORTECT"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_6:
        DC8 "O_COIL_CUR_HIGH_PORTECT"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_7:
        DC8 "Efficiency_abnormal"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_8:
        DC8 "NTC_COIL_DET_ERR"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_9:
        DC8 "IGBT_ERR"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_10:
        DC8 "PWR_VOL_DET_LOW_PORTECT"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_11:
        DC8 "current == NULL || voltage == NULL"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_12:
        DC8 45H, 3AH, 5CH, 32H, 30H, 31H, 37H, 0C4H
        DC8 0EAH, 0B9H, 0A4H, 0D7H, 0F7H, 0C4H, 0DAH, 0C8H
        DC8 0DDH, 5CH, 4DH, 61H, 72H, 63H, 68H, 5CH
        DC8 5AH, 43H, 53H, 2DH, 52H, 4FH, 42H, 4FH
        DC8 54H, 28H, 42H, 44H, 29H, 5FH, 56H, 33H
        DC8 2EH, 32H, 28H, 53H, 29H, 2EH, 31H, 28H
        DC8 52H, 29H, 5CH, 53H, 56H, 4EH, 5CH, 5AH
        DC8 43H, 53H, 2DH, 52H, 4FH, 42H, 4FH, 54H
        DC8 28H, 42H, 44H, 29H, 2DH, 53H, 45H, 4EH
        DC8 44H, 5FH, 56H, 33H, 2EH, 31H, 5CH, 53H
        DC8 54H, 4DH, 38H, 5FH, 53H, 65H, 6EH, 64H
        DC8 5FH, 56H, 33H, 2EH, 30H, 5CH, 55H, 53H
        DC8 45H, 52H, 5CH, 53H, 79H, 73H, 49H, 6EH
        DC8 69H, 74H, 2EH, 63H, 0

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_13:
        DC8 "voltage == NULL"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_14:
        DC8 "NULL == IgbtValue"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_15:
        DC8 "NULL == CoilValue"

        END
//  552 
//  553 /*******************************************************************************
//  554 -----------------------------    End of file    --------------------------------
//  555 *******************************************************************************/
// 
// 1 398 bytes in section .far_func.text
//     1 byte  in section .near.bss
//    22 bytes in section .near.data
//    63 bytes in section .near.noinit   (abs)
//   401 bytes in section .near.rodata
// 
// 1 398 bytes of CODE  memory
//   401 bytes of CONST memory
//    23 bytes of DATA  memory (+ 63 bytes shared)
//
//Errors: none
//Warnings: none
