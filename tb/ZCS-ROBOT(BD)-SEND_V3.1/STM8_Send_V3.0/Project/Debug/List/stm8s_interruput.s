///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.20.1.176 for STM8                29/Mar/2017  16:23:49
// Copyright 2010-2015 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\stm8s_interruput.c
//    Command line =  
//        "E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\stm8s_interruput.c"
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
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List\stm8s_interruput.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b8
        EXTERN ?inc32_l0_l0
        EXTERN ?load32_0x_l0
        EXTERN ?load32_l0_0x
        EXTERN ?pop_l0
        EXTERN ?pop_l1
        EXTERN ?push_l0
        EXTERN ?push_l1
        EXTERN ?srl8_a_a_6
        EXTERN ?umod32_l1_l0_dl
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN Broken_Code
        EXTERN CNT_FULL_Num
        EXTERN CNT_MPSub_Beep
        EXTERN CNT_Prot
        EXTERN CNT_T1ms
        EXTERN CNT_T1s
        EXTERN CNT_T2ms
        EXTERN FLAG_PWM_START
        EXTERN Flag_Eeprom_Ero
        EXTERN Flag_LED2_ENABLE
        EXTERN Flag_RECV_ADDRESS_NUM
        EXTERN Flag_RECV_ADDRESS_NUM_SAME
        EXTERN MacStatus
        EXTERN ProNum
        EXTERN ProtectFlag
        EXTERN RecordPwmInfo
        EXTERN Time1_PWM_Close_Mode_Fast
        EXTERN UART2_RxInterrupt
        EXTERN _A_Flag_10ms_1
        EXTERN _A_Flag_10ms_2
        EXTERN _delay_us
        EXTERN count_time
        EXTERN errno
        EXTERN flag_statu
        EXTERN globetimer
        EXTERN status

        PUBLIC ADC2_IRQHandler
        PUBLIC AWU_IRQHandler
        PUBLIC AbortFunCheck
        PUBLIC CLK_IRQHandler
        PUBLIC EEPROM_EEC_IRQHandler
        PUBLIC EXTI_PORTA_IRQHandler
        PUBLIC EXTI_PORTB_IRQHandler
        PUBLIC EXTI_PORTC_IRQHandler
        PUBLIC EXTI_PORTD_IRQHandler
        PUBLIC EXTI_PORTE_IRQHandler
        PUBLIC SPI_IRQHandler
        PUBLIC TIM1_CAP_COM_IRQHandler
        PUBLIC TIM1_UPD_OVF_TRG_BRK_IRQHandler
        PUBLIC TIM2_CAP_COM_IRQHandler
        PUBLIC TIM2_UPD_OVF_BRK_IRQHandler
        PUBLIC TIM3_CAP_COM_IRQHandler
        PUBLIC TIM3_UPD_OVF_BRK_IRQHandler
        PUBLIC TIM4_UPD_OVF_IRQHandler
        PUBLIC TLI_IRQHandler
        PUBLIC TRAP_IRQHandler
        PUBLIC UART1_TX_IRQHandler
        PUBLIC UART2_DR
        PUBLIC UART2_RX_IRQHandler
        PUBLIC UART2_TX_IRQHandler
        PUBLIC UART3_RX_IRQHandler
        PUBLIC UART3_TX_IRQHandler
        PUBLIC _A_PA_IDR
        PUBLIC _A_PB_IDR
        PUBLIC _A_PE_ODR
        PUBLIC _A_PG_ODR
        PUBLIC _A_TIM4_SR
        PUBLIC _A_UART2_SR
        PUBLIC _interrupt_1
        PUBLIC _interrupt_12
        PUBLIC _interrupt_13
        PUBLIC _interrupt_14
        PUBLIC _interrupt_15
        PUBLIC _interrupt_16
        PUBLIC _interrupt_17
        PUBLIC _interrupt_18
        PUBLIC _interrupt_19
        PUBLIC _interrupt_2
        PUBLIC _interrupt_20
        PUBLIC _interrupt_21
        PUBLIC _interrupt_22
        PUBLIC _interrupt_23
        PUBLIC _interrupt_24
        PUBLIC _interrupt_25
        PUBLIC _interrupt_26
        PUBLIC _interrupt_3
        PUBLIC _interrupt_4
        PUBLIC _interrupt_5
        PUBLIC _interrupt_6
        PUBLIC _interrupt_7
        PUBLIC _interrupt_8
        PUBLIC _interrupt_9
        PUBLIC as

// E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\stm8s_interruput.c
//    1 /******************************************************************************/
//    2 /*					                                      						*/
//    3 /*	Project Name :	发射机(接收）		                                    	*/
//    4 /*	Version      :	1.0			                              					*/
//    5 /*	MCU          :	ST 8-bit STM8S104K4T6C	                              		*/
//    6 /*	Clock        :	16MHz			                              				*/
//    7 /*	Author	     :	mengzhuozhuo   		                              			*/
//    8 /*	Modefied	 :	kean		   		                              			*/
//    9 /*  Date	     :	2016/04/26	                                      			*/
//   10 /*	Corporation  :	中惠创智（深圳）无线供电技术有限公司                    		*/
//   11 /*	Info		 ：ACK本次自动回复内容为上次转载到相应通道地址的内容，				*/
//   12 /*							故在通过ACK设置接收端地址时需要两次通信 				*/
//   13 /******************************************************************************/
//   14 /*******************************************************************************
//   15 -----------------------------     File start    --------------------------------
//   16 *******************************************************************************/
//   17 
//   18 
//   19 /*******************************************************************************
//   20 -----------------------------    Include files   -------------------------------
//   21 *******************************************************************************/
//   22 #include "type_def.h"

        ASEGN `.near.noinit`:DATA:NOROOT,05001H
        SECTION_GROUP _A_PA_IDR
// union <unnamed> const volatile _A_PA_IDR
_A_PA_IDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05006H
        SECTION_GROUP _A_PB_IDR
// union <unnamed> const volatile _A_PB_IDR
_A_PB_IDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05014H
        SECTION_GROUP _A_PE_ODR
// union <unnamed> volatile _A_PE_ODR
_A_PE_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0501eH
        SECTION_GROUP _A_PG_ODR
// union <unnamed> volatile _A_PG_ODR
_A_PG_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05240H
        SECTION_GROUP _A_UART2_SR
// union <unnamed> volatile _A_UART2_SR
_A_UART2_SR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05241H
        SECTION_GROUP UART2_DR
// unsigned char volatile UART2_DR
UART2_DR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05342H
        SECTION_GROUP _A_TIM4_SR
// union <unnamed> volatile _A_TIM4_SR
_A_TIM4_SR:
        DS8 1
//   23 #include "Uart.h"
//   24 #include "PWM_Control.h"
//   25 #include "delayTime.h"
//   26 /*****************************************************************************/  
//   27 extern int count_time[5];
//   28 extern char errno;

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   29 enum Flag_Interrupt_err{igbt_up_err = 2,igbt_dn_err,o_input_vol_err,o_input_cur_err,o_coil_vol_err,o_coil_cur_err}as;
as:
        DS8 1
//   30 /*******************************************************************************
//   31 -----------------------------    Global define   -------------------------------
//   32 *******************************************************************************/
//   33 
//   34 #pragma vector=1

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   35 __interrupt void TRAP_IRQHandler(void)
//   36 {
TRAP_IRQHandler:
_interrupt_1:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALLF     L:?push_l0
        CALLF     L:?push_l1
//   37    _delay_us(1000); 
        LDW       X, #0x3e8
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALLF     _delay_us
//   38 }
        CALLF     L:?pop_l1
        CALLF     L:?pop_l0
        IRET
//   39 #pragma vector=2

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   40 __interrupt void TLI_IRQHandler(void)
//   41 {
//   42 
//   43 }
TLI_IRQHandler:
_interrupt_2:
        IRET
//   44 #pragma vector=3

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   45 __interrupt void AWU_IRQHandler(void)
//   46 {
//   47   
//   48 }
AWU_IRQHandler:
_interrupt_3:
        IRET
//   49 #pragma vector=4

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   50 __interrupt void CLK_IRQHandler(void)
//   51 {
//   52   
//   53 }
CLK_IRQHandler:
_interrupt_4:
        IRET
//   54 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   55 void AbortFunCheck(const unsigned char num)
//   56 {
AbortFunCheck:
        PUSH      S:?b8
        LD        S:?b8, A
//   57 	CNT_Prot[num]++;
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b8
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_Prot,Y), X
//   58 	if(CNT_Prot[num] >= 10)
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        CPW       X, #0xa
        JRC       L:??AbortFunCheck_0
//   59 	{
//   60 		PE_ODR_ODR0 = 1;//关断IGBT
        BSET      L:0x5014, #0x0
//   61 		Time1_PWM_Close_Mode_Fast();
        CALLF     Time1_PWM_Close_Mode_Fast
//   62 		RecordPwmInfo[0]= Flag_RECV_ADDRESS_NUM;
        MOV       L:RecordPwmInfo, L:Flag_RECV_ADDRESS_NUM
//   63 		RecordPwmInfo[1] = CNT_FULL_Num;
        MOV       L:RecordPwmInfo + 1, L:CNT_FULL_Num
//   64 		CNT_Prot[num] = 0;
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
//   65 		ProtectFlag[num] = 1;
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        LD        A, #0x1
        LD        (L:ProtectFlag,X), A
//   66 		if(MacStatus != C_MSProt)
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      L:??AbortFunCheck_1
//   67 		{
//   68 			CNT_MPSub_Beep = 500;
        LDW       X, #0x1f4
        LDW       L:CNT_MPSub_Beep, X
//   69 			ProNum = num;	
        LD        A, S:?b8
        LD        L:ProNum, A
//   70 			MacStatus = C_MSProt;			
        MOV       L:MacStatus, #0x4
//   71 		} 
//   72 		errno = num - 1;
??AbortFunCheck_1:
        LD        A, S:?b8
        ADD       A, #0xff
        LD        L:errno, A
//   73 	}
//   74 	Broken_Code = 1;
??AbortFunCheck_0:
        MOV       L:Broken_Code, #0x1
//   75 }
        POP       S:?b8
        RETF
        REQUIRE _A_PE_ODR
//   76 //完成IGBT上/下管饱和出错报警，输入电压过高告警，输出电流过高告警
//   77 #pragma vector=5

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   78 __interrupt void EXTI_PORTA_IRQHandler(void)
//   79 {
EXTI_PORTA_IRQHandler:
_interrupt_5:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALLF     L:?push_l0
        CALLF     L:?push_l1
//   80 	if(PA_IDR_IDR3  == 0)					//IGBT_M_UP_ERR
        LD        A, L:0x5001
        SRL       A
        SRL       A
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JRNE      L:??EXTI_PORTA_IRQHandler_0
//   81 	{
//   82 		//完成IGBT上管饱和出错报警，代码如下：
//   83 		AbortFunCheck(igbt_up_err);
        LD        A, #0x2
        CALLF     AbortFunCheck
        JRA       L:??EXTI_PORTA_IRQHandler_1
//   84 	}
//   85 	else if(PA_IDR_IDR4 == 0)  			//IGBT_M_DN_ERR
??EXTI_PORTA_IRQHandler_0:
        LD        A, L:0x5001
        SWAP      A
        AND       A, #0xf
        AND       A, #0x1
        CP        A, #0x0
        JRNE      L:??EXTI_PORTA_IRQHandler_2
//   86 	{
//   87 		//完成IGBT下管饱和出错报警，代码如下：
//   88 		AbortFunCheck(igbt_dn_err);
        LD        A, #0x3
        CALLF     AbortFunCheck
        JRA       L:??EXTI_PORTA_IRQHandler_1
//   89 	}
//   90 	else if(PA_IDR_IDR5 == 0)  			//O_INPUT_VOL
??EXTI_PORTA_IRQHandler_2:
        LD        A, L:0x5001
        SWAP      A
        AND       A, #0xf
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JRNE      L:??EXTI_PORTA_IRQHandler_3
//   91 	{
//   92 		//整流桥后电压过高出错报警，代码如下：
//   93 		AbortFunCheck(o_input_vol_err);
        LD        A, #0x4
        CALLF     AbortFunCheck
        JRA       L:??EXTI_PORTA_IRQHandler_1
//   94 	}
//   95 	else if(PA_IDR_IDR6 == 0)  			//O_INPUT_CUR
??EXTI_PORTA_IRQHandler_3:
        LD        A, L:0x5001
        CALLF     L:?srl8_a_a_6
        AND       A, #0x1
        CP        A, #0x0
        JRNE      L:??EXTI_PORTA_IRQHandler_1
//   96 	{
//   97 		//总消耗电流过大告警，代码如下：
//   98 		AbortFunCheck(o_input_cur_err);
        LD        A, #0x5
        CALLF     AbortFunCheck
//   99 	}
//  100 }
??EXTI_PORTA_IRQHandler_1:
        CALLF     L:?pop_l1
        CALLF     L:?pop_l0
        IRET
        REQUIRE _A_PA_IDR
//  101 #pragma vector=6

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  102 __interrupt void EXTI_PORTB_IRQHandler(void)
//  103 {
EXTI_PORTB_IRQHandler:
_interrupt_6:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALLF     L:?push_l0
        CALLF     L:?push_l1
//  104 	if(PB_IDR_IDR7 == 0) 					//O_COIL_VOL
        BTJT      L:0x5006, #0x7, L:??EXTI_PORTB_IRQHandler_0
//  105 	{
//  106 		//线圈LC谐振回路超压出错报警，代码如下：
//  107 		AbortFunCheck(o_coil_vol_err);
        LD        A, #0x6
        CALLF     AbortFunCheck
        JRA       L:??EXTI_PORTB_IRQHandler_1
//  108 	}
//  109 	else if(PB_IDR_IDR6  == 0)  			//0_COIL_CUR
??EXTI_PORTB_IRQHandler_0:
        LD        A, L:0x5006
        CALLF     L:?srl8_a_a_6
        AND       A, #0x1
        CP        A, #0x0
        JRNE      L:??EXTI_PORTB_IRQHandler_1
//  110 	{
//  111 		//线圈电流过高出错报警，代码如下：
//  112 		AbortFunCheck(o_coil_cur_err);
        LD        A, #0x7
        CALLF     AbortFunCheck
//  113 	}
//  114 }
??EXTI_PORTB_IRQHandler_1:
        CALLF     L:?pop_l1
        CALLF     L:?pop_l0
        IRET
        REQUIRE _A_PB_IDR
//  115 #pragma vector=7

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  116 __interrupt void EXTI_PORTC_IRQHandler(void)
//  117 {
//  118 
//  119 }
EXTI_PORTC_IRQHandler:
_interrupt_7:
        IRET
//  120 #pragma vector=8

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  121 __interrupt void EXTI_PORTD_IRQHandler(void)
//  122 {
//  123 	
//  124 
//  125 }
EXTI_PORTD_IRQHandler:
_interrupt_8:
        IRET
//  126 #pragma vector=9

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  127 __interrupt void EXTI_PORTE_IRQHandler(void)
//  128 {
//  129    
//  130 }
EXTI_PORTE_IRQHandler:
_interrupt_9:
        IRET
//  131 
//  132 #pragma vector=0xC

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  133 __interrupt void SPI_IRQHandler(void)
//  134 {
//  135     
//  136 }
SPI_IRQHandler:
_interrupt_12:
        IRET
//  137 #pragma vector=0xD

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  138 __interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void)
//  139 {
//  140     
//  141 }
TIM1_UPD_OVF_TRG_BRK_IRQHandler:
_interrupt_13:
        IRET
//  142 #pragma vector=0xE

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  143 __interrupt void TIM1_CAP_COM_IRQHandler(void)
//  144 {
//  145   
//  146 }
TIM1_CAP_COM_IRQHandler:
_interrupt_14:
        IRET
//  147 
//  148 #pragma vector=0xF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  149 __interrupt void TIM2_UPD_OVF_BRK_IRQHandler(void)
//  150 {
//  151      
//  152 }
TIM2_UPD_OVF_BRK_IRQHandler:
_interrupt_15:
        IRET
//  153 #pragma vector=0x10

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  154 __interrupt void TIM2_CAP_COM_IRQHandler(void)
//  155 {
//  156   
//  157 }
TIM2_CAP_COM_IRQHandler:
_interrupt_16:
        IRET
//  158 
//  159 
//  160 #pragma vector=0x11

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  161 __interrupt void TIM3_UPD_OVF_BRK_IRQHandler(void)
//  162 {
//  163     
//  164 }
TIM3_UPD_OVF_BRK_IRQHandler:
_interrupt_17:
        IRET
//  165 #pragma vector=0x12

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  166 __interrupt void TIM3_CAP_COM_IRQHandler(void)
//  167 {
//  168      //++globetimer;
//  169 }
TIM3_CAP_COM_IRQHandler:
_interrupt_18:
        IRET
//  170 
//  171 #pragma vector=0x13

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  172 __interrupt void UART1_TX_IRQHandler(void)
//  173 {
//  174   
//  175 }
UART1_TX_IRQHandler:
_interrupt_19:
        IRET
//  176 #pragma vector=0x14

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  177 __interrupt void UART2_TX_IRQHandler(void)
//  178 { 
//  179 
//  180 }
UART2_TX_IRQHandler:
_interrupt_20:
        IRET
//  181 
//  182 #pragma vector=0x17

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  183 __interrupt void UART2_RX_IRQHandler(void)
//  184 {
UART2_RX_IRQHandler:
_interrupt_23:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALLF     L:?push_l0
        CALLF     L:?push_l1
        SUB       SP, #0x1
//  185     volatile unsigned char reg;
//  186     if(UART2_SR_OR_LHE)
        LD        A, L:0x5240
        SRL       A
        SRL       A
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??UART2_RX_IRQHandler_0
//  187     {
//  188         reg = UART2_SR;
        LD        A, L:0x5240
        LD        (0x1,SP), A
//  189         reg = UART2_DR;
        LD        A, L:0x5241
        LD        (0x1,SP), A
//  190         UART2_RxInterrupt(reg);  
        LD        A, (0x1,SP)
        CALLF     UART2_RxInterrupt
        JRA       L:??UART2_RX_IRQHandler_1
//  191     }
//  192     else if(UART2_SR_RXNE)
??UART2_RX_IRQHandler_0:
        LD        A, L:0x5240
        SWAP      A
        AND       A, #0xf
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??UART2_RX_IRQHandler_1
//  193     {
//  194         reg = UART2_DR;
        LD        A, L:0x5241
        LD        (0x1,SP), A
//  195         UART2_RxInterrupt(reg); 
        LD        A, (0x1,SP)
        CALLF     UART2_RxInterrupt
//  196 		//UART2_SR_RXNE = 0;
//  197     }
//  198 }
??UART2_RX_IRQHandler_1:
        ADD       SP, #0x1
        CALLF     L:?pop_l1
        CALLF     L:?pop_l0
        IRET
        REQUIRE _A_UART2_SR
        REQUIRE UART2_DR
//  199 
//  200 
//  201 #pragma vector=0x16

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  202 __interrupt void UART3_TX_IRQHandler(void)
//  203 {
//  204   
//  205 }
UART3_TX_IRQHandler:
_interrupt_22:
        IRET
//  206 #pragma vector=0x15

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  207 __interrupt void UART3_RX_IRQHandler(void)
//  208 {
//  209  	
//  210 }
UART3_RX_IRQHandler:
_interrupt_21:
        IRET
//  211 
//  212 
//  213 #pragma vector=0x18

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  214 __interrupt void ADC2_IRQHandler(void)
//  215 {
//  216 
//  217 }
ADC2_IRQHandler:
_interrupt_24:
        IRET
//  218 
//  219 
//  220 #pragma vector=0x19

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  221 __interrupt void TIM4_UPD_OVF_IRQHandler(void)//每2ms进入一次
//  222 {
TIM4_UPD_OVF_IRQHandler:
_interrupt_25:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALLF     L:?push_l0
        CALLF     L:?push_l1
//  223 	CNT_T1ms++;
        LDW       X, L:CNT_T1ms
        INCW      X
        LDW       L:CNT_T1ms, X
//  224 	CNT_T1s++;
        LDW       X, L:CNT_T1s
        INCW      X
        LDW       L:CNT_T1s, X
//  225 
//  226     if(++globetimer >= GLOBLETIME) //20170221 防止计数溢出，满99天后回归至10值
        LDW       X, #globetimer
        CALLF     L:?load32_l0_0x
        CALLF     L:?inc32_l0_l0
        LDW       X, #globetimer
        CALLF     L:?load32_0x_l0
        LDW       X, #globetimer
        CALLF     L:?load32_l0_0x
        LDW       X, S:?w0
        CPW       X, #0xffff
        JRNE      L:??TIM4_UPD_OVF_IRQHandler_0
        LDW       X, S:?w1
        CPW       X, #0xfffa
??TIM4_UPD_OVF_IRQHandler_0:
        JRC       L:??TIM4_UPD_OVF_IRQHandler_1
//  227 		globetimer = 10;
        LDW       X, #0x0
        LDW       L:globetimer, X
        LDW       X, #0xa
        LDW       L:globetimer + 2, X
//  228 	if(CNT_T1ms >= 5) //20170213 10ms进入一次
??TIM4_UPD_OVF_IRQHandler_1:
        LDW       X, L:CNT_T1ms
        CPW       X, #0x5
        JRC       L:??TIM4_UPD_OVF_IRQHandler_2
//  229 	{
//  230 		CNT_T1ms = 0;
        CLRW      X
        LDW       L:CNT_T1ms, X
//  231 		Flag_10ms_1 = 0xFF;//10ms once
        MOV       L:_A_Flag_10ms_1, #0xff
//  232 		Flag_10ms_2 = 0xFF;//10ms once
        MOV       L:_A_Flag_10ms_2, #0xff
//  233 	}
//  234 	CNT_T2ms = 1;
??TIM4_UPD_OVF_IRQHandler_2:
        CLRW      X
        INCW      X
        LDW       L:CNT_T2ms, X
//  235 	if(Flag_10ms_H)
        BTJT      L:_A_Flag_10ms_1, #0x0, ??lb_0
        JPF       L:??TIM4_UPD_OVF_IRQHandler_3
//  236 	{
//  237 		Flag_10ms_H = 0;
??lb_0:
        BRES      L:_A_Flag_10ms_1, #0x0
//  238 		//空闲开始计时
//  239 		if(status == C_MSIdle)
        LD        A, L:status
        TNZ       A
        JRNE      L:??TIM4_UPD_OVF_IRQHandler_4
//  240         {
//  241 			count_time[3]++;
        LDW       X, L:count_time + 6
        INCW      X
        LDW       L:count_time + 6, X
//  242         }
//  243         //pwm关闭时间计时，也就是满足条件后PWM会关闭
//  244         if(FLAG_PWM_START == 1)
??TIM4_UPD_OVF_IRQHandler_4:
        LD        A, #0x1
        CP        A, L:FLAG_PWM_START
        JRNE      L:??TIM4_UPD_OVF_IRQHandler_5
//  245 		{
//  246 			count_time[2]++;
        LDW       X, L:count_time + 4
        INCW      X
        LDW       L:count_time + 4, X
        JRA       L:??TIM4_UPD_OVF_IRQHandler_6
//  247 		}
//  248 		else if(FLAG_PWM_START == 0)//pwm开启时间计时，满足条件后PWM开启
??TIM4_UPD_OVF_IRQHandler_5:
        LD        A, L:FLAG_PWM_START
        TNZ       A
        JRNE      L:??TIM4_UPD_OVF_IRQHandler_6
//  249 		{
//  250 			count_time[4]++;
        LDW       X, L:count_time + 8
        INCW      X
        LDW       L:count_time + 8, X
//  251 		}
//  252         //配对查询时间计时
//  253         if(status == C_MSPair)
??TIM4_UPD_OVF_IRQHandler_6:
        LD        A, #0x2
        CP        A, L:status
        JRNE      L:??TIM4_UPD_OVF_IRQHandler_7
//  254         {
//  255           count_time[0]++;
        LDW       X, L:count_time
        INCW      X
        LDW       L:count_time, X
//  256         }
//  257         //查询子端程序计时
//  258         if(status == C_MSWork)
??TIM4_UPD_OVF_IRQHandler_7:
        LD        A, #0x3
        CP        A, L:status
        JRNE      L:??TIM4_UPD_OVF_IRQHandler_8
//  259         {
//  260           count_time[1]++;
        LDW       X, L:count_time + 2
        INCW      X
        LDW       L:count_time + 2, X
//  261         }
//  262         /**************************************************/
//  263         /*****count_time[n] 必须小于256(2^8)，否则无效******/
//  264         /**************************************************/
//  265 		if(count_time[0] >= 2)//20ms查询是否有配对机nrf
??TIM4_UPD_OVF_IRQHandler_8:
        LDW       X, L:count_time
        CPW       X, #0x2
        JRSLT     L:??TIM4_UPD_OVF_IRQHandler_9
//  266 		{
//  267 			flag_statu[1] = 1;
        MOV       L:flag_statu + 1, #0x1
//  268 			count_time[0] = 0;
        CLRW      X
        LDW       L:count_time, X
//  269 		}
//  270 		if(count_time[1] >= 2)//20ms查询一次状态
??TIM4_UPD_OVF_IRQHandler_9:
        LDW       X, L:count_time + 2
        CPW       X, #0x2
        JRSLT     L:??TIM4_UPD_OVF_IRQHandler_10
//  271 		{
//  272 			flag_statu[2] = 1;
        MOV       L:flag_statu + 2, #0x1
//  273 			count_time[1] = 0;
        CLRW      X
        LDW       L:count_time + 2, X
//  274 		}
//  275 		if(count_time[2] >= 200)//50ms空闲状态等待 pwm开启时间
??TIM4_UPD_OVF_IRQHandler_10:
        LDW       X, L:count_time + 4
        CPW       X, #0xc8
        JRSLT     L:??TIM4_UPD_OVF_IRQHandler_11
//  276 		{
//  277 			flag_statu[0] = 1;
        MOV       L:flag_statu, #0x1
//  278 			count_time[2] = 0;
        CLRW      X
        LDW       L:count_time + 4, X
//  279 		}
//  280 		if(count_time[4] >= 300)//3sPWM关闭持续时间
??TIM4_UPD_OVF_IRQHandler_11:
        LDW       X, L:count_time + 8
        CPW       X, #0x12c
        JRSLT     L:??TIM4_UPD_OVF_IRQHandler_12
//  281 		{
//  282 			flag_statu[4] = 1;
        MOV       L:flag_statu + 4, #0x1
//  283 			count_time[4] = 0;
        CLRW      X
        LDW       L:count_time + 8, X
//  284 		}			
//  285 		if(count_time[3] >= 2)//20ms 发送nrf
??TIM4_UPD_OVF_IRQHandler_12:
        LDW       X, L:count_time + 6
        CPW       X, #0x2
        JRSLT     L:??TIM4_UPD_OVF_IRQHandler_3
//  286 		{
//  287 			flag_statu[3] = 1;
        MOV       L:flag_statu + 3, #0x1
//  288 			count_time[3] = 0;
        CLRW      X
        LDW       L:count_time + 6, X
//  289 		}
//  290 	}
//  291 	
//  292 	if((globetimer % 500 == 0) && (Flag_RECV_ADDRESS_NUM_SAME > 0))//LED1 RED
??TIM4_UPD_OVF_IRQHandler_3:
        LDW       X, #globetimer
        CALLF     L:?load32_l0_0x
        CALLF     L:?umod32_l1_l0_dl
        DATA
        DC32      0x1f4
        CODE
        LDW       X, S:?w2
        CPW       X, #0x0
        JRNE      L:??TIM4_UPD_OVF_IRQHandler_13
        LDW       X, S:?w3
        CPW       X, #0x0
??TIM4_UPD_OVF_IRQHandler_13:
        JRNE      L:??TIM4_UPD_OVF_IRQHandler_14
        LD        A, L:Flag_RECV_ADDRESS_NUM_SAME
        TNZ       A
        JREQ      L:??TIM4_UPD_OVF_IRQHandler_14
//  293     	PG_ODR_ODR0 = ~PG_ODR_ODR0;
        LD        A, #0x1
        AND       A, L:0x501e
        CPL       A
        MOV       S:?b0, L:0x501e
        CPL       S:?b0
        SRL       S:?b0
        BCCM      L:0x501e, #0x0
//  294 	if((globetimer % 500 == 0) && (Flag_Eeprom_Ero == 1) && (Flag_LED2_ENABLE == 1))//LED2 BULE
??TIM4_UPD_OVF_IRQHandler_14:
        LDW       X, #globetimer
        CALLF     L:?load32_l0_0x
        CALLF     L:?umod32_l1_l0_dl
        DATA
        DC32      0x1f4
        CODE
        LDW       X, S:?w2
        CPW       X, #0x0
        JRNE      L:??TIM4_UPD_OVF_IRQHandler_15
        LDW       X, S:?w3
        CPW       X, #0x0
??TIM4_UPD_OVF_IRQHandler_15:
        JRNE      L:??TIM4_UPD_OVF_IRQHandler_16
        LD        A, #0x1
        CP        A, L:Flag_Eeprom_Ero
        JRNE      L:??TIM4_UPD_OVF_IRQHandler_16
        LD        A, #0x1
        CP        A, L:Flag_LED2_ENABLE
        JRNE      L:??TIM4_UPD_OVF_IRQHandler_16
//  295     	PG_ODR_ODR1 = ~PG_ODR_ODR1;
        LD        A, L:0x501e
        SRL       A
        AND       A, #0x1
        LD        S:?b0, A
        CPL       S:?b0
        LD        A, L:0x501e
        CPL       A
        SRL       A
        SRL       A
        BCCM      L:0x501e, #0x1
//  296 	//置位
//  297     TIM4_SR &=0xFE;
??TIM4_UPD_OVF_IRQHandler_16:
        BRES      L:0x5342, #0x0
//  298 }
        CALLF     L:?pop_l1
        CALLF     L:?pop_l0
        IRET
        REQUIRE _A_PG_ODR
        REQUIRE _A_TIM4_SR
//  299 
//  300 #pragma vector=0x1A

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  301 __interrupt void EEPROM_EEC_IRQHandler(void)
//  302 {
//  303 
//  304 }
EEPROM_EEC_IRQHandler:
_interrupt_26:
        IRET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  305 /*******************************************************************************
//  306 -----------------------------    End of file    --------------------------------
//  307 *******************************************************************************/
// 
// 803 bytes in section .far_func.text
//   1 byte  in section .near.bss
//   7 bytes in section .near.noinit   (abs)
// 
// 803 bytes of CODE memory
//   1 byte  of DATA memory (+ 7 bytes shared)
//
//Errors: none
//Warnings: none
