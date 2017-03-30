/******************************************************************************/
/*					                                      */
/*	Project Name :	�����		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
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
//SPIx ��дһ���ֽ�
//TxData:Ҫд����ֽ�
//����ֵ:��ȡ�����ֽ�
//******************************************************************************
unsigned char SPIx_ReadWriteByte(unsigned char TxData)
{		
    unsigned char retry=0;
    while(SPI_SR_TXE ==0)//�ȴ���������	
    {
        retry++;
        if(retry>200)return 0;
    }				  
    SPI_DR=TxData;	 	  //����һ��byte 
    retry=0;
    while(SPI_SR_RXNE==0) //�ȴ�������һ��byte  
    {
        retry++;
        if(retry>200)return 0;
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
    NRF24L01_CE=0; 	//ʹ��24L01
    NRF24L01_CSN=1;	//SPIƬѡȡ��	
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
    status=SPIx_ReadWriteByte(reg);//���ͼĴ���ֵ(λ��),����ȡ״ֵ̬   	   
    for(u8_ctr=0;u8_ctr<len;u8_ctr++)
    {
        pBuf[u8_ctr]=SPIx_ReadWriteByte(0xff);//��������0XFF
    }
    NRF24L01_CSN=1;       //�ر�SPI����
    return status;        //���ض�����״ֵ̬
}
//******************************************************************************


//******************************************************************************
//���24L01�Ƿ����
//����ֵ:0���ɹ�;1��ʧ��
//******************************************************************************	
unsigned char NRF24L01_Check(void)
{
    unsigned char buf[5]={0XEB,0XEB,0XEB,0XEB,0XEB};
    unsigned char i;
    NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,buf,5); //д��5���ֽڵĵ�ַ.	
    NRF24L01_Read_Buf(TX_ADDR,buf,5); //����д��ĵ�ַ  
    for(i=0;i<5;i++)
        if(buf[i]!=0XEB)
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
//����ֵ:�������״��
//******************************************************************************
unsigned char NRF24L01_TxPacket(unsigned char *txbuf)
{  
    unsigned int i;
    NRF24L01_CE=0;
    NRF24L01_Write_Buf(WR_TX_PLOAD,txbuf,TX_PLOAD_WIDTH);//д���ݵ�TX BUF  32���ֽ�
    NRF24L01_CE=1;//��������
	//Delay(130);
    for(i = 0;i < 100;i++)  //203us
    {
        if(NRF24L01_IRQ == 0) 
        {
            break;
        }
    }
    return TX_OK;//����ԭ����ʧ��
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
    NRF24L01_CE=0;
    NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //���TX_DS��MAX_RT�жϱ�־��20160426�ӵ��ԣ�      
    NRF24L01_Write_Reg(FLUSH_TX,0x00);//���RX FIFO�Ĵ�����20160426�ӵ��ԣ�

    NRF24L01_Write_Buf(WRITE_REG+TX_ADDR,RX_ADDRESS_0,RX_ADR_WIDTH);//дTX�ڵ��ַ 
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_0,RX_ADR_WIDTH); //����TX�ڵ��ַ,��ҪΪ��ʹ��ACK
	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS_1,RX_ADR_WIDTH); //����TX�ڵ��ַ,��ҪΪ��ʹ��ACK
	NRF24L01_Write_Reg(WRITE_REG+RX_PW_P0,RX_PLOAD_WIDTH);//ѡ��ͨ��0����Ч���ݿ�� 
    NRF24L01_Write_Reg(WRITE_REG+RX_PW_P1,RX_PLOAD_WIDTH);//ѡ��ͨ��0����Ч���ݿ��
    
    NRF24L01_Write_Reg(WRITE_REG+EN_AA,0x3f);     //ʹ��ͨ��1���Զ�Ӧ��    
    NRF24L01_Write_Reg(WRITE_REG+EN_RXADDR,0x3f); //ʹ��ͨ��2�Ľ��յ�ַ  
    NRF24L01_Write_Reg(WRITE_REG+SETUP_RETR,0x2a);//�����Զ��ط����ʱ��:750us;����Զ��ط�����:10��
    NRF24L01_Write_Reg(WRITE_REG+RF_CH,20);       //����RFͨ��Ϊ40
    NRF24L01_Write_Reg(WRITE_REG+RF_SETUP,0x0f);  //����TX�������,0db����,2Mbps,���������濪�� 
    
    NRF24L01_Write_Reg(WRITE_REG+CONFIG,0x0a); //���û�������ģʽ�Ĳ���;PWR_UP,EN_CRC,8BIT_CRC,����ģʽ,���������ж�
	
	NRF24L01_Write_Reg(WRITE_REG+FEATURE,0x06);
    NRF24L01_Write_Reg(WRITE_REG+DYNDP,0x3f);
	
    NRF24L01_CE=1;//CEΪ��,10us����������
	_delay_us(140);
}	
//******************************************************************************

void CHECK_P_SET(const unsigned char rx_address_x[]) //���ʱ��Ժ�ִ��
{
	strncpy((char*)RX_ADDRESS,(char*)rx_address_x,5);
	NRF24L01_CE = 0;
	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //���TX_DS��MAX_RT�жϱ�־��20160426�ӵ��ԣ�
	NRF24L01_Write_Reg(FLUSH_TX,0x00);//���RX FIFO�Ĵ�����20160426�ӵ��ԣ�
	NRF24L01_Write_Reg(FLUSH_RX,0x00);//���RX FIFO�Ĵ�����20160426�ӵ��ԣ�
           
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_N,RX_ADR_WIDTH);//дRX�ڵ��ַ
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS,RX_ADR_WIDTH);//дRX�ڵ��ַ
	NRF24L01_Write_Reg(WRITE_REG+CONFIG, 0x0b);//���û�������ģʽ�Ĳ���;PWR_UP,EN_CRC,16BIT_CRC,����ģʽ
	NRF24L01_CE = 1; //CEΪ��,�������ģʽ
	_delay_us(140);
}

void RX_P_SET() //ʧȥ��������ϵʱ�ص�p0ͨ����ͬʱ�ر�����ͨ��
{
	NRF24L01_CE = 0;
	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //���TX_DS��MAX_RT�жϱ�־��20160426�ӵ��ԣ�
	NRF24L01_Write_Reg(FLUSH_TX,0x00);//���RX FIFO�Ĵ�����20160426�ӵ��ԣ�
	NRF24L01_Write_Reg(FLUSH_RX,0x00);//���RX FIFO�Ĵ�����20160426�ӵ��ԣ�
           
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_0,RX_ADR_WIDTH);//дRX�ڵ��ַ
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS_N,RX_ADR_WIDTH);//дRX�ڵ��ַ
	NRF24L01_Write_Reg(WRITE_REG+CONFIG, 0x0b);//���û�������ģʽ�Ĳ���;PWR_UP,EN_CRC,16BIT_CRC,����ģʽ
	NRF24L01_CE = 1; //CEΪ��,�������ģʽ
	_delay_us(140);
}
	
void CLEAR_P_SET() //������ִ�� ����Ƶ�����룬���Ƶ������
{
	NRF24L01_CE = 0;
	NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //���TX_DS��MAX_RT�жϱ�־��20160426�ӵ��ԣ�
	NRF24L01_Write_Reg(FLUSH_TX,0x00);//���RX FIFO�Ĵ�����20160426�ӵ��ԣ�
	NRF24L01_Write_Reg(FLUSH_RX,0x00);//���RX FIFO�Ĵ�����20160426�ӵ��ԣ�
           
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_N,RX_ADR_WIDTH);//дRX�ڵ��ַ
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS_N,RX_ADR_WIDTH);//дRX�ڵ��ַ
	NRF24L01_Write_Reg(WRITE_REG+CONFIG, 0x0b);//���û�������ģʽ�Ĳ���;PWR_UP,EN_CRC,16BIT_CRC,����ģʽ 
	NRF24L01_CE = 1; //CEΪ��,�������ģʽ
	_delay_us(140);
}

void CHECK_P0_SET() //��������ٴγ��ʱִ��
{
	NRF24L01_CE = 0;
    NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //���TX_DS��MAX_RT�жϱ�־��20160426�ӵ��ԣ�       
    NRF24L01_Write_Reg(FLUSH_TX,0x00);//���RX FIFO�Ĵ�����20160426�ӵ��ԣ�
	NRF24L01_Write_Reg(FLUSH_RX,0x00);//���RX FIFO�Ĵ�����20160426�ӵ��ԣ�
	NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_0,RX_ADR_WIDTH);//дRX�ڵ��ַ
	//NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS_N,RX_ADR_WIDTH);//дRX�ڵ��ַ
	NRF24L01_Write_Reg(WRITE_REG+CONFIG, 0x0b);//���û�������ģʽ�Ĳ���;PWR_UP,EN_CRC,16BIT_CRC,����ģʽ 
	NRF24L01_CE = 1; //CEΪ��,�������ģʽ
	_delay_us(140);
}
//******************************************************************************
//�ú�����ʼ��NRF24L01��RXģʽ
//����RX��ַ,дRX���ݿ��,ѡ��RFƵ��,�����ʺ�LNA HCURR
//��CE��ߺ�,������RXģʽ,�����Խ���������
//******************************************************************************		   
void RX_Mode(void)
{
	NRF24L01_CE = 0;
    NRF24L01_Write_Reg(WRITE_REG+STATUS,0xff); //���TX_DS��MAX_RT�жϱ�־��20160426�ӵ��ԣ�       
    NRF24L01_Write_Reg(FLUSH_RX,0x00);//���TX FIFO�Ĵ�����20160426�ӵ��ԣ�
	
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P0,RX_ADDRESS_0,RX_ADR_WIDTH);//дRX�ڵ��ַ
    //NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P1,RX_ADDRESS_1,RX_ADR_WIDTH);//дRX�ڵ��ַ
    /*NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P2,RX_ADDRESS_2,1);//дRX�ڵ��ַ
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P3,RX_ADDRESS_3,1);//дRX�ڵ��ַ
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P4,RX_ADDRESS_4,1);//дRX�ڵ��ַ
    NRF24L01_Write_Buf(WRITE_REG+RX_ADDR_P5,RX_ADDRESS_5,1);//дRX�ڵ��ַ*/
	
    NRF24L01_Write_Reg(WRITE_REG+EN_AA,0x3f);    //ʹ��ͨ��0���Զ�Ӧ��    
    NRF24L01_Write_Reg(WRITE_REG+EN_RXADDR,0x3f);//ʹ��ͨ��0�Ľ��յ�ַ
	
    NRF24L01_Write_Reg(WRITE_REG+RF_CH,20);	     //����RFͨ��Ƶ��		  
    
    NRF24L01_Write_Reg(WRITE_REG+RF_SETUP,0x0f);//����TX�������,0db����,1Mbps,���������濪��   

	NRF24L01_Write_Reg(WRITE_REG+DYNDP,0x3f);
    NRF24L01_Write_Reg(WRITE_REG+FEATURE,0x06);
	
	NRF24L01_Write_Reg(WRITE_REG+CONFIG, 0x0b);//���û�������ģʽ�Ĳ���;PWR_UP,EN_CRC,16BIT_CRC,����ģʽ 
	NRF24L01_CE = 1; //CEΪ��,�������ģʽ
    _delay_us(10);
}

//******************************************************************************
//�������ݸ���
//******************************************************************************
void  SendDataUpdate()						
{
    unsigned char i;
    unsigned int  data;
    TD_Array[0] = C_THead_T;            //�������������ͷ��
    TD_Array[1] = TX_PLOAD_WIDTH;       //���ݳ���
    TD_Array[2] = Target >> 8;   		//��������
    TD_Array[3] = Target & 0xff; 		//��������
    TD_Array[4] = Self_Num; 			//����״̬

	TD_Array[5] = Flag_Word; 		//��������
	
    for(i=0;i<5;i++)
    {
        TD_Array[i+6] = self_cpd[i];	//����źŵ�ַ
    }
    TD_Array[11] = ACVolt_DD>>8;       //������ѹ��λ�����֣�
    TD_Array[12] = ACVolt_DD&0xff;     //������ѹ��λ�����֣�
    TD_Array[13] = ACCurr_DD>>8;       //����������λ�����֣�
    TD_Array[14] = ACCurr_DD&0xff;     //����������λ�����֣�
    TD_Array[15] = ACTemp_DD>>8;       //�����¶ȸ�λ�����֣�
    TD_Array[16] = ACTemp_DD&0xff;     //�����¶ȵ�λ�����֣�
    TD_Array[17] = Power>>24;          //�������ʵ���λ
    TD_Array[18] = (Power>>16)&0xff;   //�������ʵ���λ
    TD_Array[19] = (Power>>8)&0xff;    //�������ʵڶ�λ
    TD_Array[20] = Power&0xff;         //�������ʵ�һλ
    TD_Array[21] = TX_Pro_Code_A;      //��������
    TD_Array[22] = TX_Pro_Code_B;      //�������� 
    TD_Array[23] = Statu_Word_A;        //�����ɱ�ʶ
    TD_Array[24] = Statu_Word_B;         //���״̬��
    TD_Array[25] = 0x00;			   //����  
    TD_Array[26] = 0x00;   	   		   //����
    TD_Array[27] = 0x00;               //����   
    TD_Array[28] = FrmNumb;   			//֡����
    data =crc_cal_value(TD_Array, TX_PLOAD_WIDTH-3);
    TD_Array[TX_PLOAD_WIDTH-3] = data>>8;     		//У�����λ
    TD_Array[TX_PLOAD_WIDTH-2] = data&0xff;   		//У�����λ
    TD_Array[TX_PLOAD_WIDTH-1] = 0x2b;				//������������ݽ�����
}

	//******************************************************************************
//�������ݸ���
//******************************************************************************
void  SendDataUpdate_Pair()						
{
    unsigned char i;
    unsigned int  data;
    TD_Array[0] = C_THead_T;            //�������������ͷ��
    TD_Array[1] = TX_PLOAD_WIDTH;       //���ݳ���
    TD_Array[2] = Target >> 8;   		//��������
    TD_Array[3] = Target & 0xff; 		//��������
    TD_Array[4] = Self_Num; 			//����״̬
    TD_Array[5] = Master_Comm_Re; 		//��������
	
    for(i=0;i<5;i++)
    {
        TD_Array[i+6] = self_cpd_send[i];	//����źŵ�ַ
		TD_Array[i+11] = master_cpd[i]; //������ַ
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
    TD_Array[28] = 0x4A;   //'J'						//֡����
    data =crc_cal_value(TD_Array, TX_PLOAD_WIDTH-3);
    TD_Array[TX_PLOAD_WIDTH-3] = data>>8;     		//У�����λ
    TD_Array[TX_PLOAD_WIDTH-2] = data&0xff;   		//У�����λ
    TD_Array[TX_PLOAD_WIDTH-1] = 0x2b;				//������������ݽ�����
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
/*����NRF24L01ģ���Զ�Ӧ��*/
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
//�µ�ַ��麯��--Ŀ��ȷ���Ƿ�����ȷ����Ե�ַ
//******************************************************************************
int IsRightAddr(unsigned char * Resv_Address)
{
	int i = 0;
	int count = 0;
	for(int j=0;j<7;j++)
	{		
		i = strncmp((char *) Address_Rec[j],(char *)Resv_Address,5);
		if(i == 0) //��ͬ
		{	
			break;
		 }
		else //��ͬ
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
/*����NRF24L01ģ�鵽��������ģʽ*/
//******************************************************************************
void  Set_TX_Com_Mode(void)//���ù�������ģʽ
{
    Num_RF = 80;//���ù���ͨ��Ƶ��
    TX_Mode();
}
//******************************************************************************
//******************************************************************************
/*����NRF24L01ģ�鵽��������ģʽ*/
//******************************************************************************
void  Set_RX_Com_Mode(void)//���ù�������ģʽ
{
    Num_RF = 80;//���ù���ͨ��Ƶ��
    RX_Mode();
}
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/