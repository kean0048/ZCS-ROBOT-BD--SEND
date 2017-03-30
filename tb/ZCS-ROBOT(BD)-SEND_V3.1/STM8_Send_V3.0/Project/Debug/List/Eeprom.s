///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.20.1.176 for STM8                29/Mar/2017  16:23:49
// Copyright 2010-2015 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\Eeprom.c
//    Command line =  
//        "E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\Eeprom.c"
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
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List\Eeprom.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?inc32_l0_l0
        EXTERN ?mul16_x_x_w0
        EXTERN ?sext32_l0_x
        EXTERN ?srl8_a_a_6
        EXTERN ?ucmp32_c_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN CHECK_ID
        EXTERN CNT_Eeprom_Check
        EXTERN ChipUniqueID
        EXTERN Flag_1hour_A
        EXTERN Flag_Eeprom_Check
        EXTERN Flag_Eeprom_Ero
        EXTERN Flag_RestartEhours
        EXTERN Key_Check_ID1
        EXTERN Key_Check_ID2
        EXTERN _A_Flag_10ms_1

        PUBLIC Eeprom_Init
        PUBLIC Eeprom_Write
        PUBLIC FLASH_DUKR
        PUBLIC GetEeprom
        PUBLIC GetUniqueID
        PUBLIC UniqueID_Check
        PUBLIC _A_FLASH_CR1
        PUBLIC _A_FLASH_CR2
        PUBLIC _A_FLASH_IAPSR
        PUBLIC _A_FLASH_NCR2
        PUBLIC crc_check_value
        PUBLIC crc_sum_value

// E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\Eeprom.c
//    1 /******************************************************************************/
//    2 /*					                                      */
//    3 /*	Project Name :	发射机		                                      */
//    4 /*	Version      :	1.0			                              */
//    5 /*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
//    6 /*	Clock        :	16MHz			                              */
//    7 /*	Author	     :	mengzhuozhuo   		                              */
//    8 /*      Date	     :	2016/04/26	                                      */
//    9 /*	Corporation  :	中惠创智（深圳）无线供电技术有限公司                    */
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

        ASEGN `.near.noinit`:DATA:NOROOT,0505aH
        SECTION_GROUP _A_FLASH_CR1
// union <unnamed> volatile _A_FLASH_CR1
_A_FLASH_CR1:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0505bH
        SECTION_GROUP _A_FLASH_CR2
// union <unnamed> volatile _A_FLASH_CR2
_A_FLASH_CR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0505cH
        SECTION_GROUP _A_FLASH_NCR2
// union <unnamed> volatile _A_FLASH_NCR2
_A_FLASH_NCR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0505fH
        SECTION_GROUP _A_FLASH_IAPSR
// union <unnamed> volatile _A_FLASH_IAPSR
_A_FLASH_IAPSR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05064H
        SECTION_GROUP FLASH_DUKR
// unsigned char volatile FLASH_DUKR
FLASH_DUKR:
        DS8 1
//   21 #include "Eeprom.h"
//   22 
//   23 //******************************************************************************
//   24 //EEPROM初始化（解密）
//   25 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   26 void  Eeprom_Init(void)
//   27 {
//   28     FLASH_CR1 =0X00;
Eeprom_Init:
        MOV       L:0x505a, #0x0
//   29     FLASH_CR2 =0X00;
        MOV       L:0x505b, #0x0
//   30     FLASH_NCR2 =0Xff;
        MOV       L:0x505c, #0xff
//   31     FLASH_DUKR=0XAE;//写入第一个密钥
        MOV       L:0x5064, #0xae
//   32     asm("nop");
        nop
//   33     asm("nop");
        nop
//   34     asm("nop");
        nop
//   35     asm("nop");
        nop
//   36     asm("nop");		
        nop
//   37     FLASH_DUKR=0X56;//写入第二个密钥
        MOV       L:0x5064, #0x56
//   38     while(!(FLASH_IAPSR&0X08));//等待解密就绪		
??Eeprom_Init_0:
        BTJF      L:0x505f, #0x3, L:??Eeprom_Init_0
//   39 }
        RETF
        REQUIRE _A_FLASH_CR1
        REQUIRE _A_FLASH_CR2
        REQUIRE _A_FLASH_NCR2
        REQUIRE FLASH_DUKR
        REQUIRE _A_FLASH_IAPSR
//   40 //******************************************************************************
//   41 
//   42 
//   43 //******************************************************************************
//   44 //保密检测
//   45 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   46 void  UniqueID_Check(void)
//   47 {
//   48     unsigned long data;
//   49     data = CHECK_ID[2]*256 + CHECK_ID[1];
UniqueID_Check:
        LD        A, L:CHECK_ID + 2
        CLRW      Y
        LD        YL, A
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LD        A, L:CHECK_ID + 1
        CLR       S:?b0
        LD        S:?b1, A
        ADDW      X, S:?w0
        CALLF     L:?sext32_l0_x
//   50     if(Flag_10ms_B == 1)
        LD        A, L:_A_Flag_10ms_1
        CALLF     L:?srl8_a_a_6
        AND       A, #0x1
        CP        A, #0x0
        JRNE      ??lb_0
        JP        L:??UniqueID_Check_0
//   51     {
//   52         Flag_10ms_B = 0;
??lb_0:
        BRES      L:_A_Flag_10ms_1, #0x6
//   53         //*************************************************
//   54         //短时间检测方法
//   55         if(CHECK_ID[0] == 0xa5)
        LD        A, #0xa5
        CP        A, L:CHECK_ID
        JRNE      L:??UniqueID_Check_1
//   56         {
//   57             if(data == Key_Check_ID1)
        LDW       X, L:Key_Check_ID1
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALLF     L:?ucmp32_c_l0_l1
        JRNE      L:??UniqueID_Check_2
//   58             {
//   59                //短时间检测方法正常
//   60                 asm("nop");
        nop
        JRA       L:??UniqueID_Check_3
//   61             }
//   62             else
//   63             {
//   64                 Flag_Eeprom_Ero = 1;
??UniqueID_Check_2:
        MOV       L:Flag_Eeprom_Ero, #0x1
        JRA       L:??UniqueID_Check_3
//   65             }
//   66         }
//   67         else
//   68         {
//   69             Flag_Eeprom_Ero = 1;
??UniqueID_Check_1:
        MOV       L:Flag_Eeprom_Ero, #0x1
//   70         }
//   71         //*************************************************
//   72         
//   73         //*************************************************
//   74         //长时间检测方法
//   75         if((Flag_1hour_A ==1)||(Flag_Eeprom_Check == 1))
??UniqueID_Check_3:
        LD        A, #0x1
        CP        A, L:Flag_1hour_A
        JREQ      L:??UniqueID_Check_4
        LD        A, #0x1
        CP        A, L:Flag_Eeprom_Check
        JREQ      ??lb_1
        JP        L:??UniqueID_Check_0
//   76         {
//   77             Flag_1hour_A = 0;
??lb_1:
??UniqueID_Check_4:
        MOV       L:Flag_1hour_A, #0x0
//   78             GetEeprom(CHECK_ID);        //读取EEprom中数据（共6个数据）
        LDW       X, #CHECK_ID
        CALLF     GetEeprom
//   79             data = CHECK_ID[4]*256 + CHECK_ID[5];
        LD        A, L:CHECK_ID + 4
        CLRW      Y
        LD        YL, A
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LD        A, L:CHECK_ID + 5
        CLR       S:?b0
        LD        S:?b1, A
        ADDW      X, S:?w0
        CALLF     L:?sext32_l0_x
//   80             if(data >= C_EEP_PROECT_TIME)
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??UniqueID_Check_5
        LDW       X, S:?w1
        CPW       X, #0x2238
??UniqueID_Check_5:
        JRC       L:??UniqueID_Check_6
//   81             {
//   82                 if(CHECK_ID[3] == Key_Check_ID2)
        LDW       X, #Key_Check_ID2
        LD        A, (X)
        CP        A, L:CHECK_ID + 3
        JRNE      L:??UniqueID_Check_7
//   83                 {
//   84                     //长时间检测方法正常
//   85                     Flag_Eeprom_Check = 0;
        MOV       L:Flag_Eeprom_Check, #0x0
//   86                     CNT_Eeprom_Check = 0;
        MOV       L:CNT_Eeprom_Check, #0x0
//   87 					
//   88 					Flag_RestartEhours = 1;
        MOV       L:Flag_RestartEhours, #0x1
        RETF
//   89                 }
//   90                 else
//   91                 {
//   92                     Flag_Eeprom_Check = 1;
??UniqueID_Check_7:
        MOV       L:Flag_Eeprom_Check, #0x1
//   93                     CNT_Eeprom_Check++;
        LD        A, #0x1
        ADD       A, L:CNT_Eeprom_Check
        LD        L:CNT_Eeprom_Check, A
//   94                     if(CNT_Eeprom_Check >= 10)
        LDW       X, #CNT_Eeprom_Check
        LD        A, (X)
        CP        A, #0xa
        JRC       L:??UniqueID_Check_0
//   95                     {
//   96                         CNT_Eeprom_Check = 10;
        MOV       L:CNT_Eeprom_Check, #0xa
//   97                         Flag_Eeprom_Ero = 1;
        MOV       L:Flag_Eeprom_Ero, #0x1
        RETF
//   98                     }
//   99                 }
//  100             }
//  101             else
//  102             {
//  103                 data++;
??UniqueID_Check_6:
        CALLF     L:?inc32_l0_l0
//  104                 CHECK_ID[4] = data>>8;//高位
        LD        A, S:?b2
        LD        L:CHECK_ID + 4, A
//  105                 CHECK_ID[5] = data&0xff;//低位
        LD        A, S:?b3
        LD        L:CHECK_ID + 5, A
//  106 				asm("sim");//关闭中断
        sim
//  107                 Eeprom_Write(4,CHECK_ID[4]);
        MOV       S:?b0, L:CHECK_ID + 4
        LD        A, #0x4
        CALLF     Eeprom_Write
//  108                 Eeprom_Write(5,CHECK_ID[5]);
        MOV       S:?b0, L:CHECK_ID + 5
        LD        A, #0x5
        CALLF     Eeprom_Write
//  109 				asm("rim");                         //打开中断
        rim
//  110             }
//  111         }
//  112     }
//  113 }
??UniqueID_Check_0:
        RETF
//  114 //******************************************************************************
//  115 
//  116 
//  117 //******************************************************************************
//  118 //EEPROM写数据
//  119 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  120 void Eeprom_Write(unsigned char addr,unsigned char dat)
//  121 {
//  122     unsigned char *p;
//  123     p = (unsigned char *)(0X4000 + addr);
Eeprom_Write:
        CLRW      X
        LD        XL, A
        ADDW      X, #0x4000
//  124     *p = dat;
        LD        A, S:?b0
        LD        (X), A
//  125     asm("nop");
        nop
//  126     asm("nop");
        nop
//  127     asm("nop");
        nop
//  128     asm("nop");
        nop
//  129     asm("nop");
        nop
//  130     while(!(FLASH_IAPSR&0X04));
??Eeprom_Write_0:
        BTJF      L:0x505f, #0x2, L:??Eeprom_Write_0
//  131 }
        RETF
        REQUIRE _A_FLASH_IAPSR
//  132 //******************************************************************************
//  133 
//  134 
//  135 //******************************************************************************
//  136 //EEPROM读数据
//  137 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  138 void GetEeprom(unsigned char *p)
//  139 {
//  140     unsigned char i;
//  141     unsigned char *pIDStart=(unsigned char *)(EEPROM_BaseAddress);
GetEeprom:
        LDW       Y, #0x4000
//  142     for(i=0;i <=18;i++)
        CLR       S:?b0
        JRA       L:??GetEeprom_0
//  143     {
//  144         *p++=*pIDStart++;
??GetEeprom_1:
        LD        A, (Y)
        LD        (X), A
        ADDW      Y, #0x1
        ADDW      X, #0x1
//  145         asm("nop");
        nop
//  146         asm("nop");
        nop
//  147         asm("nop");
        nop
//  148         asm("nop");
        nop
//  149         asm("nop");
        nop
//  150     }
        LD        A, S:?b0
        ADD       A, #0x1
        LD        S:?b0, A
??GetEeprom_0:
        LD        A, S:?b0
        CP        A, #0x13
        JRC       L:??GetEeprom_1
//  151 }
        RETF
//  152 //******************************************************************************
//  153 
//  154 
//  155 //******************************************************************************
//  156 //获取器件ID
//  157 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  158 void GetUniqueID(unsigned char *p)
//  159 {
//  160     unsigned char i;
//  161     unsigned char *pIDStart=(unsigned char *)(ID_BaseAddress);    
GetUniqueID:
        LDW       Y, #0x48cd
//  162     for(i=0;i!=12;i++)
        CLR       S:?b0
        JRA       L:??GetUniqueID_0
//  163     {
//  164         *p++=*pIDStart++;
??GetUniqueID_1:
        LD        A, (Y)
        LD        (X), A
        ADDW      Y, #0x1
        ADDW      X, #0x1
//  165         asm("nop");
        nop
//  166         asm("nop");
        nop
//  167         asm("nop");
        nop
//  168         asm("nop");
        nop
//  169         asm("nop");
        nop
//  170     }
        LD        A, S:?b0
        ADD       A, #0x1
        LD        S:?b0, A
??GetUniqueID_0:
        LD        A, S:?b0
        CP        A, #0xc
        JRNE      L:??GetUniqueID_1
//  171 }
        RETF
//  172 //******************************************************************************
//  173 
//  174 
//  175 //******************************************************************************
//  176 //校验方式二
//  177 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  178 unsigned char crc_check_value(unsigned char *data_value, unsigned char data_length)
//  179 {
crc_check_value:
        LD        S:?b2, A
//  180     unsigned char  i,TCheckCode;
//  181     TCheckCode =0;
        CLR       S:?b1
//  182     for(i = 0; i < data_length; i++)
        CLR       S:?b0
        JRA       L:??crc_check_value_0
//  183     {
//  184         TCheckCode ^=ChipUniqueID[i];  // check code calculate
??crc_check_value_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, (L:ChipUniqueID,X)
        XOR       A, S:?b1
        LD        S:?b1, A
//  185     }
        LD        A, S:?b0
        ADD       A, #0x1
        LD        S:?b0, A
??crc_check_value_0:
        LD        A, S:?b0
        CP        A, S:?b2
        JRC       L:??crc_check_value_1
//  186     return TCheckCode;
        LD        A, S:?b1
        RETF
//  187 }
//  188 //******************************************************************************
//  189 
//  190 
//  191 //******************************************************************************
//  192 //校验方式三
//  193 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  194 unsigned int crc_sum_value(unsigned char *buf,unsigned char len)
//  195 {
crc_sum_value:
        LD        S:?b1, A
//  196     unsigned char i;
//  197     unsigned int sum;
//  198     sum =0;
        CLR       S:?b3
        CLR       S:?b2
//  199     for(i=0;i<len;i++)
        CLR       S:?b0
        JRA       L:??crc_sum_value_0
//  200     {
//  201         sum += *buf++;
??crc_sum_value_1:
        LD        A, (X)
        CLRW      Y
        LD        YL, A
        ADDW      Y, S:?w1
        LDW       S:?w1, Y
        ADDW      X, #0x1
//  202     }
        LD        A, S:?b0
        ADD       A, #0x1
        LD        S:?b0, A
??crc_sum_value_0:
        LD        A, S:?b0
        CP        A, S:?b1
        JRC       L:??crc_sum_value_1
//  203     return sum;
        LDW       X, S:?w1
        RETF
//  204 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  205 /*******************************************************************************
//  206 -----------------------------    End of file    --------------------------------
//  207 *******************************************************************************/
// 
// 446 bytes in section .far_func.text
//   5 bytes in section .near.noinit   (abs)
// 
// 446 bytes of CODE memory
//   0 bytes of DATA memory (+ 5 bytes shared)
//
//Errors: none
//Warnings: none
