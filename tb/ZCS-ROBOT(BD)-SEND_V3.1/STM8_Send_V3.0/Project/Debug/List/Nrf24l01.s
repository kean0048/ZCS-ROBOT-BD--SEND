///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.20.1.176 for STM8                29/Mar/2017  16:23:49
// Copyright 2010-2015 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\Nrf24l01.c
//    Command line =  
//        "E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\Nrf24l01.c"
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
//        E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\Project\Debug\List\Nrf24l01.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b8
        EXTERN ?load32_0x_l0
        EXTERN ?load32_l0_0x
        EXTERN ?mov_w2_w0
        EXTERN ?move1616_v_x_y_a
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN Address
        EXTERN Address4Check
        EXTERN Address_Sure
        EXTERN Child_Comm
        EXTERN Child_Comm_Back
        EXTERN Child_Count_Num_Back
        EXTERN Child_Num
        EXTERN Frm_num
        EXTERN Num_RF
        EXTERN RD_Array
        EXTERN RX_ADDRESS
        EXTERN TD_Array
        EXTERN _delay_us
        EXTERN enQueue
        EXTERN flag_p
        EXTERN globetimer
        EXTERN queSEND
        EXTERN strncpy

        PUBLIC CheckRecData
        PUBLIC Clear_Nrf24l01
        PUBLIC NRF24L01Process
        PUBLIC NRF24L01_Check
        PUBLIC NRF24L01_Init
        PUBLIC NRF24L01_Read_Buf
        PUBLIC NRF24L01_Read_Reg
        PUBLIC NRF24L01_RxPacket
        PUBLIC NRF24L01_Send_Data
        PUBLIC NRF24L01_TxPacket
        PUBLIC NRF24L01_Write_Buf
        PUBLIC NRF24L01_Write_Reg
        PUBLIC NRF24L01_read_Data
        PUBLIC RX_ADDRESS_0
        PUBLIC RX_ADDRESS_1
        PUBLIC RX_ADDRESS_2
        PUBLIC RX_ADDRESS_3
        PUBLIC RX_ADDRESS_4
        PUBLIC RX_ADDRESS_5
        PUBLIC Rec_Send_data
        PUBLIC SPI_DR
        PUBLIC SPIx_ReadWriteByte
        PUBLIC SendDataUpdate
        PUBLIC Set_TX_Com_Mode
        PUBLIC TX_Mode
        PUBLIC TX_P0_SET
        PUBLIC TX_P1_SET
        PUBLIC TX_PADRESS_SET
        PUBLIC TX_P_SET
        PUBLIC _A_PC_IDR
        PUBLIC _A_PC_ODR
        PUBLIC _A_PE_ODR
        PUBLIC _A_SPI_SR
        PUBLIC crc_cal_value
        PUBLIC nrfRxLength
        PUBLIC nrfWriteAck

// E:\2017年工作内容\March\ZCS-ROBOT(BD)_V3.2(S).1(R)\SVN\ZCS-ROBOT(BD)-SEND_V3.1\STM8_Send_V3.0\USER\Nrf24l01.c
//    1 /******************************************************************************/
//    2 /*					                                      */
//    3 /*	Project Name :	发射机（接收）		                                      */
//    4 /*	Version      :	1.0			                              */
//    5 /*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
//    6 /*	Clock        :	16MHz			                              */
//    7 /*	Author	     :	mengzhuozhuo   		                              */
//    8 /*  Date	     :	2016/04/26	                                      */
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

        ASEGN `.near.noinit`:DATA:NOROOT,0500aH
        SECTION_GROUP _A_PC_ODR
// union <unnamed> volatile _A_PC_ODR
_A_PC_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0500bH
        SECTION_GROUP _A_PC_IDR
// union <unnamed> const volatile _A_PC_IDR
_A_PC_IDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05014H
        SECTION_GROUP _A_PE_ODR
// union <unnamed> volatile _A_PE_ODR
_A_PE_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05203H
        SECTION_GROUP _A_SPI_SR
// union <unnamed> volatile _A_SPI_SR
_A_SPI_SR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05204H
        SECTION_GROUP SPI_DR
// unsigned char volatile SPI_DR
SPI_DR:
        DS8 1
//   21 #include "Nrf24l01.h"
//   22 #include "QueueMsg.h"
//   23 #include "SysInit.h"
//   24 #include "delayTime.h"
//   25 #include "string.h"
//   26 
//   27 #define  _DEBUG_TEST
//   28 //#undef  _DEBUG_TEST
//   29 

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   30 unsigned char RX_ADDRESS_0[5] = {0xEB,0xBE,0xEB,0xBE,0xEB};
RX_ADDRESS_0:
        DC8 235, 190, 235, 190, 235

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   31 unsigned char RX_ADDRESS_1[5] = {0x01,0xB3,0xB4,0xB5,0xB6};
RX_ADDRESS_1:
        DC8 1, 179, 180, 181, 182

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   32 unsigned char RX_ADDRESS_2[5] = {0x02,0xB3,0xB4,0xB5,0xB6};
RX_ADDRESS_2:
        DC8 2, 179, 180, 181, 182

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   33 unsigned char RX_ADDRESS_3[5] = {0x03,0xB3,0xB4,0xB5,0xB6};
RX_ADDRESS_3:
        DC8 3, 179, 180, 181, 182

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   34 unsigned char RX_ADDRESS_4[5] = {0x04,0xB3,0xB4,0xB5,0xB6};
RX_ADDRESS_4:
        DC8 4, 179, 180, 181, 182

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   35 unsigned char RX_ADDRESS_5[5] = {0x05,0xB3,0xB4,0xB5,0xB6};
RX_ADDRESS_5:
        DC8 5, 179, 180, 181, 182
//   36 //static unsigned long count_err = 0;

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   37 static TMsg msg;
msg:
        DS8 8
//   38 //******************************************************************************
//   39 //SPIx 读写一个字节
//   40 //TxData:要写入的字节
//   41 //返回值:读取到的字节
//   42 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   43 unsigned char SPIx_ReadWriteByte(unsigned char TxData)
//   44 {		
SPIx_ReadWriteByte:
        LD        S:?b1, A
//   45     unsigned char retry=0;
        CLR       S:?b0
//   46     while(SPI_SR_TXE == 0)//等待发送区空	
??SPIx_ReadWriteByte_0:
        LD        A, L:0x5203
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JRNE      L:??SPIx_ReadWriteByte_1
//   47     {
//   48         retry++;
        LD        A, S:?b0
        ADD       A, #0x1
        LD        S:?b0, A
//   49         if(retry>200)
        LD        A, S:?b0
        CP        A, #0xc9
        JRC       L:??SPIx_ReadWriteByte_0
//   50 	  return 0;
        CLR       A
        RETF
//   51     }				  
//   52     SPI_DR = TxData;	 	  //发送一个byte 
??SPIx_ReadWriteByte_1:
        LD        A, S:?b1
        LD        L:0x5204, A
//   53     retry=0;
        CLR       S:?b0
//   54 
//   55     while(SPI_SR_RXNE == 0) //等待接收完一个byte  
??SPIx_ReadWriteByte_2:
        BTJT      L:0x5203, #0x0, L:??SPIx_ReadWriteByte_3
//   56     {
//   57         retry++;
        LD        A, S:?b0
        ADD       A, #0x1
        LD        S:?b0, A
//   58         if(retry>200)
        LD        A, S:?b0
        CP        A, #0xc9
        JRC       L:??SPIx_ReadWriteByte_2
//   59             return 0;
        CLR       A
        RETF
//   60     }	  						    
//   61     return SPI_DR;          //返回收到的数据
??SPIx_ReadWriteByte_3:
        LD        A, L:0x5204
        RETF
        REQUIRE _A_SPI_SR
        REQUIRE SPI_DR
//   62 
//   63 }
//   64 //******************************************************************************
//   65 
//   66 
//   67 //******************************************************************************
//   68 //初始化24L01
//   69 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   70 void NRF24L01_Init(void)
//   71 {
//   72     SPIx_ReadWriteByte(0xff);//启动传输
NRF24L01_Init:
        LD        A, #0xff
        CALLF     SPIx_ReadWriteByte
//   73     NRF24L01_CE = 0; 	//使能24L01
        BRES      L:0x500a, #0x3
//   74     NRF24L01_CSN = 1;	//SPI片选取消	
        BSET      L:0x5014, #0x5
//   75 }
        RETF
        REQUIRE _A_PC_ODR
        REQUIRE _A_PE_ODR
//   76 //******************************************************************************
//   77 
//   78 
//   79 //******************************************************************************
//   80 //在指定位置写指定长度的数据
//   81 //reg:寄存器(位置)
//   82 //*pBuf:数据指针
//   83 //len:数据长度
//   84 //返回值,此次读到的状态寄存器值
//   85 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   86 unsigned char NRF24L01_Write_Buf(unsigned char reg, unsigned char *pBuf, unsigned char len)
//   87 {
NRF24L01_Write_Buf:
        MOV       S:?b4, S:?b0
//   88     unsigned char status,u8_ctr;	    
//   89     NRF24L01_CSN = 0;          //使能SPI传输
        BRES      L:0x5014, #0x5
//   90     status = SPIx_ReadWriteByte(reg);//发送寄存器值(位置),并读取状态值
        CALLF     SPIx_ReadWriteByte
        LD        S:?b3, A
//   91     for(u8_ctr=0; u8_ctr<len; u8_ctr++)
        CLR       S:?b2
        JRA       L:??NRF24L01_Write_Buf_0
//   92     {
//   93         SPIx_ReadWriteByte(*pBuf++); //写入数据	
??NRF24L01_Write_Buf_1:
        LD        A, (X)
        CALLF     SPIx_ReadWriteByte
        ADDW      X, #0x1
//   94     }
        LD        A, S:?b2
        ADD       A, #0x1
        LD        S:?b2, A
??NRF24L01_Write_Buf_0:
        LD        A, S:?b2
        CP        A, S:?b4
        JRC       L:??NRF24L01_Write_Buf_1
//   95     NRF24L01_CSN = 1;       //关闭SPI传输
        BSET      L:0x5014, #0x5
//   96     return status;          //返回读到的状态值
        LD        A, S:?b3
        RETF
        REQUIRE _A_PE_ODR
//   97 }
//   98 //******************************************************************************
//   99 
//  100 
//  101 //******************************************************************************
//  102 //在指定位置读出指定长度的数据
//  103 //reg:寄存器(位置)
//  104 //*pBuf:数据指针
//  105 //len:数据长度
//  106 //返回值,此次读到的状态寄存器值 
//  107 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  108 unsigned char NRF24L01_Read_Buf(unsigned char reg,unsigned char *pBuf,unsigned char len)
//  109 {
NRF24L01_Read_Buf:
        MOV       S:?b4, S:?b0
//  110     unsigned char status,u8_ctr;	       
//  111     NRF24L01_CSN = 0;           //使能SPI传输
        BRES      L:0x5014, #0x5
//  112     status = SPIx_ReadWriteByte(reg);//发送寄存器值(位置),并读取状态值 
        CALLF     SPIx_ReadWriteByte
        LD        S:?b3, A
//  113     //SPIx_ReadWriteByte(0xff);
//  114     for(u8_ctr = 0;u8_ctr<len;u8_ctr++)
        CLR       S:?b2
        JRA       L:??NRF24L01_Read_Buf_0
//  115     {
//  116         pBuf[u8_ctr] = SPIx_ReadWriteByte(0xff);//读出数据0XFF
??NRF24L01_Read_Buf_1:
        CLRW      Y
        LD        A, S:?b2
        LD        YL, A
        LDW       S:?w0, X
        ADDW      Y, S:?w0
        LD        A, #0xff
        CALLF     SPIx_ReadWriteByte
        LD        (Y), A
//  117     }
        LD        A, S:?b2
        ADD       A, #0x1
        LD        S:?b2, A
??NRF24L01_Read_Buf_0:
        LD        A, S:?b2
        CP        A, S:?b4
        JRC       L:??NRF24L01_Read_Buf_1
//  118     NRF24L01_CSN = 1;       //关闭SPI传输
        BSET      L:0x5014, #0x5
//  119     return status;        //返回读到的状态值
        LD        A, S:?b3
        RETF
        REQUIRE _A_PE_ODR
//  120 }
//  121 //******************************************************************************
//  122 
//  123 
//  124 //******************************************************************************
//  125 //检测24L01是否存在
//  126 //返回值:0，成功;1，失败
//  127 //******************************************************************************	

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  128 unsigned char NRF24L01_Check(void)
//  129 {
NRF24L01_Check:
        SUB       SP, #0x5
//  130     unsigned char buf[5]={0xa5,0xa5,0xa5,0xa5,0xa5};
        LDW       Y, #?_0
        LDW       X, SP
        ADDW      X, #0x1
        PUSHW     X
        LD        A, #0x5
        CALLF     L:?move1616_v_x_y_a
        POPW      X
//  131     unsigned char i;
//  132     NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,buf,5); //写入5个字节的地址.	
        MOV       S:?b0, #0x5
        LDW       X, SP
        ADDW      X, #0x1
        LD        A, #0x30
        CALLF     NRF24L01_Write_Buf
//  133     NRF24L01_Read_Buf(TX_ADDR,buf,5); //读出写入的地址  
        MOV       S:?b0, #0x5
        LDW       X, SP
        ADDW      X, #0x1
        LD        A, #0x10
        CALLF     NRF24L01_Read_Buf
//  134     for(i=0;i<5;i++)
        CLR       S:?b1
        JRA       L:??NRF24L01_Check_0
??NRF24L01_Check_1:
        LD        A, S:?b1
        ADD       A, #0x1
        LD        S:?b1, A
??NRF24L01_Check_0:
        LD        A, S:?b1
        CP        A, #0x5
        JRNC      L:??NRF24L01_Check_2
//  135         if(buf[i]!=0xa5)
        CLR       S:?b0
        LDW       X, SP
        ADDW      X, #0x1
        ADDW      X, S:?w0
        LD        A, (X)
        CP        A, #0xa5
        JREQ      L:??NRF24L01_Check_1
//  136             break;	 							  
//  137     if(i!=5)
??NRF24L01_Check_2:
        LD        A, S:?b1
        CP        A, #0x5
        JREQ      L:??NRF24L01_Check_3
//  138         return 1;//检测24L01错误	
        LD        A, #0x1
        JRA       L:??NRF24L01_Check_4
//  139     return 0;		 //检测到24L01
??NRF24L01_Check_3:
        CLR       A
??NRF24L01_Check_4:
        ADD       SP, #0x5
        RETF
//  140 }
//  141 //******************************************************************************
//  142 
//  143 
//  144 //******************************************************************************
//  145 //SPI写寄存器
//  146 //reg:指定寄存器地址
//  147 //value:写入的值
//  148 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  149 unsigned char NRF24L01_Write_Reg(unsigned char reg,unsigned char value)
//  150 {
NRF24L01_Write_Reg:
        MOV       S:?b2, S:?b0
//  151     unsigned char status;	
//  152     NRF24L01_CSN=0;                 //使能SPI传输
        BRES      L:0x5014, #0x5
//  153     status =SPIx_ReadWriteByte(reg);//发送寄存器号 
        CALLF     SPIx_ReadWriteByte
        LD        S:?b3, A
//  154     SPIx_ReadWriteByte(value);      //写入寄存器的值
        LD        A, S:?b2
        CALLF     SPIx_ReadWriteByte
//  155     NRF24L01_CSN=1;                 //禁止SPI传输	   
        BSET      L:0x5014, #0x5
//  156     return(status);       			//返回状态值
        LD        A, S:?b3
        RETF
        REQUIRE _A_PE_ODR
//  157 }
//  158 //******************************************************************************
//  159 
//  160 
//  161 //******************************************************************************
//  162 //读取SPI寄存器值
//  163 //reg:要读的寄存器
//  164 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  165 unsigned char NRF24L01_Read_Reg(unsigned char reg)
//  166 {
//  167     unsigned char reg_val;	    
//  168     NRF24L01_CSN = 0;          //使能SPI传输		
NRF24L01_Read_Reg:
        BRES      L:0x5014, #0x5
//  169     SPIx_ReadWriteByte(reg);   //发送寄存器号
        CALLF     SPIx_ReadWriteByte
//  170     reg_val=SPIx_ReadWriteByte(0xFF);//读取寄存器内容0XFF
        LD        A, #0xff
        CALLF     SPIx_ReadWriteByte
//  171     NRF24L01_CSN = 1;          //禁止SPI传输		    
        BSET      L:0x5014, #0x5
//  172     return(reg_val);           //返回状态值
        RETF
        REQUIRE _A_PE_ODR
//  173 }
//  174 //******************************************************************************
//  175 
//  176 
//  177 //******************************************************************************
//  178 //启动NRF24L01发送一次数据
//  179 //txbuf:待发送数据首地址
//  180 //返回值:0，接收完成；其他，错误代码
//  181 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  182 unsigned char NRF24L01_RxPacket(unsigned char *rxbuf)
//  183 {
//  184     unsigned char sta;		    							     
//  185     sta = NRF24L01_Read_Reg(STATUS);  //读取状态寄存器的值  
NRF24L01_RxPacket:
        LD        A, #0x7
        CALLF     NRF24L01_Read_Reg
        LD        S:?b4, A
//  186     NRF24L01_Write_Reg(WRITE_REG+STATUS,sta); //清除TX_DS或MAX_RT中断标志
        MOV       S:?b0, S:?b4
        LD        A, #0x27
        CALLF     NRF24L01_Write_Reg
//  187     if(sta & RX_OK)//接收到数据
        LD        A, S:?b4
        AND       A, #0x40
        CP        A, #0x0
        JREQ      L:??NRF24L01_RxPacket_0
//  188     {
//  189 		NRF24L01_CE = 0;
        BRES      L:0x500a, #0x3
//  190         NRF24L01_Read_Buf(RD_RX_PLOAD,rxbuf,RX_PLOAD_WIDTH);//读取数据
        MOV       S:?b0, #0x20
        LD        A, #0x61
        CALLF     NRF24L01_Read_Buf
//  191         NRF24L01_Write_Reg(FLUSH_RX,0xff);//清除RX FIFO寄存器 
        MOV       S:?b0, #0xff
        LD        A, #0xe2
        CALLF     NRF24L01_Write_Reg
//  192 		NRF24L01_CE = 1;
        BSET      L:0x500a, #0x3
//  193         return 0; 
        CLR       A
        RETF
//  194     }
//  195     return 1;//没收到任何数据
??NRF24L01_RxPacket_0:
        LD        A, #0x1
        RETF
        REQUIRE _A_PC_ODR
//  196 }
//  197 //******************************************************************************
//  198 
//  199 
//  200 //******************************************************************************
//  201 //启动NRF24L01发送一次数据
//  202 //txbuf:待发送数据首地址
//  203 //返回值:发送完成状况
//  204 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  205 unsigned char NRF24L01_TxPacket(unsigned char *txbuf)
//  206 {
NRF24L01_TxPacket:
        PUSH      S:?b8
//  207 	//static unsigned char RDlength;
//  208     unsigned char sta;
//  209     unsigned int i;
//  210     
//  211     NRF24L01_Write_Buf(WR_TX_PLOAD,txbuf,TX_PLOAD_WIDTH);//写数据到TX BUF  32个字节
        MOV       S:?b0, #0x20
        LD        A, #0xa0
        CALLF     NRF24L01_Write_Buf
//  212     NRF24L01_CE = 1;//启动发送	
        BSET      L:0x500a, #0x3
//  213 	_delay_us(140);
        LDW       X, #0x8c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALLF     _delay_us
//  214     //Printf();
//  215     //while(NRF24L01_IRQ == 1);//等待发送完成
//  216     for(i = 0;i < 500;i++)  //203us
        CLRW      X
        JRA       L:??NRF24L01_TxPacket_0
??NRF24L01_TxPacket_1:
        ADDW      X, #0x1
??NRF24L01_TxPacket_0:
        CPW       X, #0x1f4
        JRNC      L:??NRF24L01_TxPacket_2
//  217     {
//  218         if(NRF24L01_IRQ == 0) 
        LD        A, L:0x500b
        SWAP      A
        AND       A, #0xf
        AND       A, #0x1
        CP        A, #0x0
        JRNE      L:??NRF24L01_TxPacket_1
//  219         {
//  220             //Printf();
//  221             break;
//  222         }
//  223     }
//  224 	_delay_us(800);
??NRF24L01_TxPacket_2:
        LDW       X, #0x320
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALLF     _delay_us
//  225 	NRF24L01_CE = 0;
        BRES      L:0x500a, #0x3
//  226 	
//  227     sta = NRF24L01_Read_Reg(STATUS);  //读取状态寄存器的值	   
        LD        A, #0x7
        CALLF     NRF24L01_Read_Reg
        LD        S:?b8, A
//  228     NRF24L01_Write_Reg(WRITE_REG+STATUS,sta); //清除TX_DS或MAX_RT中断标志
        MOV       S:?b0, S:?b8
        LD        A, #0x27
        CALLF     NRF24L01_Write_Reg
//  229 
//  230     //Printf("DS16(0,102,'NRF_Statu = %02x',12);\n\r",sta);
//  231     
//  232 	NRF24L01_Read_Buf(RD_RX_PLOAD,RD_Array,RX_PLOAD_WIDTH);//读取数据
        MOV       S:?b0, #0x20
        LDW       X, #RD_Array
        LD        A, #0x61
        CALLF     NRF24L01_Read_Buf
//  233 	NRF24L01_Write_Reg(FLUSH_RX,0xff);//清除RX FIFO寄存器
        MOV       S:?b0, #0xff
        LD        A, #0xe2
        CALLF     NRF24L01_Write_Reg
//  234 	
//  235     //if((sta & MAX_TX) || (sta & FULL_TX))//达到最大重发次数
//  236 	if(sta & MAX_TX)//达到最大重发次数
        LD        A, S:?b8
        AND       A, #0x10
        CP        A, #0x0
        JREQ      L:??NRF24L01_TxPacket_3
//  237     {
//  238         NRF24L01_Write_Reg(FLUSH_TX,0xff);//清除TX FIFO寄存器 
        MOV       S:?b0, #0xff
        LD        A, #0xe1
        CALLF     NRF24L01_Write_Reg
//  239         return MAX_TX; 
        LD        A, #0x10
        JRA       L:??NRF24L01_TxPacket_4
//  240     }	
//  241     
//  242     if(sta & TX_OK)//发送完成
??NRF24L01_TxPacket_3:
        LD        A, S:?b8
        AND       A, #0x20
        CP        A, #0x0
        JREQ      L:??NRF24L01_TxPacket_5
//  243     {
//  244 		if(CheckRecData() == 1)
        CALLF     CheckRecData
        CP        A, #0x1
        JRNE      L:??NRF24L01_TxPacket_6
//  245 		{
//  246 			msg.pInf = RD_Array;
        LDW       X, #RD_Array
        LDW       L:msg + 1, X
//  247 			msg.datalenth = RX_PLOAD_WIDTH;
        MOV       L:msg + 3, #0x20
//  248 			msg.time = globetimer;
        LDW       X, #globetimer
        CALLF     L:?load32_l0_0x
        LDW       X, #msg + 4
        CALLF     L:?load32_0x_l0
//  249 			msg.id = sta;
        LD        A, S:?b8
        LD        L:msg, A
//  250 			enQueue(&queSEND, &msg);
        LDW       Y, #msg
        LDW       X, #queSEND
        CALLF     enQueue
//  251 			
//  252 			return RX_OK;
        LD        A, #0x40
        JRA       L:??NRF24L01_TxPacket_4
//  253 		}
//  254 		else
//  255 		{
//  256 			//printf("DS16(0,85,'Check Err: %ld',12);\n\r",count_err++);
//  257 			return 0x0f;	
??NRF24L01_TxPacket_6:
        LD        A, #0xf
        JRA       L:??NRF24L01_TxPacket_4
//  258 		}
//  259     }
//  260 	//NRF24L01_Write_Reg(FLUSH_TX,0xff);//清除TX FIFO寄存器 
//  261     return 0x00;//其他原因发送失败
??NRF24L01_TxPacket_5:
        CLR       A
??NRF24L01_TxPacket_4:
        POP       S:?b8
        RETF
        REQUIRE _A_PC_ODR
        REQUIRE _A_PC_IDR
//  262 }
//  263 //******************************************************************************
//  264 
//  265 
//  266 //******************************************************************************
//  267 //该函数初始化NRF24L01到TX模式
//  268 //设置TX地址,写TX数据宽度,设置RX自动应答的地址,填充TX发送数据,选择RF频道,波特率和LNA HCURR
//  269 //PWR_UP,CRC使能
//  270 //当CE变高后,即进入RX模式,并可以接收数据了		   
//  271 //CE为高大于10us,则启动发送.
//  272 //******************************************************************************	 

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  273 void TX_Mode(void)
//  274 {														 
//  275     NRF24L01_CE = 0;
TX_Mode:
        BRES      L:0x500a, #0x3
//  276     NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）      
        MOV       S:?b0, #0xff
        LD        A, #0x27
        CALLF     NRF24L01_Write_Reg
//  277     NRF24L01_Write_Reg(FLUSH_TX,0x00);//清除RX FIFO寄存器（20160426加调试）
        CLR       S:?b0
        LD        A, #0xe1
        CALLF     NRF24L01_Write_Reg
//  278 	
//  279     NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,(unsigned char*)RX_ADDRESS_0,TX_ADR_WIDTH);//写TX节点地址  
        MOV       S:?b0, #0x5
        LDW       X, #RX_ADDRESS_0
        LD        A, #0x30
        CALLF     NRF24L01_Write_Buf
//  280     NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,(unsigned char*)RX_ADDRESS_0,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
        MOV       S:?b0, #0x5
        LDW       X, #RX_ADDRESS_0
        LD        A, #0x2a
        CALLF     NRF24L01_Write_Buf
//  281 	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS_1,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
//  282 	NRF24L01_Write_Reg(WRITE_REG+RX_PW_P0,RX_PLOAD_WIDTH);//选择通道0的有效数据宽度 
        MOV       S:?b0, #0x20
        LD        A, #0x31
        CALLF     NRF24L01_Write_Reg
//  283     //NRF24L01_Write_Reg(WRITE_REG+RX_PW_P1,RX_PLOAD_WIDTH);//选择通道0的有效数据宽度
//  284 	
//  285     NRF24L01_Write_Reg(WRITE_REG+EN_AA,0x03);     //使能通道1的自动应答    
        MOV       S:?b0, #0x3
        LD        A, #0x21
        CALLF     NRF24L01_Write_Reg
//  286     NRF24L01_Write_Reg(WRITE_REG+EN_RXADDR,0x03); //使能通道2的接收地址  
        MOV       S:?b0, #0x3
        LD        A, #0x22
        CALLF     NRF24L01_Write_Reg
//  287     NRF24L01_Write_Reg(WRITE_REG+SETUP_RETR,0x2a);//设置自动重发间隔时间:750us;最大自动重发次数:10次
        MOV       S:?b0, #0x2a
        LD        A, #0x24
        CALLF     NRF24L01_Write_Reg
//  288     NRF24L01_Write_Reg(WRITE_REG+RF_CH,20);       //设置RF通道为40
        MOV       S:?b0, #0x14
        LD        A, #0x25
        CALLF     NRF24L01_Write_Reg
//  289     NRF24L01_Write_Reg(WRITE_REG+RF_SETUP,0x0f);  //设置TX发射参数,0db增益,2Mbps,低噪声增益开启 
        MOV       S:?b0, #0xf
        LD        A, #0x26
        CALLF     NRF24L01_Write_Reg
//  290     
//  291 	//NRF24L01_Write_Buf(WRITE_REG+W_ACK_PAYLOAD_P0,RX_ADDRESS_0,5);//写RX节点地址
//  292 
//  293 	NRF24L01_Write_Reg(WRITE_REG+FEATURE,0x06);
        MOV       S:?b0, #0x6
        LD        A, #0x3d
        CALLF     NRF24L01_Write_Reg
//  294     NRF24L01_Write_Reg(WRITE_REG+DYNDP,0x03);
        MOV       S:?b0, #0x3
        LD        A, #0x3c
        CALLF     NRF24L01_Write_Reg
//  295 	
//  296 	NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //配置基本工作模式的参数;PWR_UP,EN_CRC,8BIT_CRC,发射模式,开启所有中断
        MOV       S:?b0, #0xa
        LD        A, #0x20
        CALLF     NRF24L01_Write_Reg
//  297     NRF24L01_CE = 1;//CE为高,10us后启动发送
        BSET      L:0x500a, #0x3
//  298 	_delay_us(140);
        LDW       X, #0x8c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        JPF       _delay_us
        REQUIRE _A_PC_ODR
//  299 }	
//  300 //******************************************************************************
//  301 
//  302 
//  303 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  304 void TX_P0_SET()
//  305 {
//  306 	NRF24L01_CE = 0;//CE为高,10us后启动发送
TX_P0_SET:
        BRES      L:0x500a, #0x3
//  307 	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）      
        MOV       S:?b0, #0xff
        LD        A, #0x27
        CALLF     NRF24L01_Write_Reg
//  308     NRF24L01_Write_Reg(FLUSH_TX,0x00);//清除RX FIFO寄存器（20160426加调试）
        CLR       S:?b0
        LD        A, #0xe1
        CALLF     NRF24L01_Write_Reg
//  309 	NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,RX_ADDRESS_0,TX_ADR_WIDTH);//写TX节点地址
        MOV       S:?b0, #0x5
        LDW       X, #RX_ADDRESS_0
        LD        A, #0x30
        CALLF     NRF24L01_Write_Buf
//  310 	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_0,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
        MOV       S:?b0, #0x5
        LDW       X, #RX_ADDRESS_0
        LD        A, #0x2a
        CALLF     NRF24L01_Write_Buf
//  311 	
//  312 	//NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,(unsigned char*)RX_ADDRESS_0,TX_ADR_WIDTH);//写TX节点地址
//  313 	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,(unsigned char*)RX_ADDRESS_0,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
//  314 	flag_p = 2;
        MOV       L:flag_p, #0x2
//  315 	NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //配置基本工作模式的参数;PWR_UP,EN_CRC,8BIT_CRC,发射模式,开启所有中断
        MOV       S:?b0, #0xa
        LD        A, #0x20
        CALLF     NRF24L01_Write_Reg
//  316 	NRF24L01_CE = 1;//CE为高,10us后启动发送
        BSET      L:0x500a, #0x3
//  317 	_delay_us(10);
        LDW       X, #0xa
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        JPF       _delay_us
        REQUIRE _A_PC_ODR
//  318 }
//  319 //******************************************************************************
//  320 
//  321 
//  322 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  323 void TX_PADRESS_SET(unsigned char pairadr[])
//  324 {
TX_PADRESS_SET:
        SUB       SP, #0x6
        LDW       S:?w1, X
//  325 	unsigned char address[6] = {0};
        LDW       Y, #?_1
        LDW       X, SP
        ADDW      X, #0x1
        PUSHW     X
        LD        A, #0x6
        CALLF     L:?move1616_v_x_y_a
        POPW      X
//  326 	strncpy((char*)address,(char*)pairadr,5);
        LDW       X, #0x5
        LDW       S:?w0, X
        LDW       Y, S:?w1
        LDW       X, SP
        ADDW      X, #0x1
        CALLF     strncpy
//  327 	NRF24L01_CE = 0;//CE为高,10us后启动发送
        BRES      L:0x500a, #0x3
//  328 	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）      
        MOV       S:?b0, #0xff
        LD        A, #0x27
        CALLF     NRF24L01_Write_Reg
//  329     NRF24L01_Write_Reg(FLUSH_TX,0x00);//清除RX FIFO寄存器（20160426加调试）
        CLR       S:?b0
        LD        A, #0xe1
        CALLF     NRF24L01_Write_Reg
//  330 	NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,address,TX_ADR_WIDTH);//写TX节点地址
        MOV       S:?b0, #0x5
        LDW       X, SP
        ADDW      X, #0x1
        LD        A, #0x30
        CALLF     NRF24L01_Write_Buf
//  331 	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,address,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
        MOV       S:?b0, #0x5
        LDW       X, SP
        ADDW      X, #0x1
        LD        A, #0x2a
        CALLF     NRF24L01_Write_Buf
//  332 	
//  333 	//NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,(unsigned char*)address,TX_ADR_WIDTH);//写TX节点地址
//  334 	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,(unsigned char*)address,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
//  335 	NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //配置基本工作模式的参数;PWR_UP,EN_CRC,8BIT_CRC,发射模式,开启所有中断
        MOV       S:?b0, #0xa
        LD        A, #0x20
        CALLF     NRF24L01_Write_Reg
//  336 	NRF24L01_CE = 1;//CE为高,10us后启动发送
        BSET      L:0x500a, #0x3
//  337 	_delay_us(10);
        LDW       X, #0xa
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALLF     _delay_us
//  338 }
        ADD       SP, #0x6
        RETF
        REQUIRE _A_PC_ODR
//  339 //******************************************************************************
//  340 
//  341 
//  342 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  343 void TX_P1_SET()
//  344 {
//  345 	NRF24L01_CE = 0;//CE为高,10us后启动发送
TX_P1_SET:
        BRES      L:0x500a, #0x3
//  346 	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）      
        MOV       S:?b0, #0xff
        LD        A, #0x27
        CALLF     NRF24L01_Write_Reg
//  347     NRF24L01_Write_Reg(FLUSH_TX,0x00);//清除RX FIFO寄存器（20160426加调试）
        CLR       S:?b0
        LD        A, #0xe1
        CALLF     NRF24L01_Write_Reg
//  348 	NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,RX_ADDRESS_1,TX_ADR_WIDTH);//写TX节点地址
        MOV       S:?b0, #0x5
        LDW       X, #RX_ADDRESS_1
        LD        A, #0x30
        CALLF     NRF24L01_Write_Buf
//  349 	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_1,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
        MOV       S:?b0, #0x5
        LDW       X, #RX_ADDRESS_1
        LD        A, #0x2a
        CALLF     NRF24L01_Write_Buf
//  350 	
//  351 	//NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,(unsigned char*)RX_ADDRESS_1,TX_ADR_WIDTH);//写TX节点地址
//  352 	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,(unsigned char*)RX_ADDRESS_1,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
//  353 	NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //配置基本工作模式的参数;PWR_UP,EN_CRC,8BIT_CRC,发射模式,开启所有中断
        MOV       S:?b0, #0xa
        LD        A, #0x20
        CALLF     NRF24L01_Write_Reg
//  354 	NRF24L01_CE = 1;//CE为高,10us后启动发送
        BSET      L:0x500a, #0x3
//  355 	_delay_us(10);
        LDW       X, #0xa
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        JPF       _delay_us
        REQUIRE _A_PC_ODR
//  356 }
//  357 //******************************************************************************
//  358 
//  359 
//  360 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  361 void TX_P_SET(const unsigned char P_Child_Num)
//  362 {
//  363 	 switch(P_Child_Num)
TX_P_SET:
        DEC       A
        JREQ      L:??TX_P_SET_0
        DEC       A
        JREQ      L:??TX_P_SET_1
        DEC       A
        JREQ      L:??TX_P_SET_2
        DEC       A
        JREQ      L:??TX_P_SET_3
        DEC       A
        JREQ      L:??TX_P_SET_4
        JRA       L:??TX_P_SET_5
//  364 	  {
//  365 		case 1:
//  366 			strncpy((char*)RX_ADDRESS,(char*)RX_ADDRESS_1,5);
??TX_P_SET_0:
        LDW       X, #0x5
        LDW       S:?w0, X
        LDW       Y, #RX_ADDRESS_1
        LDW       X, #RX_ADDRESS
        CALLF     strncpy
//  367 			break;
        JRA       L:??TX_P_SET_5
//  368 		case 2:
//  369 			strncpy((char*)RX_ADDRESS,(char*)RX_ADDRESS_2,5);
??TX_P_SET_1:
        LDW       X, #0x5
        LDW       S:?w0, X
        LDW       Y, #RX_ADDRESS_2
        LDW       X, #RX_ADDRESS
        CALLF     strncpy
//  370 			break;
        JRA       L:??TX_P_SET_5
//  371 		case 3:
//  372 			strncpy((char*)RX_ADDRESS,(char*)RX_ADDRESS_3,5);
??TX_P_SET_2:
        LDW       X, #0x5
        LDW       S:?w0, X
        LDW       Y, #RX_ADDRESS_3
        LDW       X, #RX_ADDRESS
        CALLF     strncpy
//  373 			break;
        JRA       L:??TX_P_SET_5
//  374 		case 4:
//  375 			strncpy((char*)RX_ADDRESS,(char*)RX_ADDRESS_4,5);
??TX_P_SET_3:
        LDW       X, #0x5
        LDW       S:?w0, X
        LDW       Y, #RX_ADDRESS_4
        LDW       X, #RX_ADDRESS
        CALLF     strncpy
//  376 			break;
        JRA       L:??TX_P_SET_5
//  377 		case 5:
//  378 			strncpy((char*)RX_ADDRESS,(char*)RX_ADDRESS_5,5);
??TX_P_SET_4:
        LDW       X, #0x5
        LDW       S:?w0, X
        LDW       Y, #RX_ADDRESS_5
        LDW       X, #RX_ADDRESS
        CALLF     strncpy
//  379 			break;
//  380 		default:
//  381 		  break;
//  382 	  }
//  383 	flag_p = 3;
??TX_P_SET_5:
        MOV       L:flag_p, #0x3
//  384 	NRF24L01_CE = 0;//CE为高,10us后启动发送
        BRES      L:0x500a, #0x3
//  385 	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）      
        MOV       S:?b0, #0xff
        LD        A, #0x27
        CALLF     NRF24L01_Write_Reg
//  386     NRF24L01_Write_Reg(FLUSH_TX,0x00);//清除RX FIFO寄存器（20160426加调试）
        CLR       S:?b0
        LD        A, #0xe1
        CALLF     NRF24L01_Write_Reg
//  387 	//NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,(unsigned char*)RX_ADDRESS,TX_ADR_WIDTH);//写TX节点地址
//  388 	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,(unsigned char*)RX_ADDRESS,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
//  389 	
//  390 	NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,RX_ADDRESS,TX_ADR_WIDTH);//写TX节点地址
        MOV       S:?b0, #0x5
        LDW       X, #RX_ADDRESS
        LD        A, #0x30
        CALLF     NRF24L01_Write_Buf
//  391 	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
        MOV       S:?b0, #0x5
        LDW       X, #RX_ADDRESS
        LD        A, #0x2a
        CALLF     NRF24L01_Write_Buf
//  392 	
//  393 	NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //配置基本工作模式的参数;PWR_UP,EN_CRC,8BIT_CRC,接收模式,开启所有中断
        MOV       S:?b0, #0xa
        LD        A, #0x20
        CALLF     NRF24L01_Write_Reg
//  394 	NRF24L01_CE = 1;//CE为高,10us后启动发送
        BSET      L:0x500a, #0x3
//  395 	_delay_us(10);
        LDW       X, #0xa
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        JPF       _delay_us
        REQUIRE _A_PC_ODR
//  396 }
//  397 //******************************************************************************
//  398 //无线收发数据
//  399 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  400 void  NRF24L01Process(void)
//  401 {                 
//  402     
//  403 }
NRF24L01Process:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
crc_cal_value:
        LDW       S:?w0, X
        LD        S:?b3, A
        CLRW      X
        DECW      X
??crc_cal_value_0:
        MOV       S:?b2, S:?b3
        LD        A, S:?b2
        ADD       A, #0xff
        LD        S:?b3, A
        TNZ       S:?b2
        JREQ      L:??crc_cal_value_1
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
        CLRW      Y
        JRA       L:??crc_cal_value_2
??crc_cal_value_3:
        SRLW      X
??crc_cal_value_4:
        ADDW      Y, #0x1
??crc_cal_value_2:
        CPW       Y, #0x8
        JRNC      L:??crc_cal_value_0
        LD        A, XL
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??crc_cal_value_3
        SRLW      X
        RLWA      X, A
        XOR       A, #0xa0
        RLWA      X, A
        XOR       A, #0x1
        RLWA      X, A
        JRA       L:??crc_cal_value_4
??crc_cal_value_1:
        RETF
//  404 //******************************************************************************
//  405 
//  406 
//  407 //******************************************************************************
//  408 //发送数据更新
//  409 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  410 void  SendDataUpdate(void)						
//  411 {
//  412     unsigned char i;
//  413     unsigned int  data;
//  414     TD_Array[0] = C_THead_T;     //发射机（接收）（接收）发送数据头码
SendDataUpdate:
        MOV       L:TD_Array, #0x68
//  415     TD_Array[1] = TX_PLOAD_WIDTH;//发射机（接收）（接收）发送数据长度
        MOV       L:TD_Array + 1, #0x20
//  416     TD_Array[2] = 0x11; 		//本机属性
        MOV       L:TD_Array + 2, #0x11
//  417     TD_Array[3] = 0x01; 		//本机属性
        MOV       L:TD_Array + 3, #0x1
//  418     TD_Array[4] = Child_Num;    //子机编号
        MOV       L:TD_Array + 4, L:Child_Num
//  419 
//  420     TD_Array[5] = Child_Comm; 
        MOV       L:TD_Array + 5, L:Child_Comm
//  421        
//  422     for(i=0;i<5;i++)
        CLR       S:?b1
        JRA       L:??SendDataUpdate_0
//  423     {
//  424         TD_Array[i+6] = Address[i];//配对信号地址
??SendDataUpdate_1:
        CLR       S:?b0
        CLRW      X
        LD        A, S:?b1
        LD        XL, A
        LD        A, (L:Address,X)
        LDW       X, S:?w0
        LD        (L:TD_Array + 6,X), A
//  425 		TD_Array[i+11] = Address_Sure[i];//配对确认信号地址
        CLR       S:?b0
        CLRW      X
        LD        A, S:?b1
        LD        XL, A
        LD        A, (L:Address_Sure,X)
        LDW       X, S:?w0
        LD        (L:TD_Array + 11,X), A
//  426     }
        LD        A, S:?b1
        ADD       A, #0x1
        LD        S:?b1, A
??SendDataUpdate_0:
        LD        A, S:?b1
        CP        A, #0x5
        JRC       L:??SendDataUpdate_1
//  427     TD_Array[16] = 0x00;     	//本机温度低位（数字）
        MOV       L:TD_Array + 16, #0x0
//  428     TD_Array[17] = 0x00;          //本机功率第四位
        MOV       L:TD_Array + 17, #0x0
//  429     TD_Array[18] = 0x00;   		//本机功率第三位
        MOV       L:TD_Array + 18, #0x0
//  430     TD_Array[19] = 0x00;    	//本机功率第二位
        MOV       L:TD_Array + 19, #0x0
//  431     TD_Array[20] = 0x00;         //本机功率第一位
        MOV       L:TD_Array + 20, #0x0
//  432     TD_Array[21] = 0x00;      	//本机故障
        MOV       L:TD_Array + 21, #0x0
//  433     TD_Array[22] = 0x00;      	//本机故障
        MOV       L:TD_Array + 22, #0x0
//  434     TD_Array[23] = 0x00;          //功率命令    
        MOV       L:TD_Array + 23, #0x0
//  435     TD_Array[24] = 0x00;        //保留
        MOV       L:TD_Array + 24, #0x0
//  436     TD_Array[25] = 0x00;        //发射机（接收）频率  
        MOV       L:TD_Array + 25, #0x0
//  437     TD_Array[26] = 0x00;   		//发射机（接收）（接收）占空比
        MOV       L:TD_Array + 26, #0x0
//  438     TD_Array[27] = 0x00;               //保留   
        MOV       L:TD_Array + 27, #0x0
//  439     TD_Array[28] = Frm_num;               //帧计数
        MOV       L:TD_Array + 28, L:Frm_num
//  440     data =crc_cal_value(TD_Array, TX_PLOAD_WIDTH-3);
        LD        A, #0x1d
        LDW       X, #TD_Array
        CALLF     crc_cal_value
//  441     TD_Array[TX_PLOAD_WIDTH-3] = data>>8;     //校验码高位
        LD        A, XH
        LD        L:TD_Array + 29, A
//  442     TD_Array[TX_PLOAD_WIDTH-2] = data&0xff;   //校验码低位
        LD        A, XL
        LD        L:TD_Array + 30, A
//  443     TD_Array[TX_PLOAD_WIDTH-1] = 0x2b;			//发射机（接收）发送数据结束码
        MOV       L:TD_Array + 31, #0x2b
//  444 }
        RETF
//  445 //******************************************************************************
//  446 
//  447 
//  448 //******************************************************************************
//  449 //接收数据是否正确
//  450 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  451 unsigned char  CheckRecData(void)						
//  452 {
//  453     unsigned char j,crcl,crch;
//  454     unsigned int  data;
//  455     if((RD_Array[0]==C_THead_T)&&(RD_Array[RX_PLOAD_WIDTH-1]==C_TEnd_T))
CheckRecData:
        LD        A, #0x68
        CP        A, L:RD_Array
        JRNE      L:??CheckRecData_0
        LD        A, #0x2b
        CP        A, L:RD_Array + 31
        JRNE      L:??CheckRecData_0
//  456     {
//  457         data =crc_cal_value(RD_Array, RX_PLOAD_WIDTH-3);
        LD        A, #0x1d
        LDW       X, #RD_Array
        CALLF     crc_cal_value
//  458         crcl=data&0xff;
        EXG       A, XL
        LD        S:?b0, A
        EXG       A, XL
//  459         crch=data>>8;
        LD        A, XH
//  460         if((RD_Array[RX_PLOAD_WIDTH-3]==crch)&&(RD_Array[RX_PLOAD_WIDTH-2]==crcl))
        CP        A, L:RD_Array + 29
        JRNE      L:??CheckRecData_1
        LD        A, S:?b0
        CP        A, L:RD_Array + 30
        JRNE      L:??CheckRecData_1
//  461         {
//  462 			Child_Comm_Back = RD_Array[5];
        MOV       L:Child_Comm_Back, L:RD_Array + 5
//  463 			Child_Count_Num_Back = TD_Array[4];
        MOV       L:Child_Count_Num_Back, L:TD_Array + 4
//  464 			if(Child_Comm_Back == 0xCC)
        LD        A, #0xcc
        CP        A, L:Child_Comm_Back
        JRNE      L:??CheckRecData_2
//  465 			{
//  466 				for(int i = 0;i <5;i++)
        CLRW      X
        JRA       L:??CheckRecData_3
//  467 					Address4Check[i] = RD_Array[i+6];
??CheckRecData_4:
        LDW       Y, X
        ADDW      Y, #RD_Array + 6
        LD        A, (Y)
        LD        (L:Address4Check,X), A
        ADDW      X, #0x1
??CheckRecData_3:
        CPW       X, #0x5
        JRSLT     L:??CheckRecData_4
//  468 			}
//  469             j=1;
??CheckRecData_2:
        LD        A, #0x1
        RETF
//  470         }
//  471         else
//  472         {
//  473             j=0;
??CheckRecData_1:
        CLR       A
        RETF
//  474         }
//  475     }
//  476     else
//  477     {
//  478         j=0;
??CheckRecData_0:
        CLR       A
//  479     }
//  480     return j;
        RETF
//  481 }
//  482 //******************************************************************************
//  483 
//  484 
//  485 //******************************************************************************
//  486 /*供电状态接收数据*/  /*Mode_Rec_Send(0表示发送，1表示接收）*/
//  487 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  488 void NRF24L01_Send_Data(void)
//  489 {
//  490    
//  491 }
NRF24L01_Send_Data:
        RETF
//  492 //******************************************************************************
//  493 
//  494 
//  495 //******************************************************************************
//  496 //CRC
//  497 //******************************************************************************
//  498 unsigned int crc_cal_value(unsigned char *data_value, unsigned char data_length)
//  499 {
//  500     unsigned int i;
//  501     unsigned int crc_value=0xffff;		
//  502     while(data_length--) 
//  503     {
//  504         crc_value^=*data_value++;
//  505         for(i=0;i<8;i++) 
//  506         {
//  507             if(crc_value&0x0001)
//  508                 crc_value=(crc_value>>1)^0xa001;
//  509             else
//  510                 crc_value=crc_value>>1;
//  511         }
//  512     }		
//  513     return(crc_value);
//  514 }
//  515 //******************************************************************************
//  516 
//  517 
//  518 //******************************************************************************
//  519 //清零相关变量
//  520 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  521 void  Clear_Nrf24l01(void)
//  522 {
//  523     unsigned char i;
//  524     for(i=0;i<32;i++)
Clear_Nrf24l01:
        CLR       S:?b0
        JRA       L:??Clear_Nrf24l01_0
//  525     {
//  526         RD_Array[i] = 0;
??Clear_Nrf24l01_1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:RD_Array,X), A
//  527         TD_Array[i] = 0;
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        LD        (L:TD_Array,X), A
//  528     }
        LD        A, S:?b0
        ADD       A, #0x1
        LD        S:?b0, A
??Clear_Nrf24l01_0:
        LD        A, S:?b0
        CP        A, #0x20
        JRC       L:??Clear_Nrf24l01_1
//  529 }
        RETF
//  530 //******************************************************************************
//  531 
//  532 
//  533 //******************************************************************************
//  534 /*供电状态接收数据*/  /*Mode_Rec_Send(0表示发送，1表示接收）*/
//  535 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  536 unsigned char  NRF24L01_read_Data(void)
//  537 {
//  538    
//  539     return 0;
NRF24L01_read_Data:
        CLR       A
        RETF
//  540 }
//  541 //******************************************************************************
//  542 
//  543 
//  544 //******************************************************************************
//  545 /*供电状态收发数据*/   /*Mode_Rec_Send(0表示发送，1表示接收）*/
//  546 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  547 void Rec_Send_data(void)//供电状态收发数据
//  548 {
//  549     
//  550 }
Rec_Send_data:
        RETF
//  551 //******************************************************************************
//  552 // Write the ack payload of the pipe 0
//  553 
//  554 //******************************************************************************
//  555 /*配置NRF24L01模块自动应答*/
//  556 //******************************************************************************

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  557 unsigned char nrfWriteAck(unsigned int pipe, unsigned char *buffer, int len)
//  558 {
nrfWriteAck:
        LDW       S:?w1, X
        LDW       X, Y
        CALLF     L:?mov_w2_w0
//  559 	unsigned char status,i;
//  560 
//  561 	NRF24L01_CSN = 0;//使能SPI传输
        BRES      L:0x5014, #0x5
//  562 	/* Send the read command with the address */
//  563 	status = SPIx_ReadWriteByte(0xA8 | pipe);
        LD        A, S:?b3
        OR        A, #0xa8
        CALLF     SPIx_ReadWriteByte
        LD        S:?b3, A
//  564 	/* Read LEN bytes */
//  565 	for(i=0; i<len; i++)
        CLR       S:?b2
        JRA       L:??nrfWriteAck_0
//  566 	  SPIx_ReadWriteByte(*buffer++);
??nrfWriteAck_1:
        LD        A, (X)
        CALLF     SPIx_ReadWriteByte
        ADDW      X, #0x1
        LD        A, S:?b2
        ADD       A, #0x1
        LD        S:?b2, A
??nrfWriteAck_0:
        CLRW      Y
        LD        A, S:?b2
        LD        YL, A
        CPW       Y, S:?w2
        JRSLT     L:??nrfWriteAck_1
//  567 	NRF24L01_CSN = 1;//禁止SPI传输
        BSET      L:0x5014, #0x5
//  568   return status;
        LD        A, S:?b3
        RETF
        REQUIRE _A_PE_ODR
//  569 }
//  570 // Return the payload length

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
//  571 unsigned char nrfRxLength()
//  572 {
//  573 	unsigned char length;
//  574 
//  575 	NRF24L01_CSN = 0;//使能SPI传输
nrfRxLength:
        BRES      L:0x5014, #0x5
//  576 	SPIx_ReadWriteByte(R_RX_PL_WID);
        LD        A, #0x60
        CALLF     SPIx_ReadWriteByte
//  577 	length = SPIx_ReadWriteByte(0xff);
        LD        A, #0xff
        CALLF     SPIx_ReadWriteByte
//  578 	NRF24L01_CSN = 1;//禁止SPI传输
        BSET      L:0x5014, #0x5
//  579 	return length;
        RETF
        REQUIRE _A_PE_ODR
//  580 }
//  581 //******************************************************************************
//  582 /*配置NRF24L01模块到公共发送模式*/
//  583 //******************************************************************************

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  584 void  Set_TX_Com_Mode(void)//设置公共发送模式
//  585 {
//  586     Num_RF = 0x20;//设置公共通信频率
Set_TX_Com_Mode:
        MOV       L:Num_RF, #0x20
//  587     TX_Mode();
        JPF       TX_Mode
//  588 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_0:
        DC8 165, 165, 165, 165, 165

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_1:
        DC8 0, 0, 0, 0, 0, 0

        END
//  589 //******************************************************************************
//  590 /*******************************************************************************
//  591 -----------------------------    End of file    --------------------------------
//  592 *******************************************************************************/
// 
// 1 601 bytes in section .far_func.text
//     8 bytes in section .near.bss
//    30 bytes in section .near.data
//     5 bytes in section .near.noinit   (abs)
//    11 bytes in section .near.rodata
// 
// 1 601 bytes of CODE  memory
//    11 bytes of CONST memory
//    38 bytes of DATA  memory (+ 5 bytes shared)
//
//Errors: none
//Warnings: none
