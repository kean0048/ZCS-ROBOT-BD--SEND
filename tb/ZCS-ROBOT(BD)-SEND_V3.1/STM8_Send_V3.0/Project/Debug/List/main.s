///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.20.1.176 for STM8                29/Mar/2017  16:25:53
// Copyright 2010-2015 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\main.c
//    Command line =  
//        "E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\main.c"
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
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?fcasts16f32_x_l0
        EXTERN ?fmul32_l0_l0_dc32
        EXTERN ?load32_0x_l0
        EXTERN ?load32_l0_0x
        EXTERN ?mov_w0_w1
        EXTERN ?mov_w1_w0
        EXTERN ?mul16_x_x_w0
        EXTERN ?push_w4
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w4
        EXTERN ADSample
        EXTERN Adjust_Time1_cycle2
        EXTERN Clock
        EXTERN DEAL_ABNORMAL_FUN
        EXTERN Fan_Close
        EXTERN Fan_Open
        EXTERN FunDealChildLost
        EXTERN FunDealChildLostWork
        EXTERN FunDealChildPwm
        EXTERN MacProtect
        EXTERN NRF24L01_TxPacket
        EXTERN SendDataUpdate
        EXTERN SysInit
        EXTERN TX_P0_SET
        EXTERN TX_P_SET
        EXTERN Time1_PWM_Close_Mode_Fast
        EXTERN UniqueID_Check
        EXTERN Variable_Init_Second
        EXTERN ZoneChargWiLess
        EXTERN _delay_us
        EXTERN deQueue
        EXTERN errmsg
        EXTERN errno
        EXTERN memcpy
        EXTERN parseByteStream2FrameStreamsp1
        EXTERN printf
        EXTERN queSEND
        EXTERN strncmp
        EXTERN strncpy

        PUBLIC ACCurr_AD
        PUBLIC ACCurr_DD
        PUBLIC ACTemp_AD
        PUBLIC ACTemp_DD
        PUBLIC ACVolt_AD
        PUBLIC ACVolt_DD
        PUBLIC ADC_RESULT
        PUBLIC ADC_RESULT_H
        PUBLIC ADC_RESULT_L
        PUBLIC AD_Value
        PUBLIC AD_Value_SUM
        PUBLIC AUTO_Array
        PUBLIC Address
        PUBLIC Address4Check
        PUBLIC Address_Pair
        PUBLIC Address_Pair_Child
        PUBLIC Address_Pair_Parent
        PUBLIC Address_Rec
        PUBLIC Address_Rec_Send
        PUBLIC Address_Sure
        PUBLIC Broken_Code
        PUBLIC BusStatus
        PUBLIC Buzz_Buffer
        PUBLIC Buzz_Control
        PUBLIC Buzz_Keep_CNT
        PUBLIC Buzz_Step
        PUBLIC Buzz_Times_CNT
        PUBLIC CHECK_ID
        PUBLIC CNT_Buzzer
        PUBLIC CNT_Eeprom_Check
        PUBLIC CNT_FULL_Num
        PUBLIC CNT_Fan_Check
        PUBLIC CNT_Fan_Open
        PUBLIC CNT_Fan_Speed
        PUBLIC CNT_MPSub_Beep
        PUBLIC CNT_PHeat
        PUBLIC CNT_PRINT
        PUBLIC CNT_Prot
        PUBLIC CNT_ProtB
        PUBLIC CNT_ProtF
        PUBLIC CNT_Re_WHOHAVE
        PUBLIC CNT_Rec_Check_Fail
        PUBLIC CNT_T100us
        PUBLIC CNT_T10ms
        PUBLIC CNT_T10us
        PUBLIC CNT_T1hour
        PUBLIC CNT_T1min
        PUBLIC CNT_T1ms
        PUBLIC CNT_T1s
        PUBLIC CNT_T2ms
        PUBLIC CNT_T2s
        PUBLIC CNT_T500ms
        PUBLIC CNT_T5s
        PUBLIC Check_Num
        PUBLIC Child_Comm
        PUBLIC Child_Comm_Back
        PUBLIC Child_Count_Num
        PUBLIC Child_Count_Num_Back
        PUBLIC Child_Num
        PUBLIC ChipUniqueID
        PUBLIC Cnt_ForeignBody_Available
        PUBLIC Command_Old
        PUBLIC FLAG_PWM_START
        PUBLIC FLAG_Re_WHOHAVE
        PUBLIC Falg_Bettery_Lessfull
        PUBLIC Falg_ForeignBody_Check
        PUBLIC FlagTrig
        PUBLIC Flag_1hour_A
        PUBLIC Flag_ADDRESS_P0
        PUBLIC Flag_Eeprom_Check
        PUBLIC Flag_Eeprom_Ero
        PUBLIC Flag_FRIST_IN
        PUBLIC Flag_False_Check_Pass
        PUBLIC Flag_Fan_First
        PUBLIC Flag_Fan_Open
        PUBLIC Flag_LED2_ENABLE
        PUBLIC Flag_Mac_On2s
        PUBLIC Flag_NEW_DEV
        PUBLIC Flag_NRF24L01_Have
        PUBLIC Flag_NRF24L01_OK
        PUBLIC Flag_PHCEn
        PUBLIC Flag_PWM_ENable
        PUBLIC Flag_RECV_ADDRESS_NUM
        PUBLIC Flag_RECV_ADDRESS_NUM_SAME
        PUBLIC Flag_RestartEhours
        PUBLIC Flag_SAME_ADDR
        PUBLIC Flag_Time1_PWM_OnOff
        PUBLIC Flag_enable_work
        PUBLIC Flg_Chenal_Fail
        PUBLIC Flg_Chenal_OK
        PUBLIC Float_ForeignBody_Value
        PUBLIC Float_ForeignBody_Value_Sum
        PUBLIC Frm_count
        PUBLIC Frm_num
        PUBLIC IWDG_KR
        PUBLIC Key_Check_ID1
        PUBLIC Key_Check_ID2
        PUBLIC Key_Check_ID3
        PUBLIC MacStatus
        PUBLIC NUM_PWM_UPload
        PUBLIC NUM_PWM_UPload_LessFull
        PUBLIC Num_RF
        PUBLIC Power
        PUBLIC Power_Rec
        PUBLIC Power_Rec_ch
        PUBLIC ProNum
        PUBLIC ProtectFlag
        PUBLIC Pwm_Frequent_Value
        PUBLIC Pwm_Product_numValue
        PUBLIC Pwm_Ratio_Value
        PUBLIC RD_Array
        PUBLIC RX_ADDRESS
        PUBLIC RX_Pro_Code_A
        PUBLIC RX_Pro_Code_B
        PUBLIC RecordPwmInfo
        PUBLIC RobotCommandProcStep
        PUBLIC SUM_CNT
        PUBLIC Step_Work
        PUBLIC Stor_Commd
        PUBLIC Stor_Frequen_eeprom
        PUBLIC Stor_Frequent
        PUBLIC Stor_Ratio
        PUBLIC Stor_Ratio_eeprom
        PUBLIC TD_Array
        PUBLIC TIM1_ARR
        PUBLIC TIM1_CCR1
        PUBLIC TX_Pro_Code_A
        PUBLIC TX_Pro_Code_B
        PUBLIC Time1_Need_cycle
        PUBLIC Time1_Work_cycle
        PUBLIC UART2_RX_BUF
        PUBLIC UART2_pRead
        PUBLIC UART2_pWrite
        PUBLIC Uart_Buf
        PUBLIC _A_Flag
        PUBLIC _A_Flag_100us
        PUBLIC _A_Flag_10ms_1
        PUBLIC _A_Flag_10ms_2
        PUBLIC _A_Flag_10us
        PUBLIC _A_Flag_1ms
        PUBLIC _A_Flag_NRF24L01
        PUBLIC _A_Key_Buffer
        PUBLIC _A_TempUsed
        PUBLIC busInfo
        PUBLIC checkSum
        PUBLIC cmdCounter
        PUBLIC count_false_check
        PUBLIC count_time
        PUBLIC devStatus
        PUBLIC err
        PUBLIC flag_check_succ
        PUBLIC flag_inwstatu
        PUBLIC flag_p
        PUBLIC flag_recheck_over
        PUBLIC flag_statu
        PUBLIC flg_stop_send_in
        PUBLIC globetimer
        PUBLIC main
        PUBLIC num1h
        PUBLIC num1l
        PUBLIC pFrm
        PUBLIC prodData
        PUBLIC rCmdContent
        PUBLIC rCmdPkg
        PUBLIC status
        PUBLIC wCmdAckBuf

// E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\main.c
//    1 /******************************************************************************/
//    2 /*					                                      */
//    3 /*	Project Name :	发射机（接收）		                                      */
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
//   15 #define  root
//   16 //#undef   root
//   17 
//   18 /*******************************************************************************
//   19 -----------------------------    Include files   -------------------------------
//   20 *******************************************************************************/
//   21 #include "type_def.h"

        ASEGN `.near.noinit`:DATA:NOROOT,050e0H
        SECTION_GROUP IWDG_KR
// unsigned char volatile IWDG_KR
IWDG_KR:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char num1l
num1l:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char num1h
num1h:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char FlagTrig
FlagTrig:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned long globetimer
globetimer:
        DS8 4

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char flag_p
flag_p:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char MacStatus
MacStatus:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Child_Count_Num
Child_Count_Num:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Child_Comm
Child_Comm:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Child_Comm_Back
Child_Comm_Back:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Child_Count_Num_Back
Child_Count_Num_Back:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Address_Rec[10][6]
Address_Rec:
        DS8 60

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Check_Num
Check_Num:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char CNT_FULL_Num
CNT_FULL_Num:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char status
status:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char CNT_T100us
CNT_T100us:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char CNT_T10us
CNT_T10us:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char CNT_T500ms
CNT_T500ms:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_T10ms
CNT_T10ms:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_T1ms
CNT_T1ms:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_T2ms
CNT_T2ms:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_T1s
CNT_T1s:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_T2s
CNT_T2s:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_T5s
CNT_T5s:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_1hour_A
Flag_1hour_A:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_T1min
CNT_T1min:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_T1hour
CNT_T1hour:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char ChipUniqueID[12]
ChipUniqueID:
        DS8 12

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char CHECK_ID[19]
CHECK_ID:
        DS8 19

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int Key_Check_ID1
Key_Check_ID1:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Key_Check_ID2
Key_Check_ID2:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int Key_Check_ID3
Key_Check_ID3:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_Eeprom_Ero
Flag_Eeprom_Ero:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_Eeprom_Check
Flag_Eeprom_Check:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char CNT_Eeprom_Check
CNT_Eeprom_Check:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char CNT_PRINT
CNT_PRINT:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_RestartEhours
Flag_RestartEhours:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char ADC_RESULT_L
ADC_RESULT_L:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char ADC_RESULT_H
ADC_RESULT_H:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int ADC_RESULT
ADC_RESULT:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int AD_Value_SUM[6]
AD_Value_SUM:
        DS8 12

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char SUM_CNT[6]
SUM_CNT:
        DS8 6

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int AD_Value[6]
AD_Value:
        DS8 12

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int ACVolt_AD
ACVolt_AD:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int ACCurr_AD
ACCurr_AD:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int ACTemp_AD
ACTemp_AD:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int ACVolt_DD
ACVolt_DD:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int ACCurr_DD
ACCurr_DD:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int ACTemp_DD
ACTemp_DD:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Buzz_Control
Buzz_Control:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Command_Old
Command_Old:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Buzz_Keep_CNT
Buzz_Keep_CNT:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Buzz_Times_CNT
Buzz_Times_CNT:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Buzz_Step
Buzz_Step:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Buzz_Buffer
Buzz_Buffer:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char CNT_Buzzer
CNT_Buzzer:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_PHeat
CNT_PHeat:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int TIM1_ARR
TIM1_ARR:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int TIM1_CCR1
TIM1_CCR1:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Step_Work
Step_Work:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_PHCEn
Flag_PHCEn:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Time1_Work_cycle
Time1_Work_cycle:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Time1_Need_cycle
Time1_Need_cycle:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_Time1_PWM_OnOff
Flag_Time1_PWM_OnOff:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_PWM_ENable
Flag_PWM_ENable:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char NUM_PWM_UPload
NUM_PWM_UPload:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char NUM_PWM_UPload_LessFull
NUM_PWM_UPload_LessFull:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char FLAG_PWM_START
FLAG_PWM_START:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// int Pwm_Frequent_Value
Pwm_Frequent_Value:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// int Pwm_Ratio_Value
Pwm_Ratio_Value:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Pwm_Product_numValue
Pwm_Product_numValue:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Stor_Commd[5]
Stor_Commd:
        DS8 5

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Falg_Bettery_Lessfull[5]
Falg_Bettery_Lessfull:
        DS8 5

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Stor_Frequen_eeprom[6]
Stor_Frequen_eeprom:
        DS8 6

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Stor_Ratio_eeprom[6]
Stor_Ratio_eeprom:
        DS8 6

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char RX_ADDRESS[6]
RX_ADDRESS:
        DS8 6

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Num_RF
Num_RF:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char TD_Array[32]
TD_Array:
        DS8 32

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char RD_Array[32]
RD_Array:
        DS8 32

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Child_Num
Child_Num:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Address_Rec_Send[5][13]
Address_Rec_Send:
        DS8 65

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char AUTO_Array[10][6]
AUTO_Array:
        DS8 60

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Address[6]
Address:
        DS8 6

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Address_Sure[6]
Address_Sure:
        DS8 6

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Address4Check[6]
Address4Check:
        DS8 6

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Address_Pair_Child[6]
Address_Pair_Child:
        DS8 6

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Address_Pair_Parent[6]
Address_Pair_Parent:
        DS8 6

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_Rec_Check_Fail[5]
CNT_Rec_Check_Fail:
        DS8 10

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Address_Pair[6]
Address_Pair:
        DS8 6

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char FLAG_Re_WHOHAVE
FLAG_Re_WHOHAVE:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char CNT_Re_WHOHAVE
CNT_Re_WHOHAVE:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_NRF24L01_OK
Flag_NRF24L01_OK:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_ADDRESS_P0
Flag_ADDRESS_P0:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_SAME_ADDR
Flag_SAME_ADDR:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_False_Check_Pass
Flag_False_Check_Pass:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_RECV_ADDRESS_NUM
Flag_RECV_ADDRESS_NUM:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_RECV_ADDRESS_NUM_SAME
Flag_RECV_ADDRESS_NUM_SAME:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_FRIST_IN[5]
Flag_FRIST_IN:
        DS8 5

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_NEW_DEV[5]
Flag_NEW_DEV:
        DS8 5

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Frm_num
Frm_num:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Frm_count[4]
Frm_count:
        DS8 4

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_Mac_On2s
Flag_Mac_On2s:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_Prot[16]
CNT_Prot:
        DS8 32

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_ProtB[16]
CNT_ProtB:
        DS8 32

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_ProtF[16]
CNT_ProtF:
        DS8 32

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char ProtectFlag[16]
ProtectFlag:
        DS8 16

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char ProNum
ProNum:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_enable_work
Flag_enable_work:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_MPSub_Beep
CNT_MPSub_Beep:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// float Power
Power:
        DS8 4

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned long Power_Rec
Power_Rec:
        DS8 4

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned long Power_Rec_ch[5]
Power_Rec_ch:
        DS8 20

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char TX_Pro_Code_A
TX_Pro_Code_A:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char TX_Pro_Code_B
TX_Pro_Code_B:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char RX_Pro_Code_A
RX_Pro_Code_A:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char RX_Pro_Code_B
RX_Pro_Code_B:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Broken_Code
Broken_Code:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_NRF24L01_Have
Flag_NRF24L01_Have:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char RecordPwmInfo[2]
RecordPwmInfo:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_Fan_Open
CNT_Fan_Open:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_Fan_First
Flag_Fan_First:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_Fan_Open
Flag_Fan_Open:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char CNT_Fan_Check
CNT_Fan_Check:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned int CNT_Fan_Speed
CNT_Fan_Speed:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Uart_Buf[23]
Uart_Buf:
        DS8 23

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char UART2_RX_BUF[64]
UART2_RX_BUF:
        DS8 64

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char UART2_pRead
UART2_pRead:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char UART2_pWrite
UART2_pWrite:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char RobotCommandProcStep
RobotCommandProcStep:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char checkSum
checkSum:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char err
err:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char cmdCounter
cmdCounter:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char wCmdAckBuf[32]
wCmdAckBuf:
        DS8 32

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char rCmdContent
rCmdContent:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Stor_Frequent[5]
Stor_Frequent:
        DS8 5

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Stor_Ratio[5]
Stor_Ratio:
        DS8 5

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flag_LED2_ENABLE
Flag_LED2_ENABLE:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char BusStatus
BusStatus:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char flag_inwstatu[5]
flag_inwstatu:
        DS8 5

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char flag_statu[5]
flag_statu:
        DS8 5

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char count_false_check
count_false_check:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char flag_recheck_over
flag_recheck_over:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flg_Chenal_OK[6]
Flg_Chenal_OK:
        DS8 6

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Flg_Chenal_Fail[6]
Flg_Chenal_Fail:
        DS8 6

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char flg_stop_send_in[8]
flg_stop_send_in:
        DS8 8

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char flag_check_succ[5]
flag_check_succ:
        DS8 5

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Falg_ForeignBody_Check[5]
Falg_ForeignBody_Check:
        DS8 5

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// unsigned char Cnt_ForeignBody_Available
Cnt_ForeignBody_Available:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// float Float_ForeignBody_Value[5]
Float_ForeignBody_Value:
        DS8 20

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// float Float_ForeignBody_Value_Sum
Float_ForeignBody_Value_Sum:
        DS8 4

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// union <unnamed> volatile _A_Flag_10ms_1
_A_Flag_10ms_1:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// union <unnamed> volatile _A_Flag_10ms_2
_A_Flag_10ms_2:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// union <unnamed> volatile _A_Flag_1ms
_A_Flag_1ms:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// union <unnamed> volatile _A_Flag_10us
_A_Flag_10us:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// union <unnamed> volatile _A_Flag_100us
_A_Flag_100us:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// union <unnamed> volatile _A_Flag_NRF24L01
_A_Flag_NRF24L01:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// union <unnamed> volatile _A_Key_Buffer
_A_Key_Buffer:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// DEV_STATUS devStatus
devStatus:
        DS8 11

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// ROBOT_CMD_PKG rCmdPkg
rCmdPkg:
        DS8 19

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// ARCHITECTRUEPR prodData
prodData:
        DS8 9

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// BUS_INFO busInfo
busInfo:
        DS8 24

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// DecodeIIcode pFrm[16]
pFrm:
        DS8 48

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// union <unnamed> volatile _A_Flag
_A_Flag:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// union <unnamed> _A_TempUsed
_A_TempUsed:
        DS8 4
//   22 #include "Stream2Char.h"
//   23 #include "MacProtect.h"
//   24 #include "PWM_Control.h"
//   25 #include "QueueMsg.h"
//   26 #include "SysInit.h"
//   27 #include "Nrf24l01.h"
//   28 #include "delayTime.h"
//   29 #include "FAN_Control.h"
//   30 #include "Clock.h"
//   31 #include "Eeprom.h"
//   32 #include "ADSample.h"
//   33 #include "Buzz.h"
//   34 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   35 int count_time[5] = {0};                //
count_time:
        DS8 10
//   36 extern unsigned char* errmsg[];
//   37 extern char errno;
//   38 
//   39 //******************************************************************************
//   40 //主函数
//   41 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   42 void main(void)
//   43 {
main:
        CALLF     L:?push_w4
//   44 	//////////////////////变量定义区///////////////////////////////
//   45 	static unsigned int count_over = 1;
//   46 	static unsigned int count_over_f = 0;
//   47 	static unsigned char num_lessfull = 0;
//   48 	static unsigned int count_add_c = 0;
//   49 	//static unsigned char Flag_lessfull_bool = 0;
//   50 	//static char count_pwm_start = 0;
//   51 
//   52 	static unsigned char count_succ_check = 0;
//   53 
//   54 	static unsigned char RS_Array_Pair[32];
//   55 	static unsigned char RS_Array_Check[32];
//   56 	static TMsg msgMain = {0,NULL,0,0};
//   57 
//   58 	static unsigned char Frm_count_Temp = 0;
//   59 	static unsigned char Num4Check_CountChecked = 0;
//   60 	//////////////////////初始化定义区 关中断///////////////////////////////
//   61 
//   62 	asm("sim");//关闭中断	                       
        sim
//   63     SysInit();                          //系统初始化
        CALLF     SysInit
//   64     asm("rim");                         //打开中断 
        rim
//   65 	//////////////////////程序区，在此之前开中断///////////////////////////////
//   66     /*while(NRF24L01_Check())             //检测不到24L01
//   67     {
//   68         Delay(100);                    //延时1ms
//   69     }*/
//   70     printf("CLS(8);\n\r");
        LDW       X, #?_0
        CALLF     printf
//   71     _delay_us(100);
        LDW       X, #0x64
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALLF     _delay_us
//   72     printf("CLS(8);\n\r");
        LDW       X, #?_0
        CALLF     printf
        JP        L:??main_0
//   73 	//////////////////////程序区，在此之前检测NRF模块///////////////////////////////
//   74     for(;;)	
//   75 	{	
//   76 		Clock(); 						//时间
//   77 		UniqueID_Check();               //保密检测
//   78 		//Flag_Eeprom_Ero = 0;
//   79 		if (Flag_Eeprom_Ero == 0) 		//保密检测正常
//   80         {
//   81 			Flag_LED2_ENABLE = 0;  //LED2 灭
//   82             ADSample(); 				//AD采样
//   83 			//Buzzer(); 					//蜂鸣器			
//   84 			MacProtect(); 				//异常检测与处理
//   85             
//   86             /*20170304,找不到当2个线盘取下后无法配对，零时用来喂狗以保证样品展示正常运行*/
//   87             if(flag_p <= 5)
//   88             {
//   89                IWDG_KR = 0xAA;        //喂狗
//   90             }
//   91 		    if(Flag_Mac_On2s == 1)
//   92 		    {									
//   93 				  if(MacStatus == C_MSNORMAL )
//   94 				  {
//   95 					  switch(status)
//   96 					  {
//   97 						case C_MSIdle:	
//   98 						  if(flag_statu[3] == 1)
//   99 						  {
//  100 							  status = C_MSPair;
//  101 							  if((flag_statu[0] == 1) && (FLAG_PWM_START ==1))
//  102 							  {
//  103 								  Time1_PWM_Close_Mode_Fast(); //快速关闭PWM输出								  
//  104 								  flag_statu[0] = 0;
//  105 								  FLAG_PWM_START = 0;
//  106 								  //Printf("DS16(0,85,'Close Pwm',12);\n\r");
//  107                                   
//  108                                   if(flag_p == 2)
//  109                                   {
//  110                                     //asm("trap");      
//  111                                       flag_p = 4;
//  112                                   }
//  113 							  }
//  114 							  flag_inwstatu[0] = 1;
//  115 						  }
//  116 						  break;
//  117 						case C_MSPair:
//  118 						  if(flag_inwstatu[0] == 1)
//  119 						  {
//  120 							  if(flag_statu[1] == 1)// 400ms
//  121 							  {
//  122 								  //Delay(100);
//  123 								  //切换到0通道
//  124 								  if(Flag_ADDRESS_P0 == 0)	//20170213 减少P0通道切换
//  125                                   {
//  126 									  TX_P0_SET(); 		// 如果不添加此代码将加长初次配对时间	
//  127                                       Flag_ADDRESS_P0 = 1; 
//  128                                       flag_p = 1;
//  129                                   }
//  130 								  if((flag_statu[4] == 1) && (FLAG_PWM_START == 0))	
//  131 								  {
//  132 									  //添加缓慢增加pwm的代码
//  133 									  Adjust_Time1_cycle2(0);//10%
//  134 									  FLAG_PWM_START = 1;
//  135 									  flag_statu[4] = 0;
//  136 								  }
//  137                                   
//  138 								  Child_Count_Num = 1;
//  139 								  Child_Comm = 0xaa;//配对
//  140 								  Child_Num = Child_Count_Num;
//  141 								  for(int j = 0;j<5;j++)
//  142 									  Address[j] = Address_Pair[j];
//  143 								  SendDataUpdate();
//  144 								  //发射配对查询信息，成功后将收到待配对设备的返回信息，返回信息中带有待配对设备的ID
//  145 								  if(NRF24L01_TxPacket(TD_Array) == 0x40)
//  146 								  {
//  147                                       //Printf("DS16(0,85,'Open Pwm',12);\n\r");
//  148 									  memcpy(RS_Array_Pair,RD_Array,RX_PLOAD_WIDTH);
//  149 									  for(int i = 0;i<5;i++)
//  150 									  {
//  151 										  Address_Pair_Child[i] = RS_Array_Pair[i+6];
//  152 										  Address_Pair_Parent[i] = RS_Array_Pair[i+11];
//  153 									  }
//  154 									  if(strncmp((char*)Address_Pair_Parent,(char*)Address_Pair,5) == 0)//这一步为将来多对多使用，现在不影响配对，现在这一步主要是防止收到其他设备的查询返回指令
//  155 									  {
//  156 										  for(int i = 0;i<5;i++)
//  157 										  {
//  158 											  count_add_c += Address_Pair_Child[i];
//  159 										  }
//  160 										  if(count_add_c > 0)
//  161 										  {
//  162                                               //Printf("DS16(0,85,'Open Pwm',12);\n\r");
//  163                                               Variable_Init_Second();//20170227
//  164 											  for(int i = 0;i<5;i++)
//  165 											  {
//  166 												  AUTO_Array[Flag_RECV_ADDRESS_NUM_SAME][i] = Address_Pair_Child[i];
//  167 											  }
//  168 											    
//  169 											  for(int j = 0;j<5;j++)
//  170 												  Address_Sure[j] = AUTO_Array[Flag_RECV_ADDRESS_NUM_SAME][j];//对应查询接收机的地址
//  171 											  SendDataUpdate();
//  172                                               //20170307此处可以更严谨一些加入返回值等于0x40的判断，这样主机不会轻易进入配对状态
//  173 											  //20130307无需如此if(NRF24L01_TxPacket(TD_Array) == 0x40)
//  174 											  NRF24L01_TxPacket(TD_Array);
//  175 											  Flag_RECV_ADDRESS_NUM_SAME++;
//  176 											  Flag_RECV_ADDRESS_NUM  = Flag_RECV_ADDRESS_NUM_SAME; //20170220 充满后用于标记，同时减去pwm
//  177 											 
//  178 											  /*for(int j = 0;j<5;j++) //2017.01.18删除后配对随机性增加，但是如果不删除，会出现配对失败
//  179 												  Address_Sure[j] = 0;*/								
//  180 											  Child_Count_Num = Flag_RECV_ADDRESS_NUM_SAME;//这一步是否多余，以后观察？？？？？
//  181 											  count_add_c = 0;			
//  182 										  }
//  183 										  //else
//  184 											  //Child_Count_Num--;
//  185 									  }
//  186 									  //else
//  187 										  //Child_Count_Num--;
//  188 								  }
//  189 								  //else
//  190 									  //Child_Count_Num--;
//  191 
//  192 								  if(Flag_RECV_ADDRESS_NUM_SAME > 0)//一旦有配对设备，则进入查询分支，同时，只要Flag_RECV_ADDRESS_NUM_SAME ！=0，则不会进入该分支
//  193 								  {
//  194 									  status = C_MSWork;
//  195 								  }
//  196 								  else
//  197 								  {
//  198 									  status = C_MSIdle;
//  199 									  flag_statu[1] = 0;
//  200 								  }
//  201 								  flag_inwstatu[0] = 0;
//  202 							  }												
//  203 						  }
//  204 						  else
//  205 						  {
//  206 							  if(flag_inwstatu[1] == 1)
//  207 							  {
//  208 								  if(flag_statu[1] == 1)
//  209 								  {
//  210 									  //Flag_RECV_ADDRESS_NUM_SAME为4时挂载设备数量为5
//  211 									  if(Flag_RECV_ADDRESS_NUM_SAME < ALLOWED_PAIR)//连接设备数量小于允许连接值则继续，若大于则退出配对查询，将查询开始值置1
//  212 									  {
//  213 										  //切换到0通道
//  214 										  TX_P0_SET();
//  215 										  _delay_us(100);
//  216                                           //flag_p = 2;
//  217 										  //printf("TX_P_SET(0);\n");
//  218 										  Flag_ADDRESS_P0 = 1; //20170213 用于标识在配对阶段已经切换至p0通道减少空载时P0切换
//  219 										 
//  220 										  //2017.01.18 增加查找哪一个线盘可以放置新电池
//  221 										  for(int i = 0;i < ALLOWED_PAIR;i++)
//  222 										  {
//  223 											 if(Flg_Chenal_OK[i] == 0)//该通道配对设备已拿走
//  224 											 {
//  225 												 Child_Count_Num = i;
//  226 												 break;
//  227 											 }
//  228 										  }
//  229 										  Child_Count_Num++;//该值随连接设备数量变化
//  230 										  Child_Comm = 0xaa;//配对指令
//  231 										  Child_Num = Child_Count_Num;//指定下一个配对设备的序号
//  232 										  for(int j = 0;j<5;j++)
//  233 											  Address[j] = Address_Pair[j]; //主机地址（MAC_address)
//  234 										  SendDataUpdate();
//  235 										  if(NRF24L01_TxPacket(TD_Array) == 0x40)//发送配对查询指令
//  236 										  {
//  237 											  memcpy(RS_Array_Pair,RD_Array,RX_PLOAD_WIDTH);
//  238 											  for(int i = 0;i<5;i++)
//  239 											  {
//  240 												  Address_Pair_Child[i] = RS_Array_Pair[i+6];//返回内容中6~10位为待连接设备地址
//  241 												  Address_Pair_Parent[i] = RS_Array_Pair[i+11];//11~15位主机地址
//  242 											  }
//  243 											  if((strncmp((char*)Address_Pair_Parent,(char*)Address_Pair,5) == 0) && (Child_Comm_Back == 0xDD))//判断返回内容是否为需要的内容，配对查询指令返回值为OXDD
//  244 											  {
//  245 												  for(int i = 0;i<5;i++)
//  246 													  count_add_c += Address_Pair_Child[i];
//  247 												  if(count_add_c > 0)
//  248 												  {
//  249 													  for(int i = 0;i<10;i++)//由于系统原因导致重复配对的，标号时候要剔除
//  250 													  {
//  251 														  if(strncmp((char*)AUTO_Array[i],(char*)Address_Pair_Child,5) == 0)
//  252 														  {
//  253 															  Flag_SAME_ADDR = 1;
//  254 															  FLAG_Re_WHOHAVE = i;
//  255 															  break;
//  256 														  }
//  257 													  }
//  258 													  //有重复地址时，不予配对
//  259 													  if(Flag_SAME_ADDR == 1)
//  260 													  {
//  261 														  Flag_SAME_ADDR = 0;
//  262 														  for(int j = 0;j<5;j++) //2017.01.18 配对确认信息删除
//  263 															  Address_Sure[j] = 0;
//  264 														  //此处是否应该添加如果同样地址请求100次则给予配对的权限？？？20170222
//  265 														  CNT_Re_WHOHAVE++;
//  266 														  if(CNT_Re_WHOHAVE >= 100)
//  267 														  {
//  268 															  for(int j = 0;j < ALLOWED_PAIR;j++)
//  269 									  								AUTO_Array[FLAG_Re_WHOHAVE][j] = 0;
//  270 															  CNT_Re_WHOHAVE = 0;
//  271 														  }
//  272 													  }
//  273 													  else
//  274 													  {
//  275 														  //主要用于查询那个接收端可以放置新的配对地址
//  276 														   for(int i = 0;i<ALLOWED_PAIR;i++)
//  277 														   {
//  278 															   if(Flg_Chenal_OK[i] == 0)//该通道配对设备已拿走
//  279 															   {
//  280 																   Check_Num = i; //记录可以存放数据的位置
//  281 																   Flg_Chenal_OK[i] = 1;
//  282 																   Flg_Chenal_Fail[i] = 0;
//  283 																   break;
//  284 															   }
//  285 														   }
//  286 														   //以上的for可以和以下 的if合并，可以减少一个5字节的数组使用，以后要优化
//  287 														   //有充满拿走后的使用这个(检查是否被标记)
//  288 														  if(flg_stop_send_in[Check_Num])
//  289 														  {	
//  290 															  for(int i = 0;i<5;i++)
//  291 															  {
//  292 																  AUTO_Array[Check_Num][i] = Address_Pair_Child[i];
//  293 															  }
//  294 															  flg_stop_send_in[Check_Num] = 0;
//  295 															  //Check_Num = 0;
//  296 														  }
//  297 														  else//这应该是第一次上电后使用的，直到满后
//  298 														  {
//  299 															  for(int i = 0;i<5;i++)
//  300 															  {
//  301 																  AUTO_Array[Flag_RECV_ADDRESS_NUM_SAME][i] = Address_Pair_Child[i];
//  302 															  }	
//  303 															  //flg_stop_send_in[Flag_RECV_ADDRESS_NUM_SAME] = false;
//  304 														  }
//  305 														  
//  306 														  for(int j = 0;j<5;j++)
//  307 															  Address_Sure[j] = AUTO_Array[Check_Num][j];//对应查询接收机的地址
//  308 														   
//  309 														  Check_Num = 0;//2017.01.20  从240行移植到此处，保证上面的Address_Sure从AUTO_Array里拿到正确的地址信息
//  310 														  SendDataUpdate();
//  311 														  
//  312 														  //20170307if(NRF24L01_TxPacket(TD_Array) == 0x40)//无需如此，因为主机无法确定是否是该机回复的内容
//  313 														  NRF24L01_TxPacket(TD_Array);
//  314 														  
//  315 														  Flag_RECV_ADDRESS_NUM_SAME++;
//  316 														  Flag_RECV_ADDRESS_NUM  = Flag_RECV_ADDRESS_NUM_SAME; //20170220 充满后用于标记，同时减去pwm
//  317 														  //for(int j = 0;j<5;j++)
//  318 															  //Address_Sure[j] = 0; //2017.01.18 放在此处保留会影响配对效果
//  319 													  }
//  320 													  Child_Count_Num = Flag_RECV_ADDRESS_NUM_SAME;
//  321 													  count_add_c = 0;
//  322 												  }
//  323 												  else
//  324 													  Child_Count_Num--;
//  325 											  }
//  326 											  else
//  327 												  Child_Count_Num--;
//  328 										  }
//  329 										  else
//  330 											  Child_Count_Num--;
//  331 										  
//  332 										  if(Flag_RECV_ADDRESS_NUM_SAME > 0)//如果小于零则说明所有设备都已经下线，则进入空闲和配对查询交替分支
//  333 										  {
//  334 											  status = C_MSWork;
//  335 											  flag_statu[1] = 0;
//  336 										  }
//  337 										  else
//  338 										  {
//  339 											  status = C_MSIdle;
//  340 											  flag_statu[0] = 1;	
//  341 											  flag_statu[2] = 0;//20170303
//  342 										  }			
//  343 									  }
//  344 									  else//多于设定可充电数量时执行此分支，不再查询配对设备
//  345 									  {
//  346 										  status = C_MSWork;
//  347 										  flag_statu[1] = 0;
//  348 										  //flag_inwstatu[2] = true; 2017.01.17 因为工作阶段随不同的子模块都会切换地址，所以该值失去辨别意义
//  349 									  }
//  350 									  flag_inwstatu[1] = 0;
//  351 									  count_over = 1;
//  352 									  count_over_f = 1;//20170308
//  353 									  Num4Check_CountChecked = 0;
//  354 								  }
//  355 							  }
//  356 						  }
//  357 						  break;
//  358 						case C_MSWork:
//  359 						  if(flag_statu[2] == 1)//500ms
//  360 						  {	
//  361 							  if(flag_recheck_over == 1) // 是否有查询失败的情况，若有，则继续查询没有查询成功的配对设备
//  362 								  Child_Num = count_over_f;
//  363 							  else
//  364 								  Child_Num = count_over % ALLOWED_PAIR;//查询哪一个
//  365 							  //切换查询模式
//  366 							  //printf("Child_Num = %d :count_over_f = %d\n",Child_Num,count_over_f);
//  367 							  if(Flg_Chenal_Fail[Child_Num-1]) //2017.01.18 如果该位置产品被拿走，则不再查询该位置
//  368 							  {
//  369 								  for(int j = 0;j < ALLOWED_PAIR;j++)
//  370 									  AUTO_Array[Child_Num-1][j] = 0;
//  371 								  //flag_check_succ[Child_Num-1] = true;
//  372 								  //Flg_Chenal_Fail[Child_Num-1] = false;
//  373 								  count_over++;//查询下一个
//  374 								  
//  375 								  if(flag_recheck_over == 1)
//  376 									  flag_recheck_over = 0;
//  377 								  
//  378 								  if(count_over >= ALLOWED_PAIR)
//  379 									  count_over = 0;
//  380 								  break;	
//  381 							  }
//  382 							  else
//  383 								  Num4Check_CountChecked++;
//  384 							
//  385 							  Flag_ADDRESS_P0 = 0; //20170213 用于标识在配对阶段已经切换至p0通道减少空载时P0切换
//  386 							  
//  387                               //flag_p = 3;
//  388                               
//  389 							  TX_P_SET(Child_Num);//Delay(400);
//  390 							  //printf("TX_P_SET(%d);\n",Child_Num-1);
//  391 							  _delay_us(100);
//  392 							  Child_Comm = 0xbb;//查询命令
//  393 							  for(int j = 0;j<5;j++)
//  394 								  Address[j] = AUTO_Array[Child_Num-1][j];//对应查询接收机的地址
//  395 							  if(Frm_count_Temp >= 245)
//  396 								  Frm_count_Temp = 0;
//  397 							  Frm_count[Child_Num-1] = (Frm_count_Temp++) % 255;
//  398 							  Frm_num = Frm_count[Child_Num-1];
//  399 							  SendDataUpdate();
//  400 							  
//  401 							  if((NRF24L01_TxPacket(TD_Array) == 0x40) && (strncmp((char*)Address4Check,(char*)Address,5) == 0x00))//收到查询返回信息，并验证地址正确性
//  402 							  {	
//  403 								  flag_check_succ[Child_Num-1] = 1; // 标记查询正确
//  404 								  flag_recheck_over = 0;
//  405 								  count_false_check = 0;				 //计数清零
//  406 								  Flag_False_Check_Pass = 0;
//  407 								  CNT_Rec_Check_Fail[Child_Num-1] = 0;
//  408 								  Falg_ForeignBody_Check[Child_Num-1] = 1;//20170320 如果为1，则可以将反馈的功率值作为有效值相加
//  409 							  }
//  410 							  else
//  411 							  {
//  412 								  Falg_ForeignBody_Check[Child_Num-1] = 0;
//  413 								  CNT_Rec_Check_Fail[Child_Num-1]++;
//  414 								  if(Flag_False_Check_Pass == 1)
//  415 								  {
//  416 									  flag_check_succ[Child_Num-1] = 1;//3次查询失败后 标记成功
//  417 									  count_false_check = 0;//计数清零
//  418 									  Flag_False_Check_Pass = 0;
//  419 								  }
//  420 								  else
//  421 								  {
//  422 									  flag_check_succ[Child_Num-1] = 0;//标记查询失败
//  423 								  }
//  424 							  }	
//  425 							  
//  426 							  if(Child_Num >= 3)
//  427 								  printf("TX_P_SET(%d);\n",Child_Num-1);
//  428 							  if(Num4Check_CountChecked >= Flag_RECV_ADDRESS_NUM_SAME)//如果查询数量=连接设备数量则说明已查询所有连接设备，如果不等则++，进入下一个设备查询
//  429 							  {
//  430 								  for(int i = 0;i < ALLOWED_PAIR;i++)
//  431 								  {
//  432 									  //2017.01.19 注销，使用直接修改flag_check_succ的方法,flg_stop_send_in此变量值不易轻易修改
//  433 									  //2017.01.18将取下的排除在外，确保不进入死循环
//  434 									  //if(flg_stop_send_in[i])
//  435 										  //flag_check_succ[i] = false;
//  436 									  if((!Flg_Chenal_Fail[i])&&(flag_check_succ[i] == 1))
//  437 									  {	
//  438 										  count_succ_check++;
//  439 									  }
//  440 								  }
//  441 								  if(count_succ_check == Flag_RECV_ADDRESS_NUM_SAME)//若相等则证明所有连接设备都已查询，退出分支进入配对查询分支
//  442 								  {
//  443 									  if(flag_inwstatu[1] == 0)
//  444 									  {
//  445 										  for(int j = 0;j<5;j++) //2017.01.18删除后配对随机性增加，但是如果不删除，会出现配对失败
//  446 											  Address_Sure[j] = 0;
//  447 										  flag_inwstatu[1] = 1;
//  448 									  }
//  449 									  status = C_MSPair;
//  450 									  count_over_f = 1;
//  451 									  flag_recheck_over = 0;
//  452 									  count_false_check = 0;
//  453 									  count_over = 1;
//  454 									  Num4Check_CountChecked = 0; //2017.01.18 恢复记录已查询产品个数计数变量初始值
//  455 								  }
//  456 								  else//不等，需要轮询查看那个设备没有查询成功
//  457 								  {
//  458 									  //2017.01.19 注销，使用直接修改flag_check_succ的方法,flg_stop_send_in此变量值不易轻易修改
//  459 									  //2017.01.18将取下的排除在外，确保不进入死循环
//  460 									  /*for(int i = 0;i <ALLOWED_PAIR;i++)
//  461 									  {
//  462 										  if(flg_stop_send_in[i])
//  463 											  flag_check_succ[i] = true;
//  464 									  }*/
//  465 									  for(int i = 1;i <= ALLOWED_PAIR;i++)
//  466 									  {
//  467 										  //2017.01.19 添加(!Flg_Chenal_Fail[i])条件，保证若果1掉了，则不查询1，查询2.3.。。
//  468 										  if((!Flg_Chenal_Fail[i-1]) && (flag_check_succ[i-1] == 0))//查到那个没有查询成功
//  469 										  {
//  470 											  flag_recheck_over = 1;//标记进入待查询设备号选择
//  471 											  count_over_f = i;//记录要重复查询的子设备标号
//  472 											  count_false_check++;//记录查询次数，跳出
//  473 											  break;
//  474 										  }
//  475 									  }
//  476 								  }
//  477 								  count_succ_check = 0;
//  478 							  }
//  479 							  else
//  480 							  {
//  481 								  count_over++;
//  482 							  }
//  483 
//  484 							  if(count_false_check >= 3)//若查询失败的子设备在重复查询3次后尚无回复信息，则放弃查询，进入下一个待查
//  485 							  {
//  486 								  Flag_False_Check_Pass = 1;//实质上第二次查完就置ture了，如果第三次查询失败，则进入失败程序置成功并false，成功就进入成功程序并false;
//  487 							  }
//  488 							  
//  489 							  FunDealChildLostWork(Child_Num,&num_lessfull);
//  490 							                              
//  491 							  if(Flag_RECV_ADDRESS_NUM_SAME <= 0)
//  492 							  {
//  493 								  status = C_MSPair;
//  494 								  flag_inwstatu[1] = 1;
//  495 								  Flag_RECV_ADDRESS_NUM = 0;
//  496 								  NUM_PWM_UPload = 0;
//  497 							  }
//  498 							  
//  499  							  flag_statu[2] = 0;//20170303
//  500 							  
//  501 							  if(((Flag_RECV_ADDRESS_NUM - CNT_FULL_Num) > 0) && (Flag_Fan_Open == 0))
//  502 							  {
//  503 								  Fan_Open();
//  504 							  }
//  505 							  else if(((Flag_RECV_ADDRESS_NUM - CNT_FULL_Num) <= 0) && (Flag_Fan_Open == 1))
//  506 							  {
//  507 								  Fan_Close();
//  508 							  }
//  509 						  }
//  510 						  break;
//  511 						default:
//  512 						  break;			
//  513 					  }
//  514 					  
//  515 					  if(deQueue(&queSEND,&msgMain) == 1)//2017.01.18修改后可以显示说有连接查询回复情况，增加后只能显示最后查询情况 && flag_inwstatu[1]
//  516 					  {
//  517 						  memcpy(RS_Array_Check,(unsigned char *)msgMain.pInf,msgMain.datalenth);
//  518 						  //以下添加解码程序
//  519 						  parseByteStream2FrameStreamsp1(RS_Array_Check,msgMain.datalenth);
//  520 						  for(int i = 0;i<5;i++)
//  521 						  {
//  522 							  if(Falg_Bettery_Lessfull[i] == 1)
//  523 								  num_lessfull++;
//  524 							  if(Falg_ForeignBody_Check[i] == 1)
//  525 								  Cnt_ForeignBody_Available++;
//  526 						  }
//  527 
//  528 						  if(Falg_ForeignBody_Check[ZoneChargWiLess.SlfNum-1] == 1)
//  529 						  {
//  530 							  strncpy((char*)TempUsed,(char*)ZoneChargWiLess.PowerS,4);
//  531 							  Float_ForeignBody_Value[ZoneChargWiLess.SlfNum-1] = PowerChild;
//  532 						  }
//  533   	  
//  534 						  if(ZoneChargWiLess.PairComm == 0x00)//2017.01.17 添加当离开线圈后的处理方式
//  535 						  {
//  536 							  FunDealChildLost(ZoneChargWiLess.SlfNum,&num_lessfull);
//  537 						  }
//  538 						  else
//  539 						  {
//  540 							  //在此添加PWM等相关操作								  
//  541 							  FunDealChildPwm(ZoneChargWiLess.SlfNum,ZoneChargWiLess.Status,&num_lessfull);
//  542 						  }  
//  543 						  //20170317清空待充满电池数量，下次进入时再次统计
//  544 						  num_lessfull = 0;
//  545 						  
//  546 						  if(((Flag_RECV_ADDRESS_NUM - CNT_FULL_Num) > 0) && (Flag_Fan_Open == 0))
//  547 						  {
//  548 							  Fan_Open();
//  549 						  }
//  550 						  else if(((Flag_RECV_ADDRESS_NUM - CNT_FULL_Num) <= 0) && (Flag_Fan_Open == 1))
//  551 						  {
//  552 							  Fan_Close();
//  553 						  }
//  554 					  }					  
//  555 				 
//  556 				  }
//  557 				  else if(MacStatus == C_MSProt)
//  558 				  {	
//  559 					  for(int i = 0;i<16;i++)
//  560 					  {
//  561 						  if(ProtectFlag[i])
//  562 								DEAL_ABNORMAL_FUN(i);	
//  563 					  }
//  564                       flag_p = 5;//异常，不喂狗，mcu重启
//  565 				   }							
//  566 			}			
//  567 		}
//  568 		else
//  569 			Flag_LED2_ENABLE = 1;
??main_1:
        MOV       L:Flag_LED2_ENABLE, #0x1
//  570 		
//  571 #if 1
//  572 			if (Flag_10ms_P == 1)   
??main_2:
        BTJT      L:_A_Flag_10ms_2, #0x0, ??lb_0
        JPF       L:??main_0
//  573 			{
//  574 				Flag_10ms_P = 0;
??lb_0:
        BRES      L:_A_Flag_10ms_2, #0x0
//  575 				CNT_PRINT++;
        LD        A, #0x1
        ADD       A, L:CNT_PRINT
        LD        L:CNT_PRINT, A
//  576 				if (CNT_PRINT % 100 == 0)
        LD        A, L:CNT_PRINT
        MOV       S:?b0, #0x64
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        DIV       X, A
        CP        A, #0x0
        JRNE      L:??main_3
//  577 					printf("DS16(0,0,'充电状态:%d 挂载终端数：%d   ',12);\n\r", ZoneChargWiLess.Status,Flag_RECV_ADDRESS_NUM_SAME);
        LD        A, L:Flag_RECV_ADDRESS_NUM_SAME
        CLRW      X
        LD        XL, A
        PUSHW     X
        PUSH      L:ZoneChargWiLess + 24
        PUSH      L:ZoneChargWiLess + 23
        LDW       X, #?_2
        CALLF     printf
        ADD       SP, #0x4
//  578 				if (CNT_PRINT % 15 == 0) 
??main_3:
        LD        A, L:CNT_PRINT
        MOV       S:?b0, #0xf
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        DIV       X, A
        CP        A, #0x0
        JRNE      L:??main_4
//  579 					printf("DS16(0,17,'当前查询终端号:%d   ',12);\n\r", ZoneChargWiLess.SlfNum);
        LD        A, L:ZoneChargWiLess + 4
        CLRW      X
        LD        XL, A
        PUSHW     X
        LDW       X, #?_3
        CALLF     printf
        ADD       SP, #0x2
//  580 				if (CNT_PRINT % 2 == 0)
??main_4:
        LD        A, L:CNT_PRINT
        MOV       S:?b0, #0x2
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        DIV       X, A
        CP        A, #0x0
        JRNE      L:??main_5
//  581 					printf("DS16(0,34,'%d mV  %d  %d   ',12);\n\r", ACVolt_DD*10,ACVolt_AD,(int)(Power*1000));
        LDW       X, #Power
        CALLF     L:?load32_l0_0x
        CALLF     L:?fmul32_l0_l0_dc32
        DATA
        DC32      0x447a0000
        CODE
        CALLF     L:?fcasts16f32_x_l0
        PUSHW     X
        PUSH      L:ACVolt_AD + 1
        PUSH      L:ACVolt_AD
        LDW       Y, L:ACVolt_DD
        LDW       X, #0xa
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        PUSHW     X
        LDW       X, #?_4
        CALLF     printf
        ADD       SP, #0x6
//  582 				if (CNT_PRINT % 100 == 0)
??main_5:
        LD        A, L:CNT_PRINT
        MOV       S:?b0, #0x64
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        DIV       X, A
        CP        A, #0x0
        JRNE      L:??main_6
//  583                   printf("DS16(0,51,'pwmClass:%d full:%d Upload:%d',12);\n\r", Flag_RECV_ADDRESS_NUM - CNT_FULL_Num,CNT_FULL_Num ,NUM_PWM_UPload);
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        PUSHW     X
        LD        A, L:CNT_FULL_Num
        CLRW      X
        LD        XL, A
        PUSHW     X
        LD        A, L:CNT_FULL_Num
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, L:Flag_RECV_ADDRESS_NUM
        CLRW      X
        LD        XL, A
        SUBW      X, S:?w0
        PUSHW     X
        LDW       X, #?_5
        CALLF     printf
        ADD       SP, #0x6
//  584 				if (CNT_PRINT % 100 == 0)
??main_6:
        LD        A, L:CNT_PRINT
        MOV       S:?b0, #0x64
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        DIV       X, A
        CP        A, #0x0
        JRNE      L:??main_7
//  585                   printf("DS16(0,68,'流程控制量:%d  频道标识: %d     ',12);\n\r",ZoneChargWiLess.PairComm,flag_p);
        LD        A, L:flag_p
        CLRW      X
        LD        XL, A
        PUSHW     X
        LD        A, L:ZoneChargWiLess + 5
        CLRW      X
        LD        XL, A
        PUSHW     X
        LDW       X, #?_6
        CALLF     printf
        ADD       SP, #0x4
//  586 				/*if (CNT_PRINT % 18 == 0)
//  587 					printf("DS16(0,85,'线圈电压:%d mV   ',12);\n\r",ACSupply_Volt_DD*10);*/
//  588 
//  589 				if (CNT_PRINT % 15 == 0)
??main_7:
        LD        A, L:CNT_PRINT
        MOV       S:?b0, #0xf
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        DIV       X, A
        CP        A, #0x0
        JRNE      L:??main_8
//  590 				{
//  591 					printf("DS16(0,136,'错误信息：%s',12);\n\r",errmsg[errno]);
        LD        A, L:errno
        CLRW      X
        LD        XL, A
        SLLW      X
        LDW       X, (L:errmsg,X)
        PUSHW     X
        LDW       X, #?_7
        CALLF     printf
        ADD       SP, #0x2
//  592 					//printf("DS16(0,153,'348为第三等级，400为第四等级',12);\n\r");
//  593 				
//  594 					/*printf("DS16(0,119,'ACTemp_DD:%d ℃ ',12);\n\r",Touch_Coil_On);
//  595 					
//  596 					printf("DS16(0,136,'MacStatus:%d - %d     ',12);\n\r", STA_PAIR_CODE,Flag_Supply_Volt_OK);
//  597 					
//  598 					printf("DS16(0,153,'ErrStatus:%s    ',12);\n\r", errmsg[errno]);*/
//  599 				}
//  600 				//if (CNT_PRINT == 80)printf("DS16(0,153,'RXworkCycle:%d    ',12);\n\r", RX_Time1_Work_cycle);
//  601 				if (CNT_PRINT >= 254)
??main_8:
        LDW       X, #CNT_PRINT
        LD        A, (X)
        CP        A, #0xfe
        JRC       L:??main_0
//  602 				{	
//  603 					CNT_PRINT = 0;
        MOV       L:CNT_PRINT, #0x0
//  604 				}
//  605 			
//  606 				/*count_re++;
//  607 				if(count_re > 1000)
//  608 				{
//  609 					count_re = 0;
//  610 					Touch_Coil_On = false;
//  611 				}*/
//  612 					
//  613 			}
??main_0:
        CALLF     Clock
        CALLF     UniqueID_Check
        LD        A, L:Flag_Eeprom_Ero
        TNZ       A
        JREQ      ??lb_1
        JP        L:??main_1
??lb_1:
        MOV       L:Flag_LED2_ENABLE, #0x0
        CALLF     ADSample
        CALLF     MacProtect
        LDW       X, #flag_p
        LD        A, (X)
        CP        A, #0x6
        JRNC      L:??main_9
        MOV       L:0x50e0, #0xaa
??main_9:
        LD        A, #0x1
        CP        A, L:Flag_Mac_On2s
        JREQ      ??lb_2
        JP        L:??main_2
??lb_2:
        LD        A, #0x5
        CP        A, L:MacStatus
        JREQ      ??lb_3
        JP        L:??main_10
??lb_3:
        LDW       X, #status
        LD        A, (X)
        TNZ       A
        JREQ      L:??main_11
        SUB       A, #0x2
        JREQ      L:??main_12
        DEC       A
        JRNE      ??lb_4
        JP        L:??main_13
??lb_4:
        JP        L:??main_14
??main_11:
        LD        A, #0x1
        CP        A, L:flag_statu + 3
        JREQ      ??lb_5
        JP        L:??main_14
??lb_5:
        MOV       L:status, #0x2
        LD        A, #0x1
        CP        A, L:flag_statu
        JRNE      L:??main_15
        LD        A, #0x1
        CP        A, L:FLAG_PWM_START
        JRNE      L:??main_15
        CALLF     Time1_PWM_Close_Mode_Fast
        MOV       L:flag_statu, #0x0
        MOV       L:FLAG_PWM_START, #0x0
        LD        A, #0x2
        CP        A, L:flag_p
        JRNE      L:??main_15
        MOV       L:flag_p, #0x4
??main_15:
        MOV       L:flag_inwstatu, #0x1
        JP        L:??main_14
??main_12:
        LD        A, #0x1
        CP        A, L:flag_inwstatu
        JREQ      ??lb_6
        JP        L:??main_16
??lb_6:
        LD        A, #0x1
        CP        A, L:flag_statu + 1
        JREQ      ??lb_7
        JP        L:??main_14
??lb_7:
        LD        A, L:Flag_ADDRESS_P0
        TNZ       A
        JRNE      L:??main_17
        CALLF     TX_P0_SET
        MOV       L:Flag_ADDRESS_P0, #0x1
        MOV       L:flag_p, #0x1
??main_17:
        LD        A, #0x1
        CP        A, L:flag_statu + 4
        JRNE      L:??main_18
        LD        A, L:FLAG_PWM_START
        TNZ       A
        JRNE      L:??main_18
        CLR       A
        CALLF     Adjust_Time1_cycle2
        MOV       L:FLAG_PWM_START, #0x1
        MOV       L:flag_statu + 4, #0x0
??main_18:
        MOV       L:Child_Count_Num, #0x1
        MOV       L:Child_Comm, #0xaa
        MOV       L:Child_Num, L:Child_Count_Num
        CLRW      X
        JRA       L:??main_19
??main_20:
        LD        A, (L:Address_Pair,X)
        LD        (L:Address,X), A
        ADDW      X, #0x1
??main_19:
        CPW       X, #0x5
        JRSLT     L:??main_20
        CALLF     SendDataUpdate
        LDW       X, #TD_Array
        CALLF     NRF24L01_TxPacket
        CP        A, #0x40
        JREQ      ??lb_8
        JP        L:??main_21
??lb_8:
        LDW       X, #0x20
        LDW       S:?w0, X
        LDW       Y, #RD_Array
        LDW       X, #??RS_Array_Pair
        CALLF     memcpy
        CLRW      X
        JRA       L:??main_22
??main_23:
        LDW       Y, X
        ADDW      Y, #??RS_Array_Pair + 6
        LD        A, (Y)
        LD        (L:Address_Pair_Child,X), A
        LDW       Y, X
        ADDW      Y, #??RS_Array_Pair + 11
        LD        A, (Y)
        LD        (L:Address_Pair_Parent,X), A
        ADDW      X, #0x1
??main_22:
        CPW       X, #0x5
        JRSLT     L:??main_23
        LDW       X, #0x5
        LDW       S:?w0, X
        LDW       Y, #Address_Pair
        LDW       X, #Address_Pair_Parent
        CALLF     strncmp
        TNZW      X
        JREQ      ??lb_9
        JP        L:??main_21
??lb_9:
        CLRW      Y
        JRA       L:??main_24
??main_25:
        LDW       X, Y
        LD        A, (L:Address_Pair_Child,X)
        CLRW      X
        LD        XL, A
        ADDW      X, L:??count_add_c
        LDW       L:??count_add_c, X
        ADDW      Y, #0x1
??main_24:
        CPW       Y, #0x5
        JRSLT     L:??main_25
        LDW       X, L:??count_add_c
        TNZW      X
        JRNE      ??lb_10
        JP        L:??main_21
??lb_10:
        CALLF     Variable_Init_Second
        CLR       S:?b3
        CLR       S:?b2
        JRA       L:??main_26
??main_27:
        LD        A, L:Flag_RECV_ADDRESS_NUM_SAME
        CLRW      Y
        LD        YL, A
        LDW       X, #0x6
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        ADDW      X, #AUTO_Array
        ADDW      X, S:?w1
        LDW       Y, X
        LDW       X, S:?w1
        LD        A, (L:Address_Pair_Child,X)
        LD        (Y), A
        LDW       X, S:?w1
        ADDW      X, #0x1
        LDW       S:?w1, X
??main_26:
        LDW       X, S:?w1
        CPW       X, #0x5
        JRSLT     L:??main_27
        CLR       S:?b3
        CLR       S:?b2
        JRA       L:??main_28
??main_29:
        LD        A, L:Flag_RECV_ADDRESS_NUM_SAME
        CLRW      Y
        LD        YL, A
        LDW       X, #0x6
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        ADDW      X, #AUTO_Array
        ADDW      X, S:?w1
        LD        A, (X)
        LDW       X, S:?w1
        LD        (L:Address_Sure,X), A
        LDW       X, S:?w1
        ADDW      X, #0x1
        LDW       S:?w1, X
??main_28:
        LDW       X, S:?w1
        CPW       X, #0x5
        JRSLT     L:??main_29
        CALLF     SendDataUpdate
        LDW       X, #TD_Array
        CALLF     NRF24L01_TxPacket
        LD        A, #0x1
        ADD       A, L:Flag_RECV_ADDRESS_NUM_SAME
        LD        L:Flag_RECV_ADDRESS_NUM_SAME, A
        MOV       L:Flag_RECV_ADDRESS_NUM, L:Flag_RECV_ADDRESS_NUM_SAME
        MOV       L:Child_Count_Num, L:Flag_RECV_ADDRESS_NUM_SAME
        CLRW      X
        LDW       L:??count_add_c, X
??main_21:
        LD        A, L:Flag_RECV_ADDRESS_NUM_SAME
        TNZ       A
        JREQ      L:??main_30
        MOV       L:status, #0x3
        JRA       L:??main_31
??main_30:
        MOV       L:status, #0x0
        MOV       L:flag_statu + 1, #0x0
??main_31:
        MOV       L:flag_inwstatu, #0x0
        JP        L:??main_14
??main_16:
        LD        A, #0x1
        CP        A, L:flag_inwstatu + 1
        JREQ      ??lb_11
        JP        L:??main_14
??lb_11:
        LD        A, #0x1
        CP        A, L:flag_statu + 1
        JREQ      ??lb_12
        JP        L:??main_14
??lb_12:
        LDW       X, #Flag_RECV_ADDRESS_NUM_SAME
        LD        A, (X)
        CP        A, #0x5
        JRC       ??lb_13
        JP        L:??main_32
??lb_13:
        CALLF     TX_P0_SET
        LDW       X, #0x64
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALLF     _delay_us
        MOV       L:Flag_ADDRESS_P0, #0x1
        CLRW      X
        JRA       L:??main_33
??main_34:
        ADDW      X, #0x1
??main_33:
        CPW       X, #0x5
        JRSGE     L:??main_35
        LD        A, #0x0
        CP        A, (L:Flg_Chenal_OK,X)
        JRNE      L:??main_34
        LD        A, XL
        LD        L:Child_Count_Num, A
??main_35:
        LD        A, #0x1
        ADD       A, L:Child_Count_Num
        LD        L:Child_Count_Num, A
        MOV       L:Child_Comm, #0xaa
        MOV       L:Child_Num, L:Child_Count_Num
        CLRW      X
        JRA       L:??main_36
??main_37:
        LD        A, (L:Address_Pair,X)
        LD        (L:Address,X), A
        ADDW      X, #0x1
??main_36:
        CPW       X, #0x5
        JRSLT     L:??main_37
        CALLF     SendDataUpdate
        LDW       X, #TD_Array
        CALLF     NRF24L01_TxPacket
        CP        A, #0x40
        JREQ      ??lb_14
        JP        L:??main_38
??lb_14:
        LDW       X, #0x20
        LDW       S:?w0, X
        LDW       Y, #RD_Array
        LDW       X, #??RS_Array_Pair
        CALLF     memcpy
        CLRW      X
        JRA       L:??main_39
??main_40:
        LDW       Y, X
        ADDW      Y, #??RS_Array_Pair + 6
        LD        A, (Y)
        LD        (L:Address_Pair_Child,X), A
        LDW       Y, X
        ADDW      Y, #??RS_Array_Pair + 11
        LD        A, (Y)
        LD        (L:Address_Pair_Parent,X), A
        ADDW      X, #0x1
??main_39:
        CPW       X, #0x5
        JRSLT     L:??main_40
        LDW       X, #0x5
        LDW       S:?w0, X
        LDW       Y, #Address_Pair
        LDW       X, #Address_Pair_Parent
        CALLF     strncmp
        TNZW      X
        JREQ      ??lb_15
        JP        L:??main_41
??lb_15:
        LD        A, #0xdd
        CP        A, L:Child_Comm_Back
        JREQ      ??lb_16
        JP        L:??main_41
??lb_16:
        CLRW      Y
        JRA       L:??main_42
??main_43:
        LDW       X, Y
        LD        A, (L:Address_Pair_Child,X)
        CLRW      X
        LD        XL, A
        ADDW      X, L:??count_add_c
        LDW       L:??count_add_c, X
        ADDW      Y, #0x1
??main_42:
        CPW       Y, #0x5
        JRSLT     L:??main_43
        LDW       X, L:??count_add_c
        TNZW      X
        JRNE      ??lb_17
        JP        L:??main_44
??lb_17:
        CLR       S:?b9
        CLR       S:?b8
        JRA       L:??main_45
??main_46:
        LDW       X, S:?w4
        ADDW      X, #0x1
        LDW       S:?w4, X
??main_45:
        LDW       X, S:?w4
        CPW       X, #0xa
        JRSGE     L:??main_47
        LDW       X, #0x5
        LDW       S:?w0, X
        LDW       Y, #Address_Pair_Child
        CALLF     L:?mov_w1_w0
        LDW       X, #0x6
        LDW       S:?w0, X
        LDW       X, S:?w4
        CALLF     L:?mul16_x_x_w0
        ADDW      X, #AUTO_Array
        CALLF     L:?mov_w0_w1
        CALLF     strncmp
        TNZW      X
        JRNE      L:??main_46
        MOV       L:Flag_SAME_ADDR, #0x1
        LD        A, S:?b9
        LD        L:FLAG_Re_WHOHAVE, A
??main_47:
        LD        A, #0x1
        CP        A, L:Flag_SAME_ADDR
        JRNE      L:??main_48
        MOV       L:Flag_SAME_ADDR, #0x0
        CLRW      X
        JRA       L:??main_49
??main_50:
        CLR       A
        LD        (L:Address_Sure,X), A
        ADDW      X, #0x1
??main_49:
        CPW       X, #0x5
        JRSLT     L:??main_50
        LD        A, #0x1
        ADD       A, L:CNT_Re_WHOHAVE
        LD        L:CNT_Re_WHOHAVE, A
        LDW       X, #CNT_Re_WHOHAVE
        LD        A, (X)
        CP        A, #0x64
        JRNC      ??lb_18
        JP        L:??main_51
??lb_18:
        CLR       S:?b3
        CLR       S:?b2
        JRA       L:??main_52
??main_53:
        LD        A, L:FLAG_Re_WHOHAVE
        CLRW      Y
        LD        YL, A
        LDW       X, #0x6
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        ADDW      X, #AUTO_Array
        ADDW      X, S:?w1
        CLR       A
        LD        (X), A
        LDW       X, S:?w1
        ADDW      X, #0x1
        LDW       S:?w1, X
??main_52:
        LDW       X, S:?w1
        CPW       X, #0x5
        JRSLT     L:??main_53
        MOV       L:CNT_Re_WHOHAVE, #0x0
        JP        L:??main_51
??main_48:
        CLRW      X
        JRA       L:??main_54
??main_55:
        ADDW      X, #0x1
??main_54:
        CPW       X, #0x5
        JRSGE     L:??main_56
        LD        A, #0x0
        CP        A, (L:Flg_Chenal_OK,X)
        JRNE      L:??main_55
        LD        A, XL
        LD        L:Check_Num, A
        LD        A, #0x1
        LD        (L:Flg_Chenal_OK,X), A
        CLR       A
        LD        (L:Flg_Chenal_Fail,X), A
??main_56:
        LD        A, L:Check_Num
        CLRW      X
        LD        XL, A
        LD        A, #0x0
        CP        A, (L:flg_stop_send_in,X)
        JREQ      L:??main_57
        CLR       S:?b3
        CLR       S:?b2
        JRA       L:??main_58
??main_59:
        LD        A, L:Check_Num
        CLRW      Y
        LD        YL, A
        LDW       X, #0x6
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        ADDW      X, #AUTO_Array
        ADDW      X, S:?w1
        LDW       Y, X
        LDW       X, S:?w1
        LD        A, (L:Address_Pair_Child,X)
        LD        (Y), A
        LDW       X, S:?w1
        ADDW      X, #0x1
        LDW       S:?w1, X
??main_58:
        LDW       X, S:?w1
        CPW       X, #0x5
        JRSLT     L:??main_59
        LD        A, L:Check_Num
        CLRW      X
        LD        XL, A
        CLR       A
        LD        (L:flg_stop_send_in,X), A
        JRA       L:??main_60
??main_57:
        CLR       S:?b3
        CLR       S:?b2
        JRA       L:??main_61
??main_62:
        LD        A, L:Flag_RECV_ADDRESS_NUM_SAME
        CLRW      Y
        LD        YL, A
        LDW       X, #0x6
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        ADDW      X, #AUTO_Array
        ADDW      X, S:?w1
        LDW       Y, X
        LDW       X, S:?w1
        LD        A, (L:Address_Pair_Child,X)
        LD        (Y), A
        LDW       X, S:?w1
        ADDW      X, #0x1
        LDW       S:?w1, X
??main_61:
        LDW       X, S:?w1
        CPW       X, #0x5
        JRSLT     L:??main_62
??main_60:
        CLR       S:?b3
        CLR       S:?b2
        JRA       L:??main_63
??main_64:
        LD        A, L:Check_Num
        CLRW      Y
        LD        YL, A
        LDW       X, #0x6
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        ADDW      X, #AUTO_Array
        ADDW      X, S:?w1
        LD        A, (X)
        LDW       X, S:?w1
        LD        (L:Address_Sure,X), A
        LDW       X, S:?w1
        ADDW      X, #0x1
        LDW       S:?w1, X
??main_63:
        LDW       X, S:?w1
        CPW       X, #0x5
        JRSLT     L:??main_64
        MOV       L:Check_Num, #0x0
        CALLF     SendDataUpdate
        LDW       X, #TD_Array
        CALLF     NRF24L01_TxPacket
        LD        A, #0x1
        ADD       A, L:Flag_RECV_ADDRESS_NUM_SAME
        LD        L:Flag_RECV_ADDRESS_NUM_SAME, A
        MOV       L:Flag_RECV_ADDRESS_NUM, L:Flag_RECV_ADDRESS_NUM_SAME
??main_51:
        MOV       L:Child_Count_Num, L:Flag_RECV_ADDRESS_NUM_SAME
        CLRW      X
        LDW       L:??count_add_c, X
        JRA       L:??main_65
??main_44:
        LD        A, #0xff
        ADD       A, L:Child_Count_Num
        LD        L:Child_Count_Num, A
        JRA       L:??main_65
??main_41:
        LD        A, #0xff
        ADD       A, L:Child_Count_Num
        LD        L:Child_Count_Num, A
        JRA       L:??main_65
??main_38:
        LD        A, #0xff
        ADD       A, L:Child_Count_Num
        LD        L:Child_Count_Num, A
??main_65:
        LD        A, L:Flag_RECV_ADDRESS_NUM_SAME
        TNZ       A
        JREQ      L:??main_66
        MOV       L:status, #0x3
        MOV       L:flag_statu + 1, #0x0
        JRA       L:??main_67
??main_66:
        MOV       L:status, #0x0
        MOV       L:flag_statu, #0x1
        MOV       L:flag_statu + 2, #0x0
        JRA       L:??main_67
??main_32:
        MOV       L:status, #0x3
        MOV       L:flag_statu + 1, #0x0
??main_67:
        MOV       L:flag_inwstatu + 1, #0x0
        CLRW      X
        INCW      X
        LDW       L:??count_over, X
        CLRW      X
        INCW      X
        LDW       L:??count_over_f, X
        MOV       L:??Num4Check_CountChecked, #0x0
        JP        L:??main_14
??main_13:
        LD        A, #0x1
        CP        A, L:flag_statu + 2
        JREQ      ??lb_19
        JP        L:??main_14
??lb_19:
        LD        A, #0x1
        CP        A, L:flag_recheck_over
        JRNE      L:??main_68
        LDW       X, L:??count_over_f
        LD        A, XL
        LD        L:Child_Num, A
        JRA       L:??main_69
??main_68:
        LDW       X, L:??count_over
        LDW       Y, #0x5
        DIVW      X, Y
        LD        A, YL
        LD        L:Child_Num, A
??main_69:
        LD        A, L:Child_Num
        CLRW      X
        LD        XL, A
        ADDW      X, #Flg_Chenal_Fail - 1
        TNZ       (X)
        JREQ      L:??main_70
        CLR       S:?b3
        CLR       S:?b2
        JRA       L:??main_71
??main_72:
        LDW       X, S:?w1
        ADDW      X, #AUTO_Array - 6
        LDW       Y, X
        LD        A, L:Child_Num
        CLR       S:?b4
        LD        S:?b5, A
        LDW       X, #0x6
        LDW       S:?w0, X
        LDW       X, S:?w2
        CALLF     L:?mul16_x_x_w0
        LDW       S:?w0, X
        LDW       X, Y
        ADDW      X, S:?w0
        CLR       A
        LD        (X), A
        LDW       X, S:?w1
        ADDW      X, #0x1
        LDW       S:?w1, X
??main_71:
        LDW       X, S:?w1
        CPW       X, #0x5
        JRSLT     L:??main_72
        LDW       X, L:??count_over
        INCW      X
        LDW       L:??count_over, X
        LD        A, #0x1
        CP        A, L:flag_recheck_over
        JRNE      L:??main_73
        MOV       L:flag_recheck_over, #0x0
??main_73:
        LDW       X, L:??count_over
        CPW       X, #0x5
        JRNC      ??lb_20
        JP        L:??main_14
??lb_20:
        CLRW      X
        LDW       L:??count_over, X
        JP        L:??main_14
??main_70:
        LD        A, #0x1
        ADD       A, L:??Num4Check_CountChecked
        LD        L:??Num4Check_CountChecked, A
        MOV       L:Flag_ADDRESS_P0, #0x0
        LD        A, L:Child_Num
        CALLF     TX_P_SET
        LDW       X, #0x64
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALLF     _delay_us
        MOV       L:Child_Comm, #0xbb
        CLRW      Y
        JRA       L:??main_74
??main_75:
        LDW       X, Y
        ADDW      X, #AUTO_Array - 6
        LDW       S:?w1, X
        LD        A, L:Child_Num
        CLR       S:?b4
        LD        S:?b5, A
        LDW       X, #0x6
        LDW       S:?w0, X
        LDW       X, S:?w2
        CALLF     L:?mul16_x_x_w0
        LDW       S:?w0, X
        LDW       X, S:?w1
        ADDW      X, S:?w0
        LD        A, (X)
        LD        (L:Address,Y), A
        ADDW      Y, #0x1
??main_74:
        CPW       Y, #0x5
        JRSLT     L:??main_75
        LDW       X, #??Frm_count_Temp
        LD        A, (X)
        CP        A, #0xf5
        JRC       L:??main_76
        MOV       L:??Frm_count_Temp, #0x0
??main_76:
        LD        A, L:Child_Num
        CLRW      Y
        LD        YL, A
        LD        A, L:??Frm_count_Temp
        MOV       S:?b0, #0xff
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        DIV       X, A
        LDW       X, Y
        ADDW      X, #Frm_count - 1
        LD        (X), A
        LD        A, #0x1
        ADD       A, L:??Frm_count_Temp
        LD        L:??Frm_count_Temp, A
        LD        A, L:Child_Num
        CLRW      X
        LD        XL, A
        ADDW      X, #Frm_count - 1
        LD        A, (X)
        LD        L:Frm_num, A
        CALLF     SendDataUpdate
        LDW       X, #TD_Array
        CALLF     NRF24L01_TxPacket
        CP        A, #0x40
        JRNE      L:??main_77
        LDW       X, #0x5
        LDW       S:?w0, X
        LDW       Y, #Address
        LDW       X, #Address4Check
        CALLF     strncmp
        TNZW      X
        JRNE      L:??main_77
        LD        A, L:Child_Num
        CLRW      X
        LD        XL, A
        LD        A, #0x1
        ADDW      X, #flag_check_succ - 1
        LD        (X), A
        SUBW      X, #flag_check_succ - 1
        MOV       L:flag_recheck_over, #0x0
        MOV       L:count_false_check, #0x0
        MOV       L:Flag_False_Check_Pass, #0x0
        LD        A, L:Child_Num
        CLRW      X
        LD        XL, A
        SLLW      X
        CLRW      Y
        ADDW      X, #CNT_Rec_Check_Fail - 2
        LDW       (X), Y
        SUBW      X, #CNT_Rec_Check_Fail - 2
        LD        A, L:Child_Num
        CLRW      X
        LD        XL, A
        LD        A, #0x1
        ADDW      X, #Falg_ForeignBody_Check - 1
        LD        (X), A
        SUBW      X, #Falg_ForeignBody_Check - 1
        JRA       L:??main_78
??main_77:
        LD        A, L:Child_Num
        CLRW      X
        LD        XL, A
        CLR       A
        ADDW      X, #Falg_ForeignBody_Check - 1
        LD        (X), A
        SUBW      X, #Falg_ForeignBody_Check - 1
        LD        A, L:Child_Num
        CLRW      X
        LD        XL, A
        SLLW      X
        ADDW      X, #CNT_Rec_Check_Fail - 2
        LDW       X, (X)
        INCW      X
        LD        A, L:Child_Num
        CLRW      Y
        LD        YL, A
        SLLW      Y
        ADDW      Y, #CNT_Rec_Check_Fail - 2
        LDW       (Y), X
        SUBW      Y, #CNT_Rec_Check_Fail - 2
        LD        A, #0x1
        CP        A, L:Flag_False_Check_Pass
        JRNE      L:??main_79
        LD        A, L:Child_Num
        CLRW      X
        LD        XL, A
        LD        A, #0x1
        ADDW      X, #flag_check_succ - 1
        LD        (X), A
        SUBW      X, #flag_check_succ - 1
        MOV       L:count_false_check, #0x0
        MOV       L:Flag_False_Check_Pass, #0x0
        JRA       L:??main_78
??main_79:
        LD        A, L:Child_Num
        CLRW      X
        LD        XL, A
        CLR       A
        ADDW      X, #flag_check_succ - 1
        LD        (X), A
        SUBW      X, #flag_check_succ - 1
??main_78:
        LDW       X, #Child_Num
        LD        A, (X)
        CP        A, #0x3
        JRC       L:??main_80
        LD        A, L:Child_Num
        CLRW      X
        LD        XL, A
        ADDW      X, #0xffffffffffffffff
        PUSHW     X
        LDW       X, #?_1
        CALLF     printf
        ADD       SP, #0x2
??main_80:
        LDW       X, #??Num4Check_CountChecked
        LD        A, (X)
        CP        A, L:Flag_RECV_ADDRESS_NUM_SAME
        JRNC      ??lb_21
        JP        L:??main_81
??lb_21:
        CLRW      X
        JRA       L:??main_82
??main_83:
        LD        A, #0x0
        CP        A, (L:Flg_Chenal_Fail,X)
        JRNE      L:??main_84
        LD        A, #0x1
        CP        A, (L:flag_check_succ,X)
        JRNE      L:??main_84
        LD        A, #0x1
        ADD       A, L:??count_succ_check
        LD        L:??count_succ_check, A
??main_84:
        ADDW      X, #0x1
??main_82:
        CPW       X, #0x5
        JRSLT     L:??main_83
        LDW       X, #Flag_RECV_ADDRESS_NUM_SAME
        LD        A, (X)
        CP        A, L:??count_succ_check
        JRNE      L:??main_85
        LD        A, L:flag_inwstatu + 1
        TNZ       A
        JRNE      L:??main_86
        CLRW      X
        JRA       L:??main_87
??main_88:
        CLR       A
        LD        (L:Address_Sure,X), A
        ADDW      X, #0x1
??main_87:
        CPW       X, #0x5
        JRSLT     L:??main_88
        MOV       L:flag_inwstatu + 1, #0x1
??main_86:
        MOV       L:status, #0x2
        CLRW      X
        INCW      X
        LDW       L:??count_over_f, X
        MOV       L:flag_recheck_over, #0x0
        MOV       L:count_false_check, #0x0
        CLRW      X
        INCW      X
        LDW       L:??count_over, X
        MOV       L:??Num4Check_CountChecked, #0x0
        JRA       L:??main_89
??main_85:
        CLRW      X
        INCW      X
        JRA       L:??main_90
??main_91:
        ADDW      X, #0x1
??main_90:
        CPW       X, #0x6
        JRSGE     L:??main_89
        LDW       Y, X
        ADDW      Y, #Flg_Chenal_Fail - 1
        TNZ       (Y)
        JRNE      L:??main_91
        LDW       Y, X
        ADDW      Y, #flag_check_succ - 1
        TNZ       (Y)
        JRNE      L:??main_91
        MOV       L:flag_recheck_over, #0x1
        LDW       L:??count_over_f, X
        LD        A, #0x1
        ADD       A, L:count_false_check
        LD        L:count_false_check, A
??main_89:
        MOV       L:??count_succ_check, #0x0
        JRA       L:??main_92
??main_81:
        LDW       X, L:??count_over
        INCW      X
        LDW       L:??count_over, X
??main_92:
        LDW       X, #count_false_check
        LD        A, (X)
        CP        A, #0x3
        JRC       L:??main_93
        MOV       L:Flag_False_Check_Pass, #0x1
??main_93:
        LDW       X, #??num_lessfull
        LD        A, L:Child_Num
        CALLF     FunDealChildLostWork
        LD        A, L:Flag_RECV_ADDRESS_NUM_SAME
        TNZ       A
        JRNE      L:??main_94
        MOV       L:status, #0x2
        MOV       L:flag_inwstatu + 1, #0x1
        MOV       L:Flag_RECV_ADDRESS_NUM, #0x0
        MOV       L:NUM_PWM_UPload, #0x0
??main_94:
        MOV       L:flag_statu + 2, #0x0
        LD        A, L:CNT_FULL_Num
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, L:Flag_RECV_ADDRESS_NUM
        CLRW      X
        LD        XL, A
        SUBW      X, S:?w0
        CPW       X, #0x1
        JRSLT     L:??main_95
        LD        A, L:Flag_Fan_Open
        TNZ       A
        JRNE      L:??main_95
        CALLF     Fan_Open
        JRA       L:??main_14
??main_95:
        LD        A, L:CNT_FULL_Num
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, L:Flag_RECV_ADDRESS_NUM
        CLRW      X
        LD        XL, A
        SUBW      X, S:?w0
        CPW       X, #0x1
        JRSGE     L:??main_14
        LD        A, #0x1
        CP        A, L:Flag_Fan_Open
        JRNE      L:??main_14
        CALLF     Fan_Close
??main_14:
        LDW       Y, #??msgMain
        LDW       X, #queSEND
        CALLF     deQueue
        CPW       X, #0x1
        JREQ      ??lb_22
        JP        L:??main_2
??lb_22:
        LD        A, L:??msgMain + 3
        CLR       S:?b0
        LD        S:?b1, A
        LDW       Y, L:??msgMain + 1
        LDW       X, #??RS_Array_Check
        CALLF     memcpy
        LD        A, L:??msgMain + 3
        CLRW      Y
        LD        YL, A
        LDW       X, #??RS_Array_Check
        CALLF     parseByteStream2FrameStreamsp1
        CLRW      X
        JRA       L:??main_96
??main_97:
        LD        A, #0x1
        CP        A, (L:Falg_Bettery_Lessfull,X)
        JRNE      L:??main_98
        LD        A, #0x1
        ADD       A, L:??num_lessfull
        LD        L:??num_lessfull, A
??main_98:
        LD        A, #0x1
        CP        A, (L:Falg_ForeignBody_Check,X)
        JRNE      L:??main_99
        LD        A, #0x1
        ADD       A, L:Cnt_ForeignBody_Available
        LD        L:Cnt_ForeignBody_Available, A
??main_99:
        ADDW      X, #0x1
??main_96:
        CPW       X, #0x5
        JRSLT     L:??main_97
        LD        A, L:ZoneChargWiLess + 4
        CLRW      X
        LD        XL, A
        ADDW      X, #Falg_ForeignBody_Check - 1
        LD        A, (X)
        CP        A, #0x1
        JRNE      L:??main_100
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       Y, #ZoneChargWiLess + 17
        LDW       X, #_A_TempUsed
        CALLF     strncpy
        LD        A, L:ZoneChargWiLess + 4
        CLRW      Y
        LD        YL, A
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        ADDW      X, #Float_ForeignBody_Value - 4
        LDW       Y, X
        LDW       X, #_A_TempUsed
        CALLF     L:?load32_l0_0x
        LDW       X, Y
        CALLF     L:?load32_0x_l0
??main_100:
        LD        A, L:ZoneChargWiLess + 5
        TNZ       A
        JRNE      L:??main_101
        LDW       X, #??num_lessfull
        LD        A, L:ZoneChargWiLess + 4
        CALLF     FunDealChildLost
        JRA       L:??main_102
??main_101:
        LDW       X, #??num_lessfull
        LDW       Y, L:ZoneChargWiLess + 23
        EXG       A, YL
        LD        S:?b0, A
        EXG       A, YL
        LD        A, L:ZoneChargWiLess + 4
        CALLF     FunDealChildPwm
??main_102:
        MOV       L:??num_lessfull, #0x0
        LD        A, L:CNT_FULL_Num
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, L:Flag_RECV_ADDRESS_NUM
        CLRW      X
        LD        XL, A
        SUBW      X, S:?w0
        CPW       X, #0x1
        JRSLT     L:??main_103
        LD        A, L:Flag_Fan_Open
        TNZ       A
        JRNE      L:??main_103
        CALLF     Fan_Open
        JP        L:??main_2
??main_103:
        LD        A, L:CNT_FULL_Num
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, L:Flag_RECV_ADDRESS_NUM
        CLRW      X
        LD        XL, A
        SUBW      X, S:?w0
        CPW       X, #0x1
        JRSLT     ??lb_23
        JP        L:??main_2
??lb_23:
        LD        A, #0x1
        CP        A, L:Flag_Fan_Open
        JREQ      ??lb_24
        JP        L:??main_2
??lb_24:
        CALLF     Fan_Close
        JP        L:??main_2
??main_10:
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      ??lb_25
        JP        L:??main_2
??lb_25:
        CLR       S:?b9
        CLR       S:?b8
        JRA       L:??main_104
??main_105:
        LD        A, #0x0
        LDW       X, S:?w4
        CP        A, (L:ProtectFlag,X)
        JREQ      L:??main_106
        LD        A, S:?b9
        CALLF     DEAL_ABNORMAL_FUN
??main_106:
        LDW       X, S:?w4
        ADDW      X, #0x1
        LDW       S:?w4, X
??main_104:
        LDW       X, S:?w4
        CPW       X, #0x10
        JRSLT     L:??main_105
        MOV       L:flag_p, #0x5
        JP        L:??main_2
        REQUIRE IWDG_KR
//  614 #endif			
//  615 	
//  616 	
//  617 	}	
//  618 }

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
??count_over:
        DC16 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??count_over_f:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??num_lessfull:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??count_add_c:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??count_succ_check:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??RS_Array_Pair:
        DS8 32

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??RS_Array_Check:
        DS8 32

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??msgMain:
        DS8 8

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??Frm_count_Temp:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??Num4Check_CountChecked:
        DS8 1

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_0:
        DC8 "CLS(8);\012\015"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_1:
        DC8 "TX_P_SET(%d);\012"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_2:
        DC8 "DS16(0,0,'\263\344\265\347\327\264\314\254:%d \271\322\324\330\326\325\266\313\312\375\243\272%d   ',12);\012\015"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_3:
        DC8 "DS16(0,17,'\265\261\307\260\262\351\321\257\326\325\266\313\272\305:%d   ',12);\012\015"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_4:
        DC8 "DS16(0,34,'%d mV  %d  %d   ',12);\012\015"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_5:
        DC8 "DS16(0,51,'pwmClass:%d full:%d Upload:%d',12);\012\015"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_6:
        DC8 44H, 53H, 31H, 36H, 28H, 30H, 2CH, 36H
        DC8 38H, 2CH, 27H, 0C1H, 0F7H, 0B3H, 0CCH, 0BFH
        DC8 0D8H, 0D6H, 0C6H, 0C1H, 0BFH, 3AH, 25H, 64H
        DC8 20H, 20H, 0C6H, 0B5H, 0B5H, 0C0H, 0B1H, 0EAH
        DC8 0CAH, 0B6H, 3AH, 20H, 25H, 64H, 20H, 20H
        DC8 20H, 20H, 20H, 27H, 2CH, 31H, 32H, 29H
        DC8 3BH, 0AH, 0DH, 0

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_7:
        DC8 "DS16(0,136,'\264\355\316\363\320\305\317\242\243\272%s',12);\012\015"

        END
//  619 
//  620 #ifdef USE_FULL_ASSERT
//  621 
//  622 /**
//  623   * @brief  Reports the name of the source file and the source line number
//  624   *   where the assert_param error has occurred.
//  625   * @param file: pointer to the source file name
//  626   * @param line: assert_param error line source number
//  627   * @retval : None
//  628   */
//  629 void assert_failed(u8* file, u32 line)
//  630 { 
//  631   /* User can add his own implementation to report the file name and line number,
//  632      ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
//  633 
//  634   /* Infinite loop */
//  635   while (1)
//  636   {
//  637   }
//  638 }
//  639 #endif
//  640 /*******************************************************************************
//  641 -----------------------------    End of file    --------------------------------
//  642 *******************************************************************************/
// 
// 2 692 bytes in section .far_func.text
// 1 076 bytes in section .near.bss
//     2 bytes in section .near.data
//     1 byte  in section .near.noinit   (abs)
//   283 bytes in section .near.rodata
// 
// 2 692 bytes of CODE  memory
//   283 bytes of CONST memory
// 1 078 bytes of DATA  memory (+ 1 byte shared)
//
//Errors: none
//Warnings: none
