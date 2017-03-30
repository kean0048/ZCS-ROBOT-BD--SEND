#ifndef _STREAM2CHAR_H_
#define _STREAM2CHAR_H_

#include "string.h"
#include "stdio.h"
#include "DataStruct.h"

extern LikeWifi ZoneChargWiLess;
void iF2IDsp1(TMdII mdII[], int cIP, unsigned char *frm);
unsigned int crc_cal_value_s(unsigned char *data_value, unsigned char data_length);
int parseByteStream2FrameStreamsp1(unsigned char rxData[],int len);

#endif