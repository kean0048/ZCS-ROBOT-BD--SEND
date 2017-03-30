///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.20.1.176 for STM8                29/Mar/2017  16:24:29
// Copyright 2010-2015 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\Buzz.c
//    Command line =  
//        "E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\Buzz.c"
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
//        E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List\Buzz.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN Buzz_Buffer
        EXTERN Buzz_Control
        EXTERN Buzz_Keep_CNT
        EXTERN Buzz_Step
        EXTERN Buzz_Times_CNT
        EXTERN CNT_Buzzer
        EXTERN Command_Old
        EXTERN _A_Flag_10ms_1

        PUBLIC BuzzChange
        PUBLIC BuzzDriver
        PUBLIC BuzzInit
        PUBLIC BuzzStart
        PUBLIC BuzzStop
        PUBLIC Buzzer
        PUBLIC BuzzerNewOld
        PUBLIC _A_PD_ODR

// E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\Buzz.c
//    1 /******************************************************************************/
//    2 /*					                                      */
//    3 /*	Project Name :	发射机		                                      */
//    4 /*	Version      :	1.0			                              */
//    5 /*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
//    6 /*	Clock        :	16MHz			                              */
//    7 /*	Author	     :	mengzhuozhuo   		                              */
//    8 /*      Date	     :	2016/04/26	                                      */
//    9 /*	Corporation  :	中惠创智（深圳）无线供电技术有限公司                   */
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

        ASEGN `.near.noinit`:DATA:NOROOT,0500fH
        SECTION_GROUP _A_PD_ODR
// union <unnamed> volatile _A_PD_ODR
_A_PD_ODR:
        DS8 1

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
BuzzStart:
        BSET      L:0x500f, #0x4
        RETF
        REQUIRE _A_PD_ODR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
BuzzDriver:
        CP        A, L:Command_Old
        JREQ      L:??BuzzDriver_0
        LD        L:Command_Old, A
        LD        A, #0x1
        CP        A, L:Command_Old
        JRNE      L:??BuzzDriver_1
        JPF       BuzzStart
??BuzzDriver_1:
        LD        A, L:Command_Old
        TNZ       A
        JRNE      L:??BuzzDriver_0
        CALLF     BuzzStop
??BuzzDriver_0:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
BuzzChange:
        LD        S:?b2, A
        LDW       X, #Buzz_Step
        LD        A, (X)
        TNZ       A
        JREQ      L:??BuzzChange_0
        DEC       A
        JREQ      L:??BuzzChange_1
        JRA       L:??BuzzChange_2
??BuzzChange_0:
        LD        A, #0x1
        ADD       A, L:Buzz_Keep_CNT
        LD        L:Buzz_Keep_CNT, A
        LD        A, S:?b2
        CP        A, L:Buzz_Keep_CNT
        JRNC      L:??BuzzChange_3
        MOV       L:Buzz_Keep_CNT, #0x0
        LD        A, #0x1
        ADD       A, L:Buzz_Times_CNT
        LD        L:Buzz_Times_CNT, A
        LDW       X, #Buzz_Times_CNT
        LD        A, (X)
        CP        A, S:?b1
        JRC       L:??BuzzChange_4
        MOV       L:Buzz_Times_CNT, #0x0
        MOV       L:Buzz_Buffer, #0x0
        MOV       L:Buzz_Step, #0x0
        CLR       A
        JPF       BuzzDriver
??BuzzChange_4:
        MOV       L:Buzz_Step, #0x1
        CLR       A
        JPF       BuzzDriver
??BuzzChange_3:
        LD        A, #0x1
        JPF       BuzzDriver
??BuzzChange_1:
        LD        A, #0x1
        ADD       A, L:Buzz_Keep_CNT
        LD        L:Buzz_Keep_CNT, A
        LDW       X, #Buzz_Keep_CNT
        LD        A, (X)
        CP        A, S:?b0
        JRC       L:??BuzzChange_5
        MOV       L:Buzz_Keep_CNT, #0x0
        MOV       L:Buzz_Step, #0x0
        LDW       X, #Buzz_Times_CNT
        LD        A, (X)
        CP        A, S:?b1
        JRNC      L:??BuzzChange_5
        LD        A, #0x1
        CALLF     BuzzDriver
        LD        A, #0x1
        ADD       A, L:Buzz_Keep_CNT
        LD        L:Buzz_Keep_CNT, A
        RETF
??BuzzChange_2:
        MOV       L:Buzz_Step, #0x0
        MOV       L:Buzz_Buffer, #0x0
        CLR       A
        CALLF     BuzzDriver
??BuzzChange_5:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
BuzzerNewOld:
        LD        A, L:Buzz_Control
        TNZ       A
        JREQ      L:??BuzzerNewOld_0
        MOV       L:Buzz_Times_CNT, #0x0
        MOV       L:Buzz_Keep_CNT, #0x0
        MOV       L:Buzz_Step, #0x0
        MOV       L:Buzz_Buffer, #0x0
        CLR       A
        CALLF     BuzzDriver
        LD        A, #0x1
        ADD       A, L:CNT_Buzzer
        LD        L:CNT_Buzzer, A
        LDW       X, #CNT_Buzzer
        LD        A, (X)
        CP        A, #0x5
        JRC       L:??BuzzerNewOld_0
        MOV       L:CNT_Buzzer, #0x0
        MOV       L:Buzz_Buffer, L:Buzz_Control
        MOV       L:Buzz_Control, #0x0
??BuzzerNewOld_0:
        RETF
//   21 #include "Buzz.h"
//   22 //******************************************************************************
//   23 //蜂鸣器函数
//   24 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   25 void  Buzzer(void)
//   26 {	
//   27     if(Flag_10ms_F ==1)
Buzzer:
        LD        A, L:_A_Flag_10ms_1
        SRL       A
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JRNE      ??lb_0
        JP        L:??Buzzer_0
//   28     {
//   29         Flag_10ms_F = 0;
??lb_0:
        BRES      L:_A_Flag_10ms_1, #0x2
//   30         BuzzerNewOld();
        CALLF     BuzzerNewOld
//   31         switch (Buzz_Buffer)
        LDW       X, #Buzz_Buffer
        LD        A, (X)
        DEC       A
        JREQ      L:??Buzzer_1
        DEC       A
        JREQ      L:??Buzzer_2
        DEC       A
        JREQ      L:??Buzzer_3
        DEC       A
        JREQ      L:??Buzzer_4
        DEC       A
        JREQ      L:??Buzzer_5
        DEC       A
        JRNE      ??lb_1
        JP        L:??Buzzer_6
??lb_1:
        DEC       A
        JRNE      ??lb_2
        JP        L:??Buzzer_7
??lb_2:
        DEC       A
        JRNE      ??lb_3
        JP        L:??Buzzer_8
??lb_3:
        DEC       A
        JRNE      ??lb_4
        JP        L:??Buzzer_9
??lb_4:
        DEC       A
        JRNE      ??lb_5
        JP        L:??Buzzer_10
??lb_5:
        DEC       A
        JRNE      ??lb_6
        JP        L:??Buzzer_11
??lb_6:
        DEC       A
        JRNE      ??lb_7
        JP        L:??Buzzer_12
??lb_7:
        JP        L:??Buzzer_13
//   32         {
//   33             case  BUZZ_POWER_ON://上电
//   34                 BuzzChange(30,0,1);
??Buzzer_1:
        MOV       S:?b1, #0x1
        CLR       S:?b0
        LD        A, #0x1e
        JPF       BuzzChange
//   35                 break;
//   36             case  BUZZ_KEY_ON://按键
//   37                 BuzzChange(10,0,1);
??Buzzer_2:
        MOV       S:?b1, #0x1
        CLR       S:?b0
        LD        A, #0xa
        JPF       BuzzChange
//   38                 break;
//   39             case  BUZZ_IN_Error_0://igbt超温 1长2短
//   40                 BuzzChange(60,20,1);
??Buzzer_3:
        MOV       S:?b1, #0x1
        MOV       S:?b0, #0x14
        LD        A, #0x3c
        CALLF     BuzzChange
//   41 				BuzzChange(20,30,2);
        MOV       S:?b1, #0x2
        MOV       S:?b0, #0x1e
        LD        A, #0x14
        JPF       BuzzChange
//   42                 break;
//   43             case  BUZZ_IN_Error_1://COIL超温 1长3短
//   44                 BuzzChange(60,20,1);
??Buzzer_4:
        MOV       S:?b1, #0x1
        MOV       S:?b0, #0x14
        LD        A, #0x3c
        CALLF     BuzzChange
//   45 				BuzzChange(20,30,3);
        MOV       S:?b1, #0x3
        MOV       S:?b0, #0x1e
        LD        A, #0x14
        JPF       BuzzChange
//   46                 break;
//   47 			case  BUZZ_IN_Error_2: //IGBT上管饱和出错报警  4短声
//   48               	BuzzChange(20,30,4);  
??Buzzer_5:
        MOV       S:?b1, #0x4
        MOV       S:?b0, #0x1e
        LD        A, #0x14
        JPF       BuzzChange
//   49                 break;
//   50 			case  BUZZ_IN_Error_3: //IGBT下管饱和出错报警 4短声
//   51 			  	BuzzChange(20,30,4);                
??Buzzer_6:
        MOV       S:?b1, #0x4
        MOV       S:?b0, #0x1e
        LD        A, #0x14
        JPF       BuzzChange
//   52                 break;
//   53             case  BUZZ_IN_Error_4://输入电压采样超 1长1短
//   54                 BuzzChange(60,20,1);
??Buzzer_7:
        MOV       S:?b1, #0x1
        MOV       S:?b0, #0x14
        LD        A, #0x3c
        CALLF     BuzzChange
//   55 				BuzzChange(20,30,1);
        MOV       S:?b1, #0x1
        MOV       S:?b0, #0x1e
        LD        A, #0x14
        JPF       BuzzChange
//   56                 break;
//   57             case  BUZZ_IN_Error_5://输入电流采样超 1长1短
//   58                 BuzzChange(60,20,1);
??Buzzer_8:
        MOV       S:?b1, #0x1
        MOV       S:?b0, #0x14
        LD        A, #0x3c
        CALLF     BuzzChange
//   59 				BuzzChange(20,30,1);
        MOV       S:?b1, #0x1
        MOV       S:?b0, #0x1e
        LD        A, #0x14
        JPF       BuzzChange
//   60                 break;
//   61 			case  BUZZ_IN_Error_6:////线圈LC谐振回路超压出错报警
//   62                 BuzzChange(20,30,1);
??Buzzer_9:
        MOV       S:?b1, #0x1
        MOV       S:?b0, #0x1e
        LD        A, #0x14
        JPF       BuzzChange
//   63 				break;
//   64 			case  BUZZ_IN_Error_7:////线圈电流过高出错报警
//   65                 BuzzChange(20,30,2);
??Buzzer_10:
        MOV       S:?b1, #0x2
        MOV       S:?b0, #0x1e
        LD        A, #0x14
        JPF       BuzzChange
//   66                 break;	
//   67             case  BUZZ_IN_Error_8://效率异常
//   68                 BuzzChange(20,30,5); 
??Buzzer_11:
        MOV       S:?b1, #0x5
        MOV       S:?b0, #0x1e
        LD        A, #0x14
        JPF       BuzzChange
//   69                 break;
//   70             case  BUZZ_IN_Error_9://通信异常
//   71                 BuzzChange(20,30,6);
??Buzzer_12:
        MOV       S:?b1, #0x6
        MOV       S:?b0, #0x1e
        LD        A, #0x14
        JPF       BuzzChange
//   72                 break;
//   73 				
//   74             default:
//   75                 Buzz_Buffer = 0;
??Buzzer_13:
        MOV       L:Buzz_Buffer, #0x0
//   76                 break;
//   77         }
//   78     }
//   79 }
??Buzzer_0:
        RETF
//   80 //******************************************************************************
//   81 
//   82 
//   83 //******************************************************************************
//   84 //蜂鸣器函数
//   85 //******************************************************************************
//   86 void  BuzzerNewOld(void)
//   87 {
//   88     if(Buzz_Control != 0)//说明有新的蜂鸣器来了
//   89     {
//   90         Buzz_Times_CNT = 0;
//   91         Buzz_Keep_CNT = 0;
//   92         Buzz_Step = 0;
//   93         Buzz_Buffer = 0;
//   94         BuzzDriver(BUZZ_CLOSE);
//   95         CNT_Buzzer++;
//   96         if(CNT_Buzzer >= 5)//延时10*5＝50ms
//   97         {
//   98             CNT_Buzzer = 0;
//   99             Buzz_Buffer = Buzz_Control;
//  100             Buzz_Control = 0;
//  101         }
//  102     }
//  103 }
//  104 //******************************************************************************
//  105 
//  106 
//  107 //******************************************************************************
//  108 //蜂鸣器初始化函数
//  109 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  110 void  BuzzInit(void)//要解锁后执行
//  111 {
//  112     //unsigned char i;
//  113     Command_Old = 0XFF;
BuzzInit:
        MOV       L:Command_Old, #0xff
//  114     //Buzz_Control = BUZZ_POWER_ON;
//  115     /*
//  116     FLASH_CR2 = 0x80;
//  117     i=10;
//  118     while(i--);
//  119     FLASH_NCR2 = 0x7f;
//  120     i=10;
//  121     while(i--);
//  122     *((unsigned char *)0x4803) = 0x80;
//  123     i=10;
//  124     while(i--);
//  125     *((unsigned char *)0x4804) = 0x7f;
//  126     BEEP_CSR=0X02;
//  127     */
//  128 }
        RETF
//  129 //******************************************************************************
//  130 
//  131 
//  132 //******************************************************************************
//  133 //蜂鸣器函数
//  134 //******************************************************************************
//  135 void  BuzzChange(unsigned char Buzz_On,unsigned char Buzz_Off,unsigned char Buzz_Times)
//  136 {
//  137     switch (Buzz_Step)
//  138     {
//  139         case  0://on
//  140             Buzz_Keep_CNT++;
//  141             if (Buzz_Keep_CNT > Buzz_On)
//  142             {
//  143                 Buzz_Keep_CNT = 0;                
//  144                 Buzz_Times_CNT++;
//  145                 if (Buzz_Times_CNT >= Buzz_Times)
//  146                 {
//  147                     Buzz_Times_CNT = 0;
//  148                     Buzz_Buffer = 0;
//  149                     Buzz_Step = 0;
//  150                     BuzzDriver(BUZZ_CLOSE);
//  151                 }
//  152                 else
//  153                 {
//  154                     Buzz_Step = 1;//on to off
//  155                     BuzzDriver(BUZZ_CLOSE);
//  156                 }
//  157             }
//  158             else
//  159             {
//  160                 BuzzDriver(BUZZ_OPEN);
//  161             }
//  162             break;
//  163         case  1://off
//  164             Buzz_Keep_CNT++;
//  165             if (Buzz_Keep_CNT >= Buzz_Off)  
//  166             {
//  167                 Buzz_Keep_CNT = 0;
//  168                 Buzz_Step = 0;//off to on
//  169                 if (Buzz_Times_CNT < Buzz_Times)
//  170                 {
//  171                     BuzzDriver(BUZZ_OPEN);      
//  172                     Buzz_Keep_CNT++;            
//  173                 }
//  174             }
//  175             break;
//  176         default:
//  177             Buzz_Step = 0;
//  178             Buzz_Buffer = 0;
//  179             BuzzDriver(BUZZ_CLOSE);
//  180             break;
//  181     }
//  182 }
//  183 //******************************************************************************
//  184 
//  185 
//  186 //******************************************************************************
//  187 //蜂鸣器函数
//  188 //******************************************************************************
//  189 void  BuzzDriver(unsigned char Command_New)
//  190 {
//  191     if (Command_Old != Command_New)
//  192     {
//  193         Command_Old = Command_New;
//  194         if (Command_Old == BUZZ_OPEN)
//  195         {
//  196             BuzzStart();
//  197         }
//  198         else if (Command_Old == BUZZ_CLOSE)
//  199         {
//  200             BuzzStop();
//  201         }
//  202     }
//  203 }
//  204 //******************************************************************************
//  205 
//  206 
//  207 //******************************************************************************
//  208 //开启蜂鸣器函数
//  209 //******************************************************************************
//  210 void  BuzzStart(void)
//  211 {
//  212     //BEEP_CSR_BEEPEN =1;
//  213     PD_ODR_ODR4 =1;
//  214 }
//  215 //******************************************************************************
//  216 
//  217 
//  218 //******************************************************************************
//  219 //关闭蜂鸣器函数
//  220 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  221 void  BuzzStop(void)
//  222 {
//  223     //BEEP_CSR_BEEPEN =0;
//  224     PD_ODR_ODR4 =0;
BuzzStop:
        BRES      L:0x500f, #0x4
//  225 }
        RETF
        REQUIRE _A_PD_ODR

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  226 /*******************************************************************************
//  227 -----------------------------    End of file    --------------------------------
//  228 *******************************************************************************/
// 
// 555 bytes in section .far_func.text
//   1 byte  in section .near.noinit   (abs)
// 
// 555 bytes of CODE memory
//   0 bytes of DATA memory (+ 1 byte shared)
//
//Errors: none
//Warnings: none
