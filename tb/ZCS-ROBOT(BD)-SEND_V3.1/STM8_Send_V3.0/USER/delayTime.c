#include "type_def.h"
#include "delayTime.h"


//******************************************************************************
//延时函数0us
//******************************************************************************
//******************************************************************************
void _delay_us(unsigned long us)
{
    while(us--)
    {
#if (FOSC==FOSC_24M)
    	asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");
    	asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");
    	asm("NOP");asm("NOP");asm("NOP");asm("NOP");//asm("NOP");asm("NOP");
#elif (FOSC==FOSC_16M)
    	asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");
    	asm("NOP");asm("NOP");asm("NOP");//asm("NOP");asm("NOP");
#elif (FOSC==FOSC_8M)
    	//asm("NOP");asm("NOP");    
#elif (FOSC==FOSC_4M)
    	#error "不支持8M以下频率"   
#else
		#error "没有定义主时钟频率"
#endif
    }
}
//******************************************************************************
//延时函数1ms
//******************************************************************************
void _delay_1_ms(void)
{
    unsigned long cnt=1000;
    while(cnt--)
	{
#if (FOSC==FOSC_24M)
    	asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");
    	asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");
    	asm("NOP");asm("NOP");asm("NOP");asm("NOP");//asm("NOP");asm("NOP");
#elif (FOSC==FOSC_16M)
    	asm("NOP");asm("NOP");asm("NOP");asm("NOP");asm("NOP");
    	asm("NOP");asm("NOP");asm("NOP");//asm("NOP");asm("NOP");
#elif (FOSC==FOSC_8M)
    	//asm("NOP");asm("NOP");    
#elif (FOSC==FOSC_4M)
    	#error "不支持8M以下频率"  
#else
		#error "没有定义主时钟频率"
#endif
	}
}
//******************************************************************************
//延时函数ms级
//******************************************************************************
void _delay_ms(unsigned long ms)
{
    while(ms--)
    {
        _delay_1_ms();
    }
}