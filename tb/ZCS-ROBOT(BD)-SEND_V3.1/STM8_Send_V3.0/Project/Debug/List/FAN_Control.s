///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.20.1.176 for STM8                29/Mar/2017  16:23:49
// Copyright 2010-2015 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        E:\2017ƒÍπ§◊˜ƒ⁄»›\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\FAN_Control.c
//    Command line =  
//        "E:\2017ƒÍπ§◊˜ƒ⁄»›\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\FAN_Control.c"
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
//        E:\2017ƒÍπ§◊˜ƒ⁄»›\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List\FAN_Control.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ACTemp_DD
        EXTERN CNT_Fan_Open
        EXTERN Flag_Fan_First
        EXTERN Flag_Fan_Open
        EXTERN Time1_Work_cycle

        PUBLIC FAN_Control
        PUBLIC Fan_Adjust_Temp
        PUBLIC Fan_Adjust_Time
        PUBLIC Fan_Close
        PUBLIC Fan_Open
        PUBLIC _A_PD_ODR

// E:\2017ƒÍπ§◊˜ƒ⁄»›\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\FAN_Control.c
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
//   20 #include "iostm8s105c6.h"

        ASEGN `.near.noinit`:DATA:NOROOT,0500fH
        SECTION_GROUP _A_PD_ODR
// union <unnamed> volatile _A_PD_ODR
_A_PD_ODR:
        DS8 1

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
Fan_Close:
        BRES      L:0x500f, #0x3
        MOV       L:Flag_Fan_Open, #0x0
        RETF
        REQUIRE _A_PD_ODR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
Fan_Open:
        BSET      L:0x500f, #0x3
        MOV       L:Flag_Fan_Open, #0x1
        RETF
        REQUIRE _A_PD_ODR
//   21 #include "RAM.h"
//   22 #include "FAN_Control.h"
//   23 
//   24 //******************************************************************************
//   25 /*È£éÊâáÊéßÂà∂*/
//   26 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//   27 void  FAN_Control(void)
//   28 {
//   29     if(Time1_Work_cycle > 0)
FAN_Control:
        LD        A, L:Time1_Work_cycle
        TNZ       A
        JREQ      L:??FAN_Control_0
//   30     {
//   31         Fan_Open();
        JPF       Fan_Open
//   32     }
//   33     else
//   34     {
//   35         Fan_Close();
??FAN_Control_0:
        JPF       Fan_Close
//   36     }
//   37 }
//   38 //******************************************************************************
//   39 
//   40 
//   41 //******************************************************************************
//   42 /*ÊâìÂºÄÈ£éÊâá*/
//   43 //******************************************************************************
//   44 void  Fan_Open(void)
//   45 {
//   46     PD_ODR_ODR3 = 1;
//   47     Flag_Fan_Open = 1;
//   48 }
//   49 //******************************************************************************
//   50 
//   51 
//   52 //******************************************************************************
//   53 /*ÂÖ≥Èó≠È£éÊâá*/
//   54 //******************************************************************************
//   55 void  Fan_Close(void)
//   56 {
//   57     PD_ODR_ODR3 = 0;
//   58     Flag_Fan_Open = 0;
//   59 }
//   60 //******************************************************************************
//   61 
//   62 
//   63 //******************************************************************************
//   64 /*Ê†πÊçÆÊ∏©Â∫¶ÊéßÂà∂È£éÊâá*/
//   65 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//   66 void  Fan_Adjust_Temp(void)
//   67 {
//   68     if(ACTemp_DD >= C_Maximum_Temp1)
Fan_Adjust_Temp:
        LDW       X, L:ACTemp_DD
        CPW       X, #0x37
        JRC       L:??Fan_Adjust_Temp_0
//   69     {
//   70         Fan_Open();
        JPF       Fan_Open
//   71     }
//   72     else if(ACTemp_DD <= C_Minimum_Temp1)
??Fan_Adjust_Temp_0:
        LDW       X, L:ACTemp_DD
        CPW       X, #0x33
        JRNC      L:??Fan_Adjust_Temp_1
//   73     {
//   74         Fan_Close();
        CALLF     Fan_Close
//   75     }     
//   76 }
??Fan_Adjust_Temp_1:
        RETF
//   77 //******************************************************************************
//   78 
//   79 
//   80 //******************************************************************************
//   81 /*Ê†πÊçÆÊó∂Èó¥ÊéßÂà∂È£éÊâá*/
//   82 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   83 void  Fan_Adjust_Time(void)
//   84 {
//   85       if(Flag_Fan_First ==1)
Fan_Adjust_Time:
        LD        A, #0x1
        CP        A, L:Flag_Fan_First
        JRNE      L:??Fan_Adjust_Time_0
//   86       {
//   87            if(CNT_Fan_Open < C_Fan_Close)
        LDW       X, L:CNT_Fan_Open
        CPW       X, #0x4b0
        JRNC      L:??Fan_Adjust_Time_1
//   88            {
//   89                 CNT_Fan_Open++;
        LDW       X, L:CNT_Fan_Open
        INCW      X
        LDW       L:CNT_Fan_Open, X
        RETF
//   90            }
//   91            else
//   92            {
//   93                 Flag_Fan_First =0;
??Fan_Adjust_Time_1:
        MOV       L:Flag_Fan_First, #0x0
        RETF
//   94            }           
//   95       }
//   96       else
//   97       {
//   98           Fan_Close();
??Fan_Adjust_Time_0:
        JPF       Fan_Close
//   99       }
//  100 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  101 /*******************************************************************************
//  102 -----------------------------    End of file    --------------------------------
//  103 *******************************************************************************/
// 
// 89 bytes in section .far_func.text
//  1 byte  in section .near.noinit   (abs)
// 
// 89 bytes of CODE memory
//  0 bytes of DATA memory (+ 1 byte shared)
//
//Errors: none
//Warnings: none
