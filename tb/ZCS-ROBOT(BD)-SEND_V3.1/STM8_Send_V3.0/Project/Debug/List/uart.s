///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.20.1.176 for STM8                29/Mar/2017  16:23:49
// Copyright 2010-2015 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\uart.c
//    Command line =  
//        "E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\uart.c"
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
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List\uart.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b8
        EXTERN ?epilogue_l2_w6
        EXTERN ?move1616_v_x_y_a
        EXTERN ?mul16_x_x_w0
        EXTERN ?push_l2
        EXTERN ?push_w6
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w4
        EXTERN Adjust_Time1_RF_4UART
        EXTERN Eeprom_Write
        EXTERN Pwm_Frequent_Value
        EXTERN Pwm_Product_numValue
        EXTERN Pwm_Ratio_Value
        EXTERN RobotCommandProcStep
        EXTERN Stor_Commd
        EXTERN Stor_Frequen_eeprom
        EXTERN Stor_Ratio_eeprom
        EXTERN UART2_RX_BUF
        EXTERN UART2_pRead
        EXTERN UART2_pWrite
        EXTERN Uart_Buf
        EXTERN checkSum
        EXTERN printf

        PUBLIC CheckSum
        PUBLIC RobotCmdProc
        PUBLIC RobotPkgProc
        PUBLIC UART2_BRR1
        PUBLIC UART2_BRR2
        PUBLIC UART2_DR
        PUBLIC UART2_RxInterrupt
        PUBLIC UART2_RxRead
        PUBLIC UART2_SendByte
        PUBLIC UART2_SendString
        PUBLIC UART_Process
        PUBLIC Uart2_Init
        PUBLIC _A_UART2_CR1
        PUBLIC _A_UART2_CR2
        PUBLIC _A_UART2_CR3
        PUBLIC _A_UART2_SR
        PUBLIC putchar

// E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\uart.c
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

        ASEGN `.near.noinit`:DATA:NOROOT,05242H
        SECTION_GROUP UART2_BRR1
// unsigned char volatile UART2_BRR1
UART2_BRR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05243H
        SECTION_GROUP UART2_BRR2
// unsigned char volatile UART2_BRR2
UART2_BRR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05244H
        SECTION_GROUP _A_UART2_CR1
// union <unnamed> volatile _A_UART2_CR1
_A_UART2_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05245H
        SECTION_GROUP _A_UART2_CR2
// union <unnamed> volatile _A_UART2_CR2
_A_UART2_CR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05246H
        SECTION_GROUP _A_UART2_CR3
// union <unnamed> volatile _A_UART2_CR3
_A_UART2_CR3:
        DS8 1
//   21 //#include "string.h"
//   22 #include "stdio.h"
//   23 #include "Uart.h"
//   24 #include "Eeprom.h"
//   25 #include "PWM_Control.h"
//   26 //******************************************************************************
//   27 //UART初始化
//   28 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   29 void Uart2_Init(void)
//   30 {
Uart2_Init:
        SUB       SP, #0x2
//   31     volatile unsigned int baud_div=0;   
        CLRW      X
        LDW       (0x1,SP), X
//   32     unsigned tmp1,tmp2;
//   33      
//   34     UART2_CR1 = (0<<4)|(0<<3)|(0<<2)|(0<<1)|(0<<0); 
        MOV       L:0x5244, #0x0
//   35     /*1位起始位 8位数据位 结束位由CR3设置 不使用奇偶校验 不使能奇偶校验中断*/
//   36     //UART2_CR2 = (0<<7)|(0<<6)|(0<<5)|(0<<4)|(0<<3)|(0<<2);
//   37 	UART2_CR2 = (0<<7)|(0<<6)|(1<<5)|(0<<4)|(1<<3)|(1<<2); 
        MOV       L:0x5245, #0x2c
//   38     /*使能发送和接收 接收中断使能 禁止发送中断*/
//   39     UART2_CR3 = (0<<6)|(0<<4)|(0<<3); /*设置1位停止位 不使能SCLK*/        
        MOV       L:0x5246, #0x0
//   40     //UART2_CR5 = (0<<2)|(0<<1);     
//   41     /*使用智能卡模式需要设置的，基本上保持默认就行了 */    
//   42     /*设置波特率----16M波特率配置 115200*/
//   43     baud_div =(unsigned int)((float)HSIClockFreq/BaudRate + 0.112);  /*求出分频因子*/
        LDW       X, #0x8b
        LDW       (0x1,SP), X
//   44     tmp1 = (unsigned char)(baud_div & 0x0f);
        LDW       X, (0x1,SP)
        LD        A, XL
        AND       A, #0xf
        CLRW      Y
        LD        YL, A
//   45     tmp2 = (unsigned char)((baud_div >> 8) & 0xf0);
        LDW       X, (0x1,SP)
        LD        A, XH
        AND       A, #0xf0
        CLRW      X
        LD        XL, A
//   46     
//   47     
//   48     UART2_BRR2 = (tmp1 | tmp2);
        LD        A, XL
        EXG       A, YL
        LD        S:?b0, A
        EXG       A, YL
        OR        A, S:?b0
        LD        L:0x5243, A
//   49     UART2_BRR1 = (unsigned char)((baud_div >> 4) & 0xff);    /*先给BRR2赋值 最后再设置BRR1*/ 
        LDW       X, (0x1,SP)
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5242, A
//   50     
//   51     //16M晶振 波特率115200
//   52     UART2_BRR2 = 0x0B;
        MOV       L:0x5243, #0xb
//   53     UART2_BRR1 = 0x08;
        MOV       L:0x5242, #0x8
//   54     
//   55     //8M晶振 波特率9600
//   56     //UART2_BRR2 = 0x01;
//   57     //UART2_BRR1 = 0x34;
//   58     
//   59      //16M晶振 波特率9600
//   60     //UART2_BRR2 = 0x03;
//   61     //UART2_BRR1 = 0x68;
//   62 
//   63     
//   64     UART2_CR1 |= (0<<5);         /*使能UART*/
        MOV       L:0x5244, L:0x5244
//   65 	//UART2_CR2 = (0<<7)|(0<<6)|(1<<5)|(0<<4)|(1<<3)|(1<<2); 
//   66     /*使能发送和接收 接收中断使能 禁止发送中断*/
//   67 }
        ADD       SP, #0x2
        RETF
        REQUIRE _A_UART2_CR1
        REQUIRE _A_UART2_CR2
        REQUIRE _A_UART2_CR3
        REQUIRE UART2_BRR2
        REQUIRE UART2_BRR1
//   68 //******************************************************************************
//   69 
//   70 
//   71 //******************************************************************************
//   72 //串口通讯
//   73 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   74 void UART_Process(void )
//   75 {
//   76     unsigned char len;
//   77     len = UART2_RxRead(Uart_Buf,23);
UART_Process:
        LD        A, #0x17
        LDW       X, #Uart_Buf
        CALLF     UART2_RxRead
//   78     if(len)
        TNZ       A
        JREQ      L:??UART_Process_0
//   79     {
//   80         RobotPkgProc(Uart_Buf,len);
        LDW       X, #Uart_Buf
        CALLF     RobotPkgProc
//   81     }  
//   82 }
??UART_Process_0:
        RETF
//   83 //******************************************************************************
//   84 
//   85 
//   86 //******************************************************************************
//   87 //串口中断接收数据
//   88 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   89 void UART2_RxInterrupt(unsigned char ch)
//   90 {
UART2_RxInterrupt:
        LD        S:?b0, A
//   91     UART2_RX_BUF[UART2_pWrite++] = ch;
        LD        A, L:UART2_pWrite
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:UART2_RX_BUF,X), A
        LD        A, #0x1
        ADD       A, L:UART2_pWrite
        LD        L:UART2_pWrite, A
//   92     if(UART2_pWrite >= UART2_RX_BUF_SIZE)
        LDW       X, #UART2_pWrite
        LD        A, (X)
        CP        A, #0x40
        JRC       L:??UART2_RxInterrupt_0
//   93     {
//   94         UART2_pWrite = 0;
        MOV       L:UART2_pWrite, #0x0
//   95     }
//   96 	//while(!UART2_SR_TXE);
//   97 	//UART2_DR = UART2_RX_BUF[UART2_pWrite-1];
//   98 }
??UART2_RxInterrupt_0:
        RETF
//   99 //******************************************************************************
//  100 
//  101 
//  102 //******************************************************************************
//  103 //获取接收数据长度
//  104 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  105 unsigned char UART2_RxRead(unsigned char *buf,unsigned char len)
//  106 {	
UART2_RxRead:
        LDW       Y, X
        LD        S:?b2, A
//  107     unsigned char i,num = 0;
        CLR       S:?b0
//  108     for(i=0;i<len;i++)
        CLR       S:?b1
        JRA       L:??UART2_RxRead_0
//  109     {
//  110         if(UART2_pRead == UART2_pWrite)
//  111         {
//  112             break;
//  113         }
//  114         *buf++ = UART2_RX_BUF[UART2_pRead++];
??UART2_RxRead_1:
        LD        A, L:UART2_pRead
        CLRW      X
        LD        XL, A
        LD        A, (L:UART2_RX_BUF,X)
        LD        (Y), A
        LD        A, #0x1
        ADD       A, L:UART2_pRead
        LD        L:UART2_pRead, A
        ADDW      Y, #0x1
//  115         num++;
        LD        A, S:?b0
        ADD       A, #0x1
        LD        S:?b0, A
//  116         if(UART2_pRead >= UART2_RX_BUF_SIZE)
        LDW       X, #UART2_pRead
        LD        A, (X)
        CP        A, #0x40
        JRC       L:??UART2_RxRead_2
//  117         {
//  118             UART2_pRead = 0;
        MOV       L:UART2_pRead, #0x0
//  119         }
??UART2_RxRead_2:
        LD        A, S:?b1
        ADD       A, #0x1
        LD        S:?b1, A
??UART2_RxRead_0:
        LD        A, S:?b1
        CP        A, S:?b2
        JRNC      L:??UART2_RxRead_3
        LDW       X, #UART2_pWrite
        LD        A, (X)
        CP        A, L:UART2_pRead
        JRNE      L:??UART2_RxRead_1
//  120     }
//  121     return num;
??UART2_RxRead_3:
        LD        A, S:?b0
        RETF
//  122 }
//  123 //******************************************************************************
//  124 
//  125 
//  126 //******************************************************************************
//  127 //解析串口接收到的数据
//  128 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  129 void RobotPkgProc(unsigned char *buf,unsigned char len)
//  130 {
RobotPkgProc:
        CALLF     L:?push_l2
        CALLF     L:?push_w6
        SUB       SP, #0x18
        LDW       S:?w4, X
        LD        S:?b13, A
//  131     unsigned char i,tmp,str_len = 0;
        CLR       S:?b10
//  132 	unsigned char temp_cat[24] = {0};
        LDW       Y, #?_0
        LDW       X, SP
        ADDW      X, #0x1
        PUSHW     X
        LD        A, #0x18
        CALLF     L:?move1616_v_x_y_a
        POPW      X
//  133 	unsigned int cmd = 0;
        CLR       S:?b3
        CLR       S:?b2
//  134 	str_len = len;
        MOV       S:?b10, S:?b13
//  135     checkSum = 0;
        MOV       L:checkSum, #0x0
//  136     for(i=0;i<len;i++)
        CLR       S:?b11
        JRA       L:??RobotPkgProc_0
//  137     {
//  138         tmp = *buf++;
//  139 		temp_cat[i] = tmp;
//  140         switch(RobotCommandProcStep)
//  141         {
//  142             case 0:
//  143                 if(tmp == '$')
//  144                 {
//  145                     Stor_Commd[RobotCommandProcStep] = tmp;
//  146                 	RobotCommandProcStep++;    
//  147                 }
//  148 				checkSum += tmp;				
//  149 				str_len--;
//  150                 break;
//  151             case 1:
//  152                 if(tmp == 'c')
//  153                 {
//  154                     Stor_Commd[RobotCommandProcStep] = tmp;
//  155                 	RobotCommandProcStep++;    
//  156                 }
//  157 				else
//  158 					RobotCommandProcStep = 0;
//  159 				checkSum += tmp;
//  160 				str_len--;
//  161                 break;
//  162             case 2:
//  163                 if(tmp == 'm')
//  164                 {
//  165                     Stor_Commd[RobotCommandProcStep] = tmp;
//  166                 	RobotCommandProcStep++;    
//  167                 }
//  168 				else
//  169 					RobotCommandProcStep = 0;
//  170 				checkSum += tmp;
//  171 				str_len--;
//  172                 break;				
//  173             case 3:
//  174                 if(tmp == 'd')
//  175                 {
//  176                     Stor_Commd[RobotCommandProcStep] = tmp;
//  177                 	RobotCommandProcStep++;    
//  178                 }
//  179 				else
//  180 					RobotCommandProcStep = 0;
//  181 				checkSum += tmp;
//  182 				str_len--;
//  183                 break;
//  184             default: 
//  185 			  	str_len--;				
//  186 			  	switch(str_len)
//  187 				{
//  188 				  case 1:
//  189 					if(checkSum == tmp)
//  190 					{
//  191 						cmd = temp_cat[5];
//  192 						RobotCmdProc(cmd,temp_cat,len,Stor_Commd);
//  193 					}
//  194 					RobotCommandProcStep = 0;
//  195 					break;
//  196 				  default:
//  197 					break;
//  198 				}
//  199 				checkSum += tmp;
??RobotPkgProc_1:
        LD        A, S:?b12
        ADD       A, L:checkSum
        LD        L:checkSum, A
//  200 				break;
??RobotPkgProc_2:
        LD        A, S:?b11
        ADD       A, #0x1
        LD        S:?b11, A
??RobotPkgProc_0:
        LD        A, S:?b11
        CP        A, S:?b13
        JRC       ??lb_1
        JP        L:??RobotPkgProc_3
??lb_1:
        LD        A, [S:?w4.w]
        LD        S:?b12, A
        LDW       X, S:?w4
        ADDW      X, #0x1
        LDW       S:?w4, X
        CLR       S:?b0
        MOV       S:?b1, S:?b11
        LDW       X, SP
        ADDW      X, #0x1
        ADDW      X, S:?w0
        LD        A, S:?b12
        LD        (X), A
        LDW       X, #RobotCommandProcStep
        LD        A, (X)
        TNZ       A
        JREQ      L:??RobotPkgProc_4
        DEC       A
        JREQ      L:??RobotPkgProc_5
        DEC       A
        JREQ      L:??RobotPkgProc_6
        DEC       A
        JRNE      ??lb_2
        JP        L:??RobotPkgProc_7
??lb_2:
        JP        L:??RobotPkgProc_8
??RobotPkgProc_4:
        LD        A, S:?b12
        CP        A, #0x24
        JRNE      L:??RobotPkgProc_9
        LD        A, L:RobotCommandProcStep
        CLRW      X
        LD        XL, A
        LD        A, S:?b12
        LD        (L:Stor_Commd,X), A
        LD        A, #0x1
        ADD       A, L:RobotCommandProcStep
        LD        L:RobotCommandProcStep, A
??RobotPkgProc_9:
        LD        A, S:?b12
        ADD       A, L:checkSum
        LD        L:checkSum, A
        LD        A, S:?b10
        ADD       A, #0xff
        LD        S:?b10, A
        JRA       L:??RobotPkgProc_2
??RobotPkgProc_5:
        LD        A, S:?b12
        CP        A, #0x63
        JRNE      L:??RobotPkgProc_10
        LD        A, L:RobotCommandProcStep
        CLRW      X
        LD        XL, A
        LD        A, S:?b12
        LD        (L:Stor_Commd,X), A
        LD        A, #0x1
        ADD       A, L:RobotCommandProcStep
        LD        L:RobotCommandProcStep, A
        JRA       L:??RobotPkgProc_11
??RobotPkgProc_10:
        MOV       L:RobotCommandProcStep, #0x0
??RobotPkgProc_11:
        LD        A, S:?b12
        ADD       A, L:checkSum
        LD        L:checkSum, A
        LD        A, S:?b10
        ADD       A, #0xff
        LD        S:?b10, A
        JP        L:??RobotPkgProc_2
??RobotPkgProc_6:
        LD        A, S:?b12
        CP        A, #0x6d
        JRNE      L:??RobotPkgProc_12
        LD        A, L:RobotCommandProcStep
        CLRW      X
        LD        XL, A
        LD        A, S:?b12
        LD        (L:Stor_Commd,X), A
        LD        A, #0x1
        ADD       A, L:RobotCommandProcStep
        LD        L:RobotCommandProcStep, A
        JRA       L:??RobotPkgProc_13
??RobotPkgProc_12:
        MOV       L:RobotCommandProcStep, #0x0
??RobotPkgProc_13:
        LD        A, S:?b12
        ADD       A, L:checkSum
        LD        L:checkSum, A
        LD        A, S:?b10
        ADD       A, #0xff
        LD        S:?b10, A
        JP        L:??RobotPkgProc_2
??RobotPkgProc_7:
        LD        A, S:?b12
        CP        A, #0x64
        JRNE      L:??RobotPkgProc_14
        LD        A, L:RobotCommandProcStep
        CLRW      X
        LD        XL, A
        LD        A, S:?b12
        LD        (L:Stor_Commd,X), A
        LD        A, #0x1
        ADD       A, L:RobotCommandProcStep
        LD        L:RobotCommandProcStep, A
        JRA       L:??RobotPkgProc_15
??RobotPkgProc_14:
        MOV       L:RobotCommandProcStep, #0x0
??RobotPkgProc_15:
        LD        A, S:?b12
        ADD       A, L:checkSum
        LD        L:checkSum, A
        LD        A, S:?b10
        ADD       A, #0xff
        LD        S:?b10, A
        JP        L:??RobotPkgProc_2
??RobotPkgProc_8:
        LD        A, S:?b10
        ADD       A, #0xff
        LD        S:?b10, A
        LD        A, S:?b10
        CP        A, #0x1
        JREQ      ??lb_3
        JP        L:??RobotPkgProc_1
??lb_3:
        LD        A, S:?b12
        CP        A, L:checkSum
        JRNE      L:??RobotPkgProc_16
        LD        A, (0x6,SP)
        CLR       S:?b2
        LD        S:?b3, A
        LDW       Y, #Stor_Commd
        MOV       S:?b0, S:?b13
        LDW       X, SP
        ADDW      X, #0x1
        LD        A, S:?b3
        CALLF     RobotCmdProc
??RobotPkgProc_16:
        MOV       L:RobotCommandProcStep, #0x0
        JP        L:??RobotPkgProc_1
//  201         }
//  202     }
//  203 }
??RobotPkgProc_3:
        ADD       SP, #0x18
        JPF       L:?epilogue_l2_w6
//  204 //******************************************************************************
//  205 
//  206 
//  207 //******************************************************************************
//  208 //根据接收发送数据
//  209 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  210 void RobotCmdProc(unsigned char cmd,unsigned char *buf,unsigned char len,unsigned char *cmd_flag)
//  211 {
RobotCmdProc:
        PUSH      S:?b8
        LDW       S:?w1, X
//  212     unsigned char i;
//  213     switch(cmd)
        CP        A, #0x66
        JREQ      L:??RobotCmdProc_0
        CP        A, #0x77
        JRNE      ??lb_0
        JP        L:??RobotCmdProc_1
??lb_0:
        JP        L:??RobotCmdProc_2
//  214     {
//  215 	   case ROBOT_COMMAND_MODIFY_FR:
//  216 		
//  217 			Pwm_Frequent_Value = (*(buf+7)- '0')*10 + (*(buf+8)-'0');
??RobotCmdProc_0:
        LDW       X, S:?w1
        ADDW      X, #0x7
        LD        A, (X)
        CLR       S:?b4
        LD        S:?b5, A
        LDW       X, #0xa
        LDW       S:?w0, X
        LDW       X, S:?w2
        CALLF     L:?mul16_x_x_w0
        LDW       S:?w0, X
        LDW       X, S:?w1
        ADDW      X, #0x8
        LD        A, (X)
        CLR       S:?b4
        LD        S:?b5, A
        LDW       X, S:?w0
        ADDW      X, S:?w2
        ADDW      X, #0xfffffffffffffdf0
        LDW       L:Pwm_Frequent_Value, X
//  218 			Pwm_Ratio_Value = (*(buf+13) - '0')*10 + (*(buf+14) - '0');
        LDW       X, S:?w1
        ADDW      X, #0xd
        LD        A, (X)
        CLR       S:?b4
        LD        S:?b5, A
        LDW       X, #0xa
        LDW       S:?w0, X
        LDW       X, S:?w2
        CALLF     L:?mul16_x_x_w0
        LDW       S:?w0, X
        LDW       X, S:?w1
        ADDW      X, #0xe
        LD        A, (X)
        CLR       S:?b4
        LD        S:?b5, A
        LDW       X, S:?w0
        ADDW      X, S:?w2
        ADDW      X, #0xfffffffffffffdf0
        LDW       L:Pwm_Ratio_Value, X
//  219 			Pwm_Product_numValue = *(buf+20) - '0';
        LDW       X, S:?w1
        ADDW      X, #0x14
        LD        A, (X)
        ADD       A, #0xd0
        LD        L:Pwm_Product_numValue, A
//  220 
//  221 			Adjust_Time1_RF_4UART(cmd_flag,Pwm_Product_numValue,Pwm_Frequent_Value,Pwm_Ratio_Value);
        LDW       X, L:Pwm_Ratio_Value
        EXG       A, XL
        LD        S:?b1, A
        EXG       A, XL
        LDW       X, L:Pwm_Frequent_Value
        EXG       A, XL
        LD        S:?b0, A
        EXG       A, XL
        LD        A, L:Pwm_Product_numValue
        LDW       X, Y
        CALLF     Adjust_Time1_RF_4UART
//  222 			break;
        JRA       L:??RobotCmdProc_2
//  223 	  	case ROBOT_COMMAND_MODIFY_EEPROM:
//  224           
//  225 		    asm("sim");//关闭中断	                          
??RobotCmdProc_1:
        sim
//  226 		    for(i = 6;i<11;i++)
        MOV       S:?b8, #0x6
        JRA       L:??RobotCmdProc_3
//  227 			{
//  228 				Eeprom_Write(i,Stor_Frequen_eeprom[i-6]);
??RobotCmdProc_4:
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        ADDW      X, #Stor_Frequen_eeprom - 6
        LD        A, (X)
        LD        S:?b0, A
        LD        A, S:?b8
        CALLF     Eeprom_Write
//  229 				Eeprom_Write(i+5,Stor_Ratio_eeprom[i-6]);
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        ADDW      X, #Stor_Ratio_eeprom - 6
        LD        A, (X)
        LD        S:?b0, A
        LD        A, S:?b8
        ADD       A, #0x5
        CALLF     Eeprom_Write
//  230 				printf("set_success_eeprom!");
        LDW       X, #?_1
        CALLF     printf
//  231 			}
        LD        A, S:?b8
        ADD       A, #0x1
        LD        S:?b8, A
??RobotCmdProc_3:
        LD        A, S:?b8
        CP        A, #0xb
        JRC       L:??RobotCmdProc_4
//  232 			
//  233 			Eeprom_Write(16,17);
        MOV       S:?b0, #0x11
        LD        A, #0x10
        CALLF     Eeprom_Write
//  234 			Eeprom_Write(17,Stor_Frequen_eeprom[5]);
        MOV       S:?b0, L:Stor_Frequen_eeprom + 5
        LD        A, #0x11
        CALLF     Eeprom_Write
//  235 			Eeprom_Write(18,Stor_Ratio_eeprom[5]);
        MOV       S:?b0, L:Stor_Ratio_eeprom + 5
        LD        A, #0x12
        CALLF     Eeprom_Write
//  236             
//  237             printf("set_success_eeprom!");
        LDW       X, #?_1
        CALLF     printf
//  238 			asm("rim");
        rim
//  239 		  	break;
//  240         /*case ROBOT_COMMAND_QUERY:
//  241             //发送应答信息
//  242             i = 0;
//  243             tmp = sizeof(DEV_STATUS);
//  244             wCmdAckBuf[i++] = DEVICE_COMMAND_HEAD;			//HEAD
//  245             wCmdAckBuf[i++] = 0;					//id
//  246             wCmdAckBuf[i++] = tmp+1;					//cmd + data len
//  247             wCmdAckBuf[i++] = DEVICE_COMMAND_ACK;			//command ack		
//  248             memcpy(&wCmdAckBuf[i],(unsigned char *)&devStatus,tmp);	//data
//  249             i += tmp;
//  250             wCmdAckBuf[i] = CheckSum(&wCmdAckBuf[3],tmp+1);		//check sum
//  251             i++;
//  252             UART2_SendString(wCmdAckBuf,i);
//  253             break;
//  254         case ROBOT_COMMAND_CTRL:
//  255             if(*buf == ROBOT_COMMAND_CTRL_OPEN)
//  256             {
//  257                 //充电开启
//  258                 rCmdContent = ROBOT_CMMMAND_CHARGE_OPEN;
//  259             }
//  260             else if(*buf == ROBOT_COMMAND_CTRL_CLOSE)
//  261             {
//  262                 rCmdContent = ROBOT_CMMMAND_CHARGE_CLOSE;
//  263                 //充电关闭
//  264             }
//  265             break;*/
//  266         default:
//  267 
//  268             break;
//  269     }
//  270 }
??RobotCmdProc_2:
        POP       S:?b8
        RETF
//  271 //******************************************************************************
//  272 
//  273 
//  274 //******************************************************************************
//  275 //累加计算校验和
//  276 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  277 unsigned char CheckSum(unsigned char *buf,unsigned char len)
//  278 {
CheckSum:
        LD        S:?b2, A
//  279     unsigned char sum,i;
//  280     sum =0;
        CLR       S:?b1
//  281     for(i=0;i<len;i++)
        CLR       S:?b0
        JRA       L:??CheckSum_0
//  282     {
//  283         sum += *buf++;
??CheckSum_1:
        LD        A, (X)
        ADD       A, S:?b1
        LD        S:?b1, A
        ADDW      X, #0x1
//  284     }
        LD        A, S:?b0
        ADD       A, #0x1
        LD        S:?b0, A
??CheckSum_0:
        LD        A, S:?b0
        CP        A, S:?b2
        JRC       L:??CheckSum_1
//  285     return sum;
        LD        A, S:?b1
        RETF
//  286 }

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
UART2_SendByte:
        LD        L:0x5241, A
??UART2_SendByte_0:
        MOV       S:?b0, L:0x5240
        LD        A, S:?b0
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??UART2_SendByte_0
        RETF
        REQUIRE UART2_DR
        REQUIRE _A_UART2_SR
//  287 //******************************************************************************
//  288 
//  289 
//  290 //******************************************************************************
//  291 //UART发送字符串
//  292 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  293 void UART2_SendString(unsigned char *Data,unsigned char len)
//  294 {
UART2_SendString:
        LD        S:?b4, A
//  295     unsigned char  i;
//  296     for(i=0;i<len;i++)
        CLR       S:?b1
        JRA       L:??UART2_SendString_0
//  297     {
//  298         UART2_SendByte(Data[i]);
??UART2_SendString_1:
        CLRW      Y
        LD        A, S:?b1
        LD        YL, A
        LDW       S:?w1, X
        ADDW      Y, S:?w1
        LD        A, (Y)
        CALLF     UART2_SendByte
//  299     }
        LD        A, S:?b1
        ADD       A, #0x1
        LD        S:?b1, A
??UART2_SendString_0:
        LD        A, S:?b1
        CP        A, S:?b4
        JRC       L:??UART2_SendString_1
//  300 }
        RETF
//  301 //******************************************************************************
//  302 
//  303 
//  304 //******************************************************************************
//  305 //UART发送单字节
//  306 //******************************************************************************
//  307 void UART2_SendByte(unsigned char data)
//  308 {   
//  309     unsigned char temp;
//  310     UART2_DR = data;
//  311     for(;;)
//  312     {
//  313         temp = UART2_SR;
//  314         if(temp & MASK_UART2_SR_TXE)
//  315         {
//  316           break;
//  317         }
//  318     }
//  319 	
//  320 	/*while((UART2_SR & MASK_UART2_SR_TXE)==0x00);
//  321     UART2_DR = data;*/
//  322 }
//  323 //******************************************************************************
//  324 /*******************************************************************************
//  325 -----------------------------    End of file    --------------------------------
//  326 *******************************************************************************/

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  327 int putchar(int c)
//  328 {
//  329 	if(c == '\n')
putchar:
        CPW       X, #0xa
        JRNE      L:??putchar_0
//  330 		UART2_SendByte('\r');
        LD        A, #0xd
        CALLF     UART2_SendByte
//  331 	UART2_SendByte((unsigned char )c);
??putchar_0:
        LD        A, XL
        JPF       UART2_SendByte
//  332 
//  333 	return c;
//  334 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_0:
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_1:
        DC8 "set_success_eeprom!"

        END
//  335 /*******************************************************************************
//  336 -----------------------------    End of file    --------------------------------
//  337 *******************************************************************************/
// 
// 909 bytes in section .far_func.text
//   7 bytes in section .near.noinit   (abs)
//  44 bytes in section .near.rodata
// 
// 909 bytes of CODE  memory
//  44 bytes of CONST memory
//   0 bytes of DATA  memory (+ 7 bytes shared)
//
//Errors: none
//Warnings: none
