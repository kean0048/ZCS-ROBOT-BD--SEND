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
#ifndef _EEPROM_H
#define _EEPROM_H


/*******************************************************************************
-----------------------------    Macro define    -------------------------------
*******************************************************************************/
#define     ID_BaseAddress                0X48CD
#define     EEPROM_BaseAddress		  	  0X4000

#define     Length_ChipUniqueID           12

#define     C_EEP_PROECT_TIME             1000
/*******************************************************************************
-------------------------    Function declaration    ---------------------------
*******************************************************************************/
void  Eeprom_Write(unsigned char addr,unsigned char dat);
unsigned char Eeprom_Read(unsigned char addr);
void  Eeprom_Init(void);//EEPROM初始化（解密）
void  GetUniqueID(unsigned char *p);
void  GetEeprom(unsigned char *p);
void  UniqueID_Check(void);
unsigned char crc_check_value(unsigned char *data_value, unsigned char data_length);
unsigned int crc_sum_value(unsigned char *buf,unsigned char len);

#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/