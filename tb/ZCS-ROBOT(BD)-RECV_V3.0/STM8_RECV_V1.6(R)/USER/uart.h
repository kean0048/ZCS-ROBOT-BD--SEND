/******************************************************************************/
/*					                                      */
/*	Project Name :	﹞⊿谷??迆		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	?D?Y∩∩??㏒“谷??迆㏒??T??1?米???那?車D?T1???                    */
/*						                              */
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
*******************************************************************************/
#ifndef __UART_
#define __UART_


/*******************************************************************************
-----------------------------    Macro define    -------------------------------
*******************************************************************************/
#define HSIClockFreq     16000000ul
#define BaudRate         115200ul
#define UART2_RX_BUF_SIZE       64

//robot -> device
#define ROBOT_COMMAND_HEAD				0x23
#define ROBOT_COMMAND_QUERY				0x0
#define ROBOT_COMMAND_CTRL				0x1

#define ROBOT_COMMAND_CTRL_OPEN			0x1
#define ROBOT_COMMAND_CTRL_CLOSE		0x0


//device -> robot
#define DEVICE_COMMAND_HEAD				0x23
#define DEVICE_COMMAND_ACK				0xa0

#define ROBOT_CMMMAND_CHARGE_OPEN		0x81
#define ROBOT_CMMMAND_CHARGE_CLOSE		0x80
/*******************************************************************************
-------------------------    Function declaration    ---------------------------
*******************************************************************************/
void Uart2_Init(void);
void UART_Process(void );//∩??迆赤“??
void UART2_RxInterrupt(unsigned char ch);//∩??迆?D???車那?那y?Y
unsigned char UART2_RxRead(unsigned char *buf,unsigned char len);
void RobotPkgProc(unsigned char *buf,unsigned char len);
void RobotCmdProc(unsigned char cmd,unsigned char *buf,unsigned char len);
unsigned char CheckSum(unsigned char *buf,unsigned char len);
void UART2_SendString(unsigned char *Data,unsigned char len);
void UART2_SendByte(unsigned char data);
#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/