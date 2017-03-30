///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.20.1.176 for STM8                29/Mar/2017  16:23:49
// Copyright 2010-2015 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\MacProtect.c
//    Command line =  
//        "E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\MacProtect.c"
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
//        E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List\MacProtect.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_w4
        EXTERN ?fadd32_l0_l0_0x
        EXTERN ?fcmpge32_c_l0_l1
        EXTERN ?fcmplt32_c_l0_dc32
        EXTERN ?fmul32_l0_l0_dc32
        EXTERN ?fsub32_l0_l0_0x
        EXTERN ?load32_0x_l0
        EXTERN ?load32_l0_0x
        EXTERN ?mov_l1_l0
        EXTERN ?mul16_x_x_w0
        EXTERN ?push_w4
        EXTERN ?sll16_x_x_a
        EXTERN ?srl8_a_a_6
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN Adjust_Time1_cycle2
        EXTERN Broken_Code
        EXTERN Buzz_Control
        EXTERN CNT_Fan_Check
        EXTERN CNT_Fan_Speed
        EXTERN CNT_MPSub_Beep
        EXTERN CNT_Prot
        EXTERN CNT_ProtB
        EXTERN CNT_ProtF
        EXTERN CNT_T500ms
        EXTERN Cnt_ForeignBody_Available
        EXTERN FLAG_PWM_START
        EXTERN Fan_Close
        EXTERN Fan_Open
        EXTERN Flag_Fan_Open
        EXTERN Flag_NRF24L01_OK
        EXTERN Flag_RECV_ADDRESS_NUM_SAME
        EXTERN Flag_enable_work
        EXTERN Float_ForeignBody_Value
        EXTERN Float_ForeignBody_Value_Sum
        EXTERN MacStatus
        EXTERN Power
        EXTERN ProNum
        EXTERN ProtectFlag
        EXTERN RX_Pro_Code_A
        EXTERN RX_Pro_Code_B
        EXTERN TX_Pro_Code_A
        EXTERN TX_Pro_Code_B
        EXTERN _A_Flag_10ms_1
        EXTERN _A_Flag_10ms_2
        EXTERN _delay_ms
        EXTERN devStatus
        EXTERN errno
        EXTERN flag_p

        PUBLIC ABORT_DEAL_FUC
        PUBLIC DEAL_ABNORMAL_FUN
        PUBLIC KPIdle
        PUBLIC MPSubA
        PUBLIC MPSubB
        PUBLIC MPSubC
        PUBLIC MPSub_Beep
        PUBLIC MPSub_Check_NRF24L01_IN
        PUBLIC MPSub_Check_NRF24L01_OUT
        PUBLIC MPSub_Curr_IN
        PUBLIC MPSub_Curr_IN_COIL
        PUBLIC MPSub_Curr_IN_INPUT
        PUBLIC MPSub_Curr_OUT
        PUBLIC MPSub_Curr_OUT_COIL
        PUBLIC MPSub_Curr_OUT_INPUT
        PUBLIC MPSub_Efficiency_Check_in
        PUBLIC MPSub_Efficiency_Check_out
        PUBLIC MPSub_Fan_IN
        PUBLIC MPSub_Fan_OUT
        PUBLIC MPSub_IGBT_IN
        PUBLIC MPSub_IGBT_IN_DN
        PUBLIC MPSub_IGBT_IN_UP
        PUBLIC MPSub_IGBT_OUT
        PUBLIC MPSub_IGBT_OUT_DN
        PUBLIC MPSub_IGBT_OUT_UP
        PUBLIC MPSub_Nrf24l01_IN
        PUBLIC MPSub_Nrf24l01_OUT
        PUBLIC MPSub_Pro_Code
        PUBLIC MPSub_Receiver_IN
        PUBLIC MPSub_Receiver_OUT
        PUBLIC MPSub_VOL_IN_COIL
        PUBLIC MPSub_VOL_IN_INPUT
        PUBLIC MPSub_VOL_OUT_COIL
        PUBLIC MPSub_VOL_OUT_INPUT
        PUBLIC MacProtect
        PUBLIC ProCodeTurn
        PUBLIC _A_PA_IDR
        PUBLIC _A_PB_CR2
        PUBLIC _A_PB_IDR
        PUBLIC _A_PD_IDR
        PUBLIC _A_PE_IDR
        PUBLIC _A_PE_ODR

// E:\2017�깤������\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\MacProtect.c
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

        ASEGN `.near.noinit`:DATA:NOROOT,05009H
        SECTION_GROUP _A_PB_CR2
// union <unnamed> volatile _A_PB_CR2
_A_PB_CR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05010H
        SECTION_GROUP _A_PD_IDR
// union <unnamed> const volatile _A_PD_IDR
_A_PD_IDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05014H
        SECTION_GROUP _A_PE_ODR
// union <unnamed> volatile _A_PE_ODR
_A_PE_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05015H
        SECTION_GROUP _A_PE_IDR
// union <unnamed> const volatile _A_PE_IDR
_A_PE_IDR:
        DS8 1
//   21 #include "MacProtect.h"
//   22 #include "PWM_Control.h"
//   23 #include "FAN_Control.h"
//   24 #include "Buzz.h"
//   25 #include "delayTime.h"
//   26 

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   27 static float const_f_empty_value = 2.01425;
const_f_empty_value:
        DC32 4000E979H

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   28 static unsigned int Num_Interruput_Broken = 0;
Num_Interruput_Broken:
        DS8 2
//   29 extern char errno;
//   30 //******************************************************************************
//   31 //异常检测与处理
//   32 //******************************************************************************
//   33 void MacProtect()
//   34 { 
//   35     if(Flag_10ms_D ==1)
//   36     {
//   37         Flag_10ms_D =0;
//   38 		
//   39         //MPSubA(0,ACTemp_DD,C_Minimum_IGBT_Hotn,C_Maximum_IGBT_Hot);//进入IGBT超温
//   40 		//MPSubA(1,ACTemp_DD,C_Minimum_COIL_Hotn,C_Maximum_COIL_Hot);//进入COIL超温
//   41 		
//   42 		
//   43 		//MPSubB(0,ACTemp_DD,C_Back_Minimum_IGBT_Hot,C_Back_Maximum_IGBT_Hot);//退出IGBT超温
//   44 		//MPSubB(1,ACTemp_DD,C_Back_Minimum_COIL_Hot,C_Back_Maximum_COIL_Hot);//退出COIL超温
//   45 		//MPSub_Efficiency_Check_out(7);//效率异常检测
//   46 		MPSub_IGBT_OUT_UP(2);
//   47 		MPSub_IGBT_OUT_DN(3);
//   48 		
//   49 		MPSub_VOL_OUT_INPUT(4);
//   50         MPSub_Curr_OUT_INPUT(5);
//   51            
//   52         MPSub_VOL_OUT_COIL(6);
//   53         MPSub_Curr_OUT_COIL(7);
//   54 		
//   55 		//MPSub_Efficiency_Check_in(8);//效率异常检测进入
//   56 		//MPSub_Efficiency_Check_out(8);//效率异常检测退出
//   57         MPSub_Beep();//蜂鸣器
//   58     }
//   59 }
//   60 //******************************************************************************
//   61 void MPSub_Efficiency_Check_in(unsigned char protype)
//   62 {
//   63 	if((ProtectFlag[protype] == 0) && (Cnt_ForeignBody_Available == Flag_RECV_ADDRESS_NUM_SAME) && (FLAG_PWM_START == 1))
//   64     {
//   65 		if(Cnt_ForeignBody_Available > 0)
//   66 		{
//   67 			for(int i = 0;i<Flag_RECV_ADDRESS_NUM_SAME;i++)
//   68 				Float_ForeignBody_Value_Sum += Float_ForeignBody_Value[i];
//   69 		
//   70 			if((Power * 0.65 - Float_ForeignBody_Value_Sum) <= FLOATCOMPAREDVALUE)
//   71 			{
//   72 				CNT_Prot[protype]++;
//   73 				if(CNT_Prot[protype] >= 1000)//10s
//   74 				{	
//   75 					PE_ODR_ODR0 = 1;//关断IGBT
//   76 					CNT_Prot[protype] = 0;
//   77 					ProtectFlag[protype] = 1;
//   78 					if(MacStatus != C_MSProt)
//   79 					{
//   80 						CNT_MPSub_Beep = 500;
//   81 						ProNum = protype;	
//   82 						MacStatus = C_MSProt;
//   83 					}
//   84 					errno = protype - 1;		
//   85 				}
//   86 				Broken_Code = 1;
//   87 				
//   88 			}	
//   89 			else
//   90 			{
//   91 				CNT_Prot[protype] = 0;
//   92 			}
//   93 		}
//   94 		else
//   95 		{
//   96 			if(Power >= (const_f_empty_value * 1.05))
//   97 			{
//   98 				CNT_Prot[protype]++;
//   99 				if(CNT_Prot[protype] >= 10)//10s
//  100 				{	
//  101 					PE_ODR_ODR0 = 1;//关断IGBT
//  102 					CNT_Prot[protype] = 0;
//  103 					ProtectFlag[protype] = 1;
//  104 					if(MacStatus != C_MSProt)
//  105 					{
//  106 						CNT_MPSub_Beep = 500;
//  107 						ProNum = protype;	
//  108 						MacStatus = C_MSProt;
//  109 					}
//  110 					errno = protype - 1;
//  111 				}
//  112 				Broken_Code = 1;	
//  113 			}
//  114 			else
//  115 			{
//  116 				CNT_Prot[protype] = 0;
//  117 				Broken_Code = 0;
//  118 				errno = 0;
//  119 			}
//  120 		}
//  121 	}
//  122 	Cnt_ForeignBody_Available = 0;
//  123 }
//  124 
//  125 
//  126 void MPSub_Efficiency_Check_out(unsigned char protype)
//  127 {
//  128 	if((ProtectFlag[protype] == 1) && (CNT_ProtF[protype] == 1))
//  129     {
//  130 		CNT_ProtB[protype]++;
//  131 		if(CNT_ProtB[protype] >= 200)
//  132 		{
//  133 			CNT_ProtF[protype] = 0;
//  134 			CNT_ProtB[protype] = 0;
//  135 			ProtectFlag[protype] = 0;
//  136 			MPSubC();
//  137 		}        
//  138     }
//  139 	//else if(ProtectFlag[protype] == 1) && 
//  140 	else
//  141 	{
//  142 		CNT_ProtB[protype] = 0;
//  143 	}
//  144 }
//  145 
//  146 //******************************************************************************
//  147 //异常检测
//  148 //******************************************************************************
//  149 void  MPSubA(unsigned char protype,unsigned int advalue,unsigned int ladv,unsigned int hadv)	
//  150 {
//  151     if(ProtectFlag[protype] == 0)
//  152     {
//  153         if(advalue >= C_Maximum_Temp1)
//  154         {
//  155             CNT_Prot[protype]++;
//  156             if(CNT_Prot[protype] >= 200)
//  157             {
//  158                 CNT_Prot[protype] = 0;
//  159                 ProtectFlag[protype] = 1;
//  160                 if(MacStatus != C_MSProt)
//  161                 {
//  162                     CNT_MPSub_Beep = 500;
//  163                     ProNum = protype;	
//  164                     MacStatus = C_MSProt;
//  165 				}
//  166             }
//  167 		}
//  168 		else
//  169 		{
//  170 			CNT_Prot[protype] = 0;
//  171 		}
//  172     }
//  173 }
//  174 //******************************************************************************
//  175 
//  176 
//  177 //******************************************************************************
//  178 //异常处理
//  179 //******************************************************************************
//  180 void  MPSubB(unsigned char protype,unsigned int advalue,unsigned int ladv,unsigned int hadv)	
//  181 {
//  182     if(ProtectFlag[protype] == 1)
//  183     {
//  184         if(advalue <= C_Minimum_Temp1)
//  185         {
//  186             CNT_ProtB[protype]++;
//  187             if(CNT_ProtB[protype] >= 100)
//  188             {
//  189                 CNT_ProtB[protype] = 0;
//  190                 ProtectFlag[protype] = 0;
//  191                 MPSubC();
//  192             }
//  193         }
//  194         else
//  195         {
//  196             CNT_ProtB[protype] = 0;
//  197         }
//  198     }
//  199 }
//  200 //******************************************************************************
//  201 
//  202 
//  203 //******************************************************************************
//  204 //退出异常
//  205 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  206 void  MPSubC(void)
//  207 {
//  208     unsigned char i,j;	
//  209     j = 0;	
MPSubC:
        CLR       S:?b1
//  210     for(i = 0;i <= 15;i++)
        CLR       S:?b0
        JRA       L:??MPSubC_0
//  211     {
//  212         if(ProtectFlag[i] == 1)
??MPSubC_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSubC_2
//  213         {
//  214             j++;
        LD        A, S:?b1
        ADD       A, #0x1
        LD        S:?b1, A
//  215         }
//  216     }	
??MPSubC_2:
        LD        A, S:?b0
        ADD       A, #0x1
        LD        S:?b0, A
??MPSubC_0:
        LD        A, S:?b0
        CP        A, #0x10
        JRC       L:??MPSubC_1
//  217     if(j == 0)
        TNZ       S:?b1
        JRNE      L:??MPSubC_3
//  218     {
//  219         KPIdle(); 
        CALLF     KPIdle
//  220     }
//  221 }
??MPSubC_3:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Curr_OUT_COIL:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_Curr_OUT_COIL_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtF,X)
        CPW       X, #0x1
        JRNE      L:??MPSub_Curr_OUT_COIL_0
        LD        A, L:0x5006
        CALLF     L:?srl8_a_a_6
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??MPSub_Curr_OUT_COIL_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_ProtB,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        CPW       X, #0xc8
        JRC       L:??MPSub_Curr_OUT_COIL_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtF,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:ProtectFlag,X), A
        JPF       MPSubC
??MPSub_Curr_OUT_COIL_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        MOV       L:Broken_Code, #0x0
        MOV       L:errno, #0x0
??MPSub_Curr_OUT_COIL_0:
        RETF
        REQUIRE _A_PB_IDR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_VOL_OUT_COIL:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_VOL_OUT_COIL_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtF,X)
        CPW       X, #0x1
        JRNE      L:??MPSub_VOL_OUT_COIL_0
        BTJF      L:0x5006, #0x7, L:??MPSub_VOL_OUT_COIL_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_ProtB,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        CPW       X, #0xc8
        JRC       L:??MPSub_VOL_OUT_COIL_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtF,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:ProtectFlag,X), A
        JPF       MPSubC
??MPSub_VOL_OUT_COIL_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        MOV       L:Broken_Code, #0x0
        MOV       L:errno, #0x0
??MPSub_VOL_OUT_COIL_0:
        RETF
        REQUIRE _A_PB_IDR
//  222 //******************************************************************************
//  223 
//  224 
//  225 //******************************************************************************
//  226 //异常轮流显示
//  227 //******************************************************************************
//  228 void  ProCodeTurn(void)		
//  229 {
//  230 }
//  231 //******************************************************************************
//  232 
//  233 
//  234 //******************************************************************************
//  235 //退出异常
//  236 //******************************************************************************
//  237 void  KPIdle(void)
//  238 {
//  239 	MacStatus = C_MSNORMAL;//故障恢复后进入待机状态本程序待机直接进入查询状态
//  240 	errno = 0;
//  241 	flag_p = 4;
//  242 	//Clear_Nrf24l01();
//  243 }
//  244 //******************************************************************************
//  245 
//  246 
//  247 //******************************************************************************
//  248 //进入IGBT中断异常
//  249 //******************************************************************************
//  250 void  MPSub_IGBT_IN(unsigned char protype)
//  251 {
//  252    if(Flag_enable_work ==1)
//  253    {
//  254        ProtectFlag[protype] = 1;
//  255        if(MacStatus != C_MSProt)
//  256        {
//  257             CNT_MPSub_Beep = 500;
//  258             ProNum = protype;	
//  259             MacStatus = C_MSProt;
//  260         }
//  261    }
//  262 }
//  263 //******************************************************************************
//  264 
//  265 
//  266 //******************************************************************************
//  267 //退出IGBT中断异常
//  268 //******************************************************************************
//  269 void  MPSub_IGBT_OUT(unsigned char protype)
//  270 {
//  271     if(ProtectFlag[protype] == 1)
//  272     {
//  273         if(IGBT_Check_PIN ==1)
//  274         {
//  275             CNT_ProtB[protype]++;
//  276             if(CNT_ProtB[protype] >= 100)
//  277             {
//  278                 CNT_ProtB[protype] = 0;
//  279                 ProtectFlag[protype] = 0;
//  280                 Flag_enable_work =0;
//  281                 MPSubC();
//  282             }
//  283         }
//  284         else
//  285         {
//  286             CNT_ProtB[protype] = 0;
//  287         }
//  288     }
//  289 }
//  290 //******************************************************************************
//  291 
//  292 
//  293 //******************************************************************************
//  294 //进入过流保护
//  295 //******************************************************************************
//  296 void  MPSub_Curr_IN(unsigned char protype)
//  297 {
//  298     if(ProtectFlag[protype] == 0)
//  299     {
//  300         if(PE_IDR_IDR6 ==0)
//  301         {
//  302             CNT_Prot[protype]++;
//  303             if(CNT_Prot[protype] >=2)
//  304             {
//  305                 CNT_Prot[protype] = 0;
//  306                 ProtectFlag[protype] = 1;
//  307                 if(MacStatus != C_MSProt)
//  308                 {
//  309                     CNT_MPSub_Beep =500;
//  310                     ProNum = protype;	
//  311                     MacStatus = C_MSProt;
//  312 				}  
//  313             }
//  314         }
//  315         else
//  316         {
//  317              CNT_Prot[protype] = 0;
//  318         }
//  319     }
//  320 }
//  321 //******************************************************************************
//  322 
//  323 
//  324 //******************************************************************************
//  325 //退出过流保护
//  326 //******************************************************************************
//  327 void  MPSub_Curr_OUT(unsigned char protype)
//  328 {
//  329     if(ProtectFlag[protype] == 1)
//  330     {
//  331         if(PE_IDR_IDR6 == 1)
//  332         {
//  333             CNT_ProtB[protype]++;
//  334             if(CNT_ProtB[protype] >= 200)
//  335             {
//  336                 CNT_ProtB[protype] = 0;
//  337                 ProtectFlag[protype] = 0;
//  338                 MPSubC();
//  339             }
//  340         }
//  341         else
//  342         {
//  343            CNT_ProtB[protype] = 0;
//  344         }
//  345     }
//  346 }
//  347 //******************************************************************************
//  348 
//  349 
//  350 //******************************************************************************
//  351 //风扇故障检测
//  352 //******************************************************************************
//  353 void  MPSub_Fan_IN(unsigned char protype)
//  354 {
//  355     if(Flag_Fan_Open ==1)
//  356     {
//  357         CNT_Fan_Check++;
//  358         if(CNT_Fan_Check >=10)
//  359         {   
//  360             PB_CR2 = 0x00;//关闭PB3中断
//  361             if(CNT_Fan_Speed <100)
//  362             {
//  363                 CNT_Prot[protype]++;
//  364                 if(CNT_Prot[protype] >= 5)
//  365                 {
//  366                     CNT_Prot[protype] = 0;
//  367                     ProtectFlag[protype] = 1;
//  368                     if(MacStatus != C_MSProt)
//  369                     {
//  370                         CNT_MPSub_Beep =500;
//  371                         ProNum = protype;	
//  372                         MacStatus = C_MSProt;
//  373                     }
//  374                 }               
//  375             }
//  376             CNT_Fan_Check =0;
//  377             CNT_Fan_Speed =0;
//  378             //PB_CR2 = 0x08;//打开PB3中断 
//  379         }
//  380     }
//  381     else
//  382     {
//  383         CNT_Fan_Check =0;
//  384         //PB_CR2 = 0x00;//关闭PB3中断
//  385         CNT_Prot[protype] =0;
//  386         CNT_Fan_Speed =0;
//  387     }
//  388 }
//  389 //******************************************************************************
//  390 
//  391 //******************************************************************************
//  392 //风扇故障退出
//  393 //******************************************************************************
//  394 void  MPSub_Fan_OUT(unsigned char protype)
//  395 {
//  396     if(ProtectFlag[protype] == 1)
//  397     {
//  398         if(Flag_Fan_Open ==1)
//  399         {
//  400             CNT_Fan_Check++;
//  401             if(CNT_Fan_Check >=10)
//  402             {   
//  403                 //PB_CR2 = 0x00;//关闭PB3中断
//  404                 if(CNT_Fan_Speed >=100)
//  405                 {
//  406                     CNT_ProtB[protype]++;
//  407                     if(CNT_ProtB[protype] >= 2)
//  408                     {
//  409                         CNT_ProtB[protype] = 0;
//  410 						ProtectFlag[protype] = 0;
//  411 						MPSubC();
//  412                     }               
//  413                 }
//  414                 CNT_Fan_Check =0;
//  415                 CNT_Fan_Speed =0;
//  416                 //PB_CR2 = 0x08;//打开PB3中断 
//  417             }
//  418         }
//  419         else
//  420         {
//  421             CNT_Fan_Check =0;
//  422             //PB_CR2 = 0x00;//关闭PB3中断
//  423             CNT_ProtB[protype] =0;
//  424             CNT_Fan_Speed =0;
//  425         }        
//  426     }    
//  427 }
//  428 //******************************************************************************
//  429 
//  430 
//  431 //******************************************************************************
//  432 //无线通信异常检测
//  433 //******************************************************************************
//  434 void  MPSub_Nrf24l01_IN(unsigned char protype)
//  435 {
//  436     if(ProtectFlag[protype] == 0)
//  437     {
//  438         if((MacStatus ==C_MSWork)||(Flag_NRF24L01_OK ==1))
//  439         {
//  440             CNT_Prot[protype]--;
//  441             if(CNT_Prot[protype] == 0)
//  442             {
//  443                 CNT_Prot[protype] = 200;
//  444                 ProtectFlag[protype] = 1;
//  445                 Flag_NRF24L01_OK = 0;
//  446                 if(MacStatus != C_MSProt)
//  447                 {
//  448                     CNT_MPSub_Beep = 500;
//  449                     ProNum = protype;	
//  450                     MacStatus = C_MSProt;
//  451 				}
//  452              }
//  453          }
//  454     }  
//  455 }
//  456 //******************************************************************************
//  457 
//  458 
//  459 //******************************************************************************
//  460 //退出无线通信异常
//  461 //******************************************************************************
//  462 void  MPSub_Nrf24l01_OUT(unsigned char protype)
//  463 {
//  464     if(ProtectFlag[protype] == 1)
//  465     {
//  466         CNT_ProtB[protype]++;
//  467         if(CNT_ProtB[protype] >= 100)
//  468         {
//  469             CNT_ProtB[protype] = 0;
//  470             ProtectFlag[protype] = 0;
//  471             MPSubC();
//  472         }
//  473     }
//  474     else
//  475     {
//  476         CNT_ProtB[protype] = 0;
//  477     }
//  478 }
//  479 //******************************************************************************
//  480 
//  481 //******************************************************************************
//  482 ////从机有故障
//  483 //******************************************************************************
//  484 void  MPSub_Receiver_IN(unsigned char protype)
//  485 {
//  486   if(ProtectFlag[protype] == 0)
//  487   {
//  488      if((RX_Pro_Code_A !=0) || (RX_Pro_Code_B !=0))
//  489      {
//  490          ProtectFlag[protype] = 1;
//  491          if(MacStatus != C_MSProt)
//  492          {
//  493               CNT_MPSub_Beep = 500;
//  494               ProNum = protype; 
//  495               MacStatus = C_MSProt;
//  496          }
//  497          CNT_ProtB[protype] =0;
//  498      }
//  499   }
//  500 }
//  501 //******************************************************************************
//  502 
//  503 
//  504 //******************************************************************************
//  505 ////退出从机故障
//  506 //******************************************************************************
//  507 void  MPSub_Receiver_OUT(unsigned char protype)
//  508 {
//  509     if(ProtectFlag[protype] == 1)
//  510     {
//  511         if(Flag_NRF24L01_OK == 1)
//  512         {
//  513             if((RX_Pro_Code_A == 0)&&(RX_Pro_Code_B == 0))
//  514             {
//  515                 CNT_ProtB[protype] = 0;
//  516                 ProtectFlag[protype] = 0;
//  517                 RX_Pro_Code_A = 0;
//  518                 RX_Pro_Code_B = 0;
//  519                 MPSubC(); 
//  520             }
//  521         }
//  522         else
//  523         {
//  524             CNT_ProtB[protype]++;
//  525             if(CNT_ProtB[protype] >= 500)
//  526             {
//  527                 CNT_ProtB[protype] = 0;
//  528                 ProtectFlag[protype] = 0;
//  529                 RX_Pro_Code_A = 0;
//  530                 RX_Pro_Code_B = 0;
//  531                 MPSubC();
//  532             }
//  533         }
//  534     }
//  535     else
//  536     {
//  537         CNT_ProtB[protype] =0;
//  538     }
//  539 }
//  540 //******************************************************************************
//  541 
//  542 
//  543 //******************************************************************************
//  544 //检测不到NRF24L01模块
//  545 //******************************************************************************
//  546 void  MPSub_Check_NRF24L01_IN(unsigned char protype)
//  547 {
//  548     if(ProtectFlag[protype] == 0)
//  549     {
//  550         /*if(Flag_NRF24L01_Have == 0)
//  551         {           
//  552             if(NRF24L01_Check() == 0)//检测到NRF24L01模块
//  553             {
//  554                 Flag_NRF24L01_Have = 1;
//  555                 CNT_Prot[protype] = 0;
//  556             }
//  557             else                    //检测不到NRF24l01模块
//  558             {
//  559                 CNT_Prot[protype]++;
//  560                 if(CNT_Prot[protype] >= 200)
//  561                 {
//  562                     CNT_Prot[protype] = 0;
//  563                     ProtectFlag[protype] = 1;
//  564                     if(MacStatus != C_MSProt)
//  565                     {
//  566                         CNT_MPSub_Beep = 500;
//  567                         ProNum = protype;	
//  568                         MacStatus = C_MSProt;
//  569                     }
//  570                 }
//  571             }
//  572          }*/
//  573     }  
//  574 }
//  575 //******************************************************************************
//  576 
//  577 
//  578 //******************************************************************************
//  579 //检测到NRF24L01模块
//  580 //******************************************************************************
//  581 void  MPSub_Check_NRF24L01_OUT(unsigned char protype)
//  582 {
//  583     if(ProtectFlag[protype] == 1)
//  584     {
//  585         /*if(NRF24L01_Check() == 0)//检测到NRF24L01模块
//  586         {
//  587             Flag_NRF24L01_Have = 1;
//  588             ProtectFlag[protype] = 0;
//  589             MPSubC();
//  590         }*/
//  591     }
//  592 }
//  593 
//  594 //******************************************************************************
//  595 ///本机故障代码
//  596 //******************************************************************************
//  597 void  MPSub_Pro_Code(void)
//  598 {
//  599     unsigned char i,code;
//  600     for(i=0;i<16;i++)
//  601     {
//  602        if(i<8)
//  603        {
//  604            if(ProtectFlag[i] ==1)
//  605            {
//  606               code = (0x01 << i);
//  607               TX_Pro_Code_A |= code;
//  608            }
//  609            else
//  610            {
//  611               code = ~(0x01 << i);
//  612               TX_Pro_Code_A &= code;
//  613            }
//  614        }
//  615        else
//  616        {
//  617             if(ProtectFlag[i] ==1)
//  618            {
//  619               code = (0x01 << (i-8));
//  620               TX_Pro_Code_B |= code;
//  621            }
//  622            else
//  623            {
//  624               code = ~(0x01 << (i-8));
//  625               TX_Pro_Code_B &= code;
//  626            }
//  627            TX_Pro_Code_B &= 0xfb;//主机故障不再返回给主机
//  628        }
//  629     }
//  630 }
//  631 //******************************************************************************
//  632 
//  633 
//  634 //******************************************************************************
//  635 //异常蜂鸣
//  636 //******************************************************************************
//  637 void  MPSub_Beep(void)
//  638 {
//  639         CNT_MPSub_Beep++;
//  640         if(CNT_MPSub_Beep >= 500)
//  641         {
//  642             CNT_MPSub_Beep = 0;
//  643             if(ProtectFlag[0] == 1)
//  644             {
//  645                 Buzz_Control = BUZZ_IN_Error_0;
//  646             }
//  647             else if(ProtectFlag[1] == 1)
//  648             {
//  649                 Buzz_Control = BUZZ_IN_Error_1;
//  650             }
//  651             else if(ProtectFlag[2] == 1)
//  652             {
//  653                 Buzz_Control = BUZZ_IN_Error_2;
//  654             }
//  655             else if(ProtectFlag[3] == 1)
//  656             {
//  657                 Buzz_Control = BUZZ_IN_Error_3;
//  658             }
//  659             else if(ProtectFlag[4] == 1)
//  660             {
//  661                 Buzz_Control = BUZZ_IN_Error_4;
//  662             }
//  663             else if(ProtectFlag[5] == 1)
//  664             {
//  665                 Buzz_Control = BUZZ_IN_Error_5;
//  666             }
//  667             else if(ProtectFlag[6] == 1)
//  668             {
//  669                 Buzz_Control = BUZZ_IN_Error_6;
//  670             }
//  671             else if(ProtectFlag[7] == 1)
//  672             {
//  673                 Buzz_Control = BUZZ_IN_Error_7;
//  674             }
//  675             else if(ProtectFlag[8] == 1)
//  676             {
//  677                 Buzz_Control = BUZZ_IN_Error_8;
//  678             }
//  679             else if(ProtectFlag[9] == 1)
//  680             {
//  681                 Buzz_Control = BUZZ_IN_Error_9;
//  682             }
//  683             else if(ProtectFlag[10] == 1)
//  684             {
//  685                 Buzz_Control = BUZZ_IN_Error_10;
//  686             }
//  687             else if(ProtectFlag[11] == 1)
//  688             {
//  689                 Buzz_Control = BUZZ_IN_Error_11;
//  690             }
//  691 			else if(ProtectFlag[12] == 1)
//  692             {
//  693                 Buzz_Control = BUZZ_IN_Error_12;
//  694             }
//  695 			else if(ProtectFlag[13] == 1)
//  696             {
//  697                 Buzz_Control = BUZZ_IN_Error_13;
//  698             }
//  699 			else if(ProtectFlag[14] == 1)
//  700             {
//  701                 Buzz_Control = BUZZ_IN_Error_14;
//  702             }
//  703 			else if(ProtectFlag[15] == 1)
//  704             {
//  705                 Buzz_Control = BUZZ_IN_Error_15;
//  706             }
//  707 		}
//  708 }
//  709 /*******************************************************************************
//  710 -----------------------------    End of file    --------------------------------
//  711 *******************************************************************************/
//  712 void  MPSub_IGBT_IN_UP(unsigned char protype)//PA3
//  713 {
//  714     if(ProtectFlag[protype] == 0)
//  715     {
//  716         if(PA_IDR_IDR3 == 0)
//  717         {
//  718             CNT_Prot[protype]++;
//  719             if(CNT_Prot[protype] >=2)
//  720             {
//  721                 CNT_Prot[protype] = 0;
//  722                 ProtectFlag[protype] = 1;
//  723                 if(MacStatus != C_MSProt)
//  724                 {
//  725                     CNT_MPSub_Beep = 500;
//  726                     ProNum = protype;	
//  727                     MacStatus = C_MSProt;
//  728 				}  
//  729             }
//  730         }
//  731         else
//  732         {
//  733              CNT_Prot[protype] = 0;
//  734         }
//  735     }
//  736 }
//  737 
//  738 void  MPSub_Curr_IN_INPUT(unsigned char protype)//PA6
//  739 {
//  740     if(ProtectFlag[protype] == 0)
//  741     {
//  742         if(PA_IDR_IDR6 ==0)
//  743         {
//  744             CNT_Prot[protype]++;
//  745             if(CNT_Prot[protype] >=2)
//  746             {
//  747                 CNT_Prot[protype] = 0;
//  748                 ProtectFlag[protype] = 1;
//  749                 if(MacStatus != C_MSProt)
//  750                 {
//  751                     CNT_MPSub_Beep = 500;
//  752                     ProNum = protype;	
//  753                     MacStatus = C_MSProt;
//  754 				}  
//  755             }
//  756         }
//  757         else
//  758         {
//  759              CNT_Prot[protype] = 0;
//  760         }
//  761     }
//  762 }
//  763 void  MPSub_IGBT_IN_DN(unsigned char protype)//PA4
//  764 {
//  765     if(ProtectFlag[protype] == 0)
//  766     {
//  767         if(PA_IDR_IDR4 ==0)
//  768         {
//  769             CNT_Prot[protype]++;
//  770             if(CNT_Prot[protype] >=2)
//  771             {
//  772                 CNT_Prot[protype] = 0;
//  773                 ProtectFlag[protype] = 1;
//  774                 if(MacStatus != C_MSProt)
//  775                 {
//  776                     CNT_MPSub_Beep = 500;
//  777                     ProNum = protype;	
//  778                     MacStatus = C_MSProt;
//  779 				}  
//  780             }
//  781         }
//  782         else
//  783         {
//  784              CNT_Prot[protype] = 0;
//  785         }
//  786     }
//  787 }
//  788 void  MPSub_VOL_IN_INPUT(unsigned char protype)//PA5 
//  789 {
//  790     if(ProtectFlag[protype] == 0)
//  791     {
//  792         if(PA_IDR_IDR5 ==0)
//  793         {
//  794             CNT_Prot[protype]++;
//  795             if(CNT_Prot[protype] >=2)
//  796             {
//  797                 CNT_Prot[protype] = 0;
//  798                 ProtectFlag[protype] = 1;
//  799                 if(MacStatus != C_MSProt)
//  800                 {
//  801                     CNT_MPSub_Beep = 500;
//  802                     ProNum = protype;	
//  803                     MacStatus = C_MSProt;
//  804 				}  
//  805             }
//  806         }
//  807         else
//  808         {
//  809              CNT_Prot[protype] = 0;
//  810         }
//  811     }
//  812 }
//  813 void  MPSub_VOL_IN_COIL(unsigned char protype)//PB7
//  814 {
//  815     if(ProtectFlag[protype] == 0)
//  816     {
//  817         if(PB_IDR_IDR7 ==0)
//  818         {
//  819             CNT_Prot[protype]++;
//  820             if(CNT_Prot[protype] >=2)
//  821             {
//  822                 CNT_Prot[protype] = 0;
//  823                 ProtectFlag[protype] = 1;
//  824                 if(MacStatus != C_MSProt)
//  825                 {
//  826                     CNT_MPSub_Beep = 500;
//  827                     ProNum = protype;	
//  828                     MacStatus = C_MSProt;
//  829 				}  
//  830             }
//  831         }
//  832         else
//  833         {
//  834              CNT_Prot[protype] = 0;
//  835         }
//  836     }
//  837 }
//  838 void  MPSub_Curr_IN_COIL(unsigned char protype) //PB6
//  839 {
//  840     if(ProtectFlag[protype] == 0)
//  841     {
//  842         if(PB_IDR_IDR6 ==0)
//  843         {
//  844             CNT_Prot[protype]++;
//  845             if(CNT_Prot[protype] >=2)
//  846             {
//  847                 CNT_Prot[protype] = 0;
//  848                 ProtectFlag[protype] = 1;
//  849                 if(MacStatus != C_MSProt)
//  850                 {
//  851                     CNT_MPSub_Beep = 500;
//  852                     ProNum = protype;	
//  853                     MacStatus = C_MSProt;
//  854 				}  
//  855             }
//  856         }
//  857         else
//  858         {
//  859              CNT_Prot[protype] = 0;
//  860         }
//  861     }
//  862 }
//  863 //********************************************************************************
//  864 void  MPSub_IGBT_OUT_UP(unsigned char protype)//PA3
//  865 {
//  866     if((ProtectFlag[protype] == 1) && (CNT_ProtF[protype] == 1))
//  867     {
//  868         if(PA_IDR_IDR3 == 1)
//  869         {
//  870             CNT_ProtB[protype]++;
//  871             if(CNT_ProtB[protype] >= 200)
//  872             {
//  873 				CNT_ProtF[protype] = 0;
//  874                 CNT_ProtB[protype] = 0;
//  875                 ProtectFlag[protype] = 0;
//  876                 MPSubC();
//  877             }
//  878         }
//  879         else
//  880         {
//  881            CNT_ProtB[protype] = 0;
//  882 		   Broken_Code = 0;
//  883 		   errno = 0;
//  884         }
//  885     }
//  886 }

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  887 void  MPSub_Curr_OUT_INPUT(unsigned char protype)//PA6
//  888 {
MPSub_Curr_OUT_INPUT:
        LD        S:?b0, A
//  889     if((ProtectFlag[protype] == 1) && (CNT_ProtF[protype] == 1))
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_Curr_OUT_INPUT_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtF,X)
        CPW       X, #0x1
        JRNE      L:??MPSub_Curr_OUT_INPUT_0
//  890     {
//  891         if(PA_IDR_IDR6 == 1)
        LD        A, L:0x5001
        CALLF     L:?srl8_a_a_6
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??MPSub_Curr_OUT_INPUT_1
//  892         {
//  893             CNT_ProtB[protype]++;
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_ProtB,Y), X
//  894             if(CNT_ProtB[protype] >= 200)
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        CPW       X, #0xc8
        JRC       L:??MPSub_Curr_OUT_INPUT_0
//  895             {
//  896 				CNT_ProtF[protype] = 0;
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtF,X), Y
//  897                 CNT_ProtB[protype] = 0;
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
//  898                 ProtectFlag[protype] = 0;
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:ProtectFlag,X), A
//  899                 MPSubC();
        JPF       MPSubC
//  900             }
//  901         }
//  902         else
//  903         {
//  904            CNT_ProtB[protype] = 0;
??MPSub_Curr_OUT_INPUT_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
//  905 		   Broken_Code = 0;
        MOV       L:Broken_Code, #0x0
//  906 				errno = 0;
        MOV       L:errno, #0x0
//  907         }
//  908     }
//  909 }
??MPSub_Curr_OUT_INPUT_0:
        RETF
        REQUIRE _A_PA_IDR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_VOL_OUT_INPUT:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_VOL_OUT_INPUT_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtF,X)
        CPW       X, #0x1
        JRNE      L:??MPSub_VOL_OUT_INPUT_0
        LD        A, L:0x5001
        SWAP      A
        AND       A, #0xf
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??MPSub_VOL_OUT_INPUT_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_ProtB,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        CPW       X, #0xc8
        JRC       L:??MPSub_VOL_OUT_INPUT_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtF,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:ProtectFlag,X), A
        JPF       MPSubC
??MPSub_VOL_OUT_INPUT_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        MOV       L:Broken_Code, #0x0
        MOV       L:errno, #0x0
??MPSub_VOL_OUT_INPUT_0:
        RETF
        REQUIRE _A_PA_IDR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_IGBT_OUT_DN:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_IGBT_OUT_DN_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtF,X)
        CPW       X, #0x1
        JRNE      L:??MPSub_IGBT_OUT_DN_0
        LD        A, L:0x5001
        SWAP      A
        AND       A, #0xf
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??MPSub_IGBT_OUT_DN_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_ProtB,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        CPW       X, #0xc8
        JRC       L:??MPSub_IGBT_OUT_DN_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtF,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:ProtectFlag,X), A
        JPF       MPSubC
??MPSub_IGBT_OUT_DN_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        MOV       L:Broken_Code, #0x0
        MOV       L:errno, #0x0
??MPSub_IGBT_OUT_DN_0:
        RETF
        REQUIRE _A_PA_IDR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_IGBT_OUT_UP:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_IGBT_OUT_UP_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtF,X)
        CPW       X, #0x1
        JRNE      L:??MPSub_IGBT_OUT_UP_0
        LD        A, L:0x5001
        SRL       A
        SRL       A
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??MPSub_IGBT_OUT_UP_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_ProtB,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        CPW       X, #0xc8
        JRC       L:??MPSub_IGBT_OUT_UP_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtF,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:ProtectFlag,X), A
        JPF       MPSubC
??MPSub_IGBT_OUT_UP_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        MOV       L:Broken_Code, #0x0
        MOV       L:errno, #0x0
??MPSub_IGBT_OUT_UP_0:
        RETF
        REQUIRE _A_PA_IDR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MacProtect:
        LD        A, L:_A_Flag_10ms_1
        SWAP      A
        AND       A, #0xf
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??MacProtect_0
        BRES      L:_A_Flag_10ms_1, #0x4
        LD        A, #0x2
        CALLF     MPSub_IGBT_OUT_UP
        LD        A, #0x3
        CALLF     MPSub_IGBT_OUT_DN
        LD        A, #0x4
        CALLF     MPSub_VOL_OUT_INPUT
        LD        A, #0x5
        CALLF     MPSub_Curr_OUT_INPUT
        LD        A, #0x6
        CALLF     MPSub_VOL_OUT_COIL
        LD        A, #0x7
        CALLF     MPSub_Curr_OUT_COIL
        CALLF     MPSub_Beep
??MacProtect_0:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Efficiency_Check_in:
        CALLF     L:?push_w4
        PUSH      S:?b10
        LD        S:?b10, A
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        LD        A, #0x0
        CP        A, (L:ProtectFlag,X)
        JREQ      ??lb_1
        JP        L:??MPSub_Efficiency_Check_in_0
??lb_1:
        LDW       X, #Flag_RECV_ADDRESS_NUM_SAME
        LD        A, (X)
        CP        A, L:Cnt_ForeignBody_Available
        JREQ      ??lb_2
        JP        L:??MPSub_Efficiency_Check_in_0
??lb_2:
        LD        A, #0x1
        CP        A, L:FLAG_PWM_START
        JREQ      ??lb_3
        JP        L:??MPSub_Efficiency_Check_in_0
??lb_3:
        LD        A, L:Cnt_ForeignBody_Available
        TNZ       A
        JRNE      ??lb_4
        JP        L:??MPSub_Efficiency_Check_in_1
??lb_4:
        CLR       S:?b9
        CLR       S:?b8
        JRA       L:??MPSub_Efficiency_Check_in_2
??MPSub_Efficiency_Check_in_3:
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, S:?w4
        CALLF     L:?mul16_x_x_w0
        ADDW      X, #Float_ForeignBody_Value
        LDW       Y, X
        LDW       X, #Float_ForeignBody_Value_Sum
        CALLF     L:?load32_l0_0x
        LDW       X, Y
        CALLF     L:?fadd32_l0_l0_0x
        LDW       X, #Float_ForeignBody_Value_Sum
        CALLF     L:?load32_0x_l0
        LDW       X, S:?w4
        ADDW      X, #0x1
        LDW       S:?w4, X
??MPSub_Efficiency_Check_in_2:
        LD        A, L:Flag_RECV_ADDRESS_NUM_SAME
        CLR       S:?b0
        LD        S:?b1, A
        LDW       X, S:?w4
        CPW       X, S:?w0
        JRSLT     L:??MPSub_Efficiency_Check_in_3
        LDW       X, #Power
        CALLF     L:?load32_l0_0x
        CALLF     L:?fmul32_l0_l0_dc32
        DATA
        DC32      0x3f266666
        CODE
        LDW       X, #Float_ForeignBody_Value_Sum
        CALLF     L:?fsub32_l0_l0_0x
        CALLF     L:?fcmplt32_c_l0_dc32
        DATA
        DC32      0x3727c5ad
        CODE
        JRNC      L:??MPSub_Efficiency_Check_in_4
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b10
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_Prot,Y), X
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        CPW       X, #0x3e8
        JRC       L:??MPSub_Efficiency_Check_in_5
        BSET      L:0x5014, #0x0
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        LD        A, #0x1
        LD        (L:ProtectFlag,X), A
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      L:??MPSub_Efficiency_Check_in_6
        LDW       X, #0x1f4
        LDW       L:CNT_MPSub_Beep, X
        LD        A, S:?b10
        LD        L:ProNum, A
        MOV       L:MacStatus, #0x4
??MPSub_Efficiency_Check_in_6:
        LD        A, S:?b10
        ADD       A, #0xff
        LD        L:errno, A
??MPSub_Efficiency_Check_in_5:
        MOV       L:Broken_Code, #0x1
        JP        L:??MPSub_Efficiency_Check_in_0
??MPSub_Efficiency_Check_in_4:
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
        JP        L:??MPSub_Efficiency_Check_in_0
??MPSub_Efficiency_Check_in_1:
        LDW       X, #const_f_empty_value
        CALLF     L:?load32_l0_0x
        CALLF     L:?fmul32_l0_l0_dc32
        DATA
        DC32      0x3f866666
        CODE
        CALLF     L:?mov_l1_l0
        LDW       X, #Power
        CALLF     L:?load32_l0_0x
        CALLF     L:?fcmpge32_c_l0_l1
        JRC       L:??MPSub_Efficiency_Check_in_7
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b10
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_Prot,Y), X
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        CPW       X, #0xa
        JRC       L:??MPSub_Efficiency_Check_in_8
        BSET      L:0x5014, #0x0
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        LD        A, #0x1
        LD        (L:ProtectFlag,X), A
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      L:??MPSub_Efficiency_Check_in_9
        LDW       X, #0x1f4
        LDW       L:CNT_MPSub_Beep, X
        LD        A, S:?b10
        LD        L:ProNum, A
        MOV       L:MacStatus, #0x4
??MPSub_Efficiency_Check_in_9:
        LD        A, S:?b10
        ADD       A, #0xff
        LD        L:errno, A
??MPSub_Efficiency_Check_in_8:
        MOV       L:Broken_Code, #0x1
        JRA       L:??MPSub_Efficiency_Check_in_0
??MPSub_Efficiency_Check_in_7:
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
        MOV       L:Broken_Code, #0x0
        MOV       L:errno, #0x0
??MPSub_Efficiency_Check_in_0:
        MOV       L:Cnt_ForeignBody_Available, #0x0
        POP       S:?b10
        JPF       L:?epilogue_w4
        REQUIRE _A_PE_ODR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Efficiency_Check_out:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_Efficiency_Check_out_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtF,X)
        CPW       X, #0x1
        JRNE      L:??MPSub_Efficiency_Check_out_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_ProtB,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        CPW       X, #0xc8
        JRC       L:??MPSub_Efficiency_Check_out_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtF,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:ProtectFlag,X), A
        JPF       MPSubC
??MPSub_Efficiency_Check_out_0:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
??MPSub_Efficiency_Check_out_1:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSubA:
        LD        S:?b0, A
        LDW       Y, X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x0
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSubA_0
        CPW       Y, #0x37
        JRC       L:??MPSubA_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_Prot,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        CPW       X, #0xc8
        JRC       L:??MPSubA_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        LD        (L:ProtectFlag,X), A
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      L:??MPSubA_0
        LDW       X, #0x1f4
        LDW       L:CNT_MPSub_Beep, X
        LD        A, S:?b0
        LD        L:ProNum, A
        MOV       L:MacStatus, #0x4
        RETF
??MPSubA_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
??MPSubA_0:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSubB:
        LD        S:?b0, A
        LDW       Y, X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSubB_0
        CPW       Y, #0x33
        JRNC      L:??MPSubB_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_ProtB,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        CPW       X, #0x64
        JRC       L:??MPSubB_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:ProtectFlag,X), A
        JPF       MPSubC
??MPSubB_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
??MPSubB_0:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
ProCodeTurn:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_IGBT_IN:
        LD        S:?b0, A
        LD        A, #0x1
        CP        A, L:Flag_enable_work
        JRNE      L:??MPSub_IGBT_IN_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        LD        (L:ProtectFlag,X), A
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      L:??MPSub_IGBT_IN_0
        LDW       X, #0x1f4
        LDW       L:CNT_MPSub_Beep, X
        LD        A, S:?b0
        LD        L:ProNum, A
        MOV       L:MacStatus, #0x4
??MPSub_IGBT_IN_0:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_IGBT_OUT:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_IGBT_OUT_0
        BTJF      L:0x5010, #0x7, L:??MPSub_IGBT_OUT_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_ProtB,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        CPW       X, #0x64
        JRC       L:??MPSub_IGBT_OUT_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:ProtectFlag,X), A
        MOV       L:Flag_enable_work, #0x0
        JPF       MPSubC
??MPSub_IGBT_OUT_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
??MPSub_IGBT_OUT_0:
        RETF
        REQUIRE _A_PD_IDR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Curr_IN:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x0
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_Curr_IN_0
        LD        A, L:0x5015
        CALLF     L:?srl8_a_a_6
        AND       A, #0x1
        CP        A, #0x0
        JRNE      L:??MPSub_Curr_IN_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_Prot,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        CPW       X, #0x2
        JRC       L:??MPSub_Curr_IN_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        LD        (L:ProtectFlag,X), A
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      L:??MPSub_Curr_IN_0
        LDW       X, #0x1f4
        LDW       L:CNT_MPSub_Beep, X
        LD        A, S:?b0
        LD        L:ProNum, A
        MOV       L:MacStatus, #0x4
        RETF
??MPSub_Curr_IN_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
??MPSub_Curr_IN_0:
        RETF
        REQUIRE _A_PE_IDR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Curr_OUT:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_Curr_OUT_0
        LD        A, L:0x5015
        CALLF     L:?srl8_a_a_6
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??MPSub_Curr_OUT_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_ProtB,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        CPW       X, #0xc8
        JRC       L:??MPSub_Curr_OUT_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:ProtectFlag,X), A
        JPF       MPSubC
??MPSub_Curr_OUT_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
??MPSub_Curr_OUT_0:
        RETF
        REQUIRE _A_PE_IDR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Fan_IN:
        LD        S:?b0, A
        LD        A, #0x1
        CP        A, L:Flag_Fan_Open
        JRNE      L:??MPSub_Fan_IN_0
        LD        A, #0x1
        ADD       A, L:CNT_Fan_Check
        LD        L:CNT_Fan_Check, A
        LDW       X, #CNT_Fan_Check
        LD        A, (X)
        CP        A, #0xa
        JRC       L:??MPSub_Fan_IN_1
        MOV       L:0x5009, #0x0
        LDW       X, L:CNT_Fan_Speed
        CPW       X, #0x64
        JRNC      L:??MPSub_Fan_IN_2
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_Prot,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        CPW       X, #0x5
        JRC       L:??MPSub_Fan_IN_2
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        LD        (L:ProtectFlag,X), A
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      L:??MPSub_Fan_IN_2
        LDW       X, #0x1f4
        LDW       L:CNT_MPSub_Beep, X
        LD        A, S:?b0
        LD        L:ProNum, A
        MOV       L:MacStatus, #0x4
??MPSub_Fan_IN_2:
        MOV       L:CNT_Fan_Check, #0x0
        CLRW      X
        LDW       L:CNT_Fan_Speed, X
        RETF
??MPSub_Fan_IN_0:
        MOV       L:CNT_Fan_Check, #0x0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
        CLRW      X
        LDW       L:CNT_Fan_Speed, X
??MPSub_Fan_IN_1:
        RETF
        REQUIRE _A_PB_CR2

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Fan_OUT:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_Fan_OUT_0
        LD        A, #0x1
        CP        A, L:Flag_Fan_Open
        JRNE      L:??MPSub_Fan_OUT_1
        LD        A, #0x1
        ADD       A, L:CNT_Fan_Check
        LD        L:CNT_Fan_Check, A
        LDW       X, #CNT_Fan_Check
        LD        A, (X)
        CP        A, #0xa
        JRC       L:??MPSub_Fan_OUT_0
        LDW       X, L:CNT_Fan_Speed
        CPW       X, #0x64
        JRC       L:??MPSub_Fan_OUT_2
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_ProtB,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        CPW       X, #0x2
        JRC       L:??MPSub_Fan_OUT_2
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:ProtectFlag,X), A
        CALLF     MPSubC
??MPSub_Fan_OUT_2:
        MOV       L:CNT_Fan_Check, #0x0
        CLRW      X
        LDW       L:CNT_Fan_Speed, X
        RETF
??MPSub_Fan_OUT_1:
        MOV       L:CNT_Fan_Check, #0x0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        CLRW      X
        LDW       L:CNT_Fan_Speed, X
??MPSub_Fan_OUT_0:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Nrf24l01_IN:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x0
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_Nrf24l01_IN_0
        LD        A, #0x3
        CP        A, L:MacStatus
        JREQ      L:??MPSub_Nrf24l01_IN_1
        LD        A, #0x1
        CP        A, L:Flag_NRF24L01_OK
        JRNE      L:??MPSub_Nrf24l01_IN_0
??MPSub_Nrf24l01_IN_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        DECW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_Prot,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        TNZW      X
        JRNE      L:??MPSub_Nrf24l01_IN_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       Y, #0xc8
        LDW       (L:CNT_Prot,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        LD        (L:ProtectFlag,X), A
        MOV       L:Flag_NRF24L01_OK, #0x0
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      L:??MPSub_Nrf24l01_IN_0
        LDW       X, #0x1f4
        LDW       L:CNT_MPSub_Beep, X
        LD        A, S:?b0
        LD        L:ProNum, A
        MOV       L:MacStatus, #0x4
??MPSub_Nrf24l01_IN_0:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Nrf24l01_OUT:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_Nrf24l01_OUT_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_ProtB,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        CPW       X, #0x64
        JRC       L:??MPSub_Nrf24l01_OUT_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:ProtectFlag,X), A
        JPF       MPSubC
??MPSub_Nrf24l01_OUT_0:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
??MPSub_Nrf24l01_OUT_1:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Receiver_IN:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x0
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_Receiver_IN_0
        LD        A, L:RX_Pro_Code_A
        TNZ       A
        JRNE      L:??MPSub_Receiver_IN_1
        LD        A, L:RX_Pro_Code_B
        TNZ       A
        JREQ      L:??MPSub_Receiver_IN_0
??MPSub_Receiver_IN_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        LD        (L:ProtectFlag,X), A
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      L:??MPSub_Receiver_IN_2
        LDW       X, #0x1f4
        LDW       L:CNT_MPSub_Beep, X
        LD        A, S:?b0
        LD        L:ProNum, A
        MOV       L:MacStatus, #0x4
??MPSub_Receiver_IN_2:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
??MPSub_Receiver_IN_0:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Receiver_OUT:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_Receiver_OUT_0
        LD        A, #0x1
        CP        A, L:Flag_NRF24L01_OK
        JRNE      L:??MPSub_Receiver_OUT_1
        LD        A, L:RX_Pro_Code_A
        TNZ       A
        JRNE      L:??MPSub_Receiver_OUT_2
        LD        A, L:RX_Pro_Code_B
        TNZ       A
        JRNE      L:??MPSub_Receiver_OUT_2
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:ProtectFlag,X), A
        MOV       L:RX_Pro_Code_A, #0x0
        MOV       L:RX_Pro_Code_B, #0x0
        JPF       MPSubC
??MPSub_Receiver_OUT_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_ProtB,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_ProtB,X)
        CPW       X, #0x1f4
        JRC       L:??MPSub_Receiver_OUT_2
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:ProtectFlag,X), A
        MOV       L:RX_Pro_Code_A, #0x0
        MOV       L:RX_Pro_Code_B, #0x0
        JPF       MPSubC
??MPSub_Receiver_OUT_0:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_ProtB,X), Y
??MPSub_Receiver_OUT_2:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Check_NRF24L01_IN:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Check_NRF24L01_OUT:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Pro_Code:
        CLR       S:?b0
        JRA       L:??MPSub_Pro_Code_0
??MPSub_Pro_Code_1:
        LD        A, S:?b0
        ADD       A, #0xf8
        CLRW      X
        INCW      X
        CALLF     L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:TX_Pro_Code_B
        LD        L:TX_Pro_Code_B, A
??MPSub_Pro_Code_2:
        BRES      L:TX_Pro_Code_B, #0x2
??MPSub_Pro_Code_3:
        LD        A, S:?b0
        ADD       A, #0x1
        LD        S:?b0, A
??MPSub_Pro_Code_0:
        LD        A, S:?b0
        CP        A, #0x10
        JRNC      L:??MPSub_Pro_Code_4
        LD        A, S:?b0
        CP        A, #0x8
        JRNC      L:??MPSub_Pro_Code_5
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_Pro_Code_6
        CLRW      X
        INCW      X
        LD        A, S:?b0
        CALLF     L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:TX_Pro_Code_A
        LD        L:TX_Pro_Code_A, A
        JRA       L:??MPSub_Pro_Code_3
??MPSub_Pro_Code_6:
        CLRW      X
        INCW      X
        LD        A, S:?b0
        CALLF     L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:TX_Pro_Code_A
        LD        L:TX_Pro_Code_A, A
        JRA       L:??MPSub_Pro_Code_3
??MPSub_Pro_Code_5:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_Pro_Code_1
        LD        A, S:?b0
        ADD       A, #0xf8
        CLRW      X
        INCW      X
        CALLF     L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:TX_Pro_Code_B
        LD        L:TX_Pro_Code_B, A
        JRA       L:??MPSub_Pro_Code_2
??MPSub_Pro_Code_4:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_IGBT_IN_UP:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x0
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_IGBT_IN_UP_0
        LD        A, L:0x5001
        SRL       A
        SRL       A
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JRNE      L:??MPSub_IGBT_IN_UP_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_Prot,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        CPW       X, #0x2
        JRC       L:??MPSub_IGBT_IN_UP_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        LD        (L:ProtectFlag,X), A
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      L:??MPSub_IGBT_IN_UP_0
        LDW       X, #0x1f4
        LDW       L:CNT_MPSub_Beep, X
        LD        A, S:?b0
        LD        L:ProNum, A
        MOV       L:MacStatus, #0x4
        RETF
??MPSub_IGBT_IN_UP_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
??MPSub_IGBT_IN_UP_0:
        RETF
        REQUIRE _A_PA_IDR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Curr_IN_INPUT:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x0
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_Curr_IN_INPUT_0
        LD        A, L:0x5001
        CALLF     L:?srl8_a_a_6
        AND       A, #0x1
        CP        A, #0x0
        JRNE      L:??MPSub_Curr_IN_INPUT_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_Prot,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        CPW       X, #0x2
        JRC       L:??MPSub_Curr_IN_INPUT_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        LD        (L:ProtectFlag,X), A
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      L:??MPSub_Curr_IN_INPUT_0
        LDW       X, #0x1f4
        LDW       L:CNT_MPSub_Beep, X
        LD        A, S:?b0
        LD        L:ProNum, A
        MOV       L:MacStatus, #0x4
        RETF
??MPSub_Curr_IN_INPUT_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
??MPSub_Curr_IN_INPUT_0:
        RETF
        REQUIRE _A_PA_IDR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_IGBT_IN_DN:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x0
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_IGBT_IN_DN_0
        LD        A, L:0x5001
        SWAP      A
        AND       A, #0xf
        AND       A, #0x1
        CP        A, #0x0
        JRNE      L:??MPSub_IGBT_IN_DN_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_Prot,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        CPW       X, #0x2
        JRC       L:??MPSub_IGBT_IN_DN_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        LD        (L:ProtectFlag,X), A
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      L:??MPSub_IGBT_IN_DN_0
        LDW       X, #0x1f4
        LDW       L:CNT_MPSub_Beep, X
        LD        A, S:?b0
        LD        L:ProNum, A
        MOV       L:MacStatus, #0x4
        RETF
??MPSub_IGBT_IN_DN_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
??MPSub_IGBT_IN_DN_0:
        RETF
        REQUIRE _A_PA_IDR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_VOL_IN_INPUT:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x0
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_VOL_IN_INPUT_0
        LD        A, L:0x5001
        SWAP      A
        AND       A, #0xf
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JRNE      L:??MPSub_VOL_IN_INPUT_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_Prot,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        CPW       X, #0x2
        JRC       L:??MPSub_VOL_IN_INPUT_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        LD        (L:ProtectFlag,X), A
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      L:??MPSub_VOL_IN_INPUT_0
        LDW       X, #0x1f4
        LDW       L:CNT_MPSub_Beep, X
        LD        A, S:?b0
        LD        L:ProNum, A
        MOV       L:MacStatus, #0x4
        RETF
??MPSub_VOL_IN_INPUT_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
??MPSub_VOL_IN_INPUT_0:
        RETF
        REQUIRE _A_PA_IDR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_VOL_IN_COIL:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x0
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_VOL_IN_COIL_0
        BTJT      L:0x5006, #0x7, L:??MPSub_VOL_IN_COIL_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_Prot,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        CPW       X, #0x2
        JRC       L:??MPSub_VOL_IN_COIL_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        LD        (L:ProtectFlag,X), A
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      L:??MPSub_VOL_IN_COIL_0
        LDW       X, #0x1f4
        LDW       L:CNT_MPSub_Beep, X
        LD        A, S:?b0
        LD        L:ProNum, A
        MOV       L:MacStatus, #0x4
        RETF
??MPSub_VOL_IN_COIL_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
??MPSub_VOL_IN_COIL_0:
        RETF
        REQUIRE _A_PB_IDR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
MPSub_Curr_IN_COIL:
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x0
        CP        A, (L:ProtectFlag,X)
        JRNE      L:??MPSub_Curr_IN_COIL_0
        LD        A, L:0x5006
        CALLF     L:?srl8_a_a_6
        AND       A, #0x1
        CP        A, #0x0
        JRNE      L:??MPSub_Curr_IN_COIL_1
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        INCW      X
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        SLLW      Y
        LDW       (L:CNT_Prot,Y), X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        LDW       X, (L:CNT_Prot,X)
        CPW       X, #0x2
        JRC       L:??MPSub_Curr_IN_COIL_0
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, #0x1
        LD        (L:ProtectFlag,X), A
        LD        A, #0x4
        CP        A, L:MacStatus
        JREQ      L:??MPSub_Curr_IN_COIL_0
        LDW       X, #0x1f4
        LDW       L:CNT_MPSub_Beep, X
        LD        A, S:?b0
        LD        L:ProNum, A
        MOV       L:MacStatus, #0x4
        RETF
??MPSub_Curr_IN_COIL_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:CNT_Prot,X), Y
??MPSub_Curr_IN_COIL_0:
        RETF
        REQUIRE _A_PB_IDR

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
ABORT_DEAL_FUC:
        PUSH      S:?b8
        LD        S:?b8, A
        LDW       X, #0xa
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALLF     _delay_ms
        LD        A, #0x1
        CP        A, L:Broken_Code
        JRNE      L:??ABORT_DEAL_FUC_0
        LD        A, L:_A_Flag_10ms_2
        CALLF     L:?srl8_a_a_6
        AND       A, #0x1
        CP        A, #0x0
        JRNE      ??lb_5
        JP        L:??ABORT_DEAL_FUC_1
??lb_5:
        LD        A, #0x1
        ADD       A, L:CNT_T500ms
        LD        L:CNT_T500ms, A
        BRES      L:_A_Flag_10ms_2, #0x6
        LDW       X, #CNT_T500ms
        LD        A, (X)
        CP        A, #0x32
        JRC       L:??ABORT_DEAL_FUC_1
        LDW       Y, L:Num_Interruput_Broken
        LDW       X, Y
        ADDW      X, #0x1
        LDW       L:Num_Interruput_Broken, X
        CPW       Y, #0x3
        JRNC      L:??ABORT_DEAL_FUC_2
        BRES      L:0x5014, #0x0
        CLR       A
        CALLF     Adjust_Time1_cycle2
        MOV       L:Broken_Code, #0x2
        LDW       X, #0x64
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALLF     _delay_ms
        JRA       L:??ABORT_DEAL_FUC_1
??ABORT_DEAL_FUC_2:
        BSET      L:0x5014, #0x0
        JRA       L:??ABORT_DEAL_FUC_1
??ABORT_DEAL_FUC_0:
        LD        A, #0x2
        CP        A, L:Broken_Code
        JRNE      L:??ABORT_DEAL_FUC_1
        LD        A, L:_A_Flag_10ms_2
        CALLF     L:?srl8_a_a_6
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??ABORT_DEAL_FUC_3
        LD        A, #0x1
        ADD       A, L:CNT_T500ms
        LD        L:CNT_T500ms, A
        BRES      L:_A_Flag_10ms_2, #0x6
        LDW       X, #CNT_T500ms
        LD        A, (X)
        CP        A, #0x64
        JRC       L:??ABORT_DEAL_FUC_3
        CLRW      Y
        LD        A, S:?b8
        LD        YL, A
        SLLW      Y
        CLRW      X
        INCW      X
        LDW       (L:CNT_ProtF,Y), X
        MOV       L:CNT_T500ms, #0x0
??ABORT_DEAL_FUC_3:
        CLRW      X
        LDW       L:Num_Interruput_Broken, X
??ABORT_DEAL_FUC_1:
        POP       S:?b8
        RETF
        REQUIRE _A_PE_ODR

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DEAL_ABNORMAL_FUN:
        TNZ       A
        JREQ      L:??DEAL_ABNORMAL_FUN_0
        DEC       A
        JREQ      L:??DEAL_ABNORMAL_FUN_1
        DEC       A
        JREQ      L:??DEAL_ABNORMAL_FUN_2
        DEC       A
        JREQ      L:??DEAL_ABNORMAL_FUN_3
        DEC       A
        JREQ      L:??DEAL_ABNORMAL_FUN_4
        DEC       A
        JREQ      L:??DEAL_ABNORMAL_FUN_5
        DEC       A
        JREQ      L:??DEAL_ABNORMAL_FUN_6
        DEC       A
        JREQ      L:??DEAL_ABNORMAL_FUN_7
        DEC       A
        JREQ      L:??DEAL_ABNORMAL_FUN_8
        RETF
??DEAL_ABNORMAL_FUN_0:
        LDW       X, L:devStatus + 4
        CPW       X, #0x32
        JRNC      L:??DEAL_ABNORMAL_FUN_9
        CALLF     Fan_Close
        MOV       L:ProtectFlag, #0x0
        JPF       MPSubC
??DEAL_ABNORMAL_FUN_9:
        LDW       X, L:devStatus + 4
        CPW       X, #0x38
        JRC       L:??DEAL_ABNORMAL_FUN_10
        JPF       Fan_Open
??DEAL_ABNORMAL_FUN_1:
        LDW       X, L:devStatus + 4
        CPW       X, #0x32
        JRNC      L:??DEAL_ABNORMAL_FUN_11
        CALLF     Fan_Close
        MOV       L:ProtectFlag + 1, #0x0
        JPF       MPSubC
??DEAL_ABNORMAL_FUN_11:
        LDW       X, L:devStatus + 4
        CPW       X, #0x38
        JRC       L:??DEAL_ABNORMAL_FUN_10
        JPF       Fan_Open
??DEAL_ABNORMAL_FUN_2:
        LD        A, #0x2
        JPF       ABORT_DEAL_FUC
??DEAL_ABNORMAL_FUN_3:
        LD        A, #0x3
        JPF       ABORT_DEAL_FUC
??DEAL_ABNORMAL_FUN_4:
        LD        A, #0x4
        JPF       ABORT_DEAL_FUC
??DEAL_ABNORMAL_FUN_5:
        LD        A, #0x5
        JPF       ABORT_DEAL_FUC
??DEAL_ABNORMAL_FUN_6:
        LD        A, #0x6
        JPF       ABORT_DEAL_FUC
??DEAL_ABNORMAL_FUN_7:
        LD        A, #0x7
        JPF       ABORT_DEAL_FUC
??DEAL_ABNORMAL_FUN_8:
        LD        A, #0x8
        CALLF     ABORT_DEAL_FUC
??DEAL_ABNORMAL_FUN_10:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
KPIdle:
        MOV       L:MacStatus, #0x5
        MOV       L:errno, #0x0
        MOV       L:flag_p, #0x4
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
MPSub_Beep:
        LDW       X, L:CNT_MPSub_Beep
        INCW      X
        LDW       L:CNT_MPSub_Beep, X
        LDW       X, L:CNT_MPSub_Beep
        CPW       X, #0x1f4
        JRNC      ??lb_0
        JP        L:??MPSub_Beep_0
??lb_0:
        CLRW      X
        LDW       L:CNT_MPSub_Beep, X
        LD        A, #0x1
        CP        A, L:ProtectFlag
        JRNE      L:??MPSub_Beep_1
        MOV       L:Buzz_Control, #0x3
        RETF
??MPSub_Beep_1:
        LD        A, #0x1
        CP        A, L:ProtectFlag + 1
        JRNE      L:??MPSub_Beep_2
        MOV       L:Buzz_Control, #0x4
        RETF
??MPSub_Beep_2:
        LD        A, #0x1
        CP        A, L:ProtectFlag + 2
        JRNE      L:??MPSub_Beep_3
        MOV       L:Buzz_Control, #0x5
        RETF
??MPSub_Beep_3:
        LD        A, #0x1
        CP        A, L:ProtectFlag + 3
        JRNE      L:??MPSub_Beep_4
        MOV       L:Buzz_Control, #0x6
        RETF
??MPSub_Beep_4:
        LD        A, #0x1
        CP        A, L:ProtectFlag + 4
        JRNE      L:??MPSub_Beep_5
        MOV       L:Buzz_Control, #0x7
        RETF
??MPSub_Beep_5:
        LD        A, #0x1
        CP        A, L:ProtectFlag + 5
        JRNE      L:??MPSub_Beep_6
        MOV       L:Buzz_Control, #0x8
        RETF
??MPSub_Beep_6:
        LD        A, #0x1
        CP        A, L:ProtectFlag + 6
        JRNE      L:??MPSub_Beep_7
        MOV       L:Buzz_Control, #0x9
        RETF
??MPSub_Beep_7:
        LD        A, #0x1
        CP        A, L:ProtectFlag + 7
        JRNE      L:??MPSub_Beep_8
        MOV       L:Buzz_Control, #0xa
        RETF
??MPSub_Beep_8:
        LD        A, #0x1
        CP        A, L:ProtectFlag + 8
        JRNE      L:??MPSub_Beep_9
        MOV       L:Buzz_Control, #0xb
        RETF
??MPSub_Beep_9:
        LD        A, #0x1
        CP        A, L:ProtectFlag + 9
        JRNE      L:??MPSub_Beep_10
        MOV       L:Buzz_Control, #0xc
        RETF
??MPSub_Beep_10:
        LD        A, #0x1
        CP        A, L:ProtectFlag + 10
        JRNE      L:??MPSub_Beep_11
        MOV       L:Buzz_Control, #0xd
        RETF
??MPSub_Beep_11:
        LD        A, #0x1
        CP        A, L:ProtectFlag + 11
        JRNE      L:??MPSub_Beep_12
        MOV       L:Buzz_Control, #0xe
        RETF
??MPSub_Beep_12:
        LD        A, #0x1
        CP        A, L:ProtectFlag + 12
        JRNE      L:??MPSub_Beep_13
        MOV       L:Buzz_Control, #0xf
        RETF
??MPSub_Beep_13:
        LD        A, #0x1
        CP        A, L:ProtectFlag + 13
        JRNE      L:??MPSub_Beep_14
        MOV       L:Buzz_Control, #0x10
        RETF
??MPSub_Beep_14:
        LD        A, #0x1
        CP        A, L:ProtectFlag + 14
        JRNE      L:??MPSub_Beep_15
        MOV       L:Buzz_Control, #0x11
        RETF
??MPSub_Beep_15:
        LD        A, #0x1
        CP        A, L:ProtectFlag + 15
        JRNE      L:??MPSub_Beep_0
        MOV       L:Buzz_Control, #0x12
??MPSub_Beep_0:
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  910 void  MPSub_IGBT_OUT_DN(unsigned char protype)//PA4
//  911 {
//  912     if((ProtectFlag[protype] == 1) && (CNT_ProtF[protype] == 1))
//  913     {
//  914         if(PA_IDR_IDR4 == 1)
//  915         {
//  916             CNT_ProtB[protype]++;
//  917             if(CNT_ProtB[protype] >= 200)
//  918             {
//  919 				CNT_ProtF[protype] = 0;
//  920                 CNT_ProtB[protype] = 0;
//  921                 ProtectFlag[protype] = 0;
//  922                 MPSubC();
//  923             }
//  924         }
//  925         else
//  926         {
//  927            CNT_ProtB[protype] = 0;
//  928 		   Broken_Code = 0;
//  929 				errno = 0;
//  930         }
//  931     }
//  932 }
//  933 void  MPSub_VOL_OUT_INPUT(unsigned char protype)//PA5
//  934 {
//  935     if((ProtectFlag[protype] == 1) && (CNT_ProtF[protype] == 1))
//  936     {
//  937         if(PA_IDR_IDR5 == 1)
//  938         {
//  939             CNT_ProtB[protype]++;
//  940             if(CNT_ProtB[protype] >= 200)
//  941             {
//  942 				CNT_ProtF[protype] = 0;
//  943                 CNT_ProtB[protype] = 0;
//  944                 ProtectFlag[protype] = 0;
//  945                 MPSubC();
//  946             }
//  947         }
//  948         else
//  949         {
//  950            CNT_ProtB[protype] = 0;
//  951 		   Broken_Code = 0;
//  952 				errno = 0;
//  953         }
//  954     }
//  955 }
//  956 void  MPSub_VOL_OUT_COIL(unsigned char protype)//PB7
//  957 {
//  958     if((ProtectFlag[protype] == 1) && (CNT_ProtF[protype] == 1))
//  959     {
//  960         if(PB_IDR_IDR7 == 1)
//  961         {
//  962             CNT_ProtB[protype]++;
//  963             if(CNT_ProtB[protype] >= 200)
//  964             {
//  965 				CNT_ProtF[protype] = 0;
//  966                 CNT_ProtB[protype] = 0;
//  967                 ProtectFlag[protype] = 0;
//  968                 MPSubC();
//  969             }
//  970         }
//  971         else
//  972         {
//  973            CNT_ProtB[protype] = 0;
//  974 		   Broken_Code = 0;
//  975 				errno = 0;
//  976         }
//  977     }
//  978 }
//  979 void  MPSub_Curr_OUT_COIL(unsigned char protype)//PB6
//  980 {
//  981     if((ProtectFlag[protype] == 1) && (CNT_ProtF[protype] == 1))
//  982     {
//  983         if(PB_IDR_IDR6 == 1)
//  984         {
//  985             CNT_ProtB[protype]++;
//  986             if(CNT_ProtB[protype] >= 200)
//  987             {
//  988 				CNT_ProtF[protype] = 0;
//  989                 CNT_ProtB[protype] = 0;
//  990                 ProtectFlag[protype] = 0;
//  991                 MPSubC();
//  992             }
//  993         }
//  994         else
//  995         {
//  996            CNT_ProtB[protype] = 0;
//  997 		   Broken_Code = 0;
//  998 				errno = 0;
//  999         }
// 1000     }
// 1001 }
// 1002 
// 1003 void DEAL_ABNORMAL_FUN(const unsigned char c_num)
// 1004 {
// 1005 	unsigned char c_proNun = c_num;
// 1006 	switch(c_proNun)
// 1007 	{
// 1008 		case 0://IGBT超温
// 1009 		    if(devStatus.igbt_temp < C_Minimum_Temp1 )
// 1010 			{
// 1011 				Fan_Close();
// 1012 				//MacStatus = C_MSNORMAL;
// 1013 				ProtectFlag[0] = 0;
// 1014 				MPSubC();
// 1015 			}
// 1016 			else if(devStatus.igbt_temp > C_Maximum_Temp1 )
// 1017 			{
// 1018 				Fan_Open();
// 1019 			}																	
// 1020 			break;
// 1021 		case 1://COIL超温
// 1022 			if(devStatus.igbt_temp < C_Minimum_Temp1 )
// 1023 			{
// 1024 				Fan_Close();
// 1025 				//MacStatus = C_MSNORMAL;
// 1026 				ProtectFlag[1] = 0;
// 1027 				MPSubC();
// 1028 			}
// 1029 			else if(devStatus.igbt_temp > C_Maximum_Temp1 )
// 1030 			{
// 1031 				Fan_Open();
// 1032 			}
// 1033 			break;
// 1034 
// 1035 		case 2://完成IGBT上管饱和出错报警
// 1036 		  
// 1037 		  ABORT_DEAL_FUC(2);
// 1038 		  break;
// 1039 		  
// 1040 		case 3://完成IGBT下管饱和出错报警
// 1041 		  ABORT_DEAL_FUC(3);
// 1042 		  break;
// 1043 		  
// 1044 		case 4://整流桥后电压过高出错报警
// 1045 		  ABORT_DEAL_FUC(4);
// 1046 		  break;
// 1047 		  
// 1048 		case 5://总消耗电流过大告警
// 1049 		  ABORT_DEAL_FUC(5);
// 1050 		  break;
// 1051 		  
// 1052 		case 6://线圈LC谐振回路超压出错报警
// 1053 		  ABORT_DEAL_FUC(6);
// 1054 		  break;
// 1055 		  
// 1056 		case 7://线圈电流过高出错报警
// 1057 		  ABORT_DEAL_FUC(7);
// 1058 		  break;
// 1059 		  
// 1060 		case 8://异物检测故障
// 1061 		  ABORT_DEAL_FUC(8);
// 1062 		  break;
// 1063 		  
// 1064 		default:
// 1065 		  break;
// 1066 	}
// 1067 }
// 1068 
// 1069 void ABORT_DEAL_FUC(const unsigned char num)
// 1070 {
// 1071 	_delay_ms(10);// 延时10ms 
// 1072 	if(Broken_Code  == 1)//如果此时中断进入,则从机要切断继电器，确保不会烧毁igbt
// 1073 	{
// 1074 		if(Flag_10ms_J == 1)
// 1075 		{
// 1076 			CNT_T500ms++;
// 1077 			Flag_10ms_J = 0;
// 1078 			if(CNT_T500ms >= 50)//500ms
// 1079 			{
// 1080 				if(Num_Interruput_Broken++ <= 2)
// 1081 				{
// 1082 					PE_ODR_ODR0 = 0;//打开IGBT
// 1083 					Adjust_Time1_cycle2(0);//10%
// 1084 					Broken_Code = 2;
// 1085 					_delay_ms(100);// 延时100ms 
// 1086 				}
// 1087 				else
// 1088 				{
// 1089 					PE_ODR_ODR0 = 1;//关闭IGBT
// 1090 					//flag_p = 6;
// 1091 				}					
// 1092 			}
// 1093 		}
// 1094 	}
// 1095 	else if(Broken_Code == 2)
// 1096 	{
// 1097 		if(Flag_10ms_J == 1)
// 1098 		{
// 1099 			CNT_T500ms++;
// 1100 			Flag_10ms_J = 0;
// 1101 			if(CNT_T500ms >= 100) //1s
// 1102 			{
// 1103 				CNT_ProtF[num] = 1;
// 1104 				CNT_T500ms = 0;
// 1105 			}
// 1106 		} 
// 1107 		Num_Interruput_Broken = 0;
// 1108 	}
// 1109 }
// 
// 3 865 bytes in section .far_func.text
//     2 bytes in section .near.bss
//     4 bytes in section .near.data
//     6 bytes in section .near.noinit   (abs)
// 
// 3 865 bytes of CODE memory
//     6 bytes of DATA memory (+ 6 bytes shared)
//
//Errors: none
//Warnings: none
