/******************************************************************************/
/*					                                      */
/*	Project Name :	�����		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	�лݴ��ǣ����ڣ����߹��缼�����޹�˾                    */
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
//20170215���¶���
#define  NRF24L01_CE     PC_ODR_ODR3
#define  NRF24L01_CSN    PE_ODR_ODR5
#define  NRF24L01_CLK    PC_ODR_ODR5
#define  NRF24L01_IRQ	 PC_IDR_IDR4
#define  NRF24L01_MOSI   PC_ODR_ODR6
#define  NRF24L01_MISO   PC_IDR_IDR7

//NRF24L01�Ĵ�����������
#define READ_REG        0x00  //�����üĴ���,��5λΪ�Ĵ�����ַ
#define WRITE_REG       0x20  //д���üĴ���,��5λΪ�Ĵ�����ַ
#define R_RX_PL_WID     0x60  //�������ݳ��ȼĴ���
#define RD_RX_PLOAD     0x61  //��RX��Ч����,1~32�ֽ�
#define WR_TX_PLOAD     0xA0  //дTX��Ч����,1~32�ֽ�
#define FLUSH_TX        0xE1  //���TX FIFO�Ĵ���.����ģʽ����
#define FLUSH_RX        0xE2  //���RX FIFO�Ĵ���.����ģʽ����
#define REUSE_TX_PL     0xE3  //����ʹ����һ������,CEΪ��,���ݰ������Ϸ���.
#define NOP             0xFF  //�ղ���,����������״̬�Ĵ���	 
//SPI(NRF24L01)�Ĵ�����ַ
#define CONFIG          0x00  //���üĴ�����ַ;bit0:1����ģʽ,0����ģʽ;bit1:��ѡ��;bit2:CRCģʽ;bit3:CRCʹ��;
                              //bit4:�ж�MAX_RT(�ﵽ����ط������ж�)ʹ��;bit5:�ж�TX_DSʹ��;bit6:�ж�RX_DRʹ��
#define EN_AA           0x01  //ʹ���Զ�Ӧ����  bit0~5,��Ӧͨ��0~5
#define EN_RXADDR       0x02  //���յ�ַ����,bit0~5,��Ӧͨ��0~5
#define SETUP_AW        0x03  //���õ�ַ���(��������ͨ��):bit1,0:00,3�ֽ�;01,4�ֽ�;02,5�ֽ�;
#define SETUP_RETR      0x04  //�����Զ��ط�;bit3:0,�Զ��ط�������;bit7:4,�Զ��ط���ʱ 250*x+86us
#define RF_CH           0x05  //RFͨ��,bit6:0,����ͨ��Ƶ��;
#define RF_SETUP        0x06  //RF�Ĵ���;bit3:��������(0:1Mbps,1:2Mbps);bit2:1,���书��;bit0:�������Ŵ�������
#define STATUS          0x07  //״̬�Ĵ���;bit0:TX FIFO����־;bit3:1,��������ͨ����(���:6);bit4,�ﵽ�����ط�
                              //bit5:���ݷ�������ж�;bit6:���������ж�;
#define MAX_TX  	0x10  //�ﵽ����ʹ����ж�
#define TX_OK   	0x20  //TX��������ж�
#define RX_OK   	0x40  //���յ������ж�
#define FULL_TX   	0x1F  //Tx��������

#define OBSERVE_TX      0x08  //���ͼ��Ĵ���,bit7:4,���ݰ���ʧ������;bit3:0,�ط�������
#define CD              0x09  //�ز����Ĵ���,bit0,�ز����;
#define RX_ADDR_P0      0x0A  //����ͨ��0���յ�ַ,��󳤶�5���ֽ�,���ֽ���ǰ
#define RX_ADDR_P1      0x0B  //����ͨ��1���յ�ַ,��󳤶�5���ֽ�,���ֽ���ǰ
#define RX_ADDR_P2      0x0C  //����ͨ��2���յ�ַ,����ֽڿ�����,���ֽ�,����ͬRX_ADDR_P1[39:8]���;
#define RX_ADDR_P3      0x0D  //����ͨ��3���յ�ַ,����ֽڿ�����,���ֽ�,����ͬRX_ADDR_P1[39:8]���;
#define RX_ADDR_P4      0x0E  //����ͨ��4���յ�ַ,����ֽڿ�����,���ֽ�,����ͬRX_ADDR_P1[39:8]���;
#define RX_ADDR_P5      0x0F  //����ͨ��5���յ�ַ,����ֽڿ�����,���ֽ�,����ͬRX_ADDR_P1[39:8]���;
#define TX_ADDR         0x10  //���͵�ַ(���ֽ���ǰ),ShockBurstTMģʽ��,RX_ADDR_P0��˵�ַ���
#define RX_PW_P0        0x11  //��������ͨ��0��Ч���ݿ��(1~32�ֽ�),����Ϊ0��Ƿ�
#define RX_PW_P1        0x12  //��������ͨ��1��Ч���ݿ��(1~32�ֽ�),����Ϊ0��Ƿ�
#define RX_PW_P2        0x13  //��������ͨ��2��Ч���ݿ��(1~32�ֽ�),����Ϊ0��Ƿ�
#define RX_PW_P3        0x14  //��������ͨ��3��Ч���ݿ��(1~32�ֽ�),����Ϊ0��Ƿ�
#define RX_PW_P4        0x15  //��������ͨ��4��Ч���ݿ��(1~32�ֽ�),����Ϊ0��Ƿ�
#define RX_PW_P5        0x16  //��������ͨ��5��Ч���ݿ��(1~32�ֽ�),����Ϊ0��Ƿ�
#define FIFO_STATUS     0x17  //FIFO״̬�Ĵ���;bit0,RX FIFO�Ĵ����ձ�־;bit1,RX FIFO����־;bit2,3,����
                              //bit4,TX FIFO�ձ�־;bit5,TX FIFO����־;bit6,1,ѭ��������һ���ݰ�.0,��ѭ��;
#define FEATURE         0x1D  //Feature Register
#define DYNDP           0x1C  //Enable dynamic payload length
#define W_ACK_PAYLOAD_P0   0xA8 //0ͨ���Զ�Ӧ������
#define W_ACK_PAYLOAD_P1   0xA9 //0ͨ���Զ�Ӧ������
#define W_ACK_PAYLOAD_P2   0xAA //0ͨ���Զ�Ӧ������
#define W_ACK_PAYLOAD_P3   0xAB //0ͨ���Զ�Ӧ������
#define W_ACK_PAYLOAD_P4   0xAC //0ͨ���Զ�Ӧ������
#define W_ACK_PAYLOAD_P5   0xAD //0ͨ���Զ�Ӧ������
//24L01���ͽ������ݿ�ȶ���
#define TX_ADR_WIDTH    5   //5�ֽڵĵ�ַ���
#define RX_ADR_WIDTH    5   //5�ֽڵĵ�ַ���
#define RX_ADR_WIDTH_1  1   //1�ֽڵĵ�ַ���
#define TX_PLOAD_WIDTH  32  //20�ֽڵ��û����ݿ��
#define RX_PLOAD_WIDTH  32  //20�ֽڵ��û����ݿ��


#define C_THead_T       0x68   //��������ͷ��
#define C_TEnd_T        0x2b   //�������ݽ�����
#define C_THead_R       0x1f   //��������ͷ��
#define C_TEnd_R        0xcd   //�������ݽ�����

//�лݻ������Ա�
#define  C_Master_DianFanBao 	  0x0001	//�緹�ҷ����
#define  C_Salve_DianFanBao       0x0002        //�����˷����
#define  C_Master_Jiqiren	  	  0x0003	//�ӻ��緹��
#define  C_Salve_Jiqiren          0x0004        //�ӻ�������
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

//NRF24L01ͨ�Ż�������
void  NRF24L01_Init(void);//NRF24L01��ʼ��
void  TX_Mode(void);//�ú�����ʼ��NRF24L01��TXģʽ
void 	TX_P0_SET();
void 	CLEAR_P_SET();
void 	CHECK_P0_SET();
void 	RX_P_SET();
unsigned char SPIx_ReadWriteByte(unsigned char TxData);//SPI��дһ���ֽ�
unsigned char NRF24L01_Check(void);//���24L01�Ƿ����
unsigned char NRF24L01_Write_Buf(unsigned char reg, unsigned char *pBuf, unsigned char len);//��ָ��λ��дָ�����ȵ�����
unsigned char NRF24L01_Read_Buf(unsigned char reg,unsigned char *pBuf,unsigned char len); //��ָ��λ�ö���ָ�����ȵ�����
unsigned char NRF24L01_TxPacket(unsigned char *txbuf);//����NRF24L01����һ������
unsigned char NRF24L01_Read_Reg(unsigned char reg);//��ȡSPI�Ĵ���ֵ
unsigned char NRF24L01_Write_Reg(unsigned char reg,unsigned char value); //SPIд�Ĵ���
unsigned char NRF24L01_RxPacket(unsigned char *rxbuf);//����NRF24L01����һ������

//NRF24L01ͨ��Ӧ�ú���
void  NRF24L01Process(void);//�����շ�����
void  Clear_Nrf24l01(void);//�����ȹر���
void  Scan_Nrf24l01(void);//��ѯ�ӻ�
unsigned char  CheckRecData(void);//��ѯ���������Ƿ���ȷ	
void  Record_Data(void);//��¼��Դӻ���ַ�Լ�ͨ�Ŵ���
void  Check_Pair(void);//����Ƿ�����Դӻ�
void  Pair_Nrf24l01(void);//������ͽ��ջ����
void  SendDataUpdate();//�������ݸ���
void  SendDataUpdate_Pair();	
void  SendIdleDataUpdate();
void  RecDataProcess(void);//�������ݸ���
void  Set_TX_Com_Mode(void);//���ù�������ģʽ
void  Set_RX_Com_Mode(void);//���ù�������ģʽ
void  Set_TX_Pair_Mode(void);//������Է���ģʽ
void  Set_RX_Pair_Mode(void);//������Խ���ģʽ
void  Rec_Send_data(void);//����״̬�շ�����
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