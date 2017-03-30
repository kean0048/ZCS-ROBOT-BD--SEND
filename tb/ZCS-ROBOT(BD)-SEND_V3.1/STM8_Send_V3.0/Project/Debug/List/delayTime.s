///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.20.1.176 for STM8                29/Mar/2017  16:23:49
// Copyright 2010-2015 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\delayTime.c
//    Command line =  
//        "E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\delayTime.c"
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
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List\delayTime.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?dec32_l0_l0
        EXTERN ?dec32_l2_l2
        EXTERN ?epilogue_l2
        EXTERN ?mov_l0_l1
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l1_l0
        EXTERN ?mov_l2_l0
        EXTERN ?push_l2
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3

        PUBLIC _delay_1_ms
        PUBLIC _delay_ms
        PUBLIC _delay_us

// E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\delayTime.c
//    1 #include "type_def.h"
//    2 #include "delayTime.h"
//    3 
//    4 
//    5 //******************************************************************************
//    6 //延时函数0us
//    7 //******************************************************************************
//    8 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    9 void _delay_us(unsigned long us)
//   10 {
_delay_us:
        JRA       L:??_delay_us_0
//   11     while(us--)
//   12     {
//   13 #if (FOSC==FOSC_24M)
//   14     	asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");
//   15     	asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");
//   16     	asm("NOP");asm("NOP");asm("NOP");asm("NOP");//asm("NOP");asm("NOP");
//   17 #elif (FOSC==FOSC_16M)
//   18     	asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");
??_delay_us_1:
        NOP
        NOP
        NOP
        NOP
        NOP
//   19     	asm("NOP");asm("NOP");asm("NOP");//asm("NOP");asm("NOP");
        NOP
        NOP
        NOP
//   20 #elif (FOSC==FOSC_8M)
//   21     	//asm("NOP");asm("NOP");    
//   22 #elif (FOSC==FOSC_4M)
//   23     	#error "不支持8M以下频率"   
//   24 #else
//   25 		#error "没有定义主时钟频率"
//   26 #endif
//   27     }
??_delay_us_0:
        CALLF     L:?mov_l1_l0
        CALLF     L:?mov_l0_l1
        CALLF     L:?dec32_l0_l0
        LDW       X, S:?w2
        CPW       X, #0x0
        JRNE      L:??_delay_us_2
        LDW       X, S:?w3
        CPW       X, #0x0
??_delay_us_2:
        JRNE      L:??_delay_us_1
//   28 }
        RETF
//   29 //******************************************************************************
//   30 //延时函数1ms
//   31 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   32 void _delay_1_ms(void)
//   33 {
//   34     unsigned long cnt=1000;
_delay_1_ms:
        LDW       X, #0x3e8
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        JRA       L:??_delay_1_ms_0
//   35     while(cnt--)
//   36 	{
//   37 #if (FOSC==FOSC_24M)
//   38     	asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");
//   39     	asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");
//   40     	asm("NOP");asm("NOP");asm("NOP");asm("NOP");//asm("NOP");asm("NOP");
//   41 #elif (FOSC==FOSC_16M)
//   42     	asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");
??_delay_1_ms_1:
        NOP
        NOP
        NOP
        NOP
        NOP
//   43     	asm("NOP");asm("NOP");asm("NOP");//asm("NOP");asm("NOP");
        NOP
        NOP
        NOP
//   44 #elif (FOSC==FOSC_8M)
//   45     	//asm("NOP");asm("NOP");    
//   46 #elif (FOSC==FOSC_4M)
//   47     	#error "不支持8M以下频率"  
//   48 #else
//   49 		#error "没有定义主时钟频率"
//   50 #endif
//   51 	}
??_delay_1_ms_0:
        CALLF     L:?mov_l1_l0
        CALLF     L:?mov_l0_l1
        CALLF     L:?dec32_l0_l0
        LDW       X, S:?w2
        CPW       X, #0x0
        JRNE      L:??_delay_1_ms_2
        LDW       X, S:?w3
        CPW       X, #0x0
??_delay_1_ms_2:
        JRNE      L:??_delay_1_ms_1
//   52 }
        RETF
//   53 //******************************************************************************
//   54 //延时函数ms级
//   55 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   56 void _delay_ms(unsigned long ms)
//   57 {
_delay_ms:
        CALLF     L:?push_l2
        CALLF     L:?mov_l2_l0
        JRA       L:??_delay_ms_0
//   58     while(ms--)
//   59     {
//   60         _delay_1_ms();
??_delay_ms_1:
        CALLF     _delay_1_ms
//   61     }
??_delay_ms_0:
        CALLF     L:?mov_l0_l2
        CALLF     L:?mov_l2_l0
        CALLF     L:?dec32_l2_l2
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??_delay_ms_2
        LDW       X, S:?w1
        CPW       X, #0x0
??_delay_ms_2:
        JRNE      L:??_delay_ms_1
//   62 }
        JPF       L:?epilogue_l2

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 126 bytes in section .far_func.text
// 
// 126 bytes of CODE memory
//
//Errors: none
//Warnings: none
