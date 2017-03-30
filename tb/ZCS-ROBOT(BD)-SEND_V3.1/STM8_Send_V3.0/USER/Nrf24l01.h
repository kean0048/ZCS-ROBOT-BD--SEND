/******************************************************************************/
/*					                                      */
/*	Project Name :	发射机		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	中惠创智（深圳）无线供电技术有限公司                    */
/*						                              */
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
*******************************************************************************/
#ifndef _NRF24L01_H
#define _NRF24L01_H

/*******************************************************************************
-----------------------------    Macro define    -------------------------------
*******************************************************************************/
//20170215重新定义
#define  NRF24L01_CE     PC_ODR_ODR3
#define  NRF24L01_CSN    PE_ODR_ODR5
#define  NRF24L01_CLK    PC_ODR_ODR5
#define  NRF24L01_IRQ	 PC_IDR_IDR4
#define  NRF24L01_MOSI   PC_ODR_ODR6
#define  NRF24L01_MISO   PC_IDR_IDR7

//NRF24L01寄存器操作命令
#define READ_REG        0x00  //读配置寄存器,低5位为寄存器地址
#define WRITE_REG       0x20  //写配置寄存器,低5位为寄存器地址
#define R_RX_PL_WID     0x60  //接受数据长度寄存器
#define RD_RX_PLOAD     0x61  //读RX有效数据,1~32字节
#define WR_TX_PLOAD     0xA0  //写TX有效数据,1~32字节
#define FLUSH_TX        0xE1  //清除TX FIFO寄存器.发射模式下用
#define FLUSH_RX        0xE2  //清除RX FIFO寄存器.接收模式下用
#define REUSE_TX_PL     0xE3  //重新使用上一包数据,CE为高,数据包被不断发送.
#define NOP             0xFF  //空操作,可以用来读状态寄存器	 
//SPI(NRF24L01)寄存器地址
#define CONFIG          0x00  //配置寄存器地址;bit0:1接收模式,0发射模式;bit1:电选择;bit2:CRC模式;bit3:CRC使能;
                              //bit4:中断MAX_RT(达到最大重发次数中断)使能;bit5:中断TX_DS使能;bit6:中断RX_DR使能
#define EN_AA           0x01  //使能自动应答功能  bit0~5,对应通道0~5
#define EN_RXADDR       0x02  //接收地址允许,bit0~5,对应通道0~5
#define SETUP_AW        0x03  //设置地址宽度(所有数据通道):bit1,0:00,3字节;01,4字节;02,5字节;
#define SETUP_RETR      0x04  //建立自动重发;bit3:0,自动重发计数器;bit7:4,自动重发延时 250*x+86us
#define RF_CH           0x05  //RF通道,bit6:0,工作通道频率;
#define RF_SETUP        0x06  //RF寄存器;bit3:传输速率(0:1Mbps,1:2Mbps);bit2:1,发射功率;bit0:低噪声放大器增益
#define STATUS          0x07  //状态寄存器;bit0:TX FIFO满标志;bit3:1,接收数据通道号(最大:6);bit4,达到最多次重发
                              //bit5:数据发送完成中断;bit6:接收数据中断;
#define MAX_TX  	0x10  //达到最大发送次数中断
#define TX_OK   	0x20  //TX发送完成中断
#define RX_OK   	0x40  //接收到数据中断
#define FULL_TX   	0x1F  //Tx缓存区满

#define OBSERVE_TX      0x08  //发送检测寄存器,bit7:4,数据包丢失计数器;bit3:0,重发计数器
#define CD              0x09  //载波检测寄存器,bit0,载波检测;
#define RX_ADDR_P0      0x0A  //数据通道0接收地址,最大长度5个字节,低字节在前
#define RX_ADDR_P1      0x0B  //数据通道1接收地址,最大长度5个字节,低字节在前
#define RX_ADDR_P2      0x0C  //数据通道2接收地址,最低字节可设置,高字节,必须同RX_ADDR_P1[39:8]相等;
#define RX_ADDR_P3      0x0D  //数据通道3接收地址,最低字节可设置,高字节,必须同RX_ADDR_P1[39:8]相等;
#define RX_ADDR_P4      0x0E  //数据通道4接收地址,最低字节可设置,高字节,必须同RX_ADDR_P1[39:8]相等;
#define RX_ADDR_P5      0x0F  //数据通道5接收地址,最低字节可设置,高字节,必须同RX_ADDR_P1[39:8]相等;
#define TX_ADDR         0x10  //发送地址(低字节在前),ShockBurstTM模式下,RX_ADDR_P0与此地址相等
#define RX_PW_P0        0x11  //接收数据通道0有效数据宽度(1~32字节),设置为0则非法
#define RX_PW_P1        0x12  //接收数据通道1有效数据宽度(1~32字节),设置为0则非法
#define RX_PW_P2        0x13  //接收数据通道2有效数据宽度(1~32字节),设置为0则非法
#define RX_PW_P3        0x14  //接收数据通道3有效数据宽度(1~32字节),设置为0则非法
#define RX_PW_P4        0x15  //接收数据通道4有效数据宽度(1~32字节),设置为0则非法
#define RX_PW_P5        0x16  //接收数据通道5有效数据宽度(1~32字节),设置为0则非法
#define FIFO_STATUS     0x17  //FIFO状态寄存器;bit0,RX FIFO寄存器空标志;bit1,RX FIFO满标志;bit2,3,保留
                              //bit4,TX FIFO空标志;bit5,TX FIFO满标志;bit6,1,循环发送上一数据包.0,不循环;
#define FEATURE         0x1D  //Feature Register
#define DYNDP           0x1C  //Enable dynamic payload length
#define W_ACK_PAYLOAD_P0   0xA8 //0通道自动应道内容
#define W_ACK_PAYLOAD_P1   0xA9 //0通道自动应道内容
#define W_ACK_PAYLOAD_P2   0xAA //0通道自动应道内容
#define W_ACK_PAYLOAD_P3   0xAB //0通道自动应道内容
#define W_ACK_PAYLOAD_P4   0xAC //0通道自动应道内容
#define W_ACK_PAYLOAD_P5   0xAD //0通道自动应道内容
//24L01发送接收数据宽度定义
#define TX_ADR_WIDTH    5   //5字节的地址宽度
#define RX_ADR_WIDTH    5   //5字节的地址宽度
#define RX_ADR_WIDTH_1  1   //1字节的地址宽度
#define TX_PLOAD_WIDTH  32  //20字节的用户数据宽度
#define RX_PLOAD_WIDTH  32  //20字节的用户数据宽度


#define C_THead_T       0x68   //发送数据头码
#define C_TEnd_T        0x2b   //发送数据结束码
#define C_THead_R       0x1f   //接收数据头码
#define C_TEnd_R        0xcd   //接收数据结束码

//中惠机器属性表
#define  C_Master_DianFanBao 	  0x0001	//电饭煲发射机
#define  C_Salve_DianFanBao       0x0002        //机器人发射机
#define  C_Master_Jiqiren	  	  0x0003	//从机电饭煲
#define  C_Salve_Jiqiren          0x0004        //从机机器人
/*******************************************************************************
-------------------------    Function declaration    ---------------------------
*******************************************************************************/

extern unsigned char RX_ADDRESS_0[5];
extern unsigned char RX_ADDRESS_1[5];
extern unsigned char RX_ADDRESS_2[5];
extern unsigned char RX_ADDRESS_3[5];
extern unsigned char RX_ADDRESS_4[5];
extern unsigned char RX_ADDRESS_5[5];
extern unsigned char SEND_ADDRESS[12];

//NRF24L01通信基础函数
void  NRF24L01_Init(void);//NRF24L01初始化
void  TX_Mode(void);//该函数初始化NRF24L01到TX模式
void 	TX_P0_SET();
void 	CLEAR_P_SET();
void 	CHECK_P0_SET();
void 	RX_P_SET();
unsigned char SPIx_ReadWriteByte(unsigned char TxData);//SPI读写一个字节
unsigned char NRF24L01_Check(void);//检测24L01是否存在
unsigned char NRF24L01_Write_Buf(unsigned char reg, unsigned char *pBuf, unsigned char len);//在指定位置写指定长度的数据
unsigned char NRF24L01_Read_Buf(unsigned char reg,unsigned char *pBuf,unsigned char len); //在指定位置读出指定长度的数据
unsigned char NRF24L01_TxPacket(unsigned char *txbuf);//启动NRF24L01发送一次数据
unsigned char NRF24L01_Read_Reg(unsigned char reg);//读取SPI寄存器值
unsigned char NRF24L01_Write_Reg(unsigned char reg,unsigned char value); //SPI写寄存器
unsigned char NRF24L01_RxPacket(unsigned char *rxbuf);//启动NRF24L01接收一次数据

//NRF24L01通信应用函数
void  NRF24L01Process(void);//无线收发数据
void  Clear_Nrf24l01(void);//清零先关变量
void  Scan_Nrf24l01(void);//查询从机
unsigned char  CheckRecData(void);//查询接收数据是否正确	
void  Record_Data(void);//记录配对从机地址以及通信次数
void  Check_Pair(void);//检测是否有配对从机
void  Pair_Nrf24l01(void);//发射机和接收机配对
void  SendDataUpdate();//发送数据更新
void  SendDataUpdate_Pair();	
void  SendIdleDataUpdate();
void  RecDataProcess(void);//接收数据更新
void  Set_TX_Com_Mode(void);//设置公共发送模式
void  Set_RX_Com_Mode(void);//设置公共接收模式
void  Set_TX_Pair_Mode(void);//设置配对发送模式
void  Set_RX_Pair_Mode(void);//设置配对接收模式
void  Rec_Send_data(void);//供电状态收发数据
void  NRF24L01_Send_Data(void);
unsigned char  NRF24L01_read_Data(void);
unsigned int crc_cal_value(unsigned char *data_value, unsigned char data_length);
unsigned char nrfWriteAck(unsigned int pipe, unsigned char *buffer, int len);

int IsRightAddr(unsigned char * Resv_Address);
void  Recover_Nrf24l01_P0_Normal(void);
void TX_P_SET(const unsigned char P_Child_Num);
unsigned char nrfRxLength();
#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/