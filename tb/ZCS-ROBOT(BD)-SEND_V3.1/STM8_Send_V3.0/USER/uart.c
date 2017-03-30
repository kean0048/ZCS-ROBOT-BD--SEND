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
//#include "string.h"
#include "stdio.h"
#include "Uart.h"
#include "Eeprom.h"
#include "PWM_Control.h"
//******************************************************************************
//UART初始化
//******************************************************************************
void Uart2_Init(void)
{
    volatile unsigned int baud_div=0;   
    unsigned tmp1,tmp2;
     
    UART2_CR1 = (0<<4)|(0<<3)|(0<<2)|(0<<1)|(0<<0); 
    /*1位起始位 8位数据位 结束位由CR3设置 不使用奇偶校验 不使能奇偶校验中断*/
    //UART2_CR2 = (0<<7)|(0<<6)|(0<<5)|(0<<4)|(0<<3)|(0<<2);
	UART2_CR2 = (0<<7)|(0<<6)|(1<<5)|(0<<4)|(1<<3)|(1<<2); 
    /*使能发送和接收 接收中断使能 禁止发送中断*/
    UART2_CR3 = (0<<6)|(0<<4)|(0<<3); /*设置1位停止位 不使能SCLK*/        
    //UART2_CR5 = (0<<2)|(0<<1);     
    /*使用智能卡模式需要设置的，基本上保持默认就行了 */    
    /*设置波特率----16M波特率配置 115200*/
    baud_div =(unsigned int)((float)HSIClockFreq/BaudRate + 0.112);  /*求出分频因子*/
    tmp1 = (unsigned char)(baud_div & 0x0f);
    tmp2 = (unsigned char)((baud_div >> 8) & 0xf0);
    
    
    UART2_BRR2 = (tmp1 | tmp2);
    UART2_BRR1 = (unsigned char)((baud_div >> 4) & 0xff);    /*先给BRR2赋值 最后再设置BRR1*/ 
    
    //16M晶振 波特率115200
    UART2_BRR2 = 0x0B;
    UART2_BRR1 = 0x08;
    
    //8M晶振 波特率9600
    //UART2_BRR2 = 0x01;
    //UART2_BRR1 = 0x34;
    
     //16M晶振 波特率9600
    //UART2_BRR2 = 0x03;
    //UART2_BRR1 = 0x68;

    
    UART2_CR1 |= (0<<5);         /*使能UART*/
	//UART2_CR2 = (0<<7)|(0<<6)|(1<<5)|(0<<4)|(1<<3)|(1<<2); 
    /*使能发送和接收 接收中断使能 禁止发送中断*/
}
//******************************************************************************


//******************************************************************************
//串口通讯
//******************************************************************************
void UART_Process(void )
{
    unsigned char len;
    len = UART2_RxRead(Uart_Buf,23);
    if(len)
    {
        RobotPkgProc(Uart_Buf,len);
    }  
}
//******************************************************************************


//******************************************************************************
//串口中断接收数据
//******************************************************************************
void UART2_RxInterrupt(unsigned char ch)
{
    UART2_RX_BUF[UART2_pWrite++] = ch;
    if(UART2_pWrite >= UART2_RX_BUF_SIZE)
    {
        UART2_pWrite = 0;
    }
	//while(!UART2_SR_TXE);
	//UART2_DR = UART2_RX_BUF[UART2_pWrite-1];
}
//******************************************************************************


//******************************************************************************
//获取接收数据长度
//******************************************************************************
unsigned char UART2_RxRead(unsigned char *buf,unsigned char len)
{	
    unsigned char i,num = 0;
    for(i=0;i<len;i++)
    {
        if(UART2_pRead == UART2_pWrite)
        {
            break;
        }
        *buf++ = UART2_RX_BUF[UART2_pRead++];
        num++;
        if(UART2_pRead >= UART2_RX_BUF_SIZE)
        {
            UART2_pRead = 0;
        }
    }
    return num;
}
//******************************************************************************


//******************************************************************************
//解析串口接收到的数据
//******************************************************************************
void RobotPkgProc(unsigned char *buf,unsigned char len)
{
    unsigned char i,tmp,str_len = 0;
	unsigned char temp_cat[24] = {0};
	unsigned int cmd = 0;
	str_len = len;
    checkSum = 0;
    for(i=0;i<len;i++)
    {
        tmp = *buf++;
		temp_cat[i] = tmp;
        switch(RobotCommandProcStep)
        {
            case 0:
                if(tmp == '$')
                {
                    Stor_Commd[RobotCommandProcStep] = tmp;
                	RobotCommandProcStep++;    
                }
				checkSum += tmp;				
				str_len--;
                break;
            case 1:
                if(tmp == 'c')
                {
                    Stor_Commd[RobotCommandProcStep] = tmp;
                	RobotCommandProcStep++;    
                }
				else
					RobotCommandProcStep = 0;
				checkSum += tmp;
				str_len--;
                break;
            case 2:
                if(tmp == 'm')
                {
                    Stor_Commd[RobotCommandProcStep] = tmp;
                	RobotCommandProcStep++;    
                }
				else
					RobotCommandProcStep = 0;
				checkSum += tmp;
				str_len--;
                break;				
            case 3:
                if(tmp == 'd')
                {
                    Stor_Commd[RobotCommandProcStep] = tmp;
                	RobotCommandProcStep++;    
                }
				else
					RobotCommandProcStep = 0;
				checkSum += tmp;
				str_len--;
                break;
            default: 
			  	str_len--;				
			  	switch(str_len)
				{
				  case 1:
					if(checkSum == tmp)
					{
						cmd = temp_cat[5];
						RobotCmdProc(cmd,temp_cat,len,Stor_Commd);
					}
					RobotCommandProcStep = 0;
					break;
				  default:
					break;
				}
				checkSum += tmp;
				break;
        }
    }
}
//******************************************************************************


//******************************************************************************
//根据接收发送数据
//******************************************************************************
void RobotCmdProc(unsigned char cmd,unsigned char *buf,unsigned char len,unsigned char *cmd_flag)
{
    unsigned char i;
    switch(cmd)
    {
	   case ROBOT_COMMAND_MODIFY_FR:
		
			Pwm_Frequent_Value = (*(buf+7)- '0')*10 + (*(buf+8)-'0');
			Pwm_Ratio_Value = (*(buf+13) - '0')*10 + (*(buf+14) - '0');
			Pwm_Product_numValue = *(buf+20) - '0';

			Adjust_Time1_RF_4UART(cmd_flag,Pwm_Product_numValue,Pwm_Frequent_Value,Pwm_Ratio_Value);
			break;
	  	case ROBOT_COMMAND_MODIFY_EEPROM:
          
		    asm("sim");//关闭中断	                          
		    for(i = 6;i<11;i++)
			{
				Eeprom_Write(i,Stor_Frequen_eeprom[i-6]);
				Eeprom_Write(i+5,Stor_Ratio_eeprom[i-6]);
				printf("set_success_eeprom!");
			}
			
			Eeprom_Write(16,17);
			Eeprom_Write(17,Stor_Frequen_eeprom[5]);
			Eeprom_Write(18,Stor_Ratio_eeprom[5]);
            
            printf("set_success_eeprom!");
			asm("rim");
		  	break;
        /*case ROBOT_COMMAND_QUERY:
            //发送应答信息
            i = 0;
            tmp = sizeof(DEV_STATUS);
            wCmdAckBuf[i++] = DEVICE_COMMAND_HEAD;			//HEAD
            wCmdAckBuf[i++] = 0;					//id
            wCmdAckBuf[i++] = tmp+1;					//cmd + data len
            wCmdAckBuf[i++] = DEVICE_COMMAND_ACK;			//command ack		
            memcpy(&wCmdAckBuf[i],(unsigned char *)&devStatus,tmp);	//data
            i += tmp;
            wCmdAckBuf[i] = CheckSum(&wCmdAckBuf[3],tmp+1);		//check sum
            i++;
            UART2_SendString(wCmdAckBuf,i);
            break;
        case ROBOT_COMMAND_CTRL:
            if(*buf == ROBOT_COMMAND_CTRL_OPEN)
            {
                //充电开启
                rCmdContent = ROBOT_CMMMAND_CHARGE_OPEN;
            }
            else if(*buf == ROBOT_COMMAND_CTRL_CLOSE)
            {
                rCmdContent = ROBOT_CMMMAND_CHARGE_CLOSE;
                //充电关闭
            }
            break;*/
        default:

            break;
    }
}
//******************************************************************************


//******************************************************************************
//累加计算校验和
//******************************************************************************
unsigned char CheckSum(unsigned char *buf,unsigned char len)
{
    unsigned char sum,i;
    sum =0;
    for(i=0;i<len;i++)
    {
        sum += *buf++;
    }
    return sum;
}
//******************************************************************************


//******************************************************************************
//UART发送字符串
//******************************************************************************
void UART2_SendString(unsigned char *Data,unsigned char len)
{
    unsigned char  i;
    for(i=0;i<len;i++)
    {
        UART2_SendByte(Data[i]);
    }
}
//******************************************************************************


//******************************************************************************
//UART发送单字节
//******************************************************************************
void UART2_SendByte(unsigned char data)
{   
    unsigned char temp;
    UART2_DR = data;
    for(;;)
    {
        temp = UART2_SR;
        if(temp & MASK_UART2_SR_TXE)
        {
          break;
        }
    }
	
	/*while((UART2_SR & MASK_UART2_SR_TXE)==0x00);
    UART2_DR = data;*/
}
//******************************************************************************
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/
int putchar(int c)
{
	if(c == '\n')
		UART2_SendByte('\r');
	UART2_SendByte((unsigned char )c);

	return c;
}
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/