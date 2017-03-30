///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.20.1.176 for STM8                29/Mar/2017  16:23:48
// Copyright 2010-2015 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\ADSample.c
//    Command line =  
//        "E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\ADSample.c"
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
//        E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List\ADSample.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?fcastf32u16_l0_x
        EXTERN ?fdiv32_l0_l0_dc32
        EXTERN ?fmul32_l0_l0_l1
        EXTERN ?load32_0x_l0
        EXTERN ?mov_l1_l2
        EXTERN ?mov_l2_l0
        EXTERN ?mul16_x_x_w0
        EXTERN ?mul32_l0_l0_l1
        EXTERN ?pop_e2
        EXTERN ?push_e2
        EXTERN ?push_l2
        EXTERN ?srl16_x_x_5
        EXTERN ?udiv32_l0_l0_dl
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w5
        EXTERN ACCurr_AD
        EXTERN ACCurr_DD
        EXTERN ACTemp_AD
        EXTERN ACTemp_DD
        EXTERN ACVolt_AD
        EXTERN ACVolt_DD
        EXTERN ADC_RESULT
        EXTERN ADC_RESULT_H
        EXTERN ADC_RESULT_L
        EXTERN AD_Value
        EXTERN AD_Value_SUM
        EXTERN CNT_T2ms
        EXTERN Power
        EXTERN SUM_CNT
        EXTERN _A_Flag_10ms_1
        EXTERN devStatus

        PUBLIC ADC_DRH
        PUBLIC ADC_DRL
        PUBLIC ADCurrent_Scan
        PUBLIC ADProcess
        PUBLIC ADSample
        PUBLIC ADVoltage_Scan
        PUBLIC CountPower
        PUBLIC GetTemperature
        PUBLIC GetTemperaturex
        PUBLIC _A_ADC_CR1
        PUBLIC _A_ADC_CSR

// E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\ADSample.c
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
//   15 //#define VDD10KNTCGND
//   16 #define VDDNT10GND
//   17 /*******************************************************************************
//   18 -----------------------------    Include files   -------------------------------
//   19  *******************************************************************************/
//   20 #include "type_def.h"

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

        ASEGN `.near.noinit`:DATA:NOROOT,05404H
        SECTION_GROUP ADC_DRH
// unsigned char const volatile ADC_DRH
ADC_DRH:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05405H
        SECTION_GROUP ADC_DRL
// unsigned char const volatile ADC_DRL
ADC_DRL:
        DS8 1
//   21 #include "ADSample.h"
//   22 /*******************************************************************************
//   23 -----------------------------    Global define   -------------------------------
//   24  *******************************************************************************/
//   25 # ifdef VDDNT10GND

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   26 static const unsigned int TemperatureTable[2] = {
TemperatureTable:
        DC16 2, 3
//   27 	2,3};
//   28 /* 3950 100KNTC (VDD-NTC-10K-GND)   10K分压电阻      
//   29 static const unsigned int TemperatureTable[230] = {
//   30     0x6, 0x6, 0x7, 0x7, 0x8, 0x8, 0x9, 0x9, 0x9, 0xa, //-30 - 21  
//   31     0xb, 0xb, 0xc, 0xd, 0xd, 0xe, 0xf, 0x10, 0x10, 0x11, //-20 - 11  
//   32     0x12, 0x13, 0x14, 0x15, 0x16, 0x18, 0x19, 0x1a, 0x1c, 0x1d, //-10 - 01  
//   33 
//   34     0x1f, 0x20, 0x22, 0x23, 0x25, 0x27, 0x28, 0x2a, 0x2c, 0x2e, //0 - 9 
//   35     0x30, 0x33, 0x35, 0x38, 0x3a, 0x3d, 0x3f, 0x42, 0x45, 0x48, //10 - 19 
//   36     0x4b, 0x4e, 0x52, 0x56, 0x59, 0x5d, 0x61, 0x65, 0x69, 0x6c, //20 - 29 
//   37     0x6f, 0x73, 0x78, 0x7c, 0x81, 0x86, 0x8b, 0x90, 0x96, 0x9c, //30 - 39 
//   38 
//   39     0xa2, 0xa8, 0xae, 0xb4, 0xb9, 0xbf, 0xc5, 0xcc, 0xd2, 0xd9, //40 - 49  
//   40     0xdf, 0xe6, 0xed, 0xf3, 0xfa, 0x101, 0x109, 0x110, 0x118, 0x120, //50 - 59  
//   41     0x128, 0x130, 0x138, 0x140, 0x148, 0x150, 0x158, 0x161, 0x169, 0x172, //60 - 69  
//   42     0x17a, 0x183, 0x18b, 0x194, 0x19c, 0x1a4, 0x1ad, 0x1b5, 0x1bd, 0x1c5, //70 - 79  
//   43     0x1cd, 0x1d4, 0x1dd, 0x1e5, 0x1ed, 0x1f5, 0x1fd, 0x206, 0x20e, 0x217, //80 - 89  
//   44     0x220, 0x229, 0x231, 0x239, 0x240, 0x248, 0x250, 0x257, 0x25f, 0x266, //90 - 99  
//   45 
//   46     0x26e, 0x275, 0x27d, 0x285, 0x28d, 0x295, 0x29b, 0x2a2, 0x2a9, 0x2af, //100 - 109 
//   47     0x2b6, 0x2bd, 0x2c4, 0x2cb, 0x2d1, 0x2d8, 0x2de, 0x2e4, 0x2ea, 0x2ef, //110 - 119 
//   48     0x2f4, 0x2fa, 0x300, 0x305, 0x30a, 0x30f, 0x314, 0x318, 0x31d, 0x321, //120 - 129 
//   49     0x325, 0x32a, 0x32e, 0x333, 0x337, 0x33c, 0x340, 0x345, 0x349, 0x34d, //130 - 139 
//   50     0x351, 0x355, 0x358, 0x35c, 0x35f, 0x362, 0x365, 0x368, 0x36b, 0x36e, //140 -149 
//   51     0x370, 0x374, 0x377, 0x37a, 0x37d, 0x380, 0x382, 0x385, 0x387, 0x38a, //150 -159 
//   52     0x38c, 0x38e, 0x391, 0x393, 0x395, 0x398, 0x39a, 0x39c, 0x39e, 0x3a0, //160 - 169 
//   53     0x3a2, 0x3a4, 0x3a5, 0x3a7, 0x3a9, 0x3ab, 0x3ac, 0x3ae, 0x3b0, 0x3b1, //170 - 179 
//   54     0x3b3, 0x3b4, 0x3b6, 0x3b7, 0x3b9, 0x3ba, 0x3bb, 0x3bd, 0x3be, 0x3bf, //180 -189 
//   55     0x3c0, 0x3c1, 0x3c2, 0x3c3, 0x3c5, 0x3c6, 0x3c7, 0x3c8, 0x3c9, 0x3ca, //190 - 199 
//   56 
//   57     //0x3cb,0x3cc,0x3cd,0x3ce,0x3cf,0x3d0,0x3d1,0x3d2,0x3d3,0x3d3,//200 - 209 
//   58     //0x3d4,0x3d5,0x3d6,0x3d7,0x3d7,0x3d8,0x3d9,0x3d9,0x3da,0x3db,//210 - 219 
//   59     //0x3dc,0x3dc,0x3dd,0x3dd,0x3de,0x3df,0x3df,0x3e0,0x3e0,0x3e1,//220 - 229 
//   60     //0x3e1,0x3e2,0x3e3,0x3e3,0x3e4,0x3e4,0x3e5,0x3e5,0x3e6,0x3e6,//230 - 239 
//   61     //0x3e6,0x3e7,0x3e7,0x3e8,0x3e8,0x3e8,0x3e9,0x3e9,0x3ea,0x3ea,//240 - 249 
//   62     //0x3ea,//250   
//   63 };*/
//   64 #else
//   65 //* 3950 100KNTC (VDD-10K-NTC-GND)   10K分压电阻  
//   66 static const unsigned int TemperatureTablex[230] = {//-30 - 250  
//   67 
//   68     0x3fa, 0x3fa, 0x3f9, 0x3f9, 0x3f8, 0x3f8, 0x3f7, 0x3f7, 0x3f7, 0x3f6, //-30--21  
//   69     0x3f5, 0x3f5, 0x3f4, 0x3f3, 0x3f3, 0x3f2, 0x3f1, 0x3f0, 0x3f0, 0x3ef, //-20--11  
//   70     0x3ee, 0x3ed, 0x3ec, 0x3eb, 0x3ea, 0x3e8, 0x3e7, 0x3e6, 0x3e4, 0x3e3, //-10--1  
//   71 
//   72     0x3e1, 0x3e0, 0x3de, 0x3dd, 0x3db, 0x3d9, 0x3d8, 0x3d6, 0x3d4, 0x3d2, //0-9  
//   73     0x3d0, 0x3cd, 0x3cb, 0x3c8, 0x3c6, 0x3c3, 0x3c1, 0x3be, 0x3bb, 0x3b8, //10-19  
//   74     0x3b5, 0x3b2, 0x3ae, 0x3aa, 0x3a7, 0x3a3, 0x39f, 0x39b, 0x397, 0x394, //20-29  
//   75     0x391, 0x38d, 0x388, 0x384, 0x37f, 0x37a, 0x375, 0x370, 0x36a, 0x364, //30-39  
//   76     0x35e, 0x358, 0x352, 0x34c, 0x347, 0x341, 0x33b, 0x334, 0x32e, 0x327, //40-49  
//   77     0x321, 0x31a, 0x313, 0x30d, 0x306, 0x2ff, 0x2f7, 0x2f0, 0x2e8, 0x2e0, //50-59  
//   78     0x2d8, 0x2d0, 0x2c8, 0x2c0, 0x2b8, 0x2b0, 0x2a8, 0x29f, 0x297, 0x28e, //60-69  
//   79     0x286, 0x27d, 0x275, 0x26c, 0x264, 0x25c, 0x253, 0x24b, 0x243, 0x23b, //70-79  
//   80 
//   81     0x233, 0x22c, 0x223, 0x21b, 0x213, 0x20b, 0x203, 0x1fa, 0x1f2, 0x1e9, //80-89  
//   82     0x1e0, 0x1d7, 0x1cf, 0x1c7, 0x1c0, 0x1b8, 0x1b0, 0x1a9, 0x1a1, 0x19a, //90-99  
//   83 
//   84     0x192, 0x18b, 0x183, 0x17b, 0x173, 0x16b, 0x165, 0x15e, 0x157, 0x151, //100-109  
//   85     0x14a, 0x143, 0x13c, 0x135, 0x12f, 0x128, 0x122, 0x11c, 0x116, 0x111, //110-119  
//   86     0x10c, 0x106, 0x100, 0xfb, 0xf6, 0xf1, 0xec, 0xe8, 0xe3, 0xdf, //120-129  
//   87     0xdb, 0xd6, 0xd2, 0xcd, 0xc9, 0xc4, 0xc0, 0xbb, 0xb7, 0xb3, //130-139  
//   88     0xaf, 0xab, 0xa8, 0xa4, 0xa1, 0x9e, 0x9b, 0x98, 0x95, 0x92, //140-149  
//   89     0x90, 0x8c, 0x89, 0x86, 0x83, 0x80, 0x7e, 0x7b, 0x79, 0x76, //150-159  
//   90     0x74, 0x72, 0x6f, 0x6d, 0x6b, 0x68, 0x66, 0x64, 0x62, 0x60, //160-169  
//   91     0x5e, 0x5c, 0x5b, 0x59, 0x57, 0x55, 0x54, 0x52, 0x50, 0x4f, //170-179  
//   92 
//   93     0x4d, 0x4c, 0x4a, 0x49, 0x47, 0x46, 0x45, 0x43, 0x42, 0x41, //180-189  
//   94     0x40, 0x3f, 0x3e, 0x3d, 0x3b, 0x3a, 0x39, 0x38, 0x37, 0x36, //190-199  
//   95     /* 
//   96     0x35,0x34,0x33,0x32,0x31,0x30,0x2f,0x2e,0x2d,0x2d,//200-209 
//   97     0x2c,0x2b,0x2a,0x29,0x29,0x28,0x27,0x27,0x26,0x25,//210-219 
//   98     0x24,0x24,0x23,0x23,0x22,0x21,0x21,0x20,0x20,0x1f,//220-229 
//   99     0x1f,0x1e,0x1d,0x1d,0x1c,0x1c,0x1b,0x1b,0x1a,0x1a,//230-239 
//  100     0x1a,0x19,0x19,0x18,0x18,0x18,0x17,0x17,0x16,0x16,//240-249 
//  101     0x16,       */ //250  
//  102 };
//  103 #endif
//  104 
//  105 //******************************************************************************
//  106 //AD采样函数
//  107 //******************************************************************************
//  108 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  109 void ADSample(void)
//  110 {
//  111     if (Flag_10ms_C == 1)
ADSample:
        LD        A, L:_A_Flag_10ms_1
        SWAP      A
        AND       A, #0xf
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??ADSample_0
//  112     {
//  113         Flag_10ms_C = 0;
        BRES      L:_A_Flag_10ms_1, #0x5
//  114         //ADProcess(C_Adc_Tem);// 线圈温度采样
//  115         //ADProcess(C_Adc_IGBTTem); // IGBT温度采样
//  116     }
//  117     if (CNT_T2ms == 1)
??ADSample_0:
        LDW       X, L:CNT_T2ms
        CPW       X, #0x1
        JRNE      L:??ADSample_1
//  118     {
//  119         CNT_T2ms = 0;
        CLRW      X
        LDW       L:CNT_T2ms, X
//  120         //PD_ODR_ODR7 = !PD_ODR_ODR7;  //根据通讯闪亮
//  121         ADCurrent_Scan(C_Adc_Cur); // 电流
        LD        A, #0x3
        CALLF     ADCurrent_Scan
//  122         ADVoltage_Scan(C_Adc_Vol);
        LD        A, #0x2
        CALLF     ADVoltage_Scan
//  123 		
//  124 		CountPower();
        CALLF     CountPower
//  125     }
//  126 }
??ADSample_1:
        RETF
//  127 //******************************************************************************
//  128 
//  129 
//  130 //******************************************************************************
//  131 //AD采样函数
//  132 //******************************************************************************
//  133 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  134 void ADProcess(unsigned char CHAL)
//  135 {
ADProcess:
        LD        S:?b3, A
//  136     unsigned char i,j;
//  137 	unsigned int ADC_ADD4 = 0;
        CLRW      Y
//  138     ADC_RESULT =0;
        CLRW      X
        LDW       L:ADC_RESULT, X
//  139     for(j=0;j<4;j++)
        CLR       S:?b2
        JRA       L:??ADProcess_0
//  140     {
//  141         ADC_CSR = CHAL;
//  142         ADC_CR1 |= 0x01; // 启动转换
//  143         for (i = 0; i < 100; i++)
??ADProcess_1:
        LD        A, S:?b0
        ADD       A, #0x1
        LD        S:?b0, A
??ADProcess_2:
        LD        A, S:?b0
        CP        A, #0x64
        JRNC      L:??ADProcess_3
//  144         {
//  145             if (ADC_CSR_EOC)
        BTJF      L:0x5400, #0x7, L:??ADProcess_1
//  146             {
//  147                 break;
//  148             }
//  149         }
//  150         ADC_RESULT_L = ADC_DRL;
??ADProcess_3:
        MOV       L:ADC_RESULT_L, L:0x5405
//  151         ADC_RESULT_H = ADC_DRH;
        MOV       L:ADC_RESULT_H, L:0x5404
//  152         ADC_RESULT = ADC_RESULT_H * 256 + ADC_RESULT_L;
        LD        A, L:ADC_RESULT_H
        CLR       S:?b4
        LD        S:?b5, A
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, S:?w2
        CALLF     L:?mul16_x_x_w0
        LD        A, L:ADC_RESULT_L
        CLR       S:?b0
        LD        S:?b1, A
        ADDW      X, S:?w0
        LDW       L:ADC_RESULT, X
//  153 		ADC_ADD4 += ADC_RESULT;
        ADDW      Y, L:ADC_RESULT
        LD        A, S:?b2
        ADD       A, #0x1
        LD        S:?b2, A
??ADProcess_0:
        LD        A, S:?b2
        CP        A, #0x4
        JRNC      L:??ADProcess_4
        LD        A, S:?b3
        LD        L:0x5400, A
        BSET      L:0x5401, #0x0
        CLR       S:?b0
        JRA       L:??ADProcess_2
//  154     }
//  155 	
//  156     if (SUM_CNT[CHAL] >= 32)
??ADProcess_4:
        CLRW      X
        LD        A, S:?b3
        LD        XL, A
        LD        A, (L:SUM_CNT,X)
        CP        A, #0x20
        JRC       L:??ADProcess_5
//  157     {
//  158         SUM_CNT[CHAL] = 0;
        CLRW      X
        LD        A, S:?b3
        LD        XL, A
        CLR       A
        LD        (L:SUM_CNT,X), A
//  159         AD_Value[CHAL] = AD_Value_SUM[CHAL] >> 5;
        CLRW      X
        LD        A, S:?b3
        LD        XL, A
        SLLW      X
        LDW       X, (L:AD_Value_SUM,X)
        CALLF     L:?srl16_x_x_5
        LDW       Y, X
        CLRW      X
        LD        A, S:?b3
        LD        XL, A
        SLLW      X
        LDW       (L:AD_Value,X), Y
//  160         AD_Value_SUM[CHAL] = 0;
        CLRW      X
        LD        A, S:?b3
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:AD_Value_SUM,X), Y
//  161         switch (CHAL)
        LD        A, S:?b3
        TNZ       A
        JREQ      L:??ADProcess_6
        DEC       A
        JRNE      L:??ADProcess_7
//  162 		{
//  163 		case C_Adc_IGBTTem:
//  164 
//  165 			ACTemp_AD = AD_Value[CHAL]; // 温度
        CLRW      X
        LD        A, S:?b3
        LD        XL, A
        SLLW      X
        LDW       X, (L:AD_Value,X)
        LDW       L:ACTemp_AD, X
//  166 			ACTemp_DD = GetTemperature(ACTemp_AD); //温度0表示-30℃
        LDW       X, L:ACTemp_AD
        CALLF     GetTemperature
        CLRW      X
        LD        XL, A
        LDW       L:ACTemp_DD, X
//  167 			devStatus.igbt_temp = ACTemp_DD - 30;
        LDW       X, L:ACTemp_DD
        ADDW      X, #0xffe2
        LDW       L:devStatus + 4, X
//  168 			break;
        RETF
//  169 		case C_Adc_Tem:
//  170 
//  171 			ACTemp_AD = AD_Value[CHAL]; // 温度
??ADProcess_6:
        CLRW      X
        LD        A, S:?b3
        LD        XL, A
        SLLW      X
        LDW       X, (L:AD_Value,X)
        LDW       L:ACTemp_AD, X
//  172 			ACTemp_DD = GetTemperature(ACTemp_AD); //温度0表示-30℃
        LDW       X, L:ACTemp_AD
        CALLF     GetTemperature
        CLRW      X
        LD        XL, A
        LDW       L:ACTemp_DD, X
//  173 			devStatus.coil_temp = ACTemp_DD - 30;
        LDW       X, L:ACTemp_DD
        ADDW      X, #0xffe2
        LDW       L:devStatus + 6, X
//  174 			break;
//  175 		default:
//  176 		  break;
??ADProcess_7:
        RETF
//  177 		}
//  178     }
//  179 	else
//  180 	{
//  181 		AD_Value_SUM[CHAL] += ADC_ADD4/4;
??ADProcess_5:
        CLRW      X
        LD        A, S:?b3
        LD        XL, A
        SLLW      X
        LDW       X, (L:AD_Value_SUM,X)
        LDW       S:?w0, X
        LDW       X, Y
        SRLW      X
        SRLW      X
        LDW       S:?w2, X
        LDW       Y, S:?w0
        ADDW      Y, S:?w2
        CLRW      X
        LD        A, S:?b3
        LD        XL, A
        SLLW      X
        LDW       (L:AD_Value_SUM,X), Y
//  182     	SUM_CNT[CHAL]++;
        CLRW      X
        LD        A, S:?b3
        LD        XL, A
        LD        A, (L:SUM_CNT,X)
        INC       A
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b3
        LD        XL, A
        LD        A, S:?b0
        LD        (L:SUM_CNT,X), A
//  183 	}
//  184 }
        RETF
        REQUIRE _A_ADC_CSR
        REQUIRE _A_ADC_CR1
        REQUIRE ADC_DRL
        REQUIRE ADC_DRH
//  185 //******************************************************************************
//  186 
//  187 
//  188 //******************************************************************************
//  189 //查表温度（从小到大）
//  190 //******************************************************************************
//  191 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  192 unsigned char GetTemperature(unsigned int ADValue)
//  193 {
GetTemperature:
        LDW       Y, X
//  194     unsigned char left, mid, right;
//  195     unsigned int Temp;
//  196     left = 0;
        CLR       S:?b1
//  197     right = 229;
        MOV       S:?b3, #0xe5
//  198     if (ADValue <= 0x06)
        CPW       Y, #0x7
        JRNC      L:??GetTemperature_0
//  199     {
//  200         left = 0;
        CLR       S:?b1
        JRA       L:??GetTemperature_1
//  201     }
//  202     else
//  203     {
//  204         if (ADValue >= 0x3ca)
??GetTemperature_0:
        CPW       Y, #0x3ca
        JRC       L:??GetTemperature_2
//  205         {
//  206             left = 229;
        MOV       S:?b1, #0xe5
        JRA       L:??GetTemperature_1
//  207         }
//  208         else
//  209         {
//  210             while (left != (right - 1))
??GetTemperature_2:
        CLRW      X
        LD        A, S:?b3
        LD        XL, A
        ADDW      X, #0xffffffffffffffff
        CLR       S:?b0
        CPW       X, S:?w0
        JREQ      L:??GetTemperature_1
//  211             {
//  212                 Temp = left;
        CLRW      X
        LD        A, S:?b1
        LD        XL, A
//  213                 Temp += right;
        CLR       S:?b2
        LDW       S:?w0, X
        LDW       X, S:?w1
        ADDW      X, S:?w0
//  214                 mid = (unsigned char) (Temp >> 1);
        SRLW      X
        EXG       A, XL
        LD        S:?b0, A
        EXG       A, XL
//  215                 if (ADValue >= TemperatureTable[mid])
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        ADDW      X, #TemperatureTable
        CPW       Y, (X)
        JRC       L:??GetTemperature_3
//  216                 {
//  217                     left = mid;
        MOV       S:?b1, S:?b0
//  218                     if (ADValue < TemperatureTable[mid + 1])
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        ADDW      X, #TemperatureTable + 2
        CPW       Y, (X)
        JRNC      L:??GetTemperature_2
//  219                     {
//  220                         break;
        JRA       L:??GetTemperature_1
//  221                     }
//  222                 }
//  223                 else
//  224                 {
//  225                     right = mid;
??GetTemperature_3:
        MOV       S:?b3, S:?b0
//  226                     if (ADValue >= TemperatureTable[mid - 1])
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        ADDW      X, #TemperatureTable - 2
        CPW       Y, (X)
        JRC       L:??GetTemperature_2
//  227                     {
//  228                         left = mid - 1;
        LD        A, S:?b0
        ADD       A, #0xff
        LD        S:?b1, A
//  229                         break;
//  230                     }
//  231                 }
//  232             }
//  233         }
//  234     }
//  235     return left;
??GetTemperature_1:
        LD        A, S:?b1
        RETF
//  236 }
//  237 //******************************************************************************
//  238 //查表温度
//  239 //******************************************************************************
//  240 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  241 unsigned char GetTemperaturex(unsigned int ADValue)
//  242 {
GetTemperaturex:
        LDW       Y, X
//  243     unsigned char left, mid, right;
//  244     unsigned int Temp;
//  245     left = 0;
        CLR       S:?b1
//  246     right = 229;
        MOV       S:?b3, #0xe5
//  247     if (ADValue >= 0x3fa)
        CPW       Y, #0x3fa
        JRC       L:??GetTemperaturex_0
//  248     {
//  249         left = 0;
        CLR       S:?b1
        JRA       L:??GetTemperaturex_1
//  250     }
//  251     else
//  252     {
//  253         if (ADValue <= 0x36)
??GetTemperaturex_0:
        CPW       Y, #0x37
        JRNC      L:??GetTemperaturex_2
//  254         {
//  255             left = 229;
        MOV       S:?b1, #0xe5
        JRA       L:??GetTemperaturex_1
//  256         }
//  257         else
//  258         {
//  259             while (left != (right - 1))
??GetTemperaturex_2:
        CLRW      X
        LD        A, S:?b3
        LD        XL, A
        ADDW      X, #0xffffffffffffffff
        CLR       S:?b0
        CPW       X, S:?w0
        JREQ      L:??GetTemperaturex_1
//  260             {
//  261                 Temp = left;
        CLRW      X
        LD        A, S:?b1
        LD        XL, A
//  262                 Temp += right;
        CLR       S:?b2
        LDW       S:?w0, X
        LDW       X, S:?w1
        ADDW      X, S:?w0
//  263                 mid = (unsigned char) (Temp >> 1);
        SRLW      X
        EXG       A, XL
        LD        S:?b0, A
        EXG       A, XL
//  264                 if (ADValue <= TemperatureTable[mid])
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:TemperatureTable,X)
        LDW       S:?w2, Y
        CPW       X, S:?w2
        JRC       L:??GetTemperaturex_3
//  265                 {
//  266                     left = mid;
        MOV       S:?b1, S:?b0
//  267                     if (ADValue > TemperatureTable[mid + 1])
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        ADDW      X, #TemperatureTable + 2
        LDW       X, (X)
        LDW       S:?w2, Y
        CPW       X, S:?w2
        JRNC      L:??GetTemperaturex_2
//  268                     {
//  269                         break;
        JRA       L:??GetTemperaturex_1
//  270                     }
//  271                 }
//  272                 else
//  273                 {
//  274                     right = mid;
??GetTemperaturex_3:
        MOV       S:?b3, S:?b0
//  275                     if (ADValue <= TemperatureTable[mid - 1])
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        ADDW      X, #TemperatureTable - 2
        LDW       X, (X)
        LDW       S:?w2, Y
        CPW       X, S:?w2
        JRC       L:??GetTemperaturex_2
//  276                     {
//  277                         left = mid - 1;
        LD        A, S:?b0
        ADD       A, #0xff
        LD        S:?b1, A
//  278                         break;
//  279                     }
//  280                 }
//  281             }
//  282         }
//  283     }
//  284     return left;
??GetTemperaturex_1:
        LD        A, S:?b1
        RETF
//  285 }
//  286 //******************************************************************************
//  287 
//  288 
//  289 //******************************************************************************
//  290 //电流采样
//  291 //******************************************************************************
//  292 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  293 void ADCurrent_Scan(unsigned char CHAL)
//  294 {
ADCurrent_Scan:
        CALLF     L:?push_e2
        LD        S:?b9, A
//  295     unsigned char i,j;
//  296 	unsigned int ADC_ADD4 = 0;
        CLR       S:?b11
        CLR       S:?b10
//  297     ADC_RESULT = 0;
        CLRW      X
        LDW       L:ADC_RESULT, X
//  298     for(j=0;j<4;j++)
        CLR       S:?b2
        JRA       L:??ADCurrent_Scan_0
//  299     {
//  300         ADC_CSR = CHAL;
//  301         ADC_CR1 |= 0X1; // 启动转换
//  302         for (i = 0; i < 100; i++)
??ADCurrent_Scan_1:
        LD        A, S:?b0
        ADD       A, #0x1
        LD        S:?b0, A
??ADCurrent_Scan_2:
        LD        A, S:?b0
        CP        A, #0x64
        JRNC      L:??ADCurrent_Scan_3
//  303         {
//  304             if (ADC_CSR_EOC)
        BTJF      L:0x5400, #0x7, L:??ADCurrent_Scan_1
//  305             {
//  306                 break;
//  307             }
//  308         }
//  309         ADC_RESULT_L = ADC_DRL;
??ADCurrent_Scan_3:
        MOV       L:ADC_RESULT_L, L:0x5405
//  310         ADC_RESULT_H = ADC_DRH;
        MOV       L:ADC_RESULT_H, L:0x5404
//  311         ADC_RESULT = ADC_RESULT_H * 256 + ADC_RESULT_L;
        LD        A, L:ADC_RESULT_H
        CLRW      Y
        LD        YL, A
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LD        A, L:ADC_RESULT_L
        CLR       S:?b0
        LD        S:?b1, A
        ADDW      X, S:?w0
        LDW       L:ADC_RESULT, X
//  312 		ADC_ADD4 += ADC_RESULT;
        LDW       X, S:?w5
        ADDW      X, L:ADC_RESULT
        LDW       S:?w5, X
        LD        A, S:?b2
        ADD       A, #0x1
        LD        S:?b2, A
??ADCurrent_Scan_0:
        LD        A, S:?b2
        CP        A, #0x4
        JRNC      L:??ADCurrent_Scan_4
        LD        A, S:?b9
        LD        L:0x5400, A
        BSET      L:0x5401, #0x0
        CLR       S:?b0
        JRA       L:??ADCurrent_Scan_2
//  313     }
//  314 
//  315     if (SUM_CNT[CHAL] >= 32)
??ADCurrent_Scan_4:
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        LD        A, (L:SUM_CNT,X)
        CP        A, #0x20
        JRNC      ??lb_1
        JP        L:??ADCurrent_Scan_5
//  316     {
//  317         SUM_CNT[CHAL] = 0;
??lb_1:
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        CLR       A
        LD        (L:SUM_CNT,X), A
//  318         AD_Value[CHAL] = AD_Value_SUM[CHAL] >> 5;
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       X, (L:AD_Value_SUM,X)
        CALLF     L:?srl16_x_x_5
        LDW       S:?w0, X
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       Y, X
        LDW       X, S:?w0
        LDW       (L:AD_Value,Y), X
//  319         AD_Value_SUM[CHAL] = 0; 
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       Y, X
        CLRW      X
        LDW       (L:AD_Value_SUM,Y), X
//  320         ACCurr_AD = AD_Value[CHAL]; 
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       X, (L:AD_Value,X)
        LDW       L:ACCurr_AD, X
//  321         //I=(5*AD*1000)/(51*1024*20)*10/9;   注：平均值转有效值除以0.9
//  322         ACCurr_DD = ((unsigned long) ACCurr_AD)*532/100 ;   //每1A0.15v
        LDW       X, L:ACCurr_AD
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #0x214
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALLF     L:?mul32_l0_l0_l1
        CALLF     L:?udiv32_l0_l0_dl
        DATA
        DC32      0x64
        CODE
        LDW       X, S:?w1
        LDW       L:ACCurr_DD, X
//  323 		devStatus.cur = ACCurr_DD;
        LDW       X, L:ACCurr_DD
        LDW       L:devStatus + 2, X
//  324 		AD_Value_SUM[CHAL] += ADC_ADD4/4;
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       X, (L:AD_Value_SUM,X)
        LDW       Y, X
        LDW       X, S:?w5
        SRLW      X
        SRLW      X
        LDW       S:?w0, X
        ADDW      Y, S:?w0
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       (L:AD_Value_SUM,X), Y
//  325     	SUM_CNT[CHAL]++;
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        LD        A, (L:SUM_CNT,X)
        INC       A
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        LD        A, S:?b0
        LD        (L:SUM_CNT,X), A
        JRA       L:??ADCurrent_Scan_6
//  326     }
//  327 	else
//  328 	{
//  329 		AD_Value_SUM[CHAL] += ADC_ADD4/4;
??ADCurrent_Scan_5:
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       X, (L:AD_Value_SUM,X)
        LDW       Y, X
        LDW       X, S:?w5
        SRLW      X
        SRLW      X
        LDW       S:?w0, X
        ADDW      Y, S:?w0
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       (L:AD_Value_SUM,X), Y
//  330     	SUM_CNT[CHAL]++;
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        LD        A, (L:SUM_CNT,X)
        INC       A
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        LD        A, S:?b0
        LD        (L:SUM_CNT,X), A
//  331 	}
//  332 }
??ADCurrent_Scan_6:
        CALLF     L:?pop_e2
        RETF
        REQUIRE _A_ADC_CSR
        REQUIRE _A_ADC_CR1
        REQUIRE ADC_DRL
        REQUIRE ADC_DRH
//  333 //******************************************************************************
//  334 
//  335 //******************************************************************************
//  336 //电压采样
//  337 //******************************************************************************
//  338 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  339 void ADVoltage_Scan(unsigned char CHAL)
//  340 {
ADVoltage_Scan:
        CALLF     L:?push_e2
        LD        S:?b9, A
//  341     unsigned char i,j;
//  342 	unsigned int ADC_ADD4 = 0;
        CLR       S:?b11
        CLR       S:?b10
//  343     ADC_RESULT =0;
        CLRW      X
        LDW       L:ADC_RESULT, X
//  344     for(j=0;j<4;j++)
        CLR       S:?b2
        JRA       L:??ADVoltage_Scan_0
//  345     {
//  346         ADC_CSR = CHAL;
//  347         ADC_CR1 |= 0X1; // 启动转换
//  348         for (i = 0; i < 100; i++)
??ADVoltage_Scan_1:
        LD        A, S:?b0
        ADD       A, #0x1
        LD        S:?b0, A
??ADVoltage_Scan_2:
        LD        A, S:?b0
        CP        A, #0x64
        JRNC      L:??ADVoltage_Scan_3
//  349         {
//  350             if (ADC_CSR_EOC)
        BTJF      L:0x5400, #0x7, L:??ADVoltage_Scan_1
//  351             {
//  352                 break;
//  353             }
//  354         }
//  355         ADC_RESULT_L = ADC_DRL;
??ADVoltage_Scan_3:
        MOV       L:ADC_RESULT_L, L:0x5405
//  356         ADC_RESULT_H = ADC_DRH;
        MOV       L:ADC_RESULT_H, L:0x5404
//  357         ADC_RESULT = ADC_RESULT_H * 256 + ADC_RESULT_L;
        LD        A, L:ADC_RESULT_H
        CLRW      Y
        LD        YL, A
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LD        A, L:ADC_RESULT_L
        CLR       S:?b0
        LD        S:?b1, A
        ADDW      X, S:?w0
        LDW       L:ADC_RESULT, X
//  358 		ADC_ADD4 += ADC_RESULT;
        LDW       X, S:?w5
        ADDW      X, L:ADC_RESULT
        LDW       S:?w5, X
        LD        A, S:?b2
        ADD       A, #0x1
        LD        S:?b2, A
??ADVoltage_Scan_0:
        LD        A, S:?b2
        CP        A, #0x4
        JRNC      L:??ADVoltage_Scan_4
        LD        A, S:?b9
        LD        L:0x5400, A
        BSET      L:0x5401, #0x0
        CLR       S:?b0
        JRA       L:??ADVoltage_Scan_2
//  359     }
//  360 
//  361     if (SUM_CNT[CHAL] >= 32) 
??ADVoltage_Scan_4:
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        LD        A, (L:SUM_CNT,X)
        CP        A, #0x20
        JRNC      ??lb_0
        JP        L:??ADVoltage_Scan_5
//  362     {
//  363         SUM_CNT[CHAL] = 0;
??lb_0:
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        CLR       A
        LD        (L:SUM_CNT,X), A
//  364         AD_Value[CHAL] = AD_Value_SUM[CHAL] >> 5;
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       X, (L:AD_Value_SUM,X)
        CALLF     L:?srl16_x_x_5
        LDW       S:?w0, X
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       Y, X
        LDW       X, S:?w0
        LDW       (L:AD_Value,Y), X
//  365         AD_Value_SUM[CHAL] = 0; 
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       Y, X
        CLRW      X
        LDW       (L:AD_Value_SUM,Y), X
//  366         ACVolt_AD = AD_Value[CHAL]; 
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       X, (L:AD_Value,X)
        LDW       L:ACVolt_AD, X
//  367         //u= (101*AD*5)/1024/1.414       最大值转换
//  368         ACVolt_DD = ((unsigned long) ACVolt_AD)*3488/100; //单位10mV
        LDW       X, L:ACVolt_AD
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #0xda0
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALLF     L:?mul32_l0_l0_l1
        CALLF     L:?udiv32_l0_l0_dl
        DATA
        DC32      0x64
        CODE
        LDW       X, S:?w1
        LDW       L:ACVolt_DD, X
//  369 		//ACVolt_DD = ((unsigned long) ACVolt_AD)*101*5*100/1024; //单位10mV
//  370 		devStatus.vol = ACVolt_DD;
        LDW       X, L:ACVolt_DD
        LDW       L:devStatus, X
//  371 		
//  372 		AD_Value_SUM[CHAL] += ADC_ADD4/4;
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       X, (L:AD_Value_SUM,X)
        LDW       Y, X
        LDW       X, S:?w5
        SRLW      X
        SRLW      X
        LDW       S:?w0, X
        ADDW      Y, S:?w0
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       (L:AD_Value_SUM,X), Y
//  373     	SUM_CNT[CHAL]++;
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        LD        A, (L:SUM_CNT,X)
        INC       A
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        LD        A, S:?b0
        LD        (L:SUM_CNT,X), A
        JRA       L:??ADVoltage_Scan_6
//  374     } 
//  375 	else
//  376 	{
//  377 		AD_Value_SUM[CHAL] += ADC_ADD4/4;
??ADVoltage_Scan_5:
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       X, (L:AD_Value_SUM,X)
        LDW       Y, X
        LDW       X, S:?w5
        SRLW      X
        SRLW      X
        LDW       S:?w0, X
        ADDW      Y, S:?w0
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        LDW       (L:AD_Value_SUM,X), Y
//  378     	SUM_CNT[CHAL]++;
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        LD        A, (L:SUM_CNT,X)
        INC       A
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        LD        A, S:?b0
        LD        (L:SUM_CNT,X), A
//  379 	}
//  380     
//  381 }
??ADVoltage_Scan_6:
        CALLF     L:?pop_e2
        RETF
        REQUIRE _A_ADC_CSR
        REQUIRE _A_ADC_CR1
        REQUIRE ADC_DRL
        REQUIRE ADC_DRH
//  382 //计算功率值

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  383 void CountPower()
//  384 {
CountPower:
        CALLF     L:?push_l2
//  385 	Power = ((float)devStatus.cur / 1000.0) * ((float)devStatus.vol / 100.0);//ma -> a&mv -> v a*v = w
        LDW       X, L:devStatus
        CALLF     L:?fcastf32u16_l0_x
        CALLF     L:?fdiv32_l0_l0_dc32
        DATA
        DC32      0x42c80000
        CODE
        CALLF     L:?mov_l2_l0
        LDW       X, L:devStatus + 2
        CALLF     L:?fcastf32u16_l0_x
        CALLF     L:?fdiv32_l0_l0_dc32
        DATA
        DC32      0x447a0000
        CODE
        CALLF     L:?mov_l1_l2
        CALLF     L:?fmul32_l0_l0_l1
        LDW       X, #Power
        CALLF     L:?load32_0x_l0
//  386 }
        JPF       L:?epilogue_l2

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 1 258 bytes in section .far_func.text
//     4 bytes in section .near.noinit   (abs)
//     4 bytes in section .near.rodata
// 
// 1 258 bytes of CODE  memory
//     4 bytes of CONST memory
//     0 bytes of DATA  memory (+ 4 bytes shared)
//
//Errors: none
//Warnings: none
