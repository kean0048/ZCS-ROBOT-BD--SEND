///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.20.1.176 for STM8                29/Mar/2017  16:23:49
// Copyright 2010-2015 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\Stream2Char.c
//    Command line =  
//        "E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\Stream2Char.c"
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
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List\Stream2Char.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?mov_w0_w1
        EXTERN ?mov_w1_w0
        EXTERN ?mov_w5_w0
        EXTERN ?mul16_x_x_w0
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN AUTO_Array
        EXTERN Address4Check
        EXTERN CNT_FULL_Num
        EXTERN CNT_Rec_Check_Fail
        EXTERN Flag_FRIST_IN
        EXTERN Flag_False_Check_Pass
        EXTERN Flag_RECV_ADDRESS_NUM
        EXTERN Flag_RECV_ADDRESS_NUM_SAME
        EXTERN Flg_Chenal_Fail
        EXTERN Flg_Chenal_OK
        EXTERN NUM_PWM_UPload
        EXTERN count_false_check
        EXTERN flag_check_succ
        EXTERN flag_recheck_over
        EXTERN flg_stop_send_in
        EXTERN memcpy
        EXTERN memset

        PUBLIC FunDealChildLost
        PUBLIC FunDealChildLostWork
        PUBLIC ZoneChargWiLess
        PUBLIC crc_cal_value_s
        PUBLIC iF2IDsp1
        PUBLIC parseByteStream2FrameStreamsp1

// E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\Stream2Char.c
//    1 // Stream2Char.cpp : 实现文件
//    2 #include "Stream2Char.h"
//    3 #include "RAM.h"
//    4 
//    5 #ifdef _DEBUG
//    6 #define new DEBUG_NEW
//    7 #endif
//    8 
//    9 #define FRAME_HEAD  0x68
//   10 #define FRAME_END   0x2b
//   11 
//   12 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   13 LikeWifi ZoneChargWiLess;
ZoneChargWiLess:
        DS8 32
//   14 	/* SRPV数据帧成员项转为数据结构成员项的元数据数组，参见TMdII */

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   15 static TMdII mdIIZONEPVR[NUM_LikeWifi] = {{&ZoneChargWiLess.Head_1,1}, 
mdIIZONEPVR:
        DC16 ZoneChargWiLess, 1, ZoneChargWiLess + 1H, 1, ZoneChargWiLess + 2H
        DC16 2, ZoneChargWiLess + 4H, 1, ZoneChargWiLess + 5H, 1
        DC16 ZoneChargWiLess + 6H, 5, ZoneChargWiLess + 0BH, 2
        DC16 ZoneChargWiLess + 0DH, 2, ZoneChargWiLess + 0FH, 2
        DC16 ZoneChargWiLess + 11H, 4, ZoneChargWiLess + 15H, 2
        DC16 ZoneChargWiLess + 17H, 2, ZoneChargWiLess + 19H, 3
        DC16 ZoneChargWiLess + 1CH, 1, ZoneChargWiLess + 1DH, 2
        DC16 ZoneChargWiLess + 1FH, 1
//   16 											{&ZoneChargWiLess.Date_Length, 1}, 
//   17 											{&ZoneChargWiLess.SelfID,2}, 
//   18 											{&ZoneChargWiLess.SlfNum,1}, 
//   19 											{&ZoneChargWiLess.PairComm,1}, 
//   20 											{&ZoneChargWiLess.PairID,5}, 
//   21 											{&ZoneChargWiLess.Vol,2}, 
//   22 											{&ZoneChargWiLess.Curr, 2}, 
//   23 											{&ZoneChargWiLess.Temp, 2}, 
//   24 											{&ZoneChargWiLess.PowerS,4}, 
//   25 											{&ZoneChargWiLess.ErrID,2}, 
//   26 											{&ZoneChargWiLess.Status,2},
//   27 											{&ZoneChargWiLess.Backup, 3},
//   28 											{&ZoneChargWiLess.FrameCount,1},
//   29 											{&ZoneChargWiLess.Crc,2},
//   30 											{&ZoneChargWiLess.Head_2,1}};
//   31 	

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   32 void iF2IDsp1(TMdII mdII[], int cIP, unsigned char *frm)
//   33 {
iF2IDsp1:
        CALLF     L:?push_l2
        CALLF     L:?push_l3
        LDW       S:?w7, X
        LDW       S:?w6, Y
        CALLF     L:?mov_w5_w0
//   34 	int i;
//   35 
//   36 	for(i = 0; i < cIP; i++)
        CLR       S:?b9
        CLR       S:?b8
        JRA       L:??iF2IDsp1_0
//   37 	{
//   38 		memcpy(mdII[i].pID, frm, mdII[i].cBIF);
??iF2IDsp1_1:
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, S:?w4
        CALLF     L:?mul16_x_x_w0
        ADDW      X, S:?w7
        INCW      X
        INCW      X
        LDW       X, (X)
        LDW       S:?w0, X
        LDW       Y, S:?w5
        CALLF     L:?mov_w1_w0
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, S:?w4
        CALLF     L:?mul16_x_x_w0
        ADDW      X, S:?w7
        LDW       X, (X)
        CALLF     L:?mov_w0_w1
        CALLF     memcpy
//   39 		frm += mdII[i].cBIF;
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, S:?w4
        CALLF     L:?mul16_x_x_w0
        ADDW      X, S:?w7
        INCW      X
        INCW      X
        LDW       X, (X)
        ADDW      X, S:?w5
        LDW       S:?w5, X
//   40 	}
        LDW       X, S:?w4
        ADDW      X, #0x1
        LDW       S:?w4, X
??iF2IDsp1_0:
        LDW       X, S:?w4
        CPW       X, S:?w6
        JRSLT     L:??iF2IDsp1_1
//   41 }
        JPF       L:?epilogue_l2_l3
//   42 
//   43 //******************************************************************************
//   44 //CRC
//   45 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   46 unsigned int crc_cal_value_s(unsigned char *data_value, unsigned char data_length)
//   47 {
crc_cal_value_s:
        LDW       S:?w0, X
        LD        S:?b3, A
//   48     unsigned int i;
//   49     unsigned int crc_value=0xffff;		
        CLRW      X
        DECW      X
//   50     while(data_length--) 
??crc_cal_value_s_0:
        MOV       S:?b2, S:?b3
        LD        A, S:?b2
        ADD       A, #0xff
        LD        S:?b3, A
        TNZ       S:?b2
        JREQ      L:??crc_cal_value_s_1
//   51     {
//   52         crc_value^=*data_value++;
        LD        A, [S:?w0.w]
        CLR       S:?b4
        LD        S:?b5, A
        RRWA      X, A
        XOR       A, S:?b5
        RRWA      X, A
        XOR       A, S:?b4
        RRWA      X, A
        LDW       Y, S:?w0
        ADDW      Y, #0x1
        LDW       S:?w0, Y
//   53         for(i=0;i<8;i++) 
        CLRW      Y
        JRA       L:??crc_cal_value_s_2
//   54         {
//   55             if(crc_value&0x0001)
//   56                 crc_value=(crc_value>>1)^0xa001;
//   57             else
//   58                 crc_value=crc_value>>1;
??crc_cal_value_s_3:
        SRLW      X
??crc_cal_value_s_4:
        ADDW      Y, #0x1
??crc_cal_value_s_2:
        CPW       Y, #0x8
        JRNC      L:??crc_cal_value_s_0
        LD        A, XL
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??crc_cal_value_s_3
        SRLW      X
        RLWA      X, A
        XOR       A, #0xa0
        RLWA      X, A
        XOR       A, #0x1
        RLWA      X, A
        JRA       L:??crc_cal_value_s_4
//   59         }
//   60     }		
//   61     return(crc_value);
??crc_cal_value_s_1:
        RETF
//   62 }
//   63 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   64 int parseByteStream2FrameStreamsp1(unsigned char rxData[],int len) 
//   65 {	
parseByteStream2FrameStreamsp1:
        CALLF     L:?push_l2
        CALLF     L:?push_l3
        SUB       SP, #0x4
        LDW       S:?w7, X
//   66 	unsigned char rB = 0;								//当前数据字节；
        CLR       A
//   67 	int length = len;							//接收字节长度
        LDW       (0x3,SP), Y
//   68 	int csErrs = 0;
        CLR       S:?b13
        CLR       S:?b12
//   69 	static int cBP = 0;							// the count of bytes have been put into RX buffer
//   70 	static int cBL = 0;							// the count of bytes left of current RX frame
//   71 	int ret = 0;
        CLR       S:?b11
        CLR       S:?b10
//   72 	static unsigned char rxBuf[128];
//   73 	unsigned short crcValue = 0;
        CLRW      X
        LDW       (0x1,SP), X
//   74 
//   75 	for (int i = 0; i < length; i++)
        CLR       S:?b9
        CLR       S:?b8
        JRA       L:??parseByteStream2FrameStreamsp1_0
//   76 	{
//   77 		rB = rxData[i];
//   78 
//   79 		switch (cBP)
//   80 		{
//   81 		case 0:
//   82 			if (rB == FRAME_HEAD)
//   83 			{
//   84 				rxBuf[cBP++] = rB;
//   85 			}                        
//   86 			break;
//   87 
//   88 		case 1:
//   89 			rxBuf[cBP++] = rB;
//   90 			cBL = (int)((unsigned char)rB)-2;
//   91 			break;
//   92 		default:
//   93 			rxBuf[cBP++] = rB;
//   94 			cBL--;
//   95 			switch (cBL)
//   96 			{			
//   97 			case 0: 
//   98 				if (rB == FRAME_END)
//   99 				{
//  100 					memcpy(&crcValue,&rxBuf[29],2);
//  101 					//crcValue = ((temp >> 8) & 0x00ff) | ((temp << 8) & 0xff00);
//  102 					if(crc_cal_value_s(rxBuf, 29) == crcValue)
//  103 					{
//  104 						//帧解析函数
//  105 						iF2IDsp1(mdIIZONEPVR, NUM_LikeWifi, rxBuf);
//  106 						ret++;
//  107 						//rightCountall += ret;
//  108 					}
//  109 					else
//  110 					{
//  111 						csErrs++;
//  112 						//csErrsall += csErrs;
//  113 					}
//  114 					cBP = 0;
//  115 				}
//  116 				else
//  117 				{
//  118 					cBP = 0;
//  119 				}
//  120 				break;
//  121 			default:
//  122 				break;
//  123 			}
//  124 			break;
//  125 		}
//  126 		if (cBP >= 1024)        
??parseByteStream2FrameStreamsp1_1:
        LDW       X, L:??cBP
        CPW       X, #0x400
        JRSLT     L:??parseByteStream2FrameStreamsp1_2
//  127 		{
//  128 			cBP = 0;
        CLRW      X
        LDW       L:??cBP, X
//  129 		}
??parseByteStream2FrameStreamsp1_2:
        LDW       X, S:?w4
        ADDW      X, #0x1
        LDW       S:?w4, X
??parseByteStream2FrameStreamsp1_0:
        LDW       X, S:?w4
        CPW       X, (0x3,SP)
        JRSLT     ??lb_0
        JP        L:??parseByteStream2FrameStreamsp1_3
??lb_0:
        LDW       X, S:?w4
        ADDW      X, S:?w7
        LD        A, (X)
        LDW       X, L:??cBP
        TNZW      X
        JREQ      L:??parseByteStream2FrameStreamsp1_4
        DECW      X
        JREQ      L:??parseByteStream2FrameStreamsp1_5
        JRA       L:??parseByteStream2FrameStreamsp1_6
??parseByteStream2FrameStreamsp1_4:
        CP        A, #0x68
        JRNE      L:??parseByteStream2FrameStreamsp1_1
        LDW       X, L:??cBP
        LD        (L:??rxBuf,X), A
        LDW       X, L:??cBP
        INCW      X
        LDW       L:??cBP, X
        JRA       L:??parseByteStream2FrameStreamsp1_1
??parseByteStream2FrameStreamsp1_5:
        LDW       X, L:??cBP
        LD        (L:??rxBuf,X), A
        LDW       X, L:??cBP
        INCW      X
        LDW       L:??cBP, X
        CLRW      X
        LD        XL, A
        ADDW      X, #0xfffffffffffffffe
        LDW       L:??cBL, X
        JRA       L:??parseByteStream2FrameStreamsp1_1
??parseByteStream2FrameStreamsp1_6:
        LDW       X, L:??cBP
        LD        (L:??rxBuf,X), A
        LDW       X, L:??cBP
        INCW      X
        LDW       L:??cBP, X
        LDW       X, L:??cBL
        DECW      X
        LDW       L:??cBL, X
        LDW       X, L:??cBL
        TNZW      X
        JRNE      L:??parseByteStream2FrameStreamsp1_1
        CP        A, #0x2b
        JRNE      L:??parseByteStream2FrameStreamsp1_7
        LDW       X, #0x2
        LDW       S:?w0, X
        LDW       Y, #??rxBuf + 29
        LDW       X, SP
        ADDW      X, #0x1
        CALLF     memcpy
        LD        A, #0x1d
        LDW       X, #??rxBuf
        CALLF     crc_cal_value_s
        CPW       X, (0x1,SP)
        JRNE      L:??parseByteStream2FrameStreamsp1_8
        LDW       X, #??rxBuf
        LDW       S:?w0, X
        LDW       Y, #0x10
        LDW       X, #mdIIZONEPVR
        CALLF     iF2IDsp1
        LDW       X, S:?w5
        ADDW      X, #0x1
        LDW       S:?w5, X
        JRA       L:??parseByteStream2FrameStreamsp1_9
??parseByteStream2FrameStreamsp1_8:
        LDW       X, S:?w6
        ADDW      X, #0x1
        LDW       S:?w6, X
??parseByteStream2FrameStreamsp1_9:
        CLRW      X
        LDW       L:??cBP, X
        JP        L:??parseByteStream2FrameStreamsp1_1
??parseByteStream2FrameStreamsp1_7:
        CLRW      X
        LDW       L:??cBP, X
        JP        L:??parseByteStream2FrameStreamsp1_1
//  130 	}
//  131 	return ret;
??parseByteStream2FrameStreamsp1_3:
        LDW       X, S:?w5
        ADD       SP, #0x4
        JPF       L:?epilogue_l2_l3
//  132 }

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??cBP:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??cBL:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??rxBuf:
        DS8 128
//  133 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  134 void FunDealChildLost(const unsigned char selfNumb,unsigned char *lessfull)
//  135 {
FunDealChildLost:
        CALLF     L:?push_l2
        LD        S:?b9, A
        LDW       S:?w5, X
//  136 
//  137 	Flag_RECV_ADDRESS_NUM_SAME--;
        LD        A, #0xff
        ADD       A, L:Flag_RECV_ADDRESS_NUM_SAME
        LD        L:Flag_RECV_ADDRESS_NUM_SAME, A
//  138 	memset(AUTO_Array[selfNumb-1],0,sizeof(AUTO_Array[selfNumb-1]));
        LDW       X, #0x6
        LDW       S:?w0, X
        CLRW      Y
        CALLF     L:?mov_w1_w0
        CLR       S:?b8
        LDW       X, #0x6
        LDW       S:?w0, X
        LDW       X, S:?w4
        CALLF     L:?mul16_x_x_w0
        ADDW      X, #AUTO_Array - 6
        CALLF     L:?mov_w0_w1
        CALLF     memset
//  139 	flg_stop_send_in[selfNumb-1] = 1;	
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        LD        A, #0x1
        ADDW      X, #flg_stop_send_in - 1
        LD        (X), A
        SUBW      X, #flg_stop_send_in - 1
//  140 	Flg_Chenal_OK[selfNumb-1] = 0;
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        CLR       A
        ADDW      X, #Flg_Chenal_OK - 1
        LD        (X), A
        SUBW      X, #Flg_Chenal_OK - 1
//  141 	Flg_Chenal_Fail[selfNumb-1] = 1;
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        LD        A, #0x1
        ADDW      X, #Flg_Chenal_Fail - 1
        LD        (X), A
        SUBW      X, #Flg_Chenal_Fail - 1
//  142 	//Child_Count_Num = 0; //在1序号下配对其他的 2017.01.18 删除，因为在172~178添加for循环用于查找
//  143 	CNT_Rec_Check_Fail[selfNumb-1] = 0;	
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        SLLW      X
        CLRW      Y
        ADDW      X, #CNT_Rec_Check_Fail - 2
        LDW       (X), Y
        SUBW      X, #CNT_Rec_Check_Fail - 2
//  144 	flag_check_succ[selfNumb-1] = 0;
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        CLR       A
        ADDW      X, #flag_check_succ - 1
        LD        (X), A
        SUBW      X, #flag_check_succ - 1
//  145 	/*if(NUM_PWM_UPload > 0)
//  146 		  NUM_PWM_UPload--;*/
//  147 	if(Flag_RECV_ADDRESS_NUM > 0)
        LD        A, L:Flag_RECV_ADDRESS_NUM
        TNZ       A
        JREQ      L:??FunDealChildLost_0
//  148 	{
//  149 	  Flag_RECV_ADDRESS_NUM --;
        LD        A, #0xff
        ADD       A, L:Flag_RECV_ADDRESS_NUM
        LD        L:Flag_RECV_ADDRESS_NUM, A
//  150 	}
//  151 	//20170224 如果不添加该判断必然导致A(充满）未掉，B(充满)掉线，此时会减掉CNT_FULL_Num的值，导致等级判错
//  152 	if(Flag_FRIST_IN[selfNumb-1] == 1)
??FunDealChildLost_0:
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        ADDW      X, #Flag_FRIST_IN - 1
        LD        A, (X)
        CP        A, #0x1
        JRNE      L:??FunDealChildLost_1
//  153 	{
//  154 		(*lessfull)--;
        LD        A, [S:?w5.w]
        DEC       A
        LD        [S:?w5.w], A
//  155 	    CNT_FULL_Num--;
        LD        A, #0xff
        ADD       A, L:CNT_FULL_Num
        LD        L:CNT_FULL_Num, A
//  156 	    Flag_FRIST_IN[selfNumb-1] = 0;//20170221与系统调节PWM有关，用于记录PWM等级及调整pwm与否的信息
        CLRW      X
        LD        A, S:?b9
        LD        XL, A
        CLR       A
        ADDW      X, #Flag_FRIST_IN - 1
        LD        (X), A
        SUBW      X, #Flag_FRIST_IN - 1
//  157 	}
//  158 	if(Flag_RECV_ADDRESS_NUM == 0)
??FunDealChildLost_1:
        LD        A, L:Flag_RECV_ADDRESS_NUM
        TNZ       A
        JRNE      L:??FunDealChildLost_2
//  159 		NUM_PWM_UPload = 0;
        MOV       L:NUM_PWM_UPload, #0x0
//  160 }
??FunDealChildLost_2:
        JPF       L:?epilogue_l2
//  161 

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  162 void FunDealChildLostWork(const unsigned char ChildNum,unsigned char *lessfull)
//  163 {
FunDealChildLostWork:
        LD        S:?b5, A
        LDW       S:?w1, X
//  164 	if(CNT_Rec_Check_Fail[ChildNum-1] >= 60) //min = 2s;max = 8s  100/4=25
        CLRW      X
        LD        A, S:?b5
        LD        XL, A
        SLLW      X
        ADDW      X, #CNT_Rec_Check_Fail - 2
        LDW       X, (X)
        CPW       X, #0x3c
        JRNC      ??lb_1
        JP        L:??FunDealChildLostWork_0
//  165 	{
//  166 		for(int j = 0;j < ALLOWED_PAIR;j++)
??lb_1:
        CLRW      Y
        JRA       L:??FunDealChildLostWork_1
//  167 		{
//  168 			AUTO_Array[ChildNum-1][j] = 0;
??FunDealChildLostWork_2:
        LDW       X, Y
        ADDW      X, #AUTO_Array - 6
        LDW       S:?w3, X
        CLR       S:?b4
        LDW       X, #0x6
        LDW       S:?w0, X
        LDW       X, S:?w2
        CALLF     L:?mul16_x_x_w0
        LDW       S:?w0, X
        LDW       X, S:?w3
        ADDW      X, S:?w0
        CLR       A
        LD        (X), A
//  169 			Address4Check[j] = 0;
        CLR       A
        LD        (L:Address4Check,Y), A
//  170 		}
        ADDW      Y, #0x1
??FunDealChildLostWork_1:
        CPW       Y, #0x5
        JRSLT     L:??FunDealChildLostWork_2
//  171 		if(Flag_RECV_ADDRESS_NUM_SAME >= 1)
        LD        A, L:Flag_RECV_ADDRESS_NUM_SAME
        TNZ       A
        JREQ      L:??FunDealChildLostWork_3
//  172 		{
//  173 			Flag_RECV_ADDRESS_NUM_SAME--;
        LD        A, #0xff
        ADD       A, L:Flag_RECV_ADDRESS_NUM_SAME
        LD        L:Flag_RECV_ADDRESS_NUM_SAME, A
//  174 		}
//  175 		//2017.01.21 如果进入此时恰恰Flag_False_Check_Pass = true，而此时的ID已经掉线，那么下一个ID如果失败即使1次也会进入
//  176 		//也会进入if(Flag_False_Check_Pass)分支而将其设置为正确回应,为此添加以下两句
//  177 		Flag_False_Check_Pass = 0;
??FunDealChildLostWork_3:
        MOV       L:Flag_False_Check_Pass, #0x0
//  178 		count_false_check = 0;
        MOV       L:count_false_check, #0x0
//  179 		flag_recheck_over = 0;
        MOV       L:flag_recheck_over, #0x0
//  180 		///////////////////////////////////////////////
//  181 		CNT_Rec_Check_Fail[ChildNum-1] = 0;
        CLRW      X
        LD        A, S:?b5
        LD        XL, A
        SLLW      X
        CLRW      Y
        ADDW      X, #CNT_Rec_Check_Fail - 2
        LDW       (X), Y
        SUBW      X, #CNT_Rec_Check_Fail - 2
//  182 		//以下两句是否需要，只有在取下线圈且没收到最后一帧数据时起作用
//  183 		flg_stop_send_in[ChildNum-1] = 1;	
        CLRW      X
        LD        A, S:?b5
        LD        XL, A
        LD        A, #0x1
        ADDW      X, #flg_stop_send_in - 1
        LD        (X), A
        SUBW      X, #flg_stop_send_in - 1
//  184 		Flg_Chenal_OK[ChildNum-1] = 0;
        CLRW      X
        LD        A, S:?b5
        LD        XL, A
        CLR       A
        ADDW      X, #Flg_Chenal_OK - 1
        LD        (X), A
        SUBW      X, #Flg_Chenal_OK - 1
//  185 		Flg_Chenal_Fail[ChildNum-1] = 1;//2017.01.20 漏添加置位，导致查询对的数量大于设定值，无法继续运行程序	
        CLRW      X
        LD        A, S:?b5
        LD        XL, A
        LD        A, #0x1
        ADDW      X, #Flg_Chenal_Fail - 1
        LD        (X), A
        SUBW      X, #Flg_Chenal_Fail - 1
//  186 		flag_check_succ[ChildNum-1] = 0;
        CLRW      X
        LD        A, S:?b5
        LD        XL, A
        CLR       A
        ADDW      X, #flag_check_succ - 1
        LD        (X), A
        SUBW      X, #flag_check_succ - 1
//  187 		/*if(NUM_PWM_UPload > 0)
//  188 			  NUM_PWM_UPload--;*/
//  189 		//if((Flag_RECV_ADDRESS_NUM > 0) && (Flag_FRIST_IN[Child_Num-1] != 1))//20170223防止重复删除
//  190 		if(Flag_RECV_ADDRESS_NUM > 0)
        LD        A, L:Flag_RECV_ADDRESS_NUM
        TNZ       A
        JREQ      L:??FunDealChildLostWork_4
//  191 		{
//  192 			  Flag_RECV_ADDRESS_NUM --;     
        LD        A, #0xff
        ADD       A, L:Flag_RECV_ADDRESS_NUM
        LD        L:Flag_RECV_ADDRESS_NUM, A
//  193 		}
//  194 		  
//  195 		if(Flag_RECV_ADDRESS_NUM == 0)
??FunDealChildLostWork_4:
        LD        A, L:Flag_RECV_ADDRESS_NUM
        TNZ       A
        JRNE      L:??FunDealChildLostWork_5
//  196 			NUM_PWM_UPload = 0;
        MOV       L:NUM_PWM_UPload, #0x0
//  197 		//20170224 如果不添加该判断必然导致A(充满）未掉，B(充满)掉线，此时会减掉CNT_FULL_Num的值，导致等级判错
//  198 		if(Flag_FRIST_IN[ChildNum-1] == 1)
??FunDealChildLostWork_5:
        CLRW      X
        LD        A, S:?b5
        LD        XL, A
        ADDW      X, #Flag_FRIST_IN - 1
        LD        A, (X)
        CP        A, #0x1
        JRNE      L:??FunDealChildLostWork_0
//  199 		{
//  200 			(*lessfull)--;
        LD        A, [S:?w1.w]
        DEC       A
        LD        [S:?w1.w], A
//  201 			CNT_FULL_Num--;
        LD        A, #0xff
        ADD       A, L:CNT_FULL_Num
        LD        L:CNT_FULL_Num, A
//  202 			Flag_FRIST_IN[ChildNum-1] = 0;//20170221与系统调节PWM有关，用于记录PWM等级及调整pwm与否的信息
        CLRW      X
        LD        A, S:?b5
        LD        XL, A
        CLR       A
        ADDW      X, #Flag_FRIST_IN - 1
        LD        (X), A
        SUBW      X, #Flag_FRIST_IN - 1
//  203 		}
//  204 	}	
//  205 }
??FunDealChildLostWork_0:
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 830 bytes in section .far_func.text
// 164 bytes in section .near.bss
//  64 bytes in section .near.data
// 
// 830 bytes of CODE memory
// 228 bytes of DATA memory
//
//Errors: none
//Warnings: none
