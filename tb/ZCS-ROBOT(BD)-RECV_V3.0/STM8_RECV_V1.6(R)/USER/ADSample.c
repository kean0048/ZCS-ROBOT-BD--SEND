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


/*******************************************************************************
-----------------------------    Include files   -------------------------------
 *******************************************************************************/
#include "type_def.h"
#define	  _VDDNTC10KGND
/*******************************************************************************
-----------------------------    Global define   -------------------------------
 *******************************************************************************/
//* 3950 100KNTC (VDD-NTC-10K-GND)   10K分压电阻  
#ifdef _VDDNTC10KGND
static const unsigned int TemperatureTable[230] ={  
0x6,0x6,0x7,0x7,0x8,0x8,0x9,0x9,0x9,0xa,//-30 - 21  
0xb,0xb,0xc,0xd,0xd,0xe,0xf,0x10,0x10,0x11,//-20 - 11  
0x12,0x13,0x14,0x15,0x16,0x18,0x19,0x1a,0x1c,0x1d,//-10 - 01  

0x1f,0x20,0x22,0x23,0x25,0x27,0x28,0x2a,0x2c,0x2e,//0 - 9 
0x30,0x33,0x35,0x38,0x3a,0x3d,0x3f,0x42,0x45,0x48,//10 - 19 
0x4b,0x4e,0x52,0x56,0x59,0x5d,0x61,0x65,0x69,0x6c,//20 - 29 
0x6f,0x73,0x78,0x7c,0x81,0x86,0x8b,0x90,0x96,0x9c,//30 - 39 

0xa2,0xa8,0xae,0xb4,0xb9,0xbf,0xc5,0xcc,0xd2,0xd9,//40 - 49  
0xdf,0xe6,0xed,0xf3,0xfa,0x101,0x109,0x110,0x118,0x120,//50 - 59  
0x128,0x130,0x138,0x140,0x148,0x150,0x158,0x161,0x169,0x172,//60 - 69  
0x17a,0x183,0x18b,0x194,0x19c,0x1a4,0x1ad,0x1b5,0x1bd,0x1c5,//70 - 79  
0x1cd,0x1d4,0x1dd,0x1e5,0x1ed,0x1f5,0x1fd,0x206,0x20e,0x217,//80 - 89  
0x220,0x229,0x231,0x239,0x240,0x248,0x250,0x257,0x25f,0x266,//90 - 99  

0x26e,0x275,0x27d,0x285,0x28d,0x295,0x29b,0x2a2,0x2a9,0x2af,//100 - 109 
0x2b6,0x2bd,0x2c4,0x2cb,0x2d1,0x2d8,0x2de,0x2e4,0x2ea,0x2ef,//110 - 119 
0x2f4,0x2fa,0x300,0x305,0x30a,0x30f,0x314,0x318,0x31d,0x321,//120 - 129 
0x325,0x32a,0x32e,0x333,0x337,0x33c,0x340,0x345,0x349,0x34d,//130 - 139 
0x351,0x355,0x358,0x35c,0x35f,0x362,0x365,0x368,0x36b,0x36e,//140 -149 
0x370,0x374,0x377,0x37a,0x37d,0x380,0x382,0x385,0x387,0x38a,//150 -159 
0x38c,0x38e,0x391,0x393,0x395,0x398,0x39a,0x39c,0x39e,0x3a0,//160 - 169 
0x3a2,0x3a4,0x3a5,0x3a7,0x3a9,0x3ab,0x3ac,0x3ae,0x3b0,0x3b1,//170 - 179 
0x3b3,0x3b4,0x3b6,0x3b7,0x3b9,0x3ba,0x3bb,0x3bd,0x3be,0x3bf,//180 -189 
0x3c0,0x3c1,0x3c2,0x3c3,0x3c5,0x3c6,0x3c7,0x3c8,0x3c9,0x3ca,//190 - 199 

//0x3cb,0x3cc,0x3cd,0x3ce,0x3cf,0x3d0,0x3d1,0x3d2,0x3d3,0x3d3,//200 - 209 
//0x3d4,0x3d5,0x3d6,0x3d7,0x3d7,0x3d8,0x3d9,0x3d9,0x3da,0x3db,//210 - 219 
//0x3dc,0x3dc,0x3dd,0x3dd,0x3de,0x3df,0x3df,0x3e0,0x3e0,0x3e1,//220 - 229 
//0x3e1,0x3e2,0x3e3,0x3e3,0x3e4,0x3e4,0x3e5,0x3e5,0x3e6,0x3e6,//230 - 239 
//0x3e6,0x3e7,0x3e7,0x3e8,0x3e8,0x3e8,0x3e9,0x3e9,0x3ea,0x3ea,//240 - 249 
//0x3ea,//250   
} ;  
//* 3950 100KNTC (VDD-10K-NTC-GND)   10K分压电阻  
#else
static const unsigned int TemperatureTablex[230] = {//-30 - 250  

    0x3fa, 0x3fa, 0x3f9, 0x3f9, 0x3f8, 0x3f8, 0x3f7, 0x3f7, 0x3f7, 0x3f6, //-30--21  
    0x3f5, 0x3f5, 0x3f4, 0x3f3, 0x3f3, 0x3f2, 0x3f1, 0x3f0, 0x3f0, 0x3ef, //-20--11  
    0x3ee, 0x3ed, 0x3ec, 0x3eb, 0x3ea, 0x3e8, 0x3e7, 0x3e6, 0x3e4, 0x3e3, //-10--1  

    0x3e1, 0x3e0, 0x3de, 0x3dd, 0x3db, 0x3d9, 0x3d8, 0x3d6, 0x3d4, 0x3d2, //0-9  
    0x3d0, 0x3cd, 0x3cb, 0x3c8, 0x3c6, 0x3c3, 0x3c1, 0x3be, 0x3bb, 0x3b8, //10-19  
    0x3b5, 0x3b2, 0x3ae, 0x3aa, 0x3a7, 0x3a3, 0x39f, 0x39b, 0x397, 0x394, //20-29  
    0x391, 0x38d, 0x388, 0x384, 0x37f, 0x37a, 0x375, 0x370, 0x36a, 0x364, //30-39  
    0x35e, 0x358, 0x352, 0x34c, 0x347, 0x341, 0x33b, 0x334, 0x32e, 0x327, //40-49  
    0x321, 0x31a, 0x313, 0x30d, 0x306, 0x2ff, 0x2f7, 0x2f0, 0x2e8, 0x2e0, //50-59  
    0x2d8, 0x2d0, 0x2c8, 0x2c0, 0x2b8, 0x2b0, 0x2a8, 0x29f, 0x297, 0x28e, //60-69  
    0x286, 0x27d, 0x275, 0x26c, 0x264, 0x25c, 0x253, 0x24b, 0x243, 0x23b, //70-79  

    0x233, 0x22c, 0x223, 0x21b, 0x213, 0x20b, 0x203, 0x1fa, 0x1f2, 0x1e9, //80-89  
    0x1e0, 0x1d7, 0x1cf, 0x1c7, 0x1c0, 0x1b8, 0x1b0, 0x1a9, 0x1a1, 0x19a, //90-99  

    0x192, 0x18b, 0x183, 0x17b, 0x173, 0x16b, 0x165, 0x15e, 0x157, 0x151, //100-109  
    0x14a, 0x143, 0x13c, 0x135, 0x12f, 0x128, 0x122, 0x11c, 0x116, 0x111, //110-119  
    0x10c, 0x106, 0x100, 0xfb, 0xf6, 0xf1, 0xec, 0xe8, 0xe3, 0xdf, //120-129  
    0xdb, 0xd6, 0xd2, 0xcd, 0xc9, 0xc4, 0xc0, 0xbb, 0xb7, 0xb3, //130-139  
    0xaf, 0xab, 0xa8, 0xa4, 0xa1, 0x9e, 0x9b, 0x98, 0x95, 0x92, //140-149  
    0x90, 0x8c, 0x89, 0x86, 0x83, 0x80, 0x7e, 0x7b, 0x79, 0x76, //150-159  
    0x74, 0x72, 0x6f, 0x6d, 0x6b, 0x68, 0x66, 0x64, 0x62, 0x60, //160-169  
    0x5e, 0x5c, 0x5b, 0x59, 0x57, 0x55, 0x54, 0x52, 0x50, 0x4f, //170-179  

    0x4d, 0x4c, 0x4a, 0x49, 0x47, 0x46, 0x45, 0x43, 0x42, 0x41, //180-189  
    0x40, 0x3f, 0x3e, 0x3d, 0x3b, 0x3a, 0x39, 0x38, 0x37, 0x36, //190-199  
    /* 
    0x35,0x34,0x33,0x32,0x31,0x30,0x2f,0x2e,0x2d,0x2d,//200-209 
    0x2c,0x2b,0x2a,0x29,0x29,0x28,0x27,0x27,0x26,0x25,//210-219 
    0x24,0x24,0x23,0x23,0x22,0x21,0x21,0x20,0x20,0x1f,//220-229 
    0x1f,0x1e,0x1d,0x1d,0x1c,0x1c,0x1b,0x1b,0x1a,0x1a,//230-239 
    0x1a,0x19,0x19,0x18,0x18,0x18,0x17,0x17,0x16,0x16,//240-249 
    0x16,       */ //250  
};
#endif

//******************************************************************************
//AD采样函数
//******************************************************************************

void ADSample(void)
{
    if (Flag_10ms_C == 1)
    {
        Flag_10ms_C = 0;
        //ADProcess(C_Adc_Vol);// 电压
        //ADProcess(C_Adc_Cur);// 电流
        ADProcess(C_Adc_Tem); // 温度采样 
    }

    if (CNT_T2ms == 1)
    {
        CNT_T2ms = 0;
        //ADProcess(C_Adc_Cur);// 电流
        ADCurrent_Scan(C_Adc_Cur); // 电流采样
        //ADProcess(C_Adc_Cur);// 电流
        ADVoltage_Scan(C_Adc_Vol);//电压采样
        ADSupply_Voltage_Scan(C_Adc_Sup_Vol);//功率电压采样(线圈接触)

    }

}
//******************************************************************************

//******************************************************************************
//AD采样函数
//******************************************************************************

unsigned int ADGetValue(unsigned char CHAL)
{
    unsigned char i;
    ADC_CSR = CHAL;
    ADC_CR1 |= 0X1; // 启动转换
    for (i = 0; i < 100; i++)
    {
        if (ADC_CSR_EOC)
        {
            break;
        }
    }
    ADC_RESULT_L = ADC_DRL;
    ADC_RESULT_H = ADC_DRH;
    ADC_RESULT = ADC_RESULT_H * 256 + ADC_RESULT_L;
    return ADC_RESULT;
}
//******************************************************************************


//******************************************************************************
//AD采样函数
//******************************************************************************

void ADProcess(unsigned char CHAL)
{
    unsigned char i;
    ADC_CSR = CHAL;
    ADC_CR1 |= 0x01; // 启动转换
    for (i = 0; i < 100; i++)
    {
        if (ADC_CSR_EOC)
        {
            break;
        }
    }
    ADC_RESULT_L = ADC_DRL;
    ADC_RESULT_H = ADC_DRH;
    ADC_RESULT = ADC_RESULT_H * 256 + ADC_RESULT_L;
    AD_Value_SUM[CHAL] += ADC_RESULT;
    SUM_CNT[CHAL]++;
    if (SUM_CNT[CHAL] >= 64)
    {
        SUM_CNT[CHAL] = 0;
        AD_Value[CHAL] = AD_Value_SUM[CHAL] >> 6;
        AD_Value_SUM[CHAL] = 0;
        switch (CHAL)
        {
        case C_Adc_Vol:
            ACVolt_AD = AD_Value[CHAL]; // 电压
            break;
        case C_Adc_Cur:
            ACCurr_AD = AD_Value[CHAL]; // 电流
            break;
        case C_Adc_Tem:
            ACTemp_AD = AD_Value[CHAL]; // 温度
            break;
        default:
            break;
        }
        //获取实际温度值
        ACTemp_DD = GetTemperature(ACTemp_AD) - 30; //温度0表示-30℃
        devStatus.temp = ACTemp_DD;
        // U=(AD*5*(3+33))/(3*1024);
        // temp = ((unsigned long)ACVolt_AD)*15000/256;
        //ACVolt_DD = ((unsigned long)ACVolt_AD)*15000/256;  //单位
        //Flag_Volt_OK =1;
        //devStatus.vol = ACVolt_DD;
    }
}
//******************************************************************************

//******************************************************************************
//查表温度（从小到大）
//******************************************************************************
unsigned char GetTemperature(unsigned int ADValue)
{
    unsigned char left,mid,right;
    unsigned int Temp;
    left  = 0;
    right = 229;
    if (ADValue <= 0x06)
    {
        left = 0;
    }
    else
    {
        if (ADValue >= 0x3ca)
        {
            left = 229;
        }
        else
        {
            while(left != (right - 1))                   
            {
                Temp = left;
                Temp += right;
                mid = (unsigned char)(Temp >> 1);
                if (ADValue >= TemperatureTable[mid])
                {
                    left = mid;             
                    if (ADValue < TemperatureTable[mid + 1])
                    {
                        break;
                    }
                }
                else
                {
                    right = mid;      
                    if (ADValue >= TemperatureTable[mid - 1])
                    {
                        left = mid - 1;
                        break;
                    }
                }
            }
        }
    }
    return left;
}
//******************************************************************************
//查表温度
//******************************************************************************

unsigned char GetTemperaturex(unsigned int ADValue)
{
    unsigned char left, mid, right;
    unsigned int Temp;
    left = 0;
    right = 229;
    if (ADValue >= 0x3fa)
    {
        left = 0;
    }
    else
    {
        if (ADValue <= 0x36)
        {
            left = 229;
        }
        else
        {
            while (left != (right - 1))
            {
                Temp = left;
                Temp += right;
                mid = (unsigned char) (Temp >> 1);
                if (ADValue <= TemperatureTable[mid])
                {
                    left = mid;
                    if (ADValue > TemperatureTable[mid + 1])
                    {
                        break;
                    }
                }
                else
                {
                    right = mid;
                    if (ADValue <= TemperatureTable[mid - 1])
                    {
                        left = mid - 1;
                        break;
                    }
                }
            }
        }
    }
    return left;
}
//******************************************************************************


//******************************************************************************
//电流采样
//******************************************************************************

void ADCurrent_Scan(unsigned char CHAL)
{
    unsigned char i;
    ADC_RESULT =0;
    for(i=0;i<4;i++)
    {
        ADC_CSR = CHAL;
        ADC_CR1 |= 0X1; // 启动转换
        for (int j = 0; j < 100; j++)
        {
            if (ADC_CSR_EOC)
            {
                break;
            }
        }
        ADC_RESULT_L = ADC_DRL;
        ADC_RESULT_H = ADC_DRH;
        ADC_RESULT += ADC_RESULT_H * 256 + ADC_RESULT_L;
    }
    
    if (SUM_CNT[CHAL] >= 32)
    {
        SUM_CNT[CHAL] = 0;
        AD_Value[CHAL] = AD_Value_SUM[CHAL] >> 5;
        AD_Value_SUM[CHAL] = 0; 
        ACCurr_AD = AD_Value[CHAL]; 
       //I=（5V电压）/（51放大倍数*1024*5mΩ采样电阻）//5V实际5.06V
        ACCurr_DD = ((unsigned long)(ACCurr_AD)*1000*5*50/1024/51);   //每1A0.15v  
		devStatus.cur = ACCurr_DD;
		//记录第32次数据
		AD_Value_SUM[CHAL] += ADC_RESULT/4;
    	SUM_CNT[CHAL]++;
    }
	else
	{
		AD_Value_SUM[CHAL] += ADC_RESULT/4;
    	SUM_CNT[CHAL]++;
	}
}
//******************************************************************************


//******************************************************************************
//电压采样
//******************************************************************************

void ADVoltage_Scan(unsigned char CHAL)
{
    unsigned char i;
	unsigned int ADC_ADD4 = 0;
    ADC_RESULT =0;
    for(i=0;i<4;i++)
    {
        ADC_CSR = CHAL;
        ADC_CR1 |= 0X1; // 启动转换
        for ( int j = 0; j < 100; j++)
        {
            if (ADC_CSR_EOC)
            {
                break;
            }
        }
        ADC_RESULT_L = ADC_DRL;
        ADC_RESULT_H = ADC_DRH;
        ADC_RESULT = ADC_RESULT_H * 256 + ADC_RESULT_L;
		ADC_ADD4 += ADC_RESULT;
    }
	
    
    if (SUM_CNT[CHAL] >= 32)
    {
        SUM_CNT[CHAL] = 0;
        AD_Value[CHAL] = AD_Value_SUM[CHAL] >> 5;
        AD_Value_SUM[CHAL] = 0; 
        ACVolt_AD = AD_Value[CHAL]; 
        //u= (101*AD*5)/1024/1.414       最大值转换
        ACVolt_DD = ((unsigned long) ACVolt_AD)*5000 / 1024; //单位10mV
        //Flag_Volt_OK = 1;
		devStatus.vol = ACVolt_DD;
		//CountPower();
		Power = (devStatus.cur / 1000) * (devStatus.vol / 100);
		//记录第32次的数据
		AD_Value_SUM[CHAL] += ADC_ADD4/4;
    	SUM_CNT[CHAL]++;
		
		if((ACVolt_DD <= 1930) && (Flag_Supply_Volt_OK == 2))//电池电量小于19.3V认为电池电量耗尽 2017.01.18修改
		{
			Flag_Supply_Volt_OK = 3;
			HaveChangedOver = 1;
			//if(!Touch_Coil_On)
				//CHECK_P0_SET();
		}

        /*if((ACVolt_DD <= 2000) && (Flag_Supply_Volt_OK == 1) && FULL_DOWN_BETTERFLY)//电池电量小于5.3V认为电池电量耗尽 2017.01.18修改
		{
            FULL_DOWN_BETTERFLY = false;
			if(PF_IDR_IDR4 == 1)//主机正常但充满后拿走需要闭合继电器
			{	 
				PF_ODR_ODR4 = 0;//继电器闭合
            }
            Variable_Init_Third();
		}*/
		/*if((ACVolt_DD <= 10) && (ACCurr_DD <= 10))//20170222负载（电池）断路
		{
			if(PF_IDR_IDR4 == 0)//正常充电状态位闭合	
				PF_ODR_ODR4 = 1;//继电器打开
		}*/
    } 
	else
	{
		AD_Value_SUM[CHAL] += ADC_ADD4/4;
    	SUM_CNT[CHAL]++;
	}			
}


//******************************************************************************
//电压采样线圈
//******************************************************************************

void ADSupply_Voltage_Scan(unsigned char CHAL)
{
	unsigned char i;
	unsigned int ADC_ADD4 = 0;
    ADC_RESULT =0;
	for(i=0;i<4;i++)
    {
        ADC_CSR = CHAL;
        ADC_CR1 |= 0X1; // 启动转换
        for ( int j = 0; j < 100; j++)
        {
            if (ADC_CSR_EOC)
            {
                break;
            }
        }
        ADC_RESULT_L = ADC_DRL;
        ADC_RESULT_H = ADC_DRH;
        ADC_RESULT = ADC_RESULT_H * 256 + ADC_RESULT_L;
		ADC_ADD4 += ADC_RESULT;
    }
	
    if (SUM_CNT[CHAL] >= 32)
    {
        SUM_CNT[CHAL] = 0;
        ACSupply_Volt_AD = AD_Value_SUM[CHAL] >> 5;
        AD_Value_SUM[CHAL] = 0; 

        ACSupply_Volt_DD = ((unsigned long) ACSupply_Volt_AD)*10304 / 1024; //单位10mV 
		devStatus.supply_vol = ACSupply_Volt_DD;
		//记录第32次的数据	
		AD_Value_SUM[CHAL] += ADC_ADD4/4;
		SUM_CNT[CHAL]++;
		
		if((ACSupply_Volt_DD >= 30) && (!STA_PAIR_CODE))//大于1V时即认为有感应电压
		{
			CNT_TOUCH_SET++;
			if(CNT_TOUCH_SET >= 2)
			{
				Touch_Coil_On = true;
				CNT_TOUCH_SET = 0;
				CNT_TOUCH_RE = 0;
                Printf("lineon if \n");
			}
			if((Flag_Supply_Volt_OK == 2) || (Flag_Supply_Volt_OK == 3)) //?????
				PC_ODR_ODR1 = 0;
		}
		else if((ACSupply_Volt_DD <= 10) && STA_PAIR_CODE && (Chanrg_Over == 0))  //20170221配对后未充满电取下
		{
			CNT_TOUCH_RE++;
			if(CNT_TOUCH_RE >= 47)  //3s
			{
				Touch_Coil_On = false;
				CNT_TOUCH_RE = 0;
                STA_PAIR_CODE = false;
                Printf("lineoff else1 \n");
			}
		}
		else if((ACSupply_Volt_DD <= 10)  && (Chanrg_Over == 0))//20170221未配对未充满电取下
		{
			if(!STA_PAIR_CODE)
			{
				CNT_TOUCH_RE++;
				if(CNT_TOUCH_RE >= 47)
				{
					Touch_Coil_On = false;
					CNT_TOUCH_RE = 0;
                    Printf("lineoff else2 \n");
				}
			}			
		}
		else if((ACSupply_Volt_DD <= 10)  && (Chanrg_Over == 1)) //&& STA_PAIR_CODE
		{
			CNT_TOUCH_RE++;
			if(CNT_TOUCH_RE >= 47)  //3s
			{
				Touch_Coil_On = false;
				CNT_TOUCH_RE = 0;
                Printf("lineoff else3 \n");
			}
		}
		/*if(FLAG_CNT_TOUCH_SET)// 20170221 无法收到查询指令断开后
		{			
			Touch_Coil_On = false;
            FLAG_CNT_TOUCH_SET = false;
		}*/	 
	}
	else
	{
		AD_Value_SUM[CHAL] += ADC_ADD4/4;
		SUM_CNT[CHAL]++;
	}
}
//计算功率 msb = 100
void CountPower()
{
	//Power = ((devStatus.cur / 1000.0) * (devStatus.vol / 100.0)) * 100;
	Power = (devStatus.cur / 1000) * (devStatus.vol / 100);
}
/*******************************************************************************
-----------------------------    End of file    --------------------------------
 *******************************************************************************/
