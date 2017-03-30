// Stream2Char.cpp : ʵ���ļ�
#include "Stream2Char.h"
#include "RAM.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#define FRAME_HEAD  0x68
#define FRAME_END   0x2b


LikeWifi ZoneChargWiLess;
	/* SRPV����֡��Ա��תΪ���ݽṹ��Ա���Ԫ�������飬�μ�TMdII */
static TMdII mdIIZONEPVR[NUM_LikeWifi] = {{&ZoneChargWiLess.Head_1,1}, 
											{&ZoneChargWiLess.Date_Length, 1}, 
											{&ZoneChargWiLess.SelfID,2}, 
											{&ZoneChargWiLess.SlfNum,1}, 
											{&ZoneChargWiLess.PairComm,1}, 
											{&ZoneChargWiLess.PairID,5}, 
											{&ZoneChargWiLess.Vol,2}, 
											{&ZoneChargWiLess.Curr, 2}, 
											{&ZoneChargWiLess.Temp, 2}, 
											{&ZoneChargWiLess.PowerS,4}, 
											{&ZoneChargWiLess.ErrID,2}, 
											{&ZoneChargWiLess.Status,2},
											{&ZoneChargWiLess.Backup, 3},
											{&ZoneChargWiLess.FrameCount,1},
											{&ZoneChargWiLess.Crc,2},
											{&ZoneChargWiLess.Head_2,1}};
	
void iF2IDsp1(TMdII mdII[], int cIP, unsigned char *frm)
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
unsigned int crc_cal_value_s(unsigned char *data_value, unsigned char data_length)
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
	unsigned char rB = 0;								//��ǰ�����ֽڣ�
	int length = len;							//�����ֽڳ���
	int csErrs = 0;
	static int cBP = 0;							// the count of bytes have been put into RX buffer
	static int cBL = 0;							// the count of bytes left of current RX frame
	int ret = 0;
	static unsigned char rxBuf[128];
	unsigned short crcValue = 0;

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
					memcpy(&crcValue,&rxBuf[29],2);
					//crcValue = ((temp >> 8) & 0x00ff) | ((temp << 8) & 0xff00);
					if(crc_cal_value_s(rxBuf, 29) == crcValue)
					{
						//֡��������
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

void FunDealChildLost(const unsigned char selfNumb,unsigned char *lessfull)
{

	Flag_RECV_ADDRESS_NUM_SAME--;
	memset(AUTO_Array[selfNumb-1],0,sizeof(AUTO_Array[selfNumb-1]));
	flg_stop_send_in[selfNumb-1] = 1;	
	Flg_Chenal_OK[selfNumb-1] = 0;
	Flg_Chenal_Fail[selfNumb-1] = 1;
	//Child_Count_Num = 0; //��1�������������� 2017.01.18 ɾ������Ϊ��172~178���forѭ�����ڲ���
	CNT_Rec_Check_Fail[selfNumb-1] = 0;	
	flag_check_succ[selfNumb-1] = 0;
	/*if(NUM_PWM_UPload > 0)
		  NUM_PWM_UPload--;*/
	if(Flag_RECV_ADDRESS_NUM > 0)
	{
	  Flag_RECV_ADDRESS_NUM --;
	}
	//20170224 �������Ӹ��жϱ�Ȼ����A(������δ����B(����)���ߣ���ʱ�����CNT_FULL_Num��ֵ�����µȼ��д�
	if(Flag_FRIST_IN[selfNumb-1] == 1)
	{
		(*lessfull)--;
	    CNT_FULL_Num--;
	    Flag_FRIST_IN[selfNumb-1] = 0;//20170221��ϵͳ����PWM�йأ����ڼ�¼PWM�ȼ�������pwm������Ϣ
	}
	if(Flag_RECV_ADDRESS_NUM == 0)
		NUM_PWM_UPload = 0;
}

void FunDealChildLostWork(const unsigned char ChildNum,unsigned char *lessfull)
{
	if(CNT_Rec_Check_Fail[ChildNum-1] >= 60) //min = 2s;max = 8s  100/4=25
	{
		for(int j = 0;j < ALLOWED_PAIR;j++)
		{
			AUTO_Array[ChildNum-1][j] = 0;
			Address4Check[j] = 0;
		}
		if(Flag_RECV_ADDRESS_NUM_SAME >= 1)
		{
			Flag_RECV_ADDRESS_NUM_SAME--;
		}
		//2017.01.21 ��������ʱǡǡFlag_False_Check_Pass = true������ʱ��ID�Ѿ����ߣ���ô��һ��ID���ʧ�ܼ�ʹ1��Ҳ�����
		//Ҳ�����if(Flag_False_Check_Pass)��֧����������Ϊ��ȷ��Ӧ,Ϊ�������������
		Flag_False_Check_Pass = 0;
		count_false_check = 0;
		flag_recheck_over = 0;
		///////////////////////////////////////////////
		CNT_Rec_Check_Fail[ChildNum-1] = 0;
		//���������Ƿ���Ҫ��ֻ����ȡ����Ȧ��û�յ����һ֡����ʱ������
		flg_stop_send_in[ChildNum-1] = 1;	
		Flg_Chenal_OK[ChildNum-1] = 0;
		Flg_Chenal_Fail[ChildNum-1] = 1;//2017.01.20 ©�����λ�����²�ѯ�Ե����������趨ֵ���޷��������г���	
		flag_check_succ[ChildNum-1] = 0;
		/*if(NUM_PWM_UPload > 0)
			  NUM_PWM_UPload--;*/
		//if((Flag_RECV_ADDRESS_NUM > 0) && (Flag_FRIST_IN[Child_Num-1] != 1))//20170223��ֹ�ظ�ɾ��
		if(Flag_RECV_ADDRESS_NUM > 0)
		{
			  Flag_RECV_ADDRESS_NUM --;     
		}
		  
		if(Flag_RECV_ADDRESS_NUM == 0)
			NUM_PWM_UPload = 0;
		//20170224 �������Ӹ��жϱ�Ȼ����A(������δ����B(����)���ߣ���ʱ�����CNT_FULL_Num��ֵ�����µȼ��д�
		if(Flag_FRIST_IN[ChildNum-1] == 1)
		{
			(*lessfull)--;
			CNT_FULL_Num--;
			Flag_FRIST_IN[ChildNum-1] = 0;//20170221��ϵͳ����PWM�йأ����ڼ�¼PWM�ȼ�������pwm������Ϣ
		}
	}	
}