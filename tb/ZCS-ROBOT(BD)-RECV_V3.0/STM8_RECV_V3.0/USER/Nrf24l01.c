/******************************************************************************/
/*					                                      */
/*	Project Name :	发射机		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
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
#include "string.h"
#include "delayTime.h"
#define _DEBUG_TEST
//#undef  _DEBUG_TEST

#define Target 0x1101  //C_Bettery_Charging

unsigned char RX_ADDRESS_0[5] = {0xEB,0xBE,0xEB,0xBE,0xEB};
unsigned char RX_ADDRESS_1[5] = {0x01,0xB3,0xB4,0xB5,0xB6};
unsigned char RX_ADDRESS_2[5] = {0x02,0xB3,0xB4,0xB5,0xB6};
unsigned char RX_ADDRESS_3[5] = {0x03,0xB3,0xB4,0xB5,0xB6};
unsigned char RX_ADDRESS_4[5] = {0x04,0xB3,0xB4,0xB5,0xB6};
unsigned char RX_ADDRESS_5[5] = {0x05,0xB3,0xB4,0xB5,0xB6};
unsigned char RX_ADDRESS_N[5] = {0xaa,0xbb,0xcc,0xdd,0xee};



//******************************************************************************
//SPIx 读写一个字节
//TxData:要写入的字节
//返回值:读取到的字节
//******************************************************************************
unsigned char SPIx_ReadWriteByte(unsigned char TxData)
{		
    unsigned char retry=0;
    while(SPI_SR_TXE ==0)//等待发送区空	
    {
        retry++;
        if(retry>200)return 0;
    }				  
    SPI_DR=TxData;	 	  //发送一个byte 
    retry=0;
    while(SPI_SR_RXNE==0) //等待接收完一个byte  
    {
        retry++;
        if(retry>200)return 0;
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
    NRF24L01_CE=0; 	//使能24L01
    NRF24L01_CSN=1;	//SPI片选取消	
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
    status=SPIx_ReadWriteByte(reg);//发送寄存器值(位置),并读取状态值   	   
    for(u8_ctr=0;u8_ctr<len;u8_ctr++)
    {
        pBuf[u8_ctr]=SPIx_ReadWriteByte(0xff);//读出数据0XFF
    }
    NRF24L01_CSN=1;       //关闭SPI传输
    return status;        //返回读到的状态值
}
//******************************************************************************


//******************************************************************************
//检测24L01是否存在
//返回值:0，成功;1，失败
//******************************************************************************	
unsigned char NRF24L01_Check(void)
{
    unsigned char buf[5]={0XEB,0XEB,0XEB,0XEB,0XEB};
    unsigned char i;
    NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,buf,5); //写入5个字节的地址.	
    NRF24L01_Read_Buf(TX_ADDR,buf,5); //读出写入的地址  
    for(i=0;i<5;i++)
        if(buf[i]!=0XEB)
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
//返回值:发送完成状况
//******************************************************************************
unsigned char NRF24L01_TxPacket(unsigned char *txbuf)
{  
    unsigned int i;
    NRF24L01_CE=0;
    NRF24L01_Write_Buf(WR_TX_PLOAD,txbuf,TX_PLOAD_WIDTH);//写数据到TX BUF  32个字节
    NRF24L01_CE=1;//启动发送
	//Delay(130);
    for(i = 0;i < 100;i++)  //203us
    {
        if(NRF24L01_IRQ == 0) 
        {
            break;
        }
    }
    return TX_OK;//其他原因发送失败
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
    NRF24L01_CE=0;
    NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）      
    NRF24L01_Write_Reg(FLUSH_TX,0x00);//清除RX FIFO寄存器（20160426加调试）

    NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,RX_ADDRESS_0,RX_ADR_WIDTH);//写TX节点地址 
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_0,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS_1,RX_ADR_WIDTH); //设置TX节点地址,主要为了使能ACK
	NRF24L01_Write_Reg(WRITE_REG+RX_PW_P0,RX_PLOAD_WIDTH);//选择通道0的有效数据宽度 
    NRF24L01_Write_Reg(WRITE_REG+RX_PW_P1,RX_PLOAD_WIDTH);//选择通道0的有效数据宽度
    
    NRF24L01_Write_Reg(WRITE_REG+EN_AA,0x3f);     //使能通道1的自动应答    
    NRF24L01_Write_Reg(WRITE_REG+EN_RXADDR,0x3f); //使能通道2的接收地址  
    NRF24L01_Write_Reg(WRITE_REG+SETUP_RETR,0x2a);//设置自动重发间隔时间:750us;最大自动重发次数:10次
    NRF24L01_Write_Reg(WRITE_REG+RF_CH,20);       //设置RF通道为40
    NRF24L01_Write_Reg(WRITE_REG+RF_SETUP,0x0f);  //设置TX发射参数,0db增益,2Mbps,低噪声增益开启 
    
    NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //配置基本工作模式的参数;PWR_UP,EN_CRC,8BIT_CRC,发送模式,开启所有中断
	
	NRF24L01_Write_Reg(WRITE_REG+FEATURE,0x06);
    NRF24L01_Write_Reg(WRITE_REG+DYNDP,0x3f);
	
    NRF24L01_CE=1;//CE为高,10us后启动发送
	_delay_us(140);
}	
//******************************************************************************

void CHECK_P_SET(const unsigned char rx_address_x[]) //充电时配对后执行
{
	strncpy((char*)RX_ADDRESS,(char*)rx_address_x,5);
	NRF24L01_CE = 0;
	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）
	NRF24L01_Write_Reg(FLUSH_TX,0x00);//清除RX FIFO寄存器（20160426加调试）
	NRF24L01_Write_Reg(FLUSH_RX,0x00);//清除RX FIFO寄存器（20160426加调试）
           
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_N,RX_ADR_WIDTH);//写RX节点地址
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS,RX_ADR_WIDTH);//写RX节点地址
	NRF24L01_Write_Reg(WRITE_REG+CONFIG, 0x0b);//配置基本工作模式的参数;PWR_UP,EN_CRC,16BIT_CRC,接收模式
	NRF24L01_CE = 1; //CE为高,进入接收模式
	_delay_us(140);
}

void RX_P_SET() //失去与主机联系时回到p0通道，同时关闭所在通道
{
	NRF24L01_CE = 0;
	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）
	NRF24L01_Write_Reg(FLUSH_TX,0x00);//清除RX FIFO寄存器（20160426加调试）
	NRF24L01_Write_Reg(FLUSH_RX,0x00);//清除RX FIFO寄存器（20160426加调试）
           
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_0,RX_ADR_WIDTH);//写RX节点地址
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS_N,RX_ADR_WIDTH);//写RX节点地址
	NRF24L01_Write_Reg(WRITE_REG+CONFIG, 0x0b);//配置基本工作模式的参数;PWR_UP,EN_CRC,16BIT_CRC,接收模式
	NRF24L01_CE = 1; //CE为高,进入接收模式
	_delay_us(140);
}
	
void CLEAR_P_SET() //充满后执行 进行频道剥离，清空频道空域
{
	NRF24L01_CE = 0;
	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）
	NRF24L01_Write_Reg(FLUSH_TX,0x00);//清除RX FIFO寄存器（20160426加调试）
	NRF24L01_Write_Reg(FLUSH_RX,0x00);//清除RX FIFO寄存器（20160426加调试）
           
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_N,RX_ADR_WIDTH);//写RX节点地址
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS_N,RX_ADR_WIDTH);//写RX节点地址
	NRF24L01_Write_Reg(WRITE_REG+CONFIG, 0x0b);//配置基本工作模式的参数;PWR_UP,EN_CRC,16BIT_CRC,接收模式 
	NRF24L01_CE = 1; //CE为高,进入接收模式
	_delay_us(140);
}

void CHECK_P0_SET() //充满点后再次充电时执行
{
	NRF24L01_CE = 0;
    NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）       
    NRF24L01_Write_Reg(FLUSH_TX,0x00);//清除RX FIFO寄存器（20160426加调试）
	NRF24L01_Write_Reg(FLUSH_RX,0x00);//清除RX FIFO寄存器（20160426加调试）
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_0,RX_ADR_WIDTH);//写RX节点地址
	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS_N,RX_ADR_WIDTH);//写RX节点地址
	NRF24L01_Write_Reg(WRITE_REG+CONFIG, 0x0b);//配置基本工作模式的参数;PWR_UP,EN_CRC,16BIT_CRC,接收模式 
	NRF24L01_CE = 1; //CE为高,进入接收模式
	_delay_us(140);
}
//******************************************************************************
//该函数初始化NRF24L01到RX模式
//设置RX地址,写RX数据宽度,选择RF频道,波特率和LNA HCURR
//当CE变高后,即进入RX模式,并可以接收数据了
//******************************************************************************		   
void RX_Mode(void)
{
	NRF24L01_CE = 0;
    NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //清除TX_DS或MAX_RT中断标志（20160426加调试）       
    NRF24L01_Write_Reg(FLUSH_RX,0x00);//清除TX FIFO寄存器（20160426加调试）
	
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_0,RX_ADR_WIDTH);//写RX节点地址
    //NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS_1,RX_ADR_WIDTH);//写RX节点地址
    /*NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P2,RX_ADDRESS_2,1);//写RX节点地址
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P3,RX_ADDRESS_3,1);//写RX节点地址
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P4,RX_ADDRESS_4,1);//写RX节点地址
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P5,RX_ADDRESS_5,1);//写RX节点地址*/
	
    NRF24L01_Write_Reg(WRITE_REG+EN_AA,0x3f);    //使能通道0的自动应答    
    NRF24L01_Write_Reg(WRITE_REG+EN_RXADDR,0x3f);//使能通道0的接收地址
	
    NRF24L01_Write_Reg(WRITE_REG+RF_CH,20);	     //设置RF通信频率		  
    
    NRF24L01_Write_Reg(WRITE_REG+RF_SETUP,0x0f);//设置TX发射参数,0db增益,1Mbps,低噪声增益开启   

	NRF24L01_Write_Reg(WRITE_REG+DYNDP,0x3f);
    NRF24L01_Write_Reg(WRITE_REG+FEATURE,0x06);
	
	NRF24L01_Write_Reg(WRITE_REG+CONFIG, 0x0b);//配置基本工作模式的参数;PWR_UP,EN_CRC,16BIT_CRC,接收模式 
	NRF24L01_CE = 1; //CE为高,进入接收模式
    _delay_us(10);
}

//******************************************************************************
//发送数据更新
//******************************************************************************
void  SendDataUpdate()						
{
    unsigned char i;
    unsigned int  data;
    TD_Array[0] = C_THead_T;            //发射机发送数据头码
    TD_Array[1] = TX_PLOAD_WIDTH;       //数据长度
    TD_Array[2] = Target >> 8;   		//本机属性
    TD_Array[3] = Target & 0xff; 		//本机属性
    TD_Array[4] = Self_Num; 			//本机状态

	TD_Array[5] = Flag_Word; 		//正常工作
	
    for(i=0;i<5;i++)
    {
        TD_Array[i+6] = self_cpd[i];	//配对信号地址
    }
    TD_Array[11] = ACVolt_DD>>8;       //本机电压高位（数字）
    TD_Array[12] = ACVolt_DD&0xff;     //本机电压低位（数字）
    TD_Array[13] = ACCurr_DD>>8;       //本机电流高位（数字）
    TD_Array[14] = ACCurr_DD&0xff;     //本机电流低位（数字）
    TD_Array[15] = ACTemp_DD>>8;       //本机温度高位（数字）
    TD_Array[16] = ACTemp_DD&0xff;     //本机温度低位（数字）
    TD_Array[17] = Power>>24;          //本机功率第四位
    TD_Array[18] = (Power>>16)&0xff;   //本机功率第三位
    TD_Array[19] = (Power>>8)&0xff;    //本机功率第二位
    TD_Array[20] = Power&0xff;         //本机功率第一位
    TD_Array[21] = TX_Pro_Code_A;      //本机故障
    TD_Array[22] = TX_Pro_Code_B;      //本机故障 
    TD_Array[23] = Statu_Word_A;        //充电完成标识
    TD_Array[24] = Statu_Word_B;         //充电状态字
    TD_Array[25] = 0x00;			   //保留  
    TD_Array[26] = 0x00;   	   		   //保留
    TD_Array[27] = 0x00;               //保留   
    TD_Array[28] = FrmNumb;   			//帧计数
    data =crc_cal_value(TD_Array, TX_PLOAD_WIDTH-3);
    TD_Array[TX_PLOAD_WIDTH-3] = data>>8;     		//校验码高位
    TD_Array[TX_PLOAD_WIDTH-2] = data&0xff;   		//校验码低位
    TD_Array[TX_PLOAD_WIDTH-1] = 0x2b;				//发射机发送数据结束码
}

	//******************************************************************************
//发送数据更新
//******************************************************************************
void  SendDataUpdate_Pair()						
{
    unsigned char i;
    unsigned int  data;
    TD_Array[0] = C_THead_T;            //发射机发送数据头码
    TD_Array[1] = TX_PLOAD_WIDTH;       //数据长度
    TD_Array[2] = Target >> 8;   		//本机属性
    TD_Array[3] = Target & 0xff; 		//本机属性
    TD_Array[4] = Self_Num; 			//本机状态
    TD_Array[5] = Master_Comm_Re; 		//正常工作
	
    for(i=0;i<5;i++)
    {
        TD_Array[i+6] = self_cpd_send[i];	//配对信号地址
		TD_Array[i+11] = master_cpd[i]; //主机地址
    }
    TD_Array[16] = 0x00;     		
    TD_Array[17] = 0x00;          	
    TD_Array[18] = 0x00;   	
    TD_Array[19] = 0x00;    
    TD_Array[20] = 0x00;    
    TD_Array[21] = 0x00;     
    TD_Array[22] = 0x00;      
    TD_Array[23] = 0x00;       
    TD_Array[24] = 0x00;        
    TD_Array[25] = 0x00;       
    TD_Array[26] = 0x00;   	   
    TD_Array[27] = 0x43;   //'C'    
    TD_Array[28] = 0x4A;   //'J'						//帧计数
    data =crc_cal_value(TD_Array, TX_PLOAD_WIDTH-3);
    TD_Array[TX_PLOAD_WIDTH-3] = data>>8;     		//校验码高位
    TD_Array[TX_PLOAD_WIDTH-2] = data&0xff;   		//校验码低位
    TD_Array[TX_PLOAD_WIDTH-1] = 0x2b;				//发射机发送数据结束码
}
		
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
			Master_Comm = RD_Array[5];
			Self_Num = RD_Array[4];
			
			if((RD_Array[27] == APLH_C) && (APLH_J == RD_Array[28]))
				CJ_SEND = 1;
			if((Master_Comm == 0xAA) || (Master_Comm == 0xBB))
			{
				for(int i = 0;i<5;i++)
				{
					if(Master_Comm == 0xAA)
					{
						master_cpd[i] = RD_Array[i+6];
						add_master_add ^= master_cpd[i];
						self_cpd[i] = RD_Array[i+11];
					}
					if(Master_Comm == 0xBB)
						self_cpd[i] = RD_Array[i+6];
				}
				j = 1;
			}
			else
				j = 0;
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
/*配置NRF24L01模块自动应答*/
//******************************************************************************
unsigned char nrfWriteAck(unsigned int pipe, unsigned char *buffer, int len)
{
  unsigned char status;
  int i;
  NRF24L01_CSN = 0;
  /* Send the read command with the address */
  status = SPIx_ReadWriteByte(0xA8 | pipe);
  /* Read LEN bytes */
  for(i=0; i<len; i++)
    SPIx_ReadWriteByte(buffer[i]);
  NRF24L01_CSN = 1;
  return status;
}
// Return the payload length
int nrfRxLength()
{
  int length;

  NRF24L01_CSN = 0;
  SPIx_ReadWriteByte(R_RX_PL_WID);
  length = SPIx_ReadWriteByte(0xff);
  NRF24L01_CSN = 1;
  return length;
}
//******************************************************************************
//新地址检查函数--目的确认是否是正确的配对地址
//******************************************************************************
int IsRightAddr(unsigned char * Resv_Address)
{
	int i = 0;
	int count = 0;
	for(int j=0;j<7;j++)
	{		
		i = strncmp((char *) Address_Rec[j],(char *)Resv_Address,5);
		if(i == 0) //相同
		{	
			break;
		 }
		else //不同
		{
			count++;
		}			  
	}
	if(count == 7)
		return 1;
	else
		return 0;
   
}
//******************************************************************************
/*配置NRF24L01模块到公共发送模式*/
//******************************************************************************
void  Set_TX_Com_Mode(void)//设置公共发送模式
{
    Num_RF = 80;//设置公共通信频率
    TX_Mode();
}
//******************************************************************************
//******************************************************************************
/*配置NRF24L01模块到公共接收模式*/
//******************************************************************************
void  Set_RX_Com_Mode(void)//设置公共接收模式
{
    Num_RF = 80;//设置公共通信频率
    RX_Mode();
}
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/