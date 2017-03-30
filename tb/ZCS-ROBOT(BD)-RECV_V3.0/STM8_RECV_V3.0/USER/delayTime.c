#include "type_def.h"
#include "delayTime.h"


//******************************************************************************
//��ʱ����0us
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
    	#error "��֧��8M����Ƶ��"   
#else
		#error "û�ж�����ʱ��Ƶ��"
#endif
    }
}
//******************************************************************************
//��ʱ����1ms
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
    	#error "��֧��8M����Ƶ��"  
#else
		#error "û�ж�����ʱ��Ƶ��"
#endif
	}
}
//******************************************************************************
//��ʱ����ms��
//******************************************************************************
void _delay_ms(unsigned long ms)
{
    while(ms--)
    {
        _delay_1_ms();
    }
}