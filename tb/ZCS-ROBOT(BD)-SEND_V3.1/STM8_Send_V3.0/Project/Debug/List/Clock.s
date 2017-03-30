///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.20.1.176 for STM8                29/Mar/2017  16:23:49
// Copyright 2010-2015 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        E:\2017ƒÍπ§◊˜ƒ⁄»›\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\Clock.c
//    Command line =  
//        "E:\2017ƒÍπ§◊˜ƒ⁄»›\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\Clock.c"
//        -e -Ol --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_cross_call --debug --code_model medium --data_model medium -o
//        "E:\2017ƒÍπ§◊˜ƒ⁄»›\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\Obj"
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.3\stm8\LIB\dlstm8mmn.h" -lB
//        "E:\2017ƒÍπ§◊˜ƒ⁄»›\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List"
//        -I
//        "E:\2017ƒÍπ§◊˜ƒ⁄»›\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\..\USER\"
//        -I "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.3\stm8\inc\" --vregs 16
//    List file    =  
//        E:\2017ƒÍπ§◊˜ƒ⁄»›\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List\Clock.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?w0
        EXTERN ?w1
        EXTERN CNT_T1hour
        EXTERN CNT_T1min
        EXTERN CNT_T2s
        EXTERN CNT_T500ms
        EXTERN Flag_1hour_A
        EXTERN Flag_Mac_On2s
        EXTERN Flag_RestartEhours
        EXTERN MacStatus
        EXTERN UART_Process
        EXTERN _A_Flag_10ms_1
        EXTERN _A_Flag_10ms_2
        EXTERN _delay_us
        EXTERN flag_p

        PUBLIC Clock

// E:\2017ƒÍπ§◊˜ƒ⁄»›\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\Clock.c
//    1 /******************************************************************************/
//    2 /*					                                      */
//    3 /*	Project Name :	ÂèëÂ∞ÑÊú∫		                                      */
//    4 /*	Version      :	1.0			                              */
//    5 /*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
//    6 /*	Clock        :	16MHz			                              */
//    7 /*	Author	     :	mengzhuozhuo   		                              */
//    8 /*      Date	     :	2016/04/26	                                      */
//    9 /*	Corporation  :	‰∏≠ÊÉ†ÂàõÊô∫ÔºàÊ∑±Âú≥ÔºâÊó†Á∫ø‰æõÁîµÊäÄÊúØÊúâÈôêÂÖ¨Âè∏                   */
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
//   21 #include "Clock.h"
//   22 #include "uart.h"
//   23 #include "delayTime.h"
//   24 //******************************************************************************
//   25 //Êó∂ÈíüÂáΩÊï∞
//   26 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   27 void Clock(void)//Êó∂Èó¥
//   28 {
//   29 //***********************************************
//   30 
//   31 //***********************************************
//   32 //‰∏äÁîµ2ÁßíÂêéÂºÄÂßãÂ∑•‰Ωú   
//   33     if(Flag_10ms_K ==1)
Clock:
        LD        A, L:_A_Flag_10ms_2
        SWAP      A
        AND       A, #0xf
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??Clock_0
//   34     {
//   35         Flag_10ms_K =0;
        BRES      L:_A_Flag_10ms_2, #0x5
//   36         CNT_T2s++;
        LDW       X, L:CNT_T2s
        INCW      X
        LDW       L:CNT_T2s, X
//   37         if(CNT_T2s >= 50)
        LDW       X, L:CNT_T2s
        CPW       X, #0x32
        JRC       L:??Clock_0
//   38         {
//   39             CNT_T2s =0;
        CLRW      X
        LDW       L:CNT_T2s, X
//   40             Flag_Mac_On2s = 1;
        MOV       L:Flag_Mac_On2s, #0x1
//   41         }
//   42     }
//   43 //***********************************************
//   44 //500msËØªÂèñ‰∏ÄÊ¨°‰∏≤Âè£Êï∞ÊçÆÔºåÂ¶ÇÊûúÊ≤°Ê≥ïÈÄÅÊï∞ÊçÆÂàô‰∏çËÉΩËØªÂèñÊàêÂäü20170301 
//   45     if(Flag_10ms_I == 1)
??Clock_0:
        BTJF      L:_A_Flag_10ms_2, #0x7, L:??Clock_1
//   46     {
//   47         Flag_10ms_I =0;
        BRES      L:_A_Flag_10ms_2, #0x7
//   48         if(MacStatus == C_MSNORMAL)
        LD        A, #0x5
        CP        A, L:MacStatus
        JRNE      L:??Clock_1
//   49         {
//   50             CNT_T500ms++;
        LD        A, #0x1
        ADD       A, L:CNT_T500ms
        LD        L:CNT_T500ms, A
//   51             //if((CNT_T500ms >= 50) && UART2_SR_RXNE)
//   52 			if(CNT_T500ms >= 10)
        LDW       X, #CNT_T500ms
        LD        A, (X)
        CP        A, #0xa
        JRC       L:??Clock_1
//   53             {
//   54 				_delay_us(5);
        LDW       X, #0x5
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALLF     _delay_us
//   55                 UART_Process();
        CALLF     UART_Process
//   56                 CNT_T500ms =0;
        MOV       L:CNT_T500ms, #0x0
//   57                 //UART2_SR_RXNE = 0;
//   58             }
//   59         }
//   60     }
//   61 //***********************************************
//   62 //‰øùÂØÜÂäüËÉΩËÆ°Êó∂1Â∞èÊó∂
//   63     if(Flag_10ms_G == 1)
??Clock_1:
        LD        A, L:_A_Flag_10ms_1
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??Clock_2
//   64     {
//   65         Flag_10ms_G =0;
        BRES      L:_A_Flag_10ms_1, #0x1
//   66         CNT_T1min++;
        LDW       X, L:CNT_T1min
        INCW      X
        LDW       L:CNT_T1min, X
//   67         if(CNT_T1min >= 6000)
        LDW       X, L:CNT_T1min
        CPW       X, #0x1770
        JRC       L:??Clock_2
//   68         {
//   69             CNT_T1min =0;
        CLRW      X
        LDW       L:CNT_T1min, X
//   70             CNT_T1hour++;
        LDW       X, L:CNT_T1hour
        INCW      X
        LDW       L:CNT_T1hour, X
//   71             if(CNT_T1hour >= 60)
        LDW       X, L:CNT_T1hour
        CPW       X, #0x3c
        JRC       L:??Clock_2
//   72             {
//   73                 CNT_T1hour =0;
        CLRW      X
        LDW       L:CNT_T1hour, X
//   74                 Flag_1hour_A =1;
        MOV       L:Flag_1hour_A, #0x1
//   75 				if(Flag_RestartEhours == 1)
        LD        A, #0x1
        CP        A, L:Flag_RestartEhours
        JRNE      L:??Clock_2
//   76 				{
//   77 					flag_p = 6; //ÊØèÈöî‰∏ÄÂ∞èÊó∂ÂÅúÊ≠¢ÂñÇÁãóÔºåÁ≥ªÁªüÈáçÂêØ
        MOV       L:flag_p, #0x6
//   78 					Flag_RestartEhours = 0;
        MOV       L:Flag_RestartEhours, #0x0
//   79 				}
//   80             }
//   81         }
//   82     }    
//   83 }
??Clock_2:
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   84 
//   85 /*******************************************************************************
//   86 -----------------------------    End of file    --------------------------------
//   87 *******************************************************************************/
// 
// 164 bytes in section .far_func.text
// 
// 164 bytes of CODE memory
//
//Errors: none
//Warnings: none
