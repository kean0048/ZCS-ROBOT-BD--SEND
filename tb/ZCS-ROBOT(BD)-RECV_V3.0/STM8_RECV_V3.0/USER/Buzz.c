/******************************************************************************/
/*					                                      */
/*	Project Name :	���ջ�		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	16MHz			                              */
/*	Author	     :	mengzhuozhuo   		                              */
/*      Date	     :	2016/04/26	                                      */
/*	Corporation  :	�лݴ��ǣ����ڣ����߹��缼�����޹�˾                   */
/*						                              */
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
*******************************************************************************/


/*******************************************************************************
-----------------------------    Include files   -------------------------------
*******************************************************************************/
#include "type_def.h"
#include "Buzz.h"


//******************************************************************************
//����������
//******************************************************************************
void  Buzzer(void)
{	
    if(Flag_10ms_F ==1)
    {
        Flag_10ms_F = 0;
        BuzzerNewOld();
        switch (Buzz_Buffer)
        {
            case  BUZZ_POWER_ON://�ϵ�
                BuzzChange(100,0,1);
                break;
            case  BUZZ_KEY_ON://����
                BuzzChange(10,0,1);
                break;
            case  BUZZ_IN_Error_0://����
                BuzzChange(20,0,1);
                break;
            case  BUZZ_IN_Error_1://��ѹ
                BuzzChange(20,0,1);
                break;
            case  BUZZ_IN_Error_2://NTC��·
                BuzzChange(20,30,2); 
                break;
            case  BUZZ_IN_Error_3://NTC��·
                BuzzChange(20,30,2);
                break;
            case  BUZZ_IN_Error_4://IGBT����
                BuzzChange(20,30,3);
                break;
            case  BUZZ_IN_Error_5://�����쳣
                BuzzChange(20,30,4);
                break;
            case  BUZZ_IN_Error_6://ͨ���쳣
                BuzzChange(20,30,5); 
                break;
            case  BUZZ_IN_Error_7://Ч���쳣
                BuzzChange(20,30,6);
                break;
            case  BUZZ_IN_Error_8://û�в�ѯָ��ظ���p0ͨ��������һ����
                BuzzChange(10,0,1); 
                break;
            case  BUZZ_IN_Error_9://��ѹ����
                BuzzChange(80,20,2); 
                break;
            case  BUZZ_IN_Error_10://���ӻ��쳣
                BuzzChange(80,20,3); 
                break;
            case  BUZZ_IN_Error_11://���ӻ��쳣
                BuzzChange(80,20,4); 
                break;
            case  BUZZ_EXIT_Error://�˳�����
                BuzzChange(100,0,1);
                break;	
            default:
                Buzz_Buffer = 0;
                break;
        }
    }
}
//******************************************************************************


//******************************************************************************
//����������
//******************************************************************************
void  BuzzerNewOld(void)
{
    if(Buzz_Control != 0)//˵�����µķ���������
    {
        Buzz_Times_CNT = 0;
        Buzz_Keep_CNT = 0;
        Buzz_Step = 0;
        Buzz_Buffer = 0;
        BuzzDriver(BUZZ_CLOSE);
        CNT_Buzzer++;
        if(CNT_Buzzer >= 5)//��ʱ10*5��50ms
        {
            CNT_Buzzer = 0;
            Buzz_Buffer = Buzz_Control;
            Buzz_Control = 0;
        }
    }
}
//******************************************************************************


//******************************************************************************
//��������ʼ������
//******************************************************************************
void  BuzzInit(void)//Ҫ������ִ��
{
    //unsigned char i;
    Command_Old = 0XFF;
    Buzz_Control = BUZZ_POWER_ON;
    /*
    FLASH_CR2 = 0x80;
    i=10;
    while(i--);
    FLASH_NCR2 = 0x7f;
    i=10;
    while(i--);
    *((unsigned char *)0x4803) = 0x80;
    i=10;
    while(i--);
    *((unsigned char *)0x4804) = 0x7f;
    BEEP_CSR=0X02;
    */
}
//******************************************************************************


//******************************************************************************
//����������
//******************************************************************************
void  BuzzChange(unsigned char Buzz_On,unsigned char Buzz_Off,unsigned char Buzz_Times)
{
    switch (Buzz_Step)
    {
        case  0://on
            Buzz_Keep_CNT++;
            if (Buzz_Keep_CNT > Buzz_On)
            {
                Buzz_Keep_CNT = 0;                
                Buzz_Times_CNT++;
                if (Buzz_Times_CNT >= Buzz_Times)
                {
                    Buzz_Times_CNT = 0;
                    Buzz_Buffer = 0;
                    Buzz_Step = 0;
                    BuzzDriver(BUZZ_CLOSE);
                }
                else
                {
                    Buzz_Step = 1;//on to off
                    BuzzDriver(BUZZ_CLOSE);
                }
            }
            else
            {
                BuzzDriver(BUZZ_OPEN);
            }
            break;
        case  1://off
            Buzz_Keep_CNT++;
            if (Buzz_Keep_CNT >= Buzz_Off)  
            {
                Buzz_Keep_CNT = 0;
                Buzz_Step = 0;//off to on
                if (Buzz_Times_CNT < Buzz_Times)
                {
                    BuzzDriver(BUZZ_OPEN);      
                    Buzz_Keep_CNT++;            
                }
            }
            break;
        default:
            Buzz_Step = 0;
            Buzz_Buffer = 0;
            BuzzDriver(BUZZ_CLOSE);
            break;
    }
}
//******************************************************************************


//******************************************************************************
//����������
//******************************************************************************
void  BuzzDriver(unsigned char Command_New)
{
    if (Command_Old != Command_New)
    {
        Command_Old = Command_New;
        if (Command_Old == BUZZ_OPEN)
        {
            BuzzStart();
        }
        else if (Command_Old == BUZZ_CLOSE)
        {
            BuzzStop();
        }
    }
}
//******************************************************************************


//******************************************************************************
//��������������
//******************************************************************************
void  BuzzStart(void)
{
    //BEEP_CSR_BEEPEN =1;
    PD_ODR_ODR4 =1;
}
//******************************************************************************


//******************************************************************************
//�رշ���������
//******************************************************************************
void  BuzzStop(void)
{
    //BEEP_CSR_BEEPEN =0;
    PD_ODR_ODR4 =0;
}
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/