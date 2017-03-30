///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.20.1.176 for STM8                29/Mar/2017  16:23:49
// Copyright 2010-2015 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\PWM_Control.c
//    Command line =  
//        "E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\PWM_Control.c"
//        -e -Ol --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_cross_call --debug --code_model medium --data_model medium -o
//        "E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\Obj"
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.3\stm8\LIB\dlstm8mmn.h" -lB
//        "E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List"
//        -I
//        "E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\..\USER\"
//        -I "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.3\stm8\inc\" --vregs 16
//    List file    =  
//        E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List\PWM_Control.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_w4
        EXTERN ?fadd32_l0_l0_l1
        EXTERN ?fcastf32s16_l0_x
        EXTERN ?fcastf32u16_l0_x
        EXTERN ?fcastf32u32_l0_l0
        EXTERN ?fcasts16f32_x_l0
        EXTERN ?fcasts32f32_l0_l0
        EXTERN ?fdiv32_l0_l0_l1
        EXTERN ?fmul32_l0_l0_0x
        EXTERN ?fmul32_l0_l0_dc32
        EXTERN ?load32_0x_l0
        EXTERN ?load32_l0_0x
        EXTERN ?mov_l1_l0
        EXTERN ?mov_l1_l3
        EXTERN ?mov_l3_l0
        EXTERN ?mov_w0_w1
        EXTERN ?mov_w1_w5
        EXTERN ?mov_w3_w5
        EXTERN ?move1616_v_x_y_a
        EXTERN ?mul16_x_x_w0
        EXTERN ?pop_l1
        EXTERN ?pop_l3
        EXTERN ?pop_w5
        EXTERN ?push_l0
        EXTERN ?push_l3
        EXTERN ?push_w4
        EXTERN ?push_w5
        EXTERN ?sdiv16_x_x_y
        EXTERN ?smod16_y_x_y
        EXTERN ?ucmp32_c_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w5
        EXTERN CNT_FULL_Num
        EXTERN CNT_PHeat
        EXTERN CNT_Prot
        EXTERN Falg_Bettery_Lessfull
        EXTERN Flag_FRIST_IN
        EXTERN Flag_NEW_DEV
        EXTERN Flag_PHCEn
        EXTERN Flag_RECV_ADDRESS_NUM
        EXTERN MacStatus
        EXTERN NUM_PWM_UPload
        EXTERN NUM_PWM_UPload_LessFull
        EXTERN Pwm_Product_numValue
        EXTERN Step_Work
        EXTERN Stor_Frequen_eeprom
        EXTERN Stor_Frequent
        EXTERN Stor_Ratio
        EXTERN Stor_Ratio_eeprom
        EXTERN TIM1_ARR
        EXTERN TIM1_CCR1
        EXTERN Time1_Work_cycle
        EXTERN _A_Flag_100us
        EXTERN _A_Flag_10ms_1
        EXTERN _A_Flag_NRF24L01
        EXTERN num1h
        EXTERN num1l
        EXTERN printf
        EXTERN strncmp

        PUBLIC Adjust_Time1_RF_4UART
        PUBLIC Adjust_Time1_cycle
        PUBLIC Adjust_Time1_cycle2
        PUBLIC Fast_Adjust_Time1_cycle
        PUBLIC Fast_Adjust_Time1_cycle2
        PUBLIC Fast_Adjust_Time1_cycle_4uart
        PUBLIC FunDealChildPwm
        PUBLIC PauseHeat
        PUBLIC Sum_Adjust_Time1_cycle
        PUBLIC Sum_Adjust_Time1_cycle_lessfull
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
        PUBLIC Time1_PWM_Close_Mode_Fast
        PUBLIC Time1_PWM_Close_Mode_Slow

// E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\PWM_Control.c
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
//   14  *******************************************************************************/
//   15 
//   16 
//   17 /*******************************************************************************
//   18 -----------------------------    Include files   -------------------------------
//   19  *******************************************************************************/
//   20 #include "type_def.h"

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
//   21 #include "PWM_Control.h"
//   22 #include "string.h"
//   23 #include "stdio.h"

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   24 static unsigned char Falg_F_R_Changed = 0;
Falg_F_R_Changed:
        DS8 1
//   25 
//   26 //static unsigned char Falg_lessfull_Changed = 0;
//   27 //******************************************************************************
//   28 //static unsigned char str_succ[20] = "set_success_";
//   29 //static unsigned char str_fail[20] = "set_failed__";
//   30 //******************************************************************************
//   31 /*等待查询阶段和等待发送配对信号*/
//   32 //******************************************************************************
//   33 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   34 void PauseHeat(unsigned int ptime, unsigned char nextstep)
//   35 {
//   36     Flag_PHCEn = 1; // pause heat time count enable
PauseHeat:
        MOV       L:Flag_PHCEn, #0x1
//   37     if (CNT_PHeat >= ptime)
        LDW       Y, L:CNT_PHeat
        LDW       S:?w0, X
        CPW       Y, S:?w0
        JRC       L:??PauseHeat_0
//   38     {
//   39         Flag_PHCEn = 0;
        MOV       L:Flag_PHCEn, #0x0
//   40         CNT_PHeat = 0;
        CLRW      X
        LDW       L:CNT_PHeat, X
//   41         if (nextstep == 20)
        CP        A, #0x14
        JRNE      L:??PauseHeat_1
//   42         {
//   43             MacStatus = C_MSWork; //主机配对阶段等待
        MOV       L:MacStatus, #0x3
//   44             CNT_Prot[6] = 200; //CNT_Prot[protype] = 500;
        LDW       X, #0xc8
        LDW       L:CNT_Prot + 12, X
//   45             Mode_Rec_Send = 1; //接收模式
        BSET      L:_A_Flag_NRF24L01, #0x3
        RETF
//   46         }
//   47         else//PWM发送阶段等待
//   48         {
//   49             Step_Work = nextstep;
??PauseHeat_1:
        LD        L:Step_Work, A
//   50         }
//   51     }
//   52 }
??PauseHeat_0:
        RETF
//   53 //******************************************************************************
//   54 
//   55 
//   56 //******************************************************************************
//   57 /*快速关闭PWM输出*/
//   58 //******************************************************************************
//   59 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   60 void Time1_PWM_Close_Mode_Fast(void)
//   61 {
//   62 	unsigned int data;
//   63 	//TIM1_ARR = 267; //f = 30k
//   64     TIM1_CCR1H = 0;
Time1_PWM_Close_Mode_Fast:
        MOV       L:0x5265, #0x0
//   65     TIM1_CCR1L = 0;
        MOV       L:0x5266, #0x0
//   66 	data = TIM1_CCR1H;
        LD        A, L:0x5265
        CLRW      Y
        LD        YL, A
//   67     TIM1_CCR1 = data * 256 + TIM1_CCR1L;
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LD        A, L:0x5266
        CLR       S:?b0
        LD        S:?b1, A
        ADDW      X, S:?w0
        LDW       L:TIM1_CCR1, X
//   68 
//   69     TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
        LDW       X, L:TIM1_ARR
        SUBW      X, L:TIM1_CCR1
        LD        A, XH
        LD        L:0x5267, A
//   70     TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
        LDW       X, L:TIM1_ARR
        SUBW      X, L:TIM1_CCR1
        LDW       Y, #0x100
        DIVW      X, Y
        LD        A, YL
        LD        L:0x5268, A
//   71 
//   72 }
        RETF
        REQUIRE TIM1_CCR1H
        REQUIRE TIM1_CCR1L
        REQUIRE TIM1_CCR2H
        REQUIRE TIM1_CCR2L
//   73 //******************************************************************************
//   74 
//   75 
//   76 //******************************************************************************
//   77 /*正常关闭PWM输出(缓慢关闭）*/
//   78 //******************************************************************************
//   79 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   80 int Time1_PWM_Close_Mode_Slow(void)//正常关闭PWM输出(缓慢关闭）
//   81 {
//   82 	unsigned int data;
//   83 	//TIM1_ARR = 267; //f = 30k
//   84     if (Time1_Work_cycle <= Min_cycle)
Time1_PWM_Close_Mode_Slow:
        LDW       X, #Time1_Work_cycle
        LD        A, (X)
        CP        A, #0x3
        JRNC      L:??Time1_PWM_Close_Mode_Slow_0
//   85     {
//   86         Time1_PWM_Close_Mode_Fast();
        CALLF     Time1_PWM_Close_Mode_Fast
        JP        L:??Time1_PWM_Close_Mode_Slow_1
//   87     }
//   88     else
//   89     {
//   90         if (Flag_10ms_E == 1)
??Time1_PWM_Close_Mode_Slow_0:
        LD        A, L:_A_Flag_10ms_1
        SRL       A
        SRL       A
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JRNE      ??lb_0
        JP        L:??Time1_PWM_Close_Mode_Slow_1
//   91         {
//   92             Flag_10ms_E = 0;
??lb_0:
        BRES      L:_A_Flag_10ms_1, #0x3
//   93             Time1_Work_cycle--;
        LD        A, #0xff
        ADD       A, L:Time1_Work_cycle
        LD        L:Time1_Work_cycle, A
//   94 			
//   95 			TIM1_CCR1H = ((Time1_Work_cycle * TIM1_ARR / 100) / 308) / 256;
        LD        A, L:Time1_Work_cycle
        CLRW      Y
        LD        YL, A
        LDW       X, L:TIM1_ARR
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LDW       Y, #0x64
        DIVW      X, Y
        LDW       Y, #0x134
        DIVW      X, Y
        LD        A, XH
        LD        L:0x5265, A
//   96 			TIM1_CCR1L = ((Time1_Work_cycle * TIM1_ARR / 100) / 308) / 256;
        LD        A, L:Time1_Work_cycle
        CLRW      Y
        LD        YL, A
        LDW       X, L:TIM1_ARR
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LDW       Y, #0x64
        DIVW      X, Y
        LDW       Y, #0x134
        DIVW      X, Y
        LD        A, XH
        LD        L:0x5266, A
//   97 			data = TIM1_CCR1H;
        LD        A, L:0x5265
        CLRW      Y
        LD        YL, A
//   98 			TIM1_CCR1 = data * 256 + TIM1_CCR1L;
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LD        A, L:0x5266
        CLR       S:?b0
        LD        S:?b1, A
        ADDW      X, S:?w0
        LDW       L:TIM1_CCR1, X
//   99 			TIM1_CCR3H = TIM1_CCR1H;
        MOV       L:0x5269, L:0x5265
//  100 			TIM1_CCR3L = TIM1_CCR1L;
        MOV       L:0x526a, L:0x5266
//  101 			TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
        LDW       X, L:TIM1_ARR
        SUBW      X, L:TIM1_CCR1
        LD        A, XH
        LD        L:0x5267, A
//  102 			TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
        LDW       X, L:TIM1_ARR
        SUBW      X, L:TIM1_CCR1
        LDW       Y, #0x100
        DIVW      X, Y
        LD        A, YL
        LD        L:0x5268, A
//  103 			TIM1_CCR4H = TIM1_CCR2H;
        MOV       L:0x526b, L:0x5267
//  104 			TIM1_CCR4L = TIM1_CCR2L;
        MOV       L:0x526c, L:0x5268
//  105         }
//  106     }
//  107 	return 1;
??Time1_PWM_Close_Mode_Slow_1:
        CLRW      X
        INCW      X
        RETF
        REQUIRE TIM1_CCR1H
        REQUIRE TIM1_CCR1L
        REQUIRE TIM1_CCR3H
        REQUIRE TIM1_CCR3L
        REQUIRE TIM1_CCR2H
        REQUIRE TIM1_CCR2L
        REQUIRE TIM1_CCR4H
        REQUIRE TIM1_CCR4L
//  108 }
//  109 //******************************************************************************
//  110 
//  111 
//  112 //******************************************************************************
//  113 /*IGBT间歇发送式 指定占空比，输出PWM*//*占空比一般10%到48%内*/
//  114 //******************************************************************************
//  115 

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  116 void Adjust_Time1_cycle2(unsigned char cycle)//cycle=100表示占空比50%
//  117 {   
Adjust_Time1_cycle2:
        LD        S:?b1, A
//  118     /*unsigned int data;
//  119 	TIM1_ARRH = (8000 / 30) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率30K
//  120     TIM1_ARRL = (8000 / 30) % 256;
//  121 	TIM1_ARR = 267; //f = 30k
//  122     TIM1_CCR1H = 0;
//  123     TIM1_CCR1L = cycle;
//  124 	data = TIM1_CCR1H;
//  125     TIM1_CCR1 = data * 256 + TIM1_CCR1L;
//  126     TIM1_CCR3H = TIM1_CCR1H;
//  127     TIM1_CCR3L = TIM1_CCR1L;
//  128     TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
//  129     TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
//  130     TIM1_CCR4H = TIM1_CCR2H;
//  131     TIM1_CCR4L = TIM1_CCR2L;*/
//  132 	
//  133 	unsigned int data;
//  134 	unsigned int Ratio_Value;
//  135 	unsigned int Frequent_value;
//  136 	
//  137 	if(Falg_F_R_Changed == 1)
        LD        A, #0x1
        CP        A, L:Falg_F_R_Changed
        JRNE      L:??Adjust_Time1_cycle2_0
//  138 	{
//  139 		Stor_Frequen_eeprom[cycle+5] = Stor_Frequent[cycle];
        CLR       S:?b0
        CLRW      X
        LD        A, S:?b1
        LD        XL, A
        LD        A, (L:Stor_Frequent,X)
        LDW       X, S:?w0
        LD        (L:Stor_Frequen_eeprom + 5,X), A
//  140 		Stor_Ratio_eeprom[cycle+5] = Stor_Ratio[cycle];
        CLR       S:?b0
        CLRW      X
        LD        A, S:?b1
        LD        XL, A
        LD        A, (L:Stor_Ratio,X)
        LDW       X, S:?w0
        LD        (L:Stor_Ratio_eeprom + 5,X), A
//  141 		Falg_F_R_Changed = 0;
        MOV       L:Falg_F_R_Changed, #0x0
//  142 	}
//  143 
//  144 	Frequent_value = Stor_Frequen_eeprom[cycle+5];				
??Adjust_Time1_cycle2_0:
        CLRW      X
        LD        A, S:?b1
        LD        XL, A
        LD        A, (L:Stor_Frequen_eeprom + 5,X)
        CLR       S:?b4
        LD        S:?b5, A
//  145 	Ratio_Value = Stor_Ratio_eeprom[cycle+5];
        CLRW      X
        LD        A, S:?b1
        LD        XL, A
        LD        A, (L:Stor_Ratio_eeprom + 5,X)
        CLR       S:?b2
        LD        S:?b3, A
//  146 	
//  147     TIM1_ARRH = (FOSC_16M / 2000 / Frequent_value) / 256; //（16M/2/40K）16M时钟，中央对齐模式除以2，频率20K
        LDW       X, #0x1f40
        LDW       Y, S:?w2
        DIVW      X, Y
        LD        A, XH
        LD        L:0x5262, A
//  148 	TIM1_ARRL = (FOSC_16M / 2000 / Frequent_value) % 256;
        LDW       X, #0x1f40
        LDW       Y, S:?w2
        DIVW      X, Y
        LDW       Y, #0x100
        DIVW      X, Y
        LD        A, YL
        LD        L:0x5263, A
//  149 	data = TIM1_ARRH;
        LD        A, L:0x5262
        CLRW      Y
        LD        YL, A
//  150 	TIM1_ARR = data * 256 + TIM1_ARRL;
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LD        A, L:0x5263
        CLR       S:?b0
        LD        S:?b1, A
        ADDW      X, S:?w0
        LDW       L:TIM1_ARR, X
//  151 	Time1_Work_cycle = Ratio_Value;
        LD        A, S:?b3
        LD        L:Time1_Work_cycle, A
//  152 	TIM1_CCR1H = 0;
        MOV       L:0x5265, #0x0
//  153 	TIM1_CCR1L = TIM1_ARR * Ratio_Value / 100;//80;//53;//40;//27;
        LDW       Y, L:TIM1_ARR
        CALLF     L:?mov_w0_w1
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LDW       Y, #0x64
        DIVW      X, Y
        LD        A, XL
        LD        L:0x5266, A
//  154 	data = TIM1_CCR1H;
        LD        A, L:0x5265
        CLRW      Y
        LD        YL, A
//  155 	TIM1_CCR1 = data * 256 + TIM1_CCR1L;
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LD        A, L:0x5266
        CLR       S:?b0
        LD        S:?b1, A
        ADDW      X, S:?w0
        LDW       L:TIM1_CCR1, X
//  156 
//  157 	TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
        LDW       X, L:TIM1_ARR
        SUBW      X, L:TIM1_CCR1
        LD        A, XH
        LD        L:0x5267, A
//  158 	TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
        LDW       X, L:TIM1_ARR
        SUBW      X, L:TIM1_CCR1
        LDW       Y, #0x100
        DIVW      X, Y
        LD        A, YL
        LD        L:0x5268, A
//  159 	
//  160 }
        RETF
        REQUIRE TIM1_ARRH
        REQUIRE TIM1_ARRL
        REQUIRE TIM1_CCR1H
        REQUIRE TIM1_CCR1L
        REQUIRE TIM1_CCR2H
        REQUIRE TIM1_CCR2L
//  161 
//  162 //******************************************************************************
//  163 /*指定占空比，输出PWM*//*占空比一般10%到48%内*/
//  164 //******************************************************************************
//  165 

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  166 void Adjust_Time1_cycle(unsigned char cycle)//cycle=100表示占空比50%
//  167 {
Adjust_Time1_cycle:
        LD        S:?b0, A
//  168     unsigned int data;
//  169     unsigned char num1l, num1h;
//  170     if (Flag_100us_A == 1)
        BTJT      L:_A_Flag_100us, #0x7, ??lb_1
        JPF       L:??Adjust_Time1_cycle_0
//  171     {
//  172         Flag_100us_A = 0;
??lb_1:
        BRES      L:_A_Flag_100us, #0x7
//  173         if (cycle >= Max_cycle)
        LD        A, S:?b0
        CP        A, #0x64
        JRC       L:??Adjust_Time1_cycle_1
//  174         {
//  175             cycle = Max_cycle;
        MOV       S:?b0, #0x64
//  176         }
//  177         if (Time1_Work_cycle < cycle)
??Adjust_Time1_cycle_1:
        LDW       X, #Time1_Work_cycle
        LD        A, (X)
        CP        A, S:?b0
        JRNC      L:??Adjust_Time1_cycle_2
//  178         {
//  179             Time1_Work_cycle++;
        LD        A, #0x1
        ADD       A, L:Time1_Work_cycle
        LD        L:Time1_Work_cycle, A
//  180             num1h = ((Time1_Work_cycle * TIM1_ARR) / 200) / 256;
        LD        A, L:Time1_Work_cycle
        CLRW      Y
        LD        YL, A
        LDW       X, L:TIM1_ARR
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LDW       Y, #0xc8
        DIVW      X, Y
        RLWA      X, A
        LD        S:?b3, A
        RRWA      X, A
//  181             num1l = ((Time1_Work_cycle * TIM1_ARR) / 200) % 256;
        LD        A, L:Time1_Work_cycle
        CLRW      Y
        LD        YL, A
        LDW       X, L:TIM1_ARR
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LDW       Y, #0xc8
        DIVW      X, Y
        LDW       Y, #0x100
        DIVW      X, Y
        EXG       A, YL
        LD        S:?b5, A
        EXG       A, YL
//  182             data = num1h;
        CLR       S:?b2
//  183             TIM1_CCR1 = data * 256 + num1l;
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, S:?w1
        CALLF     L:?mul16_x_x_w0
        CLR       S:?b4
        ADDW      X, S:?w2
        LDW       L:TIM1_CCR1, X
//  184             TIM1_CCR1H = num1h;
        LD        A, S:?b3
        LD        L:0x5265, A
//  185             TIM1_CCR1L = num1l;
        LD        A, S:?b5
        LD        L:0x5266, A
        RETF
//  186         }
//  187         else if (Time1_Work_cycle > cycle)
??Adjust_Time1_cycle_2:
        LD        A, S:?b0
        CP        A, L:Time1_Work_cycle
        JRNC      L:??Adjust_Time1_cycle_0
//  188         {
//  189             Time1_Work_cycle--;
        LD        A, #0xff
        ADD       A, L:Time1_Work_cycle
        LD        L:Time1_Work_cycle, A
//  190             num1h = ((Time1_Work_cycle * TIM1_ARR) / 200) / 256;
        LD        A, L:Time1_Work_cycle
        CLRW      Y
        LD        YL, A
        LDW       X, L:TIM1_ARR
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LDW       Y, #0xc8
        DIVW      X, Y
        RLWA      X, A
        LD        S:?b3, A
        RRWA      X, A
//  191             num1l = ((Time1_Work_cycle * TIM1_ARR) / 200) % 256;
        LD        A, L:Time1_Work_cycle
        CLRW      Y
        LD        YL, A
        LDW       X, L:TIM1_ARR
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LDW       Y, #0xc8
        DIVW      X, Y
        LDW       Y, #0x100
        DIVW      X, Y
        EXG       A, YL
        LD        S:?b5, A
        EXG       A, YL
//  192             data = num1h;
        CLR       S:?b2
//  193             TIM1_CCR1 = data * 256 + num1l;
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, S:?w1
        CALLF     L:?mul16_x_x_w0
        CLR       S:?b4
        ADDW      X, S:?w2
        LDW       L:TIM1_CCR1, X
//  194             TIM1_CCR1H = num1h;
        LD        A, S:?b3
        LD        L:0x5265, A
//  195             TIM1_CCR1L = num1l;
        LD        A, S:?b5
        LD        L:0x5266, A
//  196         }
//  197     }
//  198 }
??Adjust_Time1_cycle_0:
        RETF
        REQUIRE TIM1_CCR1H
        REQUIRE TIM1_CCR1L
//  199 /*******************************************************************************
//  200 -----------------------------    End of file    --------------------------------
//  201  *******************************************************************************/
//  202 //******************************************************************************
//  203 /*IGBT根据接收端请求直接输出PWM*//*占空比一般5%到30%内*/
//  204 //******************************************************************************
//  205 

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  206 void Fast_Adjust_Time1_cycle2(unsigned char cycle)//cycle=200表示占空比30%
//  207 {
//  208     unsigned int data;
//  209 
//  210     Time1_Work_cycle = cycle;
Fast_Adjust_Time1_cycle2:
        LD        L:Time1_Work_cycle, A
//  211     data = Time1_Work_cycle * 3  / 5;
        LD        A, L:Time1_Work_cycle
        CLRW      Y
        LD        YL, A
        LDW       X, #0x3
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LDW       Y, #0x5
        CALLF     L:?sdiv16_x_x_y
        LDW       S:?w1, X
//  212 
//  213     if (Time1_Work_cycle < 8)
        LDW       X, #Time1_Work_cycle
        LD        A, (X)
        CP        A, #0x8
        JRNC      L:??Fast_Adjust_Time1_cycle2_0
//  214     {
//  215         num1h = 0;
        MOV       L:num1h, #0x0
//  216         num1l = 0;
        MOV       L:num1l, #0x0
        JRA       L:??Fast_Adjust_Time1_cycle2_1
//  217     }
//  218     else if (Time1_Work_cycle < 16)
??Fast_Adjust_Time1_cycle2_0:
        LDW       X, #Time1_Work_cycle
        LD        A, (X)
        CP        A, #0x10
        JRNC      L:??Fast_Adjust_Time1_cycle2_2
//  219     {
//  220         num1h = 0;
        MOV       L:num1h, #0x0
//  221         num1l = 48 / 5 % 256;
        MOV       L:num1l, #0x9
        JRA       L:??Fast_Adjust_Time1_cycle2_1
//  222     }
//  223     else
//  224     {
//  225         num1h = Time1_Work_cycle * 3 / 1280;
??Fast_Adjust_Time1_cycle2_2:
        LD        A, L:Time1_Work_cycle
        CLRW      Y
        LD        YL, A
        LDW       X, #0x3
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LDW       Y, #0x500
        CALLF     L:?sdiv16_x_x_y
        LD        A, XL
        LD        L:num1h, A
//  226         num1l = Time1_Work_cycle * 3 / 5 % 256;
        LD        A, L:Time1_Work_cycle
        CLRW      Y
        LD        YL, A
        LDW       X, #0x3
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LDW       Y, #0x5
        CALLF     L:?sdiv16_x_x_y
        LDW       Y, #0x100
        CALLF     L:?smod16_y_x_y
        LD        A, YL
        LD        L:num1l, A
//  227     }
//  228 
//  229     /*
//  230             num1h = ((Time1_Work_cycle * 6 / 20 * TIM1_ARR) / 200) / 256;
//  231             num1l = ((Time1_Work_cycle * 6 / 20 * TIM1_ARR) / 200) % 256;
//  232      */
//  233 
//  234     //data = num1h;
//  235     TIM1_CCR1 = data;
??Fast_Adjust_Time1_cycle2_1:
        LDW       X, S:?w1
        LDW       L:TIM1_CCR1, X
//  236     TIM1_CCR1H = num1h;
        MOV       L:0x5265, L:num1h
//  237     TIM1_CCR1L = num1l;
        MOV       L:0x5266, L:num1l
//  238     TIM1_CCR3H = TIM1_CCR1H;
        MOV       L:0x5269, L:0x5265
//  239     TIM1_CCR3L = TIM1_CCR1L;
        MOV       L:0x526a, L:0x5266
//  240     TIM1_CCR2H = (TIM1_ARR - data) / 256;
        LDW       X, L:TIM1_ARR
        SUBW      X, S:?w1
        LD        A, XH
        LD        L:0x5267, A
//  241     TIM1_CCR2L = (TIM1_ARR - data) % 256;
        LDW       X, L:TIM1_ARR
        SUBW      X, S:?w1
        LDW       Y, #0x100
        DIVW      X, Y
        LD        A, YL
        LD        L:0x5268, A
//  242     TIM1_CCR4H = TIM1_CCR2H;
        MOV       L:0x526b, L:0x5267
//  243     TIM1_CCR4L = TIM1_CCR2L;
        MOV       L:0x526c, L:0x5268
//  244 }
        RETF
        REQUIRE TIM1_CCR1H
        REQUIRE TIM1_CCR1L
        REQUIRE TIM1_CCR3H
        REQUIRE TIM1_CCR3L
        REQUIRE TIM1_CCR2H
        REQUIRE TIM1_CCR2L
        REQUIRE TIM1_CCR4H
        REQUIRE TIM1_CCR4L
//  245 
//  246 //******************************************************************************
//  247 /*不缓启动，直接输出PWM*//*占空比一般10%到48%内*/
//  248 //******************************************************************************
//  249 

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  250 void Fast_Adjust_Time1_cycle_4uart(const unsigned int Frequent_value,const unsigned int Ratio_Value)//cycle=100表示占空比50%
//  251 {
Fast_Adjust_Time1_cycle_4uart:
        LDW       S:?w0, X
        LDW       S:?w1, Y
//  252 	unsigned int data;
//  253     TIM1_ARRH = (FOSC_16M / 2000 / Frequent_value) / 256; //（16M/2/40K）16M时钟，中央对齐模式除以2，频率20K
        LDW       X, #0x1f40
        LDW       Y, S:?w0
        DIVW      X, Y
        LD        A, XH
        LD        L:0x5262, A
//  254 	TIM1_ARRL = (FOSC_16M / 2000 / Frequent_value) % 256;
        LDW       X, #0x1f40
        LDW       Y, S:?w0
        DIVW      X, Y
        LDW       Y, #0x100
        DIVW      X, Y
        LD        A, YL
        LD        L:0x5263, A
//  255 	data = TIM1_ARRH;
        LD        A, L:0x5262
        CLRW      Y
        LD        YL, A
//  256 	TIM1_ARR = data * 256 + TIM1_ARRL;
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LD        A, L:0x5263
        CLR       S:?b0
        LD        S:?b1, A
        ADDW      X, S:?w0
        LDW       L:TIM1_ARR, X
//  257 	Time1_Work_cycle = Ratio_Value;
        LD        A, S:?b3
        LD        L:Time1_Work_cycle, A
//  258 	TIM1_CCR1H = 0;
        MOV       L:0x5265, #0x0
//  259 	TIM1_CCR1L = TIM1_ARR * Ratio_Value / 100;//80;//53;//40;//27;
        LDW       X, L:TIM1_ARR
        LDW       Y, X
        CALLF     L:?mov_w0_w1
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LDW       Y, #0x64
        DIVW      X, Y
        LD        A, XL
        LD        L:0x5266, A
//  260 	data = TIM1_CCR1H;
        LD        A, L:0x5265
        CLRW      Y
        LD        YL, A
//  261 	TIM1_CCR1 = data * 256 + TIM1_CCR1L;
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LD        A, L:0x5266
        CLR       S:?b0
        LD        S:?b1, A
        ADDW      X, S:?w0
        LDW       L:TIM1_CCR1, X
//  262 
//  263 	TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
        LDW       X, L:TIM1_ARR
        SUBW      X, L:TIM1_CCR1
        LD        A, XH
        LD        L:0x5267, A
//  264 	TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
        LDW       X, L:TIM1_ARR
        SUBW      X, L:TIM1_CCR1
        LDW       Y, #0x100
        DIVW      X, Y
        LD        A, YL
        LD        L:0x5268, A
//  265 	printf("set_success_%d!",Pwm_Product_numValue);
        LD        A, L:Pwm_Product_numValue
        CLRW      X
        LD        XL, A
        PUSHW     X
        LDW       X, #?_0
        CALLF     printf
        ADD       SP, #0x2
//  266 }
        RETF
        REQUIRE TIM1_ARRH
        REQUIRE TIM1_ARRL
        REQUIRE TIM1_CCR1H
        REQUIRE TIM1_CCR1L
        REQUIRE TIM1_CCR2H
        REQUIRE TIM1_CCR2L
//  267 
//  268 //******************************************************************************
//  269 //根据挂载产品数量粗调PWM值//*占空比一般10%到48%内*/
//  270 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  271 void  Sum_Adjust_Time1_cycle(const unsigned char Pnumb)
//  272 {
Sum_Adjust_Time1_cycle:
        LD        S:?b0, A
//  273 	if((NUM_PWM_UPload != Pnumb) || (Falg_F_R_Changed == 1))
        LD        A, S:?b0
        CP        A, L:NUM_PWM_UPload
        JRNE      L:??Sum_Adjust_Time1_cycle_0
        LD        A, #0x1
        CP        A, L:Falg_F_R_Changed
        JREQ      ??lb_2
        JP        L:??Sum_Adjust_Time1_cycle_1
//  274 	{
//  275 		NUM_PWM_UPload = Pnumb;
??lb_2:
??Sum_Adjust_Time1_cycle_0:
        LD        A, S:?b0
        LD        L:NUM_PWM_UPload, A
//  276 		if(Falg_F_R_Changed == 1)
        LD        A, #0x1
        CP        A, L:Falg_F_R_Changed
        JRNE      L:??Sum_Adjust_Time1_cycle_2
//  277 		{
//  278 			if(CNT_FULL_Num >= 1)
        LD        A, L:CNT_FULL_Num
        TNZ       A
        JREQ      L:??Sum_Adjust_Time1_cycle_3
//  279 			{
//  280 				Stor_Frequen_eeprom[NUM_PWM_UPload] = Stor_Frequent[NUM_PWM_UPload + CNT_FULL_Num];
        LD        A, L:CNT_FULL_Num
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        ADDW      X, S:?w0
        LD        A, (L:Stor_Frequent,X)
        LD        S:?b0, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:Stor_Frequen_eeprom,X), A
//  281 				Stor_Ratio_eeprom[NUM_PWM_UPload] = Stor_Ratio[NUM_PWM_UPload + CNT_FULL_Num];				
        LD        A, L:CNT_FULL_Num
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        ADDW      X, S:?w0
        LD        A, (L:Stor_Ratio,X)
        LD        S:?b0, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:Stor_Ratio_eeprom,X), A
        JRA       L:??Sum_Adjust_Time1_cycle_2
//  282 			}
//  283 			else
//  284 			{
//  285 				Stor_Frequen_eeprom[NUM_PWM_UPload] = Stor_Frequent[NUM_PWM_UPload];
??Sum_Adjust_Time1_cycle_3:
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Frequent,X)
        LD        S:?b0, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:Stor_Frequen_eeprom,X), A
//  286 				Stor_Ratio_eeprom[NUM_PWM_UPload] = Stor_Ratio[NUM_PWM_UPload];
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Ratio,X)
        LD        S:?b0, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:Stor_Ratio_eeprom,X), A
//  287 			}
//  288 		}
//  289 		Fast_Adjust_Time1_cycle_4uart(Stor_Frequen_eeprom[NUM_PWM_UPload],Stor_Ratio_eeprom[NUM_PWM_UPload]);
??Sum_Adjust_Time1_cycle_2:
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Ratio_eeprom,X)
        CLRW      Y
        LD        YL, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Frequen_eeprom,X)
        CLRW      X
        LD        XL, A
        CALLF     Fast_Adjust_Time1_cycle_4uart
//  290 			
//  291 		Falg_F_R_Changed = 0;
        MOV       L:Falg_F_R_Changed, #0x0
//  292 	}
//  293 }
??Sum_Adjust_Time1_cycle_1:
        RETF
//  294 

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  295 void  Sum_Adjust_Time1_cycle_lessfull(const unsigned char Pnumb,const unsigned char num_lessfull)
//  296 {
Sum_Adjust_Time1_cycle_lessfull:
        LD        S:?b1, A
//  297 	if((NUM_PWM_UPload != Pnumb) || (Falg_F_R_Changed == 1) || (num_lessfull != NUM_PWM_UPload_LessFull))
        LD        A, S:?b1
        CP        A, L:NUM_PWM_UPload
        JRNE      L:??Sum_Adjust_Time1_cycle_lessfull_0
        LD        A, #0x1
        CP        A, L:Falg_F_R_Changed
        JREQ      L:??Sum_Adjust_Time1_cycle_lessfull_0
        LD        A, S:?b0
        CP        A, L:NUM_PWM_UPload_LessFull
        JRNE      ??lb_3
        JP        L:??Sum_Adjust_Time1_cycle_lessfull_1
//  298 	{
//  299 		NUM_PWM_UPload = Pnumb;
??lb_3:
??Sum_Adjust_Time1_cycle_lessfull_0:
        LD        A, S:?b1
        LD        L:NUM_PWM_UPload, A
//  300 		NUM_PWM_UPload_LessFull = num_lessfull;
        LD        A, S:?b0
        LD        L:NUM_PWM_UPload_LessFull, A
//  301 		if(Falg_F_R_Changed == 1)
        LD        A, #0x1
        CP        A, L:Falg_F_R_Changed
        JRNE      L:??Sum_Adjust_Time1_cycle_lessfull_2
//  302 		{
//  303 			if(CNT_FULL_Num >= 1)
        LD        A, L:CNT_FULL_Num
        TNZ       A
        JREQ      L:??Sum_Adjust_Time1_cycle_lessfull_3
//  304 			{
//  305 				Stor_Frequen_eeprom[NUM_PWM_UPload] = Stor_Frequent[NUM_PWM_UPload + CNT_FULL_Num];
        LD        A, L:CNT_FULL_Num
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        ADDW      X, S:?w0
        LD        A, (L:Stor_Frequent,X)
        LD        S:?b0, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:Stor_Frequen_eeprom,X), A
//  306 				Stor_Ratio_eeprom[NUM_PWM_UPload] = Stor_Ratio[NUM_PWM_UPload + CNT_FULL_Num];				
        LD        A, L:CNT_FULL_Num
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        ADDW      X, S:?w0
        LD        A, (L:Stor_Ratio,X)
        LD        S:?b0, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:Stor_Ratio_eeprom,X), A
        JRA       L:??Sum_Adjust_Time1_cycle_lessfull_2
//  307 			}
//  308 			else
//  309 			{
//  310 				Stor_Frequen_eeprom[NUM_PWM_UPload] = Stor_Frequent[NUM_PWM_UPload];
??Sum_Adjust_Time1_cycle_lessfull_3:
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Frequent,X)
        LD        S:?b0, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:Stor_Frequen_eeprom,X), A
//  311 				Stor_Ratio_eeprom[NUM_PWM_UPload] = Stor_Ratio[NUM_PWM_UPload];
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Ratio,X)
        LD        S:?b0, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:Stor_Ratio_eeprom,X), A
//  312 			}
//  313 		}
//  314 		switch(NUM_PWM_UPload_LessFull)
??Sum_Adjust_Time1_cycle_lessfull_2:
        LDW       X, #NUM_PWM_UPload_LessFull
        LD        A, (X)
        DEC       A
        JREQ      L:??Sum_Adjust_Time1_cycle_lessfull_4
        DEC       A
        JREQ      L:??Sum_Adjust_Time1_cycle_lessfull_5
        DEC       A
        JREQ      L:??Sum_Adjust_Time1_cycle_lessfull_6
        DEC       A
        JREQ      L:??Sum_Adjust_Time1_cycle_lessfull_7
        DEC       A
        JREQ      L:??Sum_Adjust_Time1_cycle_lessfull_8
        JP        L:??Sum_Adjust_Time1_cycle_lessfull_9
//  315 		{
//  316 		  case 1:
//  317 			Fast_Adjust_Time1_cycle_4uart(Stor_Frequen_eeprom[NUM_PWM_UPload] + 2,Stor_Ratio_eeprom[NUM_PWM_UPload]);
??Sum_Adjust_Time1_cycle_lessfull_4:
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Ratio_eeprom,X)
        CLRW      Y
        LD        YL, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Frequen_eeprom,X)
        CLRW      X
        LD        XL, A
        ADDW      X, #0x2
        CALLF     Fast_Adjust_Time1_cycle_4uart
//  318 			break;
        JRA       L:??Sum_Adjust_Time1_cycle_lessfull_9
//  319 		  case 2:
//  320 			Fast_Adjust_Time1_cycle_4uart(Stor_Frequen_eeprom[NUM_PWM_UPload] + 5,Stor_Ratio_eeprom[NUM_PWM_UPload]);
??Sum_Adjust_Time1_cycle_lessfull_5:
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Ratio_eeprom,X)
        CLRW      Y
        LD        YL, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Frequen_eeprom,X)
        CLRW      X
        LD        XL, A
        ADDW      X, #0x5
        CALLF     Fast_Adjust_Time1_cycle_4uart
//  321 			break;	
        JRA       L:??Sum_Adjust_Time1_cycle_lessfull_9
//  322 		  case 3:
//  323 			Fast_Adjust_Time1_cycle_4uart(Stor_Frequen_eeprom[NUM_PWM_UPload],Stor_Ratio_eeprom[NUM_PWM_UPload]);
??Sum_Adjust_Time1_cycle_lessfull_6:
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Ratio_eeprom,X)
        CLRW      Y
        LD        YL, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Frequen_eeprom,X)
        CLRW      X
        LD        XL, A
        CALLF     Fast_Adjust_Time1_cycle_4uart
//  324 			break;
        JRA       L:??Sum_Adjust_Time1_cycle_lessfull_9
//  325 		  case 4:
//  326 			Fast_Adjust_Time1_cycle_4uart(Stor_Frequen_eeprom[NUM_PWM_UPload],Stor_Ratio_eeprom[NUM_PWM_UPload]);
??Sum_Adjust_Time1_cycle_lessfull_7:
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Ratio_eeprom,X)
        CLRW      Y
        LD        YL, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Frequen_eeprom,X)
        CLRW      X
        LD        XL, A
        CALLF     Fast_Adjust_Time1_cycle_4uart
//  327 			break;
        JRA       L:??Sum_Adjust_Time1_cycle_lessfull_9
//  328 		  case 5:
//  329 			Fast_Adjust_Time1_cycle_4uart(Stor_Frequen_eeprom[NUM_PWM_UPload],Stor_Ratio_eeprom[NUM_PWM_UPload]);
??Sum_Adjust_Time1_cycle_lessfull_8:
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Ratio_eeprom,X)
        CLRW      Y
        LD        YL, A
        LD        A, L:NUM_PWM_UPload
        CLRW      X
        LD        XL, A
        LD        A, (L:Stor_Frequen_eeprom,X)
        CLRW      X
        LD        XL, A
        CALLF     Fast_Adjust_Time1_cycle_4uart
//  330 			break;
//  331 		  default:
//  332 			break;
//  333 		}
//  334 		Falg_F_R_Changed = 0;
??Sum_Adjust_Time1_cycle_lessfull_9:
        MOV       L:Falg_F_R_Changed, #0x0
//  335 	}
//  336 }
??Sum_Adjust_Time1_cycle_lessfull_1:
        RETF
//  337 /*void  Sum_Adjust_Time1_cycle(unsigned char Pnumb)
//  338 {
//  339 	unsigned int data;
//  340 	static int temp_frequent_value= 0;
//  341 	static int temp_ratio_value = 0;
//  342     unsigned char tem_comd[5] = "$cmd";
//  343     if(Pnumb == Pwm_Product_numValue)
//  344     {
//  345        if((strncmp((char*)Stor_Commd,(char*)tem_comd,4) == 0) && ((temp_frequent_value != Pwm_Frequent_Value) || (temp_ratio_value != Pwm_Ratio_Value)))
//  346         {
//  347 			temp_frequent_value = Pwm_Frequent_Value;
//  348 			temp_ratio_value = Pwm_Ratio_Value;
//  349           TIM1_ARRH = (8000 / Pwm_Frequent_Value) / 256; //（16M/2/40K）16M时钟，中央对齐模式除以2，频率20K
//  350           TIM1_ARRL = (8000 / Pwm_Frequent_Value) % 256;
//  351           data = TIM1_ARRH;
//  352           TIM1_ARR = data * 256 + TIM1_ARRL;
//  353           Time1_Work_cycle = Pwm_Ratio_Value;
//  354           TIM1_CCR1H = 0;
//  355           TIM1_CCR1L = TIM1_ARR * Pwm_Ratio_Value / 100;//80;//53;//40;//27;
//  356           data = TIM1_CCR1H;
//  357           TIM1_CCR1 = data * 256 + TIM1_CCR1L;
//  358           TIM1_CCR3H = TIM1_CCR1H;
//  359           TIM1_CCR3L = TIM1_CCR1L;
//  360           TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
//  361           TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
//  362           TIM1_CCR4H = TIM1_CCR2H;
//  363           TIM1_CCR4L = TIM1_CCR2L;
//  364 		  //sprintf((char*)str_succ,"set_success_%d!",Pwm_Product_numValue);
//  365 		  //strcat((char*)str_succ,(char*)Pwm_Product_numValue);
//  366 		  //UART2_SendString(str_succ,13);
//  367 		  printf("set_success_%d!",Pwm_Product_numValue);
//  368 		  Printf("DS16(0,102,'pwm_Succ!',12);\n\r");
//  369         }
//  370 	   //else if((temp_frequent_value == Pwm_Frequent_Value) && (temp_ratio_value == Pwm_Ratio_Value));
//  371 	   //else
//  372 		   //Printf("DS16(0,102,'pwm_Fail!',12);\n\r");
//  373 		   //printf("set_failed__%d!",Pwm_Product_numValue);
//  374     }
//  375     else
//  376     {
//  377 	  if((NUM_PWM_UPload != Pnumb) || (Falg_F_R_Changed == 1))
//  378       {
//  379           NUM_PWM_UPload = Pnumb;
//  380           switch(NUM_PWM_UPload)
//  381           {
//  382             case 0: //关闭 20170223 此处永远不法进入，屏蔽
//  383               Adjust_Time1_cycle2(27);
//  384               break;
//  385             case 1: //10% 15% 20% 15%
//  386               //TIM1_ARRH = (8000 / 30) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率30K
//  387               //TIM1_ARRL = (8000 / 30) % 256;
//  388               //TIM1_ARR = 267; //f = 30k  dt = 30us
//  389               TIM1_ARRH = (8000 / 28) / 256; //（16M/2/40K）16M时钟，中央对齐模式除以2，频率20K
//  390               TIM1_ARRL = (8000 / 28) % 256;
//  391               TIM1_ARR = 286;
//  392               Time1_Work_cycle = 20;
//  393               TIM1_CCR1H = 0;
//  394               TIM1_CCR1L = 57;//80;//53;//40;//27;
//  395               data = TIM1_CCR1H;
//  396               TIM1_CCR1 = data * 256 + TIM1_CCR1L;
//  397               TIM1_CCR3H = TIM1_CCR1H;
//  398               TIM1_CCR3L = TIM1_CCR1L;
//  399               TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
//  400               TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
//  401               TIM1_CCR4H = TIM1_CCR2H;
//  402               TIM1_CCR4L = TIM1_CCR2L;   
//  403               break;
//  404             case 2: //20% 15% 20% 30% 25%
//  405               //TIM1_ARRH = (8000 / 27) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率27K
//  406               //TIM1_ARRL = (8000 / 27) % 256;
//  407               //TIM1_ARR = 296; //f = 27k  dt = 30us
//  408               TIM1_ARRH = (8000 / 28) / 256; //（16M/2/40K）16M时钟，中央对齐模式除以2，频率20K
//  409               TIM1_ARRL = (8000 / 28) % 256;
//  410               TIM1_ARR = 286;
//  411               Time1_Work_cycle = 27;
//  412               TIM1_CCR1H = 0;
//  413               TIM1_CCR1L = 77;//120;//80;//53;//40;//59;
//  414               data = TIM1_CCR1H;
//  415               TIM1_CCR1 = data * 256 + TIM1_CCR1L;
//  416               TIM1_CCR3H = TIM1_CCR1H;
//  417               TIM1_CCR3L = TIM1_CCR1L;
//  418               TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
//  419               TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
//  420               TIM1_CCR4H = TIM1_CCR2H;
//  421               TIM1_CCR4L = TIM1_CCR2L; 
//  422               break;
//  423             case 3: //30% 20% 25% 36% 33%
//  424               //TIM1_ARRH = (8000 / 23) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率23K
//  425               //TIM1_ARRL = (8000 / 23) % 256;
//  426               //TIM1_ARR = 347; //f = 23k  dt = 30us
//  427               TIM1_ARRH = (8000 / 28) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率23K
//  428               TIM1_ARRL = (8000 / 28) % 256;
//  429               TIM1_ARR = 286; //f = 23k  dt = 30us
//  430               Time1_Work_cycle = 35;//30;
//  431               TIM1_CCR1H = 0;
//  432               TIM1_CCR1L = 101;//144;//96;//67;//53;//104;
//  433               data = TIM1_CCR1H;
//  434               TIM1_CCR1 = data * 256 + TIM1_CCR1L;
//  435               TIM1_CCR3H = TIM1_CCR1H;
//  436               TIM1_CCR3L = TIM1_CCR1L;
//  437               TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
//  438               TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
//  439               TIM1_CCR4H = TIM1_CCR2H;
//  440               TIM1_CCR4L = TIM1_CCR2L;
//  441               break;
//  442             case 4: //40% 25% 30% 41% 39%
//  443               //TIM1_ARRH = (8000 / 20) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率20K
//  444               //TIM1_ARRL = (8000 / 20) % 256;
//  445               //TIM1_ARR = 400; //f = 20k dt = 30us
//  446               TIM1_ARRH = (8000 / 28) / 256; //（16M/2/20K）16M时钟，中央对齐模式除以2，频率20K
//  447               TIM1_ARRL = (8000 / 28) % 256;
//  448               TIM1_ARR = 286; //f = 20k dt = 30us
//  449               Time1_Work_cycle = 40;
//  450               TIM1_CCR1H = 0;
//  451               TIM1_CCR1L = 114;//164;//109;//80;
//  452               data = TIM1_CCR1H;
//  453               TIM1_CCR1 = data * 256 + TIM1_CCR1L;
//  454               TIM1_CCR3H = TIM1_CCR1H;
//  455               TIM1_CCR3L = TIM1_CCR1L;
//  456               TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
//  457               TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
//  458               TIM1_CCR4H = TIM1_CCR2H;
//  459               TIM1_CCR4L = TIM1_CCR2L;
//  460               break;
//  461             case 5: //45%
//  462               Time1_Work_cycle = 45;
//  463               TIM1_CCR1H = 0;
//  464               TIM1_CCR1L = 139;
//  465               data = TIM1_CCR1H;
//  466               TIM1_CCR1 = data * 256 + TIM1_CCR1L;
//  467               TIM1_CCR3H = TIM1_CCR1H;
//  468               TIM1_CCR3L = TIM1_CCR1L;
//  469               TIM1_CCR2H = (TIM1_ARR - TIM1_CCR1) / 256;
//  470               TIM1_CCR2L = (TIM1_ARR - TIM1_CCR1) % 256;
//  471               TIM1_CCR4H = TIM1_CCR2H;
//  472               TIM1_CCR4L = TIM1_CCR2L;
//  473               break;
//  474             default:
//  475                   break;			
//  476           }
//  477       }
//  478     }
//  479 }*/
//  480 
//  481 
//  482 //******************************************************************************
//  483 /*不缓启动，直接输出PWM*//*占空比一般10%到48%内*/
//  484 /*Pow_On：代表每一个接收端需要的功率*/
//  485 //which_chenal:代表通道
//  486 //******************************************************************************
//  487 

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  488 void Fast_Adjust_Time1_cycle(const unsigned char cycle,const unsigned int Pow_On,const unsigned char which_chenal,const unsigned char isnew_chenal)//cycle=100表示占空比50%
//  489 {
Fast_Adjust_Time1_cycle:
        CALLF     L:?push_l3
        CALLF     L:?push_w5
        PUSH      S:?b8
        LD        S:?b8, A
        LDW       S:?w5, X
//  490     unsigned int data;
//  491     unsigned char num1l, num1h;
//  492 	static unsigned long Temp_pow[5] = {0}; 	//记录初始功率，及要调整的功率阈值
//  493 	static unsigned char Temp_chenal = 0; 	//通道值
//  494 	static char Temp_chenal_frist[5] = {1};// 辅助记录初始值的一次性变量，只有遇到新增接收机时才开启记录一次
//  495 	static float Temp_Work_cycle = 0;			//计算占空比用
//  496 	Temp_chenal = which_chenal;
        LD        A, S:?b0
        LD        L:??Temp_chenal, A
//  497 	//占空比设定第一步
//  498 	if(isnew_chenal == 1)
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??Fast_Adjust_Time1_cycle_0
//  499 	{
//  500 		Time1_Work_cycle += 25;//如果是新的就增加25%
        LD        A, #0x19
        ADD       A, L:Time1_Work_cycle
        LD        L:Time1_Work_cycle, A
//  501 		switch(Temp_chenal)
        LDW       X, #??Temp_chenal
        LD        A, (X)
        DEC       A
        JREQ      L:??Fast_Adjust_Time1_cycle_1
        DEC       A
        JREQ      L:??Fast_Adjust_Time1_cycle_2
        DEC       A
        JREQ      L:??Fast_Adjust_Time1_cycle_3
        DEC       A
        JREQ      L:??Fast_Adjust_Time1_cycle_4
        DEC       A
        JREQ      L:??Fast_Adjust_Time1_cycle_5
        JRA       L:??Fast_Adjust_Time1_cycle_0
//  502 		{
//  503 		  case 1:
//  504 			Temp_chenal_frist[0] = 1;
??Fast_Adjust_Time1_cycle_1:
        MOV       L:??Temp_chenal_frist, #0x1
//  505 			break;
        JRA       L:??Fast_Adjust_Time1_cycle_0
//  506 		  case 2:
//  507 			Temp_chenal_frist[1] = 1;
??Fast_Adjust_Time1_cycle_2:
        MOV       L:??Temp_chenal_frist + 1, #0x1
//  508 			break;
        JRA       L:??Fast_Adjust_Time1_cycle_0
//  509 		  case 3:
//  510 			Temp_chenal_frist[2] = 1;
??Fast_Adjust_Time1_cycle_3:
        MOV       L:??Temp_chenal_frist + 2, #0x1
//  511 			break;
        JRA       L:??Fast_Adjust_Time1_cycle_0
//  512 		  case 4:
//  513 			Temp_chenal_frist[3] = 1;
??Fast_Adjust_Time1_cycle_4:
        MOV       L:??Temp_chenal_frist + 3, #0x1
//  514 			break;
        JRA       L:??Fast_Adjust_Time1_cycle_0
//  515 		  case 5:
//  516 			Temp_chenal_frist[4] = 1;
??Fast_Adjust_Time1_cycle_5:
        MOV       L:??Temp_chenal_frist + 4, #0x1
//  517 			break;
//  518 		  default:
//  519 			break;		
//  520 		}
//  521 	}
//  522 	Temp_Work_cycle = Time1_Work_cycle;
??Fast_Adjust_Time1_cycle_0:
        LD        A, L:Time1_Work_cycle
        CLRW      X
        LD        XL, A
        CALLF     L:?fcastf32u16_l0_x
        LDW       X, #??Temp_Work_cycle
        CALLF     L:?load32_0x_l0
//  523 	//占空比调整第二步
//  524 	switch(Temp_chenal)
        LDW       X, #??Temp_chenal
        LD        A, (X)
        DEC       A
        JREQ      L:??Fast_Adjust_Time1_cycle_6
        DEC       A
        JRNE      ??lb_4
        JP        L:??Fast_Adjust_Time1_cycle_7
??lb_4:
        DEC       A
        JRNE      ??lb_5
        JP        L:??Fast_Adjust_Time1_cycle_8
??lb_5:
        DEC       A
        JRNE      ??lb_6
        JP        L:??Fast_Adjust_Time1_cycle_9
??lb_6:
        DEC       A
        JRNE      ??lb_7
        JP        L:??Fast_Adjust_Time1_cycle_10
??lb_7:
        JP        L:??Fast_Adjust_Time1_cycle_11
//  525 	{
//  526 	  case 1:
//  527 		Flag_NEW_DEV[0] = 0;
??Fast_Adjust_Time1_cycle_6:
        MOV       L:Flag_NEW_DEV, #0x0
//  528 		if(Temp_chenal_frist[0])
        LD        A, L:??Temp_chenal_frist
        TNZ       A
        JREQ      L:??Fast_Adjust_Time1_cycle_12
//  529 		{
//  530 			Temp_pow[0] = Pow_On;
        CALLF     L:?mov_w1_w5
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #??Temp_pow
        CALLF     L:?load32_0x_l0
//  531 			Temp_chenal_frist[0] = 0;
        MOV       L:??Temp_chenal_frist, #0x0
//  532 		}
//  533 		if((int)(Temp_pow[0]*0.8) >= Pow_On)
??Fast_Adjust_Time1_cycle_12:
        LDW       X, #??Temp_pow
        CALLF     L:?load32_l0_0x
        CALLF     L:?fcastf32u32_l0_l0
        CALLF     L:?fmul32_l0_l0_dc32
        DATA
        DC32      0x3f4ccccd
        CODE
        CALLF     L:?fcasts16f32_x_l0
        CPW       X, S:?w5
        JRC       L:??Fast_Adjust_Time1_cycle_13
//  534 		{
//  535 			//Temp_Work_cycle = (Temp_Work_cycle*(cycle-1) / cycle) + ((Temp_Work_cycle /cycle) * 0.8);
//  536 			Temp_Work_cycle = (Temp_Work_cycle*(cycle-1) / cycle) + ((Temp_Work_cycle /cycle) * 0.8);
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        CALLF     L:?fcastf32u16_l0_x
        CALLF     L:?mov_l1_l0
        LDW       X, #??Temp_Work_cycle
        CALLF     L:?load32_l0_0x
        CALLF     L:?fdiv32_l0_l0_l1
        CALLF     L:?fmul32_l0_l0_dc32
        DATA
        DC32      0x3f4ccccd
        CODE
        CALLF     L:?push_l0
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        CALLF     L:?fcastf32u16_l0_x
        CALLF     L:?mov_l3_l0
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        ADDW      X, #0xffffffffffffffff
        CALLF     L:?fcastf32s16_l0_x
        LDW       X, #??Temp_Work_cycle
        CALLF     L:?fmul32_l0_l0_0x
        CALLF     L:?mov_l1_l3
        CALLF     L:?fdiv32_l0_l0_l1
        CALLF     L:?pop_l1
        CALLF     L:?fadd32_l0_l0_l1
        LDW       X, #??Temp_Work_cycle
        CALLF     L:?load32_0x_l0
//  537 			Temp_pow[0] = (long)(Temp_pow[0] * 0.5);
        LDW       X, #??Temp_pow
        CALLF     L:?load32_l0_0x
        CALLF     L:?fcastf32u32_l0_l0
        CALLF     L:?fmul32_l0_l0_dc32
        DATA
        DC32      0x3f000000
        CODE
        CALLF     L:?fcasts32f32_l0_l0
        LDW       X, #??Temp_pow
        CALLF     L:?load32_0x_l0
        JP        L:??Fast_Adjust_Time1_cycle_14
//  538 		}
//  539 	    else if(Temp_pow[0] >= Pow_On)
??Fast_Adjust_Time1_cycle_13:
        CALLF     L:?mov_w3_w5
        CLRW      X
        LDW       S:?w2, X
        LDW       X, #??Temp_pow
        CALLF     L:?load32_l0_0x
        CALLF     L:?ucmp32_c_l0_l1
        JRC       L:??Fast_Adjust_Time1_cycle_15
//  540 		{
//  541 			Temp_Work_cycle = (Temp_Work_cycle*(cycle-1) / cycle) + ((Temp_Work_cycle /cycle) * 0.5);
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        CALLF     L:?fcastf32u16_l0_x
        CALLF     L:?mov_l1_l0
        LDW       X, #??Temp_Work_cycle
        CALLF     L:?load32_l0_0x
        CALLF     L:?fdiv32_l0_l0_l1
        CALLF     L:?fmul32_l0_l0_dc32
        DATA
        DC32      0x3f000000
        CODE
        CALLF     L:?push_l0
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        CALLF     L:?fcastf32u16_l0_x
        CALLF     L:?mov_l3_l0
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        ADDW      X, #0xffffffffffffffff
        CALLF     L:?fcastf32s16_l0_x
        LDW       X, #??Temp_Work_cycle
        CALLF     L:?fmul32_l0_l0_0x
        CALLF     L:?mov_l1_l3
        CALLF     L:?fdiv32_l0_l0_l1
        CALLF     L:?pop_l1
        CALLF     L:?fadd32_l0_l0_l1
        LDW       X, #??Temp_Work_cycle
        CALLF     L:?load32_0x_l0
//  542 			Temp_pow[0] = (long)(Temp_pow[0] * 0.2);
        LDW       X, #??Temp_pow
        CALLF     L:?load32_l0_0x
        CALLF     L:?fcastf32u32_l0_l0
        CALLF     L:?fmul32_l0_l0_dc32
        DATA
        DC32      0x3e4ccccd
        CODE
        CALLF     L:?fcasts32f32_l0_l0
        LDW       X, #??Temp_pow
        CALLF     L:?load32_0x_l0
        JRA       L:??Fast_Adjust_Time1_cycle_14
//  543 		}
//  544 	    else if(Temp_pow[0] >= Pow_On)
??Fast_Adjust_Time1_cycle_15:
        CALLF     L:?mov_w3_w5
        CLRW      X
        LDW       S:?w2, X
        LDW       X, #??Temp_pow
        CALLF     L:?load32_l0_0x
        CALLF     L:?ucmp32_c_l0_l1
        JRC       L:??Fast_Adjust_Time1_cycle_14
//  545 		{
//  546 			Temp_Work_cycle = (Temp_Work_cycle*(cycle-1) / cycle) + ((Temp_Work_cycle /cycle) * 0.2);
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        CALLF     L:?fcastf32u16_l0_x
        CALLF     L:?mov_l1_l0
        LDW       X, #??Temp_Work_cycle
        CALLF     L:?load32_l0_0x
        CALLF     L:?fdiv32_l0_l0_l1
        CALLF     L:?fmul32_l0_l0_dc32
        DATA
        DC32      0x3e4ccccd
        CODE
        CALLF     L:?push_l0
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        CALLF     L:?fcastf32u16_l0_x
        CALLF     L:?mov_l3_l0
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        ADDW      X, #0xffffffffffffffff
        CALLF     L:?fcastf32s16_l0_x
        LDW       X, #??Temp_Work_cycle
        CALLF     L:?fmul32_l0_l0_0x
        CALLF     L:?mov_l1_l3
        CALLF     L:?fdiv32_l0_l0_l1
        CALLF     L:?pop_l1
        CALLF     L:?fadd32_l0_l0_l1
        LDW       X, #??Temp_Work_cycle
        CALLF     L:?load32_0x_l0
//  547 			Temp_pow[0] = 0;
        LDW       X, #0x0
        LDW       L:??Temp_pow, X
        LDW       X, #0x0
        LDW       L:??Temp_pow + 2, X
//  548 		}
//  549 		Time1_Work_cycle = (int)Temp_Work_cycle;
??Fast_Adjust_Time1_cycle_14:
        LDW       X, #??Temp_Work_cycle
        CALLF     L:?load32_l0_0x
        CALLF     L:?fcasts16f32_x_l0
        LD        A, XL
        LD        L:Time1_Work_cycle, A
//  550 		break;
        JRA       L:??Fast_Adjust_Time1_cycle_11
//  551 	  case 2:
//  552 		Flag_NEW_DEV[1] = 0;
??Fast_Adjust_Time1_cycle_7:
        MOV       L:Flag_NEW_DEV + 1, #0x0
//  553 		break;
        JRA       L:??Fast_Adjust_Time1_cycle_11
//  554 	  case 3:
//  555 		Flag_NEW_DEV[2] = 0;
??Fast_Adjust_Time1_cycle_8:
        MOV       L:Flag_NEW_DEV + 2, #0x0
//  556 		break;
        JRA       L:??Fast_Adjust_Time1_cycle_11
//  557 	  case 4:
//  558 		Flag_NEW_DEV[3] = 0;
??Fast_Adjust_Time1_cycle_9:
        MOV       L:Flag_NEW_DEV + 3, #0x0
//  559 		break;
        JRA       L:??Fast_Adjust_Time1_cycle_11
//  560 	  case 5:
//  561 		Flag_NEW_DEV[4] = 0;
??Fast_Adjust_Time1_cycle_10:
        MOV       L:Flag_NEW_DEV + 4, #0x0
//  562 		break;
//  563 	  default:
//  564 		break;
//  565 	}
//  566 	
//  567 	if(Pow_On)
??Fast_Adjust_Time1_cycle_11:
        LDW       X, S:?w5
        TNZW      X
        JREQ      L:??Fast_Adjust_Time1_cycle_16
//  568 	{
//  569 		num1h = Time1_Work_cycle  / 256;
        CLR       S:?b1
//  570         num1l = Time1_Work_cycle  % 256;
        LD        A, L:Time1_Work_cycle
        CLRW      X
        LD        XL, A
        LDW       Y, #0x100
        CALLF     L:?smod16_y_x_y
        EXG       A, YL
        LD        S:?b0, A
        EXG       A, YL
//  571 		data = Time1_Work_cycle;
        LD        A, L:Time1_Work_cycle
        CLR       S:?b2
        LD        S:?b3, A
//  572 		TIM1_CCR1H = num1h;
        LD        A, S:?b1
        LD        L:0x5265, A
//  573 		TIM1_CCR1L = num1l;
        LD        A, S:?b0
        LD        L:0x5266, A
//  574 		TIM1_CCR2H = (TIM1_ARR - data) / 256;
        LDW       X, L:TIM1_ARR
        SUBW      X, S:?w1
        LD        A, XH
        LD        L:0x5267, A
//  575     	TIM1_CCR2L = (TIM1_ARR - data) % 256;
        LDW       X, L:TIM1_ARR
        SUBW      X, S:?w1
        LDW       Y, #0x100
        DIVW      X, Y
        LD        A, YL
        LD        L:0x5268, A
        JRA       L:??Fast_Adjust_Time1_cycle_17
//  576 	}
//  577 	else
//  578 	{
//  579 		TIM1_CCR1H = 0;
??Fast_Adjust_Time1_cycle_16:
        MOV       L:0x5265, #0x0
//  580 		TIM1_CCR1L = 0;	
        MOV       L:0x5266, #0x0
//  581 		TIM1_CCR2H = 0;
        MOV       L:0x5267, #0x0
//  582 		TIM1_CCR2L = 0;
        MOV       L:0x5268, #0x0
//  583 	}
//  584 	
//  585 	
//  586 }
??Fast_Adjust_Time1_cycle_17:
        POP       S:?b8
        CALLF     L:?pop_w5
        CALLF     L:?pop_l3
        RETF
        REQUIRE TIM1_CCR1H
        REQUIRE TIM1_CCR1L
        REQUIRE TIM1_CCR2H
        REQUIRE TIM1_CCR2L

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??Temp_pow:
        DS8 20

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??Temp_chenal:
        DS8 1

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
??Temp_chenal_frist:
        DC8 1, 0, 0, 0, 0

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??Temp_Work_cycle:
        DS8 4
//  587 
//  588 
//  589 //*********************************************************************************
//  590 /*函数名   ：Adjust_Time1_RF_4UART(unsigned char Pnumb) 						 */
//  591 /*功能     ：通过接收串口命令，修改pwm频率及占空比                               */
//  592 /*输入参数 ：Pnumb-调整电池个数即设置几个电池的占空比及频率                      */
//  593 /*返回值   ： null                                                               */
//  594 /*Time     ：2017-03-10															 */
//  595 /*Author   ：Kean																 */
//  596 /*Modify   ：null																 */
//  597 //*********************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  598 void Adjust_Time1_RF_4UART( const unsigned char commd[],const unsigned char Pnumb,const unsigned char Pfrequent,const unsigned char Pratio)
//  599 {
Adjust_Time1_RF_4UART:
        CALLF     L:?push_w4
        PUSH      S:?b10
        SUB       SP, #0x5
        LDW       S:?w1, X
        LD        S:?b9, A
        MOV       S:?b10, S:?b0
        MOV       S:?b8, S:?b1
//  600 	static int temp_frequent_value= 0;
//  601 	static int temp_ratio_value = 0;
//  602 	static int temp_product_value = 0;
//  603     unsigned char tem_comd[5] = "$cmd";
        LDW       Y, #?_1
        LDW       X, SP
        ADDW      X, #0x1
        PUSHW     X
        LD        A, #0x5
        CALLF     L:?move1616_v_x_y_a
        POPW      X
//  604 
//  605     if((strncmp((char*)commd,(char*)tem_comd,4) == 0) && ((temp_frequent_value != Pfrequent) || (temp_ratio_value != Pratio)))
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       Y, SP
        ADDW      Y, #0x1
        LDW       X, S:?w1
        CALLF     strncmp
        TNZW      X
        JREQ      ??lb_8
        JP        L:??Adjust_Time1_RF_4UART_0
??lb_8:
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        CPW       X, L:??temp_frequent_value
        JRNE      L:??Adjust_Time1_RF_4UART_1
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        CPW       X, L:??temp_ratio_value
        JREQ      L:??Adjust_Time1_RF_4UART_0
//  606 	{
//  607 		temp_frequent_value = Pfrequent;
??Adjust_Time1_RF_4UART_1:
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        LDW       L:??temp_frequent_value, X
//  608 		temp_ratio_value = Pratio;
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        LDW       L:??temp_ratio_value, X
//  609 		temp_product_value = Pnumb;
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        LDW       L:??temp_product_value, X
//  610 		
//  611 		switch(temp_product_value)
        LDW       X, L:??temp_product_value
        TNZW      X
        JREQ      L:??Adjust_Time1_RF_4UART_2
        DECW      X
        JREQ      L:??Adjust_Time1_RF_4UART_3
        DECW      X
        JREQ      L:??Adjust_Time1_RF_4UART_4
        DECW      X
        JREQ      L:??Adjust_Time1_RF_4UART_5
        DECW      X
        JREQ      L:??Adjust_Time1_RF_4UART_6
        JRA       L:??Adjust_Time1_RF_4UART_7
//  612 		{
//  613 		  case 0:
//  614 			Stor_Frequent[0] = temp_frequent_value;
??Adjust_Time1_RF_4UART_2:
        LDW       X, L:??temp_frequent_value
        LD        A, XL
        LD        L:Stor_Frequent, A
//  615 			Stor_Ratio[0] = temp_ratio_value;
        LDW       X, L:??temp_ratio_value
        LD        A, XL
        LD        L:Stor_Ratio, A
//  616 			break;
        JRA       L:??Adjust_Time1_RF_4UART_7
//  617 		  case 1: 
//  618 			Stor_Frequent[1] = temp_frequent_value;
??Adjust_Time1_RF_4UART_3:
        LDW       X, L:??temp_frequent_value
        LD        A, XL
        LD        L:Stor_Frequent + 1, A
//  619 			Stor_Ratio[1] = temp_ratio_value;
        LDW       X, L:??temp_ratio_value
        LD        A, XL
        LD        L:Stor_Ratio + 1, A
//  620 			break;
        JRA       L:??Adjust_Time1_RF_4UART_7
//  621 		  case 2: 
//  622 			Stor_Frequent[2] = temp_frequent_value;
??Adjust_Time1_RF_4UART_4:
        LDW       X, L:??temp_frequent_value
        LD        A, XL
        LD        L:Stor_Frequent + 2, A
//  623 			Stor_Ratio[2] = temp_ratio_value;
        LDW       X, L:??temp_ratio_value
        LD        A, XL
        LD        L:Stor_Ratio + 2, A
//  624 			break;
        JRA       L:??Adjust_Time1_RF_4UART_7
//  625 		  case 3:
//  626 			Stor_Frequent[3] = temp_frequent_value;
??Adjust_Time1_RF_4UART_5:
        LDW       X, L:??temp_frequent_value
        LD        A, XL
        LD        L:Stor_Frequent + 3, A
//  627 			Stor_Ratio[3] = temp_ratio_value;
        LDW       X, L:??temp_ratio_value
        LD        A, XL
        LD        L:Stor_Ratio + 3, A
//  628 			break;
        JRA       L:??Adjust_Time1_RF_4UART_7
//  629 		  case 4:
//  630 			Stor_Frequent[4] = temp_frequent_value;
??Adjust_Time1_RF_4UART_6:
        LDW       X, L:??temp_frequent_value
        LD        A, XL
        LD        L:Stor_Frequent + 4, A
//  631 			Stor_Ratio[4] = temp_ratio_value;
        LDW       X, L:??temp_ratio_value
        LD        A, XL
        LD        L:Stor_Ratio + 4, A
//  632 			break;
//  633 		  default:
//  634 			break;
//  635 		}
//  636 		Falg_F_R_Changed = 1;  
??Adjust_Time1_RF_4UART_7:
        MOV       L:Falg_F_R_Changed, #0x1
//  637 	}
//  638 }
??Adjust_Time1_RF_4UART_0:
        ADD       SP, #0x5
        POP       S:?b10
        JPF       L:?epilogue_w4

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??temp_frequent_value:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??temp_ratio_value:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??temp_product_value:
        DS8 2
//  639 
//  640 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  641 void FunDealChildPwm(const unsigned char selfNumb,const unsigned char childstatu,unsigned char *lessfull)
//  642 {
FunDealChildPwm:
        LD        S:?b1, A
        MOV       S:?b2, S:?b0
        LDW       Y, X
//  643 	unsigned char Status,Numb,num_lessfull;
//  644 	Status = childstatu;
//  645 	Numb = selfNumb;
//  646 	num_lessfull = *lessfull;
        LD        A, (Y)
        LD        S:?b0, A
//  647 	
//  648 	switch(Status)
        LD        A, S:?b2
        TNZ       A
        JREQ      L:??FunDealChildPwm_0
        DEC       A
        JREQ      L:??FunDealChildPwm_1
        DEC       A
        JRNE      ??lb_9
        JP        L:??FunDealChildPwm_2
??lb_9:
        RETF
//  649 	{
//  650 	  case 0://未充满
//  651 		if(num_lessfull >= 1)
??FunDealChildPwm_0:
        TNZ       S:?b0
        JREQ      L:??FunDealChildPwm_3
//  652 			Sum_Adjust_Time1_cycle_lessfull(Flag_RECV_ADDRESS_NUM - CNT_FULL_Num,num_lessfull);
        LDW       X, #Flag_RECV_ADDRESS_NUM
        LD        A, (X)
        SUB       A, L:CNT_FULL_Num
        JPF       Sum_Adjust_Time1_cycle_lessfull
//  653 		else
//  654 			Sum_Adjust_Time1_cycle(Flag_RECV_ADDRESS_NUM - CNT_FULL_Num);
??FunDealChildPwm_3:
        LDW       X, #Flag_RECV_ADDRESS_NUM
        LD        A, (X)
        SUB       A, L:CNT_FULL_Num
        JPF       Sum_Adjust_Time1_cycle
//  655 		
//  656 		//留作他用
//  657 		break;
//  658 	  case 1://充满
//  659 		if(Flag_FRIST_IN[Numb] == 0)
??FunDealChildPwm_1:
        CLRW      X
        LD        A, S:?b1
        LD        XL, A
        LD        A, #0x0
        CP        A, (L:Flag_FRIST_IN,X)
        JRNE      L:??FunDealChildPwm_4
//  660 		{			 
//  661 			Flag_FRIST_IN[Numb] = 1;
        CLRW      X
        LD        A, S:?b1
        LD        XL, A
        LD        A, #0x1
        LD        (L:Flag_FRIST_IN,X), A
//  662 			(*lessfull)--;
        LD        A, (Y)
        DEC       A
        LD        (Y), A
//  663 			/*20170224 电池充满后判断如果充电个数等于充满个数则将pwm调节至与初始间断发射同频但连续发射*/
//  664 			/*20170224 电池充满后判断如果充电个数不等于充满个数则将pwm降级*/
//  665 			CNT_FULL_Num++;
        LD        A, #0x1
        ADD       A, L:CNT_FULL_Num
        LD        L:CNT_FULL_Num, A
//  666 			if(CNT_FULL_Num == Flag_RECV_ADDRESS_NUM)
        LDW       X, #Flag_RECV_ADDRESS_NUM
        LD        A, (X)
        CP        A, L:CNT_FULL_Num
        JRNE      L:??FunDealChildPwm_5
//  667 			{
//  668 				Adjust_Time1_cycle2(0);
        CLR       A
        JPF       Adjust_Time1_cycle2
//  669 			}
//  670 			else if(num_lessfull >= 1)
??FunDealChildPwm_5:
        TNZ       S:?b0
        JREQ      L:??FunDealChildPwm_6
//  671 				Sum_Adjust_Time1_cycle_lessfull(Flag_RECV_ADDRESS_NUM - CNT_FULL_Num,num_lessfull);
        LDW       X, #Flag_RECV_ADDRESS_NUM
        LD        A, (X)
        SUB       A, L:CNT_FULL_Num
        JPF       Sum_Adjust_Time1_cycle_lessfull
//  672 			else
//  673 				Sum_Adjust_Time1_cycle(Flag_RECV_ADDRESS_NUM - CNT_FULL_Num);
??FunDealChildPwm_6:
        LDW       X, #Flag_RECV_ADDRESS_NUM
        LD        A, (X)
        SUB       A, L:CNT_FULL_Num
        JPF       Sum_Adjust_Time1_cycle
//  674 		}
//  675 		else if(CNT_FULL_Num == Flag_RECV_ADDRESS_NUM)
??FunDealChildPwm_4:
        LDW       X, #Flag_RECV_ADDRESS_NUM
        LD        A, (X)
        CP        A, L:CNT_FULL_Num
        JRNE      L:??FunDealChildPwm_7
//  676 			Adjust_Time1_cycle2(0);
        CLR       A
        JPF       Adjust_Time1_cycle2
//  677 		else if(num_lessfull >= 1)
??FunDealChildPwm_7:
        TNZ       S:?b0
        JREQ      L:??FunDealChildPwm_8
//  678 			Sum_Adjust_Time1_cycle_lessfull(Flag_RECV_ADDRESS_NUM - CNT_FULL_Num,num_lessfull);
        LDW       X, #Flag_RECV_ADDRESS_NUM
        LD        A, (X)
        SUB       A, L:CNT_FULL_Num
        JPF       Sum_Adjust_Time1_cycle_lessfull
//  679 		else
//  680 			Sum_Adjust_Time1_cycle(Flag_RECV_ADDRESS_NUM-CNT_FULL_Num);
??FunDealChildPwm_8:
        LDW       X, #Flag_RECV_ADDRESS_NUM
        LD        A, (X)
        SUB       A, L:CNT_FULL_Num
        JPF       Sum_Adjust_Time1_cycle
//  681 		//留作其他使用
//  682 		
//  683 		break;
//  684 	  case 2:
//  685 		Falg_Bettery_Lessfull[Numb] = 1;	
??FunDealChildPwm_2:
        CLRW      X
        LD        A, S:?b1
        LD        XL, A
        LD        A, #0x1
        LD        (L:Falg_Bettery_Lessfull,X), A
//  686 		//Flag_lessfull_bool = 1;
//  687 		Sum_Adjust_Time1_cycle_lessfull(Flag_RECV_ADDRESS_NUM - CNT_FULL_Num,num_lessfull);
        LDW       X, #Flag_RECV_ADDRESS_NUM
        LD        A, (X)
        SUB       A, L:CNT_FULL_Num
        JPF       Sum_Adjust_Time1_cycle_lessfull
//  688 		break;
//  689 	  default:
//  690 		break;									  
//  691 	}	
//  692 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_0:
        DC8 "set_success_%d!"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_1:
        DC8 "$cmd"

        END
// 
// 2 713 bytes in section .far_func.text
//    32 bytes in section .near.bss
//     5 bytes in section .near.data
//    10 bytes in section .near.noinit   (abs)
//    21 bytes in section .near.rodata
// 
// 2 713 bytes of CODE  memory
//    21 bytes of CONST memory
//    37 bytes of DATA  memory (+ 10 bytes shared)
//
//Errors: none
//Warnings: none
