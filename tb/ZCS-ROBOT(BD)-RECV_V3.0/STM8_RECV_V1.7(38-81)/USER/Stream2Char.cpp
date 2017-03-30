// ShowDDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "Stream2Char.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#define FRAME_HEAD  0x68
#define FRAME_END   0x2b


void iF2IDsp1(TMdII mdII[], int cIP, TByte *frm)
{
	int i;

	for(i = 0; i < cIP; i++)
	{
		memcpy(mdII[i].pID, frm, mdII[i].cBIF);
		frm += mdII[i].cBIF;
	}
}

//******************************************************************************
//CRC
//******************************************************************************
unsigned int crc_cal_value(TByte *data_value, TByte data_length)
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

int parseByteStream2FrameStreamsp1(unsigned char rxData[],int len) 
{	
	unsigned char rB = 0;								//当前数据字节；
	int length = len;							//接收字节长度
	int csErrs = 0;
	static int cBP = 0;							// the count of bytes have been put into RX buffer
	static int cBL = 0;							// the count of bytes left of current RX frame
	int ret = 0;
	static TByte commWord = 0;						//帧计数
	static TByte rxBuf[1024];
	unsigned short crcValue = 0;
	unsigned short temp = 0;

	//psavelog->appendSPData(psavelog->pfOriginalIMU,rxData,len);

	for (int i = 0; i < length; i++)
	{
		rB = rxData[i];

		switch (cBP)
		{
		case 0:
			if (rB == FRAME_HEAD)
			{
				rxBuf[cBP++] = rB;
			}                        
			break;

		case 1:
			rxBuf[cBP++] = rB;
			cBL = (int)((unsigned char)rB)-2;
			break;
		default:
			rxBuf[cBP++] = rB;
			cBL--;
			switch (cBL)
			{			
			case 0: 
				if (rB == FRAME_END)
				{
					memcpy(&temp,&rxBuf[29],2);
					crcValue = ((temp >> 8) & 0x00ff) | ((temp << 8) & 0xff00);
					if(crc_cal_value(rxBuf, 29) == crcValue)
					{
						//帧解析函数
						iF2IDsp1(mdIIZONEPVR, NUM_LikeWifi, rxBuf);
						ret++;
						//rightCountall += ret;
					}
					else
					{
						csErrs++;
						//csErrsall += csErrs;
					}
					cBP = 0;
				}
				else
				{
					cBP = 0;
				}
				break;
			default:
				break;
			}
			break;
		}
		if (cBP >= 1024)        
		{
			cBP = 0;
		}
	}
	return ret;
}

