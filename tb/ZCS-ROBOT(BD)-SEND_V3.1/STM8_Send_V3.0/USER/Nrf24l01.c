/******************************************************************************/
/*					                                      */
/*	Project Name :	����������գ�		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*  Date	     :	2016/04/26	                                      */
/*	Corporation  :	�лݴ��ǣ����ڣ����߹��缼�����޹�˾                  */
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
//SPIx ��дһ���ֽ�
//TxData:Ҫд����ֽ�
//����ֵ:��ȡ�����ֽ�
//******************************************************************************
unsigned char SPIx_ReadWriteByte(unsigned char TxData)
{		
    unsigned char retry=0;
    while(SPI_SR_TXE == 0)//�ȴ���������	
    {
        retry++;
        if(retry>200)
	  return 0;
    }				  
    SPI_DR = TxData;	 	  //����һ��byte 
    retry=0;

    while(SPI_SR_RXNE == 0) //�ȴ�������һ��byte  
    {
        retry++;
        if(retry>200)
            return 0;
    }	  						    
    return SPI_DR;          //�����յ�������

}
//******************************************************************************


//******************************************************************************
//��ʼ��24L01
//******************************************************************************
void NRF24L01_Init(void)
{
    SPIx_ReadWriteByte(0xff);//��������
    NRF24L01_CE = 0; 	//ʹ��24L01
    NRF24L01_CSN = 1;	//SPIƬѡȡ��	
}
//******************************************************************************


//******************************************************************************
//��ָ��λ��дָ�����ȵ�����
//reg:�Ĵ���(λ��)
//*pBuf:����ָ��
//len:���ݳ���
//����ֵ,�˴ζ�����״̬�Ĵ���ֵ
//******************************************************************************
unsigned char NRF24L01_Write_Buf(unsigned char reg, unsigned char *pBuf, unsigned char len)
{
    unsigned char status,u8_ctr;	    
    NRF24L01_CSN = 0;          //ʹ��SPI����
    status = SPIx_ReadWriteByte(reg);//���ͼĴ���ֵ(λ��),����ȡ״ֵ̬
    for(u8_ctr=0; u8_ctr<len; u8_ctr++)
    {
        SPIx_ReadWriteByte(*pBuf++); //д������	
    }
    NRF24L01_CSN = 1;       //�ر�SPI����
    return status;          //���ض�����״ֵ̬
}
//******************************************************************************


//******************************************************************************
//��ָ��λ�ö���ָ�����ȵ�����
//reg:�Ĵ���(λ��)
//*pBuf:����ָ��
//len:���ݳ���
//����ֵ,�˴ζ�����״̬�Ĵ���ֵ 
//******************************************************************************
unsigned char NRF24L01_Read_Buf(unsigned char reg,unsigned char *pBuf,unsigned char len)
{
    unsigned char status,u8_ctr;	       
    NRF24L01_CSN = 0;           //ʹ��SPI����
    status = SPIx_ReadWriteByte(reg);//���ͼĴ���ֵ(λ��),����ȡ״ֵ̬ 
    //SPIx_ReadWriteByte(0xff);
    for(u8_ctr = 0;u8_ctr<len;u8_ctr++)
    {
        pBuf[u8_ctr] = SPIx_ReadWriteByte(0xff);//��������0XFF
    }
    NRF24L01_CSN = 1;       //�ر�SPI����
    return status;        //���ض�����״ֵ̬
}
//******************************************************************************


//******************************************************************************
//���24L01�Ƿ����
//����ֵ:0���ɹ�;1��ʧ��
//******************************************************************************	
unsigned char NRF24L01_Check(void)
{
    unsigned char buf[5]={0xa5,0xa5,0xa5,0xa5,0xa5};
    unsigned char i;
    NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,buf,5); //д��5���ֽڵĵ�ַ.	
    NRF24L01_Read_Buf(TX_ADDR,buf,5); //����д��ĵ�ַ  
    for(i=0;i<5;i++)
        if(buf[i]!=0xa5)
            break;	 							  
    if(i!=5)
        return 1;//���24L01����	
    return 0;		 //��⵽24L01
}
//******************************************************************************


//******************************************************************************
//SPIд�Ĵ���
//reg:ָ���Ĵ�����ַ
//value:д���ֵ
//******************************************************************************
unsigned char NRF24L01_Write_Reg(unsigned char reg,unsigned char value)
{
    unsigned char status;	
    NRF24L01_CSN=0;                 //ʹ��SPI����
    status =SPIx_ReadWriteByte(reg);//���ͼĴ����� 
    SPIx_ReadWriteByte(value);      //д��Ĵ�����ֵ
    NRF24L01_CSN=1;                 //��ֹSPI����	   
    return(status);       			//����״ֵ̬
}
//******************************************************************************


//******************************************************************************
//��ȡSPI�Ĵ���ֵ
//reg:Ҫ���ļĴ���
//******************************************************************************
unsigned char NRF24L01_Read_Reg(unsigned char reg)
{
    unsigned char reg_val;	    
    NRF24L01_CSN = 0;          //ʹ��SPI����		
    SPIx_ReadWriteByte(reg);   //���ͼĴ�����
    reg_val=SPIx_ReadWriteByte(0xFF);//��ȡ�Ĵ�������0XFF
    NRF24L01_CSN = 1;          //��ֹSPI����		    
    return(reg_val);           //����״ֵ̬
}
//******************************************************************************


//******************************************************************************
//����NRF24L01����һ������
//txbuf:�����������׵�ַ
//����ֵ:0��������ɣ��������������
//******************************************************************************
unsigned char NRF24L01_RxPacket(unsigned char *rxbuf)
{
    unsigned char sta;		    							     
    sta = NRF24L01_Read_Reg(STATUS);  //��ȡ״̬�Ĵ�����ֵ  
    NRF24L01_Write_Reg(WRITE_REG+STATUS,sta); //���TX_DS��MAX_RT�жϱ�־
    if(sta & RX_OK)//���յ�����
    {
		NRF24L01_CE = 0;
        NRF24L01_Read_Buf(RD_RX_PLOAD,rxbuf,RX_PLOAD_WIDTH);//��ȡ����
        NRF24L01_Write_Reg(FLUSH_RX,0xff);//���RX FIFO�Ĵ��� 
		NRF24L01_CE = 1;
        return 0; 
    }
    return 1;//û�յ��κ�����
}
//******************************************************************************


//******************************************************************************
//����NRF24L01����һ������
//txbuf:�����������׵�ַ
//����ֵ:�������״��
//******************************************************************************
unsigned char NRF24L01_TxPacket(unsigned char *txbuf)
{
	//static unsigned char RDlength;
    unsigned char sta;
    unsigned int i;
    
    NRF24L01_Write_Buf(WR_TX_PLOAD,txbuf,TX_PLOAD_WIDTH);//д���ݵ�TX BUF  32���ֽ�
    NRF24L01_CE = 1;//��������	
	_delay_us(140);
    //Printf();
    //while(NRF24L01_IRQ == 1);//�ȴ��������
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
	
    sta = NRF24L01_Read_Reg(STATUS);  //��ȡ״̬�Ĵ�����ֵ	   
    NRF24L01_Write_Reg(WRITE_REG+STATUS,sta); //���TX_DS��MAX_RT�жϱ�־

    //Printf("DS16(0,102,'NRF_Statu = %02x',12);\n\r",sta);
    
	NRF24L01_Read_Buf(RD_RX_PLOAD,RD_Array,RX_PLOAD_WIDTH);//��ȡ����
	NRF24L01_Write_Reg(FLUSH_RX,0xff);//���RX FIFO�Ĵ���
	
    //if((sta & MAX_TX) || (sta & FULL_TX))//�ﵽ����ط�����
	if(sta & MAX_TX)//�ﵽ����ط�����
    {
        NRF24L01_Write_Reg(FLUSH_TX,0xff);//���TX FIFO�Ĵ��� 
        return MAX_TX; 
    }	
    
    if(sta & TX_OK)//�������
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
	//NRF24L01_Write_Reg(FLUSH_TX,0xff);//���TX FIFO�Ĵ��� 
    return 0x00;//����ԭ����ʧ��
}
//******************************************************************************


//******************************************************************************
//�ú�����ʼ��NRF24L01��TXģʽ
//����TX��ַ,дTX���ݿ��,����RX�Զ�Ӧ��ĵ�ַ,���TX��������,ѡ��RFƵ��,�����ʺ�LNA HCURR
//PWR_UP,CRCʹ��
//��CE��ߺ�,������RXģʽ,�����Խ���������		   
//CEΪ�ߴ���10us,����������.
//******************************************************************************	 
void TX_Mode(void)
{														 
    NRF24L01_CE = 0;
    NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //���TX_DS��MAX_RT�жϱ�־��20160426�ӵ��ԣ�      
    NRF24L01_Write_Reg(FLUSH_TX,0x00);//���RX FIFO�Ĵ�����20160426�ӵ��ԣ�
	
    NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,(unsigned char*)RX_ADDRESS_0,TX_ADR_WIDTH);//дTX�ڵ��ַ  
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,(unsigned char*)RX_ADDRESS_0,RX_ADR_WIDTH); //����TX�ڵ��ַ,��ҪΪ��ʹ��ACK
	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS_1,RX_ADR_WIDTH); //����TX�ڵ��ַ,��ҪΪ��ʹ��ACK
	NRF24L01_Write_Reg(WRITE_REG+RX_PW_P0,RX_PLOAD_WIDTH);//ѡ��ͨ��0����Ч���ݿ�� 
    //NRF24L01_Write_Reg(WRITE_REG+RX_PW_P1,RX_PLOAD_WIDTH);//ѡ��ͨ��0����Ч���ݿ��
	
    NRF24L01_Write_Reg(WRITE_REG+EN_AA,0x03);     //ʹ��ͨ��1���Զ�Ӧ��    
    NRF24L01_Write_Reg(WRITE_REG+EN_RXADDR,0x03); //ʹ��ͨ��2�Ľ��յ�ַ  
    NRF24L01_Write_Reg(WRITE_REG+SETUP_RETR,0x2a);//�����Զ��ط����ʱ��:750us;����Զ��ط�����:10��
    NRF24L01_Write_Reg(WRITE_REG+RF_CH,20);       //����RFͨ��Ϊ40
    NRF24L01_Write_Reg(WRITE_REG+RF_SETUP,0x0f);  //����TX�������,0db����,2Mbps,���������濪�� 
    
	//NRF24L01_Write_Buf(WRITE_REG+W_ACK_PAYLOAD_P0,RX_ADDRESS_0,5);//дRX�ڵ��ַ

	NRF24L01_Write_Reg(WRITE_REG+FEATURE,0x06);
    NRF24L01_Write_Reg(WRITE_REG+DYNDP,0x03);
	
	NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //���û�������ģʽ�Ĳ���;PWR_UP,EN_CRC,8BIT_CRC,����ģʽ,���������ж�
    NRF24L01_CE = 1;//CEΪ��,10us����������
	_delay_us(140);
}	
//******************************************************************************


//******************************************************************************
void TX_P0_SET()
{
	NRF24L01_CE = 0;//CEΪ��,10us����������
	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //���TX_DS��MAX_RT�жϱ�־��20160426�ӵ��ԣ�      
    NRF24L01_Write_Reg(FLUSH_TX,0x00);//���RX FIFO�Ĵ�����20160426�ӵ��ԣ�
	NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,RX_ADDRESS_0,TX_ADR_WIDTH);//дTX�ڵ��ַ
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_0,RX_ADR_WIDTH); //����TX�ڵ��ַ,��ҪΪ��ʹ��ACK
	
	//NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,(unsigned char*)RX_ADDRESS_0,TX_ADR_WIDTH);//дTX�ڵ��ַ
	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,(unsigned char*)RX_ADDRESS_0,RX_ADR_WIDTH); //����TX�ڵ��ַ,��ҪΪ��ʹ��ACK
	flag_p = 2;
	NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //���û�������ģʽ�Ĳ���;PWR_UP,EN_CRC,8BIT_CRC,����ģʽ,���������ж�
	NRF24L01_CE = 1;//CEΪ��,10us����������
	_delay_us(10);
}
//******************************************************************************


//******************************************************************************
void TX_PADRESS_SET(unsigned char pairadr[])
{
	unsigned char address[6] = {0};
	strncpy((char*)address,(char*)pairadr,5);
	NRF24L01_CE = 0;//CEΪ��,10us����������
	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //���TX_DS��MAX_RT�жϱ�־��20160426�ӵ��ԣ�      
    NRF24L01_Write_Reg(FLUSH_TX,0x00);//���RX FIFO�Ĵ�����20160426�ӵ��ԣ�
	NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,address,TX_ADR_WIDTH);//дTX�ڵ��ַ
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,address,RX_ADR_WIDTH); //����TX�ڵ��ַ,��ҪΪ��ʹ��ACK
	
	//NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,(unsigned char*)address,TX_ADR_WIDTH);//дTX�ڵ��ַ
	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,(unsigned char*)address,RX_ADR_WIDTH); //����TX�ڵ��ַ,��ҪΪ��ʹ��ACK
	NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //���û�������ģʽ�Ĳ���;PWR_UP,EN_CRC,8BIT_CRC,����ģʽ,���������ж�
	NRF24L01_CE = 1;//CEΪ��,10us����������
	_delay_us(10);
}
//******************************************************************************


//******************************************************************************
void TX_P1_SET()
{
	NRF24L01_CE = 0;//CEΪ��,10us����������
	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //���TX_DS��MAX_RT�жϱ�־��20160426�ӵ��ԣ�      
    NRF24L01_Write_Reg(FLUSH_TX,0x00);//���RX FIFO�Ĵ�����20160426�ӵ��ԣ�
	NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,RX_ADDRESS_1,TX_ADR_WIDTH);//дTX�ڵ��ַ
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_1,RX_ADR_WIDTH); //����TX�ڵ��ַ,��ҪΪ��ʹ��ACK
	
	//NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,(unsigned char*)RX_ADDRESS_1,TX_ADR_WIDTH);//дTX�ڵ��ַ
	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,(unsigned char*)RX_ADDRESS_1,RX_ADR_WIDTH); //����TX�ڵ��ַ,��ҪΪ��ʹ��ACK
	NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //���û�������ģʽ�Ĳ���;PWR_UP,EN_CRC,8BIT_CRC,����ģʽ,���������ж�
	NRF24L01_CE = 1;//CEΪ��,10us����������
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
	NRF24L01_CE = 0;//CEΪ��,10us����������
	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //���TX_DS��MAX_RT�жϱ�־��20160426�ӵ��ԣ�      
    NRF24L01_Write_Reg(FLUSH_TX,0x00);//���RX FIFO�Ĵ�����20160426�ӵ��ԣ�
	//NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,(unsigned char*)RX_ADDRESS,TX_ADR_WIDTH);//дTX�ڵ��ַ
	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,(unsigned char*)RX_ADDRESS,RX_ADR_WIDTH); //����TX�ڵ��ַ,��ҪΪ��ʹ��ACK
	
	NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,RX_ADDRESS,TX_ADR_WIDTH);//дTX�ڵ��ַ
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS,RX_ADR_WIDTH); //����TX�ڵ��ַ,��ҪΪ��ʹ��ACK
	
	NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //���û�������ģʽ�Ĳ���;PWR_UP,EN_CRC,8BIT_CRC,����ģʽ,���������ж�
	NRF24L01_CE = 1;//CEΪ��,10us����������
	_delay_us(10);
}
//******************************************************************************
//�����շ�����
//******************************************************************************
void  NRF24L01Process(void)
{                 
    
}
//******************************************************************************


//******************************************************************************
//�������ݸ���
//******************************************************************************
void  SendDataUpdate(void)						
{
    unsigned char i;
    unsigned int  data;
    TD_Array[0] = C_THead_T;     //����������գ������գ���������ͷ��
    TD_Array[1] = TX_PLOAD_WIDTH;//����������գ������գ��������ݳ���
    TD_Array[2] = 0x11; 		//��������
    TD_Array[3] = 0x01; 		//��������
    TD_Array[4] = Child_Num;    //�ӻ����

    TD_Array[5] = Child_Comm; 
       
    for(i=0;i<5;i++)
    {
        TD_Array[i+6] = Address[i];//����źŵ�ַ
		TD_Array[i+11] = Address_Sure[i];//���ȷ���źŵ�ַ
    }
    TD_Array[16] = 0x00;     	//�����¶ȵ�λ�����֣�
    TD_Array[17] = 0x00;          //�������ʵ���λ
    TD_Array[18] = 0x00;   		//�������ʵ���λ
    TD_Array[19] = 0x00;    	//�������ʵڶ�λ
    TD_Array[20] = 0x00;         //�������ʵ�һλ
    TD_Array[21] = 0x00;      	//��������
    TD_Array[22] = 0x00;      	//��������
    TD_Array[23] = 0x00;          //��������    
    TD_Array[24] = 0x00;        //����
    TD_Array[25] = 0x00;        //����������գ�Ƶ��  
    TD_Array[26] = 0x00;   		//����������գ������գ�ռ�ձ�
    TD_Array[27] = 0x00;               //����   
    TD_Array[28] = Frm_num;               //֡����
    data =crc_cal_value(TD_Array, TX_PLOAD_WIDTH-3);
    TD_Array[TX_PLOAD_WIDTH-3] = data>>8;     //У�����λ
    TD_Array[TX_PLOAD_WIDTH-2] = data&0xff;   //У�����λ
    TD_Array[TX_PLOAD_WIDTH-1] = 0x2b;			//����������գ��������ݽ�����
}
//******************************************************************************


//******************************************************************************
//���������Ƿ���ȷ
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
/*����״̬��������*/  /*Mode_Rec_Send(0��ʾ���ͣ�1��ʾ���գ�*/
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
//������ر���
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
/*����״̬��������*/  /*Mode_Rec_Send(0��ʾ���ͣ�1��ʾ���գ�*/
//******************************************************************************
unsigned char  NRF24L01_read_Data(void)
{
   
    return 0;
}
//******************************************************************************


//******************************************************************************
/*����״̬�շ�����*/   /*Mode_Rec_Send(0��ʾ���ͣ�1��ʾ���գ�*/
//******************************************************************************
void Rec_Send_data(void)//����״̬�շ�����
{
    
}
//******************************************************************************
// Write the ack payload of the pipe 0

//******************************************************************************
/*����NRF24L01ģ���Զ�Ӧ��*/
//******************************************************************************
unsigned char nrfWriteAck(unsigned int pipe, unsigned char *buffer, int len)
{
	unsigned char status,i;

	NRF24L01_CSN = 0;//ʹ��SPI����
	/* Send the read command with the address */
	status = SPIx_ReadWriteByte(0xA8 | pipe);
	/* Read LEN bytes */
	for(i=0; i<len; i++)
	  SPIx_ReadWriteByte(*buffer++);
	NRF24L01_CSN = 1;//��ֹSPI����
  return status;
}
// Return the payload length
unsigned char nrfRxLength()
{
	unsigned char length;

	NRF24L01_CSN = 0;//ʹ��SPI����
	SPIx_ReadWriteByte(R_RX_PL_WID);
	length = SPIx_ReadWriteByte(0xff);
	NRF24L01_CSN = 1;//��ֹSPI����
	return length;
}
//******************************************************************************
/*����NRF24L01ģ�鵽��������ģʽ*/
//******************************************************************************
void  Set_TX_Com_Mode(void)//���ù�������ģʽ
{
    Num_RF = 0x20;//���ù���ͨ��Ƶ��
    TX_Mode();
}
//******************************************************************************
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/
