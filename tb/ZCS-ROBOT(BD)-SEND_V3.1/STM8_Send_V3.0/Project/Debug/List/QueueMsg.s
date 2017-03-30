///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.20.1.176 for STM8                29/Mar/2017  16:23:49
// Copyright 2010-2015 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\QueueMsg.c
//    Command line =  
//        "E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\QueueMsg.c"
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
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List\QueueMsg.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?epilogue_l2
        EXTERN ?move1616_v_x_y_a
        EXTERN ?mul16_x_x_w0
        EXTERN ?push_l2
        EXTERN ?smod16_y_x_y
        EXTERN ?w0
        EXTERN ?w4
        EXTERN ?w5

        PUBLIC deQueue
        PUBLIC enQueue
        PUBLIC isEmpty
        PUBLIC isFull
        PUBLIC queSEND

// E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\QueueMsg.c
//    1 /******************************************************************************/
//    2 /*					                                      */
//    3 /*	Project Name :	发射机		                                      */
//    4 /*	Version      :	1.0			                              */
//    5 /*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
//    6 /*	Clock        :	8MHz			                              */
//    7 /*	Author	     :	renhai   		                              */
//    8 /*  Date	     :	2016/10/9	                                      */
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
//   20 #include "QueueMsg.h"
//   21 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   22 int enQueue(TSqQueue *pQ, TQElemType *pE)
//   23 { // 插入元素*pE为pQ的新的队尾元素。
enQueue:
        CALLF     L:?push_l2
        LDW       S:?w4, X
        LDW       S:?w5, Y
//   24 	if(isFull(pQ))
        LDW       X, S:?w4
        CALLF     isFull
        TNZW      X
        JREQ      L:??enQueue_0
//   25 		return 0;
        CLRW      X
        JPF       L:?epilogue_l2
//   26 
//   27 	pQ->base[pQ->rear] = *pE;
??enQueue_0:
        LDW       X, S:?w4
        ADDW      X, #0x9a
        LDW       X, (X)
        LDW       Y, X
        LDW       X, #0x8
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        ADDW      X, S:?w4
        PUSHW     X
        LDW       Y, S:?w5
        LD        A, #0x8
        CALLF     L:?move1616_v_x_y_a
        POPW      X
//   28 	pQ->rear = (pQ->rear + 1) % MAXQSIZE;
        LDW       X, S:?w4
        ADDW      X, #0x9a
        LDW       X, (X)
        INCW      X
        LDW       Y, #0x13
        CALLF     L:?smod16_y_x_y
        LDW       X, S:?w4
        ADDW      X, #0x9a
        LDW       (X), Y
        SUBW      X, #0x9a
//   29 	return 1;
        CLRW      X
        INCW      X
        JPF       L:?epilogue_l2
//   30 }
//   31 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   32 int deQueue(TSqQueue *pQ, TQElemType *pE)
//   33 { // 若队列不空，则删除pQ的队头元素，用pE指向其值，并返回1；
deQueue:
        CALLF     L:?push_l2
        LDW       S:?w4, X
        LDW       S:?w5, Y
//   34   // 否则返回0。
//   35 	if(isEmpty(pQ))
        LDW       X, S:?w4
        CALLF     isEmpty
        TNZW      X
        JREQ      L:??deQueue_0
//   36 		return 0;
        CLRW      X
        JPF       L:?epilogue_l2
//   37 
//   38 	*pE = pQ->base[pQ->front];
??deQueue_0:
        LDW       X, S:?w4
        ADDW      X, #0x98
        LDW       X, (X)
        LDW       Y, X
        LDW       X, #0x8
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        ADDW      X, S:?w4
        LDW       Y, X
        LDW       X, S:?w5
        PUSHW     X
        LD        A, #0x8
        CALLF     L:?move1616_v_x_y_a
        POPW      X
//   39 	pQ->front = (pQ->front + 1) % MAXQSIZE;
        LDW       X, S:?w4
        ADDW      X, #0x98
        LDW       X, (X)
        INCW      X
        LDW       Y, #0x13
        CALLF     L:?smod16_y_x_y
        LDW       X, S:?w4
        ADDW      X, #0x98
        LDW       (X), Y
        SUBW      X, #0x98
//   40 	return 1;
        CLRW      X
        INCW      X
        JPF       L:?epilogue_l2
//   41 }
//   42 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   43 int isFull(TSqQueue *pQ)
//   44 {
isFull:
        LDW       S:?w0, X
//   45 	return (pQ->rear + 1) % MAXQSIZE == pQ->front;
        LDW       X, S:?w0
        ADDW      X, #0x9a
        LDW       X, (X)
        INCW      X
        LDW       Y, #0x13
        CALLF     L:?smod16_y_x_y
        LDW       X, S:?w0
        ADDW      X, #0x98
        CPW       Y, (X)
        JRNE      L:??isFull_0
        LD        A, #0x1
        JRA       L:??isFull_1
??isFull_0:
        CLR       A
??isFull_1:
        CLRW      X
        LD        XL, A
        RETF
//   46 }
//   47 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   48 int isEmpty(TSqQueue *pQ)
//   49 {
//   50 	return pQ->front == pQ->rear;
isEmpty:
        LDW       Y, X
        ADDW      Y, #0x9a
        ADDW      X, #0x98
        LDW       X, (X)
        CPW       X, (Y)
        JRNE      L:??isEmpty_0
        LD        A, #0x1
        JRA       L:??isEmpty_1
??isEmpty_0:
        CLR       A
??isEmpty_1:
        CLRW      X
        LD        XL, A
        RETF
//   51 }
//   52 
//   53 /*************增加两个队列，1：放置imu数据，2：放置gps数据*********************************/

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   54 TSqQueue queSEND = {{{0, 0, 0, 0}}, 0, 0}; // IMU消息队列
queSEND:
        DS8 156

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   55 /*******************************************************************************
//   56 -----------------------------    End of file    --------------------------------
//   57 *******************************************************************************/
// 
// 228 bytes in section .far_func.text
// 156 bytes in section .near.bss
// 
// 228 bytes of CODE memory
// 156 bytes of DATA memory
//
//Errors: none
//Warnings: none
