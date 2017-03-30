/******************************************************************************/
/*					                                      */
/*	Project Name :	接收机		                                      */
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
#ifndef _ADSAMPLE_
#define _ADSAMPLE_

/*******************************************************************************
-----------------------------    Macro define    -------------------------------
*******************************************************************************/
#define 	C_Adc_Sup_Vol	0x00	//PWR_VOL_EDT
#define 	C_Adc_Vol		0x03	//BAT_VOL_DET
#define 	C_Adc_Cur		0x01	//CUR_DET
#define		C_Adc_Tem		0x02	//NTC_DET

#define		Power_Rating            6500

/*******************************************************************************
-------------------------    Function declaration    ---------------------------
*******************************************************************************/
void  ADSample(void);
void  ADProcess(unsigned char CHAL);
unsigned char GetTemperature(unsigned int ADValue);
void  ADCurrent_Scan(unsigned char CHAL);
void  ADVoltage_Scan(unsigned char CHAL);
void  ADSupply_Voltage_Scan(unsigned char CHAL);
void  CountPower();
#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/
