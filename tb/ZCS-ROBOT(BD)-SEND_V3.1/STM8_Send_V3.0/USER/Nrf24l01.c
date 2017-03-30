/******************************************************************************/
/*					                                      */
/*	Project Name :	发射机（接收）		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*  Date	     :	2016/04/26	                                      */
/*	Corporation  :	中惠创智（深圳）无线供电技术有限公司                  */
/*						                              */
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
*******************************************************************************/


/*******************************************************************************
-----------------------------    Include files   -------------------------------
*******************************************************************************/
#include "type_def.h"
#include "Nrf24l01.h"
#include "QueueMsg.h"
#include "SysInit.h"
#include "delayTime.h"
#include "string.h"

#define  _DEBUG_TEST
//#undef  _DEBUG_TEST

unsigned char RX_ADDRESS_0[5] = {0xEB,0xBE,0xEB,0xBE,0xEB};
unsigned char RX_ADDRESS_1[5] = {0x01,0xB3,0xB4,0xB5,0xB6};
unsigned char RX_ADDRESS_2[5] = {0x02,0xB3,0xB4,0xB5,0xB6};
unsigned char RX_ADDRESS_3[5] = {0x03,0xB3,0xB4,0xB5,0xB6};
unsigned char RX_ADDRESS_4[5] = {0x04,0xB3,0xB4,0xB5,0xB6};
unsigned char RX_ADDRESS_5[5] = {0x05,0xB3,0xB4,0xB5,0xB6};
//static unsigned long count_err = 0;
static TMsg msg;
//******************************************************************************
//SPIx 读写一个字节
//TxData:要写入的字节
//返回值:读取到的字节
//******************************************************************************
unsigned char SPIx_ReadWriteByte(unsigned char TxData)
{		
    unsigned char retry=0;
    while(SPI_SR_TXE == 0)//等待发送区空	
    {
        retry++;
        if(retry>200)
	  return 0;
    }				  
    SPI_DR = TxData;	 	  //发送一个byte 
    retry=0;

    while(SPI_SR_RXNE == 0) //等待接收完一个byte  
    {
        retry++;
        if(retry>200)
            return 0;
    }	  						    
    return SPI_DR;          //返回收到的数据

}
//******************************************************************************


//******************************************************************************
//初始化24L01
//******************************************************************************
void NRF24L01_Init(void)
{
    SPIx_ReadWriteByte(0xff);//启动传输
    NRF24L01_CE = 0; 	//使能24L01
    NRF24L01_CSN = 1;	//SPI片选取消	
}
//******************************************************************************


//******************************************************************************
//在指定位置写指定长度的数据
//reg:寄存器(位置)
//*pBuf:数据指针
//len:数据长度
//返回值,此次读到的状态寄存器值
//******************************************************************************
unsigned char NRF24L01_Write_Buf(unsigned char reg, unsigned char *pBuf, unsigned char len)
{
    unsigned char status,u8_ctr;	    
    NRF24L01_CSN = 0;          //使能SPI传输
    status = SPIx_ReadWriteByte(reg);//发送寄存器值(位置),并读取状态值
    for(u8_ctr=0; u8_ctr<len; u8_ctr++)
    {
        SPIx_ReadWriteByte(*pBuf++); //写入数据	
    }
    NRF24L01_CSN = 1;       //关闭SPI传输
    return status;          //返回读到的状态值
}
//******************************************************************************


//******************************************************************************
//在指定位置读出指定长度的数据
//reg:寄存器(位置)
//*pBuf:数据指针
//len:数据长度
//返回值,此次读到的状态寄存器值 
//******************************************************************************
unsigned char NRF24L01_Read_Buf(unsigned char reg,unsigned char *pBuf,unsigned char len)
{
    unsigned char status,u8_ctr;	       
    NRF24L01_CSN = 0;           //使能SPI传输
    status = SPIx_ReadWriteByte(reg);//发送寄存器值(位置),并读取状态值 
    //SPIx_ReadWriteByte(0xff);
    for(u8_ctr = 0;u8_ctr<len;u8_ctr++)
    {
        pBuf[u8_ctr] = SPIx_ReadWriteByte(0xff);//读出数据0XFF
    }
    NRF24L01_CSN = 1;       //关闭SPI传输
    return status;        //返回读到的状态值
}
//******************************************************************************


//******************************************************************************
//检测24L01是否存在
//返回值:0，成功;1，失败
//******************************************************************************	
unsigned char NRF24L01_Check(void)
{
    unsigned char buf[5]={0xa5,0xa5,0xa5,0xa5,0xa5};
    unsigned char i;
    NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,buf,5); //写入5个字节的地址.	
    NRF24L01_Read_Buf(TX_ADDR,buf,5); //读出写入的地址  
    for(i=0;i<5;i++)
        if(buf[i]!=0xa5)
            break;	 							  
    if(i!=5)
        return 1;//检测24L01错误	
    return 0;		 //检测到24L01
}
//******************************************************************************


//******************************************************************************
//SPI写寄存器
//reg:指定寄存器地址
//value:写入的值
//******************************************************************************
unsigned char NRF24L01_Write_Reg(unsigned char reg,unsigned char value)
{
    unsigned char status;	
    NRF24L01_CSN=0;                 //使能SPI传输
    status =SPIx_ReadWriteByte(reg);//发送寄存器号 
    SPIx_ReadWriteByte(value);      //写入寄存器的值
    NRF24L01_CSN=1;                 //禁止SPI传输	   
    return(status);       			//返回状态值
}
//******************************************************************************


//******************************************************************************
//读取SPI寄存器值
//reg:要读的寄存器
//******************************************************************************
unsigned char NRF24L01_Read_Reg(unsigned char reg)
{
    unsigned char reg_val;	    
    NRF24L01_CSN = 0;          //使能SPI传输		
    SPIx_ReadWriteByte(reg);   //发送寄存器号
    reg_val=SPIx_ReadWriteByte(0xFF);//读取寄存器内容0XFF
    NRF24L01_CSN = 1;          //禁止SPI传输		    
    return(reg_val);           //返回状态值
}
//******************************************************************************


//******************************************************************************
//启动NRF24L01发送一次数据
//txbuf:待发送数据首地址
//返回值:0，接收完成；其他，错误代码
//******************************************************************************
unsigned char NRF24L01_RxPacket(unsigned char *rxbuf)
{
    unsigned char sta;		    							     
    sta = NRF24L01_Read_Reg(STATUS);  //读取状态寄存器的值  
    NRF24L01_Write_Reg(WRITE_REG+STATUS,sta); //清除TX_DS或MAX_RT中断标志
    if(sta & RX_OK)//接收到数据
    {
		NRF24L01_CE = 0;
        NRF24L01_Read_Buf(RD_RX_PLOAD,rxbuf,RX_PLOAD_WIDTH);//读取数据
        NRF24L01_Write_Reg(FLUSH_RX,0xff);//清除RX FIFO寄存器 
		NRF24L01_CE = 1;
        return 0; 
    }
    return 1;//没收到任何数据
}
//******************************************************************************


//******************************************************************************
//启动NRF24L01发送一次数据
//txbuf:待发送数据首地址
//返回值:发送完成状况
//******************************************************************************
unsigned char NRF24L01_TxPacket(unsigned char *txbuf)
{
	//static unsigned char RDlength;
    unsigned char sta;
    unsigned int i;
    
    NRF24L01_Write_Buf(WR_TX_PLOAD,txbuf,TX_PLOAD_WIDTH);//写数据到TX BUF  32个字节
    NRF24L01_CE = 1;//启动发送	
	_delay_us(140);
    //Printf();
    //while(NRF24L01_IRQ == 1);//等待发送完成
    for(i = 0;i < 500;i++)  //203us
    {
        if(NRF24L01_IRQ == 0) 
        {
            //Printf();
            break;
        }
    }
	_delay_us(800);
	NRF24L01_CE = 0;
	
    sta = NRF24L01_Read_Reg(STATUS);  //读取状态寄存器的值	   
    NRF24L01_Write_Reg(WRITE_REG+STATUS,sta); //清除TX_DS或MAX_RT中断标志

    //Printf("DS16(0,102,'NRF_Statu = %02x',12);\n\r",sta);
    
	NRF24L01_Read_Buf(RD_RX_PLOAD,RD_Array,RX_PLOAD_WIDTH);//读取数据
	NRF24L01_Write_Reg(FLUSH_RX,0xff);//清除RX FIFO寄存器
	
    //if((sta & MAX_TX) || (sta & FULL_TX))//达到最大重发次数
	if(sta & MAX_TX)//达到最大重发次数
    {
        NRF24L01_Write_Reg(FLUSH_TX,0xff);//清除TX FIFO寄存器 
        return MAX_TX; 
    }	
    
    if(sta & TX_OK)//发送完成
    {
		if(CheckRecData() == 1)
		{
			msg.pInf = RD_Array;
			msg.datalenth = RX_PLOAD_WIDTH;
			msg.time = globetimer;
			msg.id = sta;
			enQueue(&queSEND, &msg);
			
			return RX_OK;
		}
		else
		{
			//printf("DS16(0,85,'Check Err: %ld',12);\n\r",count_err++);
			return 0x0f;	
		}
    }
	//NRF24L01_Write_Reg(FLUSH_TX,0xff);//清除TX FIFO寄存器 
    return 0x00;//其他原因发送失败
}
//******************************************************************************


//******************************************************************************
//该函数初始化NRF24L01到TX模式
//设置TX地址,写TX数据宽度,设置RX自动应答的地址,填充TX发送数据,选择RF频道,波特率和LNA HCURR
//PWR_UP,CRC使能
//当CE变高后,即进入RX模式,并可以接收数据了		   
//CE为高大于10us,则启动发送.
//******************************************************************************	 
void TX_Mode(void)
{														 
    NRF24L01_CE = 0;
    NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）      
    NRF24L01_Write_Reg(FLUSH_TX,0x00);//清除RX FIFO寄存器（20160426加调试）
	
    NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,(unsigned char*)RX_ADDRESS_0,TX_ADR_WIDTH);//写TX节点地址  
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,(unsigned char*)RX_ADDRESS_0,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS_1,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
	NRF24L01_Write_Reg(WRITE_REG+RX_PW_P0,RX_PLOAD_WIDTH);//选择通道0的有效数据宽度 
    //NRF24L01_Write_Reg(WRITE_REG+RX_PW_P1,RX_PLOAD_WIDTH);//选择通道0的有效数据宽度
	
    NRF24L01_Write_Reg(WRITE_REG+EN_AA,0x03);     //使能通道1的自动应答    
    NRF24L01_Write_Reg(WRITE_REG+EN_RXADDR,0x03); //使能通道2的接收地址  
    NRF24L01_Write_Reg(WRITE_REG+SETUP_RETR,0x2a);//设置自动重发间隔时间:750us;最大自动重发次数:10次
    NRF24L01_Write_Reg(WRITE_REG+RF_CH,20);       //设置RF通道为40
    NRF24L01_Write_Reg(WRITE_REG+RF_SETUP,0x0f);  //设置TX发射参数,0db增益,2Mbps,低噪声增益开启 
    
	//NRF24L01_Write_Buf(WRITE_REG+W_ACK_PAYLOAD_P0,RX_ADDRESS_0,5);//写RX节点地址

	NRF24L01_Write_Reg(WRITE_REG+FEATURE,0x06);
    NRF24L01_Write_Reg(WRITE_REG+DYNDP,0x03);
	
	NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //配置基本工作模式的参数;PWR_UP,EN_CRC,8BIT_CRC,发射模式,开启所有中断
    NRF24L01_CE = 1;//CE为高,10us后启动发送
	_delay_us(140);
}	
//******************************************************************************


//******************************************************************************
void TX_P0_SET()
{
	NRF24L01_CE = 0;//CE为高,10us后启动发送
	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）      
    NRF24L01_Write_Reg(FLUSH_TX,0x00);//清除RX FIFO寄存器（20160426加调试）
	NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,RX_ADDRESS_0,TX_ADR_WIDTH);//写TX节点地址
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_0,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
	
	//NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,(unsigned char*)RX_ADDRESS_0,TX_ADR_WIDTH);//写TX节点地址
	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,(unsigned char*)RX_ADDRESS_0,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
	flag_p = 2;
	NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //配置基本工作模式的参数;PWR_UP,EN_CRC,8BIT_CRC,发射模式,开启所有中断
	NRF24L01_CE = 1;//CE为高,10us后启动发送
	_delay_us(10);
}
//******************************************************************************


//******************************************************************************
void TX_PADRESS_SET(unsigned char pairadr[])
{
	unsigned char address[6] = {0};
	strncpy((char*)address,(char*)pairadr,5);
	NRF24L01_CE = 0;//CE为高,10us后启动发送
	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）      
    NRF24L01_Write_Reg(FLUSH_TX,0x00);//清除RX FIFO寄存器（20160426加调试）
	NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,address,TX_ADR_WIDTH);//写TX节点地址
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,address,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
	
	//NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,(unsigned char*)address,TX_ADR_WIDTH);//写TX节点地址
	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,(unsigned char*)address,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
	NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //配置基本工作模式的参数;PWR_UP,EN_CRC,8BIT_CRC,发射模式,开启所有中断
	NRF24L01_CE = 1;//CE为高,10us后启动发送
	_delay_us(10);
}
//******************************************************************************


//******************************************************************************
void TX_P1_SET()
{
	NRF24L01_CE = 0;//CE为高,10us后启动发送
	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）      
    NRF24L01_Write_Reg(FLUSH_TX,0x00);//清除RX FIFO寄存器（20160426加调试）
	NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,RX_ADDRESS_1,TX_ADR_WIDTH);//写TX节点地址
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_1,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
	
	//NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,(unsigned char*)RX_ADDRESS_1,TX_ADR_WIDTH);//写TX节点地址
	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,(unsigned char*)RX_ADDRESS_1,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
	NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //配置基本工作模式的参数;PWR_UP,EN_CRC,8BIT_CRC,发射模式,开启所有中断
	NRF24L01_CE = 1;//CE为高,10us后启动发送
	_delay_us(10);
}
//******************************************************************************


//******************************************************************************
void TX_P_SET(const unsigned char P_Child_Num)
{
	 switch(P_Child_Num)
	  {
		case 1:
			strncpy((char*)RX_ADDRESS,(char*)RX_ADDRESS_1,5);
			break;
		case 2:
			strncpy((char*)RX_ADDRESS,(char*)RX_ADDRESS_2,5);
			break;
		case 3:
			strncpy((char*)RX_ADDRESS,(char*)RX_ADDRESS_3,5);
			break;
		case 4:
			strncpy((char*)RX_ADDRESS,(char*)RX_ADDRESS_4,5);
			break;
		case 5:
			strncpy((char*)RX_ADDRESS,(char*)RX_ADDRESS_5,5);
			break;
		default:
		  break;
	  }
	flag_p = 3;
	NRF24L01_CE = 0;//CE为高,10us后启动发送
	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）      
    NRF24L01_Write_Reg(FLUSH_TX,0x00);//清除RX FIFO寄存器（20160426加调试）
	//NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,(unsigned char*)RX_ADDRESS,TX_ADR_WIDTH);//写TX节点地址
	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,(unsigned char*)RX_ADDRESS,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
	
	NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,RX_ADDRESS,TX_ADR_WIDTH);//写TX节点地址
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
	
	NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //配置基本工作模式的参数;PWR_UP,EN_CRC,8BIT_CRC,接收模式,开启所有中断
	NRF24L01_CE = 1;//CE为高,10us后启动发送
	_delay_us(10);
}
//******************************************************************************
//无线收发数据
//******************************************************************************
void  NRF24L01Process(void)
{                 
    
}
//******************************************************************************


//******************************************************************************
//发送数据更新
//******************************************************************************
void  SendDataUpdate(void)						
{
    unsigned char i;
    unsigned int  data;
    TD_Array[0] = C_THead_T;     //发射机（接收）（接收）发送数据头码
    TD_Array[1] = TX_PLOAD_WIDTH;//发射机（接收）（接收）发送数据长度
    TD_Array[2] = 0x11; 		//本机属性
    TD_Array[3] = 0x01; 		//本机属性
    TD_Array[4] = Child_Num;    //子机编号

    TD_Array[5] = Child_Comm; 
       
    for(i=0;i<5;i++)
    {
        TD_Array[i+6] = Address[i];//配对信号地址
		TD_Array[i+11] = Address_Sure[i];//配对确认信号地址
    }
    TD_Array[16] = 0x00;     	//本机温度低位（数字）
    TD_Array[17] = 0x00;          //本机功率第四位
    TD_Array[18] = 0x00;   		//本机功率第三位
    TD_Array[19] = 0x00;    	//本机功率第二位
    TD_Array[20] = 0x00;         //本机功率第一位
    TD_Array[21] = 0x00;      	//本机故障
    TD_Array[22] = 0x00;      	//本机故障
    TD_Array[23] = 0x00;          //功率命令    
    TD_Array[24] = 0x00;        //保留
    TD_Array[25] = 0x00;        //发射机（接收）频率  
    TD_Array[26] = 0x00;   		//发射机（接收）（接收）占空比
    TD_Array[27] = 0x00;               //保留   
    TD_Array[28] = Frm_num;               //帧计数
    data =crc_cal_value(TD_Array, TX_PLOAD_WIDTH-3);
    TD_Array[TX_PLOAD_WIDTH-3] = data>>8;     //校验码高位
    TD_Array[TX_PLOAD_WIDTH-2] = data&0xff;   //校验码低位
    TD_Array[TX_PLOAD_WIDTH-1] = 0x2b;			//发射机（接收）发送数据结束码
}
//******************************************************************************


//******************************************************************************
//接收数据是否正确
//******************************************************************************
unsigned char  CheckRecData(void)						
{
    unsigned char j,crcl,crch;
    unsigned int  data;
    if((RD_Array[0]==C_THead_T)&&(RD_Array[RX_PLOAD_WIDTH-1]==C_TEnd_T))
    {
        data =crc_cal_value(RD_Array, RX_PLOAD_WIDTH-3);
        crcl=data&0xff;
        crch=data>>8;
        if((RD_Array[RX_PLOAD_WIDTH-3]==crch)&&(RD_Array[RX_PLOAD_WIDTH-2]==crcl))
        {
			Child_Comm_Back = RD_Array[5];
			Child_Count_Num_Back = TD_Array[4];
			if(Child_Comm_Back == 0xCC)
			{
				for(int i = 0;i <5;i++)
					Address4Check[i] = RD_Array[i+6];
			}
            j=1;
        }
        else
        {
            j=0;
        }
    }
    else
    {
        j=0;
    }
    return j;
}
//******************************************************************************


//******************************************************************************
/*供电状态接收数据*/  /*Mode_Rec_Send(0表示发送，1表示接收）*/
//******************************************************************************
void NRF24L01_Send_Data(void)
{
   
}
//******************************************************************************


//******************************************************************************
//CRC
//******************************************************************************
unsigned int crc_cal_value(unsigned char *data_value, unsigned char data_length)
{
    unsigned int i;
    unsigned int crc_value=0xffff;		
    while(data_length--) 
    {
        crc_value^=*data_value++;
        for(i=0;i<8;i++) 
        {
            if(crc_value&0x0001)
                crc_value=(crc_value>>1)^0xa001;
            else
                crc_value=crc_value>>1;
        }
    }		
    return(crc_value);
}
//******************************************************************************


//******************************************************************************
//清零相关变量
//******************************************************************************
void  Clear_Nrf24l01(void)
{
    unsigned char i;
    for(i=0;i<32;i++)
    {
        RD_Array[i] = 0;
        TD_Array[i] = 0;
    }
}
//******************************************************************************


//******************************************************************************
/*供电状态接收数据*/  /*Mode_Rec_Send(0表示发送，1表示接收）*/
//******************************************************************************
unsigned char  NRF24L01_read_Data(void)
{
   
    return 0;
}
//******************************************************************************


//******************************************************************************
/*供电状态收发数据*/   /*Mode_Rec_Send(0表示发送，1表示接收）*/
//******************************************************************************
void Rec_Send_data(void)//供电状态收发数据
{
    
}
//******************************************************************************
// Write the ack payload of the pipe 0

//******************************************************************************
/*配置NRF24L01模块自动应答*/
//******************************************************************************
unsigned char nrfWriteAck(unsigned int pipe, unsigned char *buffer, int len)
{
	unsigned char status,i;

	NRF24L01_CSN = 0;//使能SPI传输
	/* Send the read command with the address */
	status = SPIx_ReadWriteByte(0xA8 | pipe);
	/* Read LEN bytes */
	for(i=0; i<len; i++)
	  SPIx_ReadWriteByte(*buffer++);
	NRF24L01_CSN = 1;//禁止SPI传输
  return status;
}
// Return the payload length
unsigned char nrfRxLength()
{
	unsigned char length;

	NRF24L01_CSN = 0;//使能SPI传输
	SPIx_ReadWriteByte(R_RX_PL_WID);
	length = SPIx_ReadWriteByte(0xff);
	NRF24L01_CSN = 1;//禁止SPI传输
	return length;
}
//******************************************************************************
/*配置NRF24L01模块到公共发送模式*/
//******************************************************************************
void  Set_TX_Com_Mode(void)//设置公共发送模式
{
    Num_RF = 0x20;//设置公共通信频率
    TX_Mode();
}
//******************************************************************************
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/
