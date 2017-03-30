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
#ifndef _PROTECT_
#define _PROTECT_


/*******************************************************************************
-----------------------------    Macro define    -------------------------------
*******************************************************************************/
//��ѹ��Χ  0   �� ��ѹ��ֵ  �� 639
//          0   �� ��ѹ��ֵ  �� 180    ����Ƿѹ����
//         185  �� ��ѹ��ֵ  �� 639    �˳�Ƿѹ����
#define C_Maximum_Low_Volt          18000          //Ƿѹ����ֵ
#define C_Minimum_Low_Volt          0            //Ƿѹ����ֵ
#define C_Back_Maximum_Low_Volt     31000         //Ƿѹ�ָ�ֵ
#define C_Back_Minimum_Low_Volt     18500          //Ƿѹ�ָ�ֵ
//         260  �� ��ѹ��ֵ  �� 639    �����ѹ����
//         0    �� ��ѹ��ֵ  �� 255    �˳���ѹ����
/*
#define C_Maximum_High_Volt         31000         //��ѹ����ֵ
#define C_Minimum_High_Volt         26000         //��ѹ����ֵ
#define C_Back_Maximum_High_Volt    25500          //��ѹ�ָ�ֵ
#define C_Back_Minimum_High_Volt    0000           //��ѹ�ָ�ֵ
*/
//��ѹ��λ10mV
#define C_Maximum_High_Volt         5000         //��ѹ����ֵ
#define C_Minimum_High_Volt         4500         //��ѹ����ֵ
#define C_Back_Maximum_High_Volt    4000          //��ѹ�ָ�ֵ
#define C_Back_Minimum_High_Volt    0000           //��ѹ�ָ�ֵ
//�¶ȷ�Χ 0   �� NTC��ADֵ  �� 1024
//         0   �� NTC��ADֵ  �� 20    �����·����
//         20  �� NTC��ADֵ  �� 1024  �˳���·����
#define C_Maximum_NTC_Short         20             //��·����ֵ
#define C_Minimum_NTC_Short         0              //��·����ֵ
#define C_Back_Maximum_NTC_Short    1024           //��·�ָ�ֵ
#define C_Back_Minimum_NTC_Short    20             //��·�ָ�ֵ
//         1013�� NTC��ADֵ  �� 1024    ���뿪·����
//         0   �� NTC��ADֵ  �� 1013   �˳���·����
#define C_Maximum_NTC_Open          1024            //��·����ֵ
#define C_Minimum_NTC_Open          1013            //��·����ֵ
#define C_Back_Maximum_NTC_Open     1013             //��·�ָ�ֵ
#define C_Back_Minimum_NTC_Open     0              //��·�ָ�ֵ
//�¶ȷ�Χ 0   �� �¶�����  �� 200    //0��ʾ-30�棬200��ʾ170��
//         100 �� �¶�����  �� 200    ���볬�±���
//         0   �� �¶�����  �� 100    �˳���·����
#define C_Maximum_IGBT_Hot          229            //IGBT���½���ֵ
#define C_Minimum_IGBT_Hotn         200            //IGBT���½���ֵ
#define C_Back_Maximum_IGBT_Hot     180            //IGBT���»ָ�ֵ
#define C_Back_Minimum_IGBT_Hot     0             //IGBT���»ָ�ֵ

#define C_Maximum_ACCurr            4000          //������λ1mA
/*******************************************************************************
-------------------------    Function declaration    ---------------------------
*******************************************************************************/
void  MacProtect(void);//�쳣����봦��
void  MPSubA(unsigned char protype,unsigned int advalue,unsigned int ladv,unsigned int hadv);
void  MPSubB(unsigned char protype,unsigned int advalue,unsigned int ladv,unsigned int hadv);
void  MPSubC(void);
void  ProCodeTurn(void);
void  KPIdle(void);
//void  MPSub_IGBT_IN(unsigned char protype);//����IGBT�ж��쳣
//void  MPSub_IGBT_OUT(unsigned char protype);//�˳�IGBT�ж��쳣
void  MPSub_Remove_load_IN(unsigned char protype);
void  MPSub_Remove_load_OUT(unsigned char protype);

void  MPSub_Curr_IN(unsigned char protype);//�����������
void  MPSub_Curr_OUT(unsigned char protype);//�˳���������

void  MPSub_Fan_IN(unsigned char protype);//���ȹ��ϼ��
void  MPSub_Fan_OUT(unsigned char protype);//���ȹ����˳�

void  MPSub_Nrf24l01_IN(unsigned char protype);
void  MPSub_Nrf24l01_OUT(unsigned char protype);


void  MPSub_Check_NRF24L01_IN(unsigned char protype);
void  MPSub_Check_NRF24L01_OUT(unsigned char protype);

void  MPSub_Receiver_IN(unsigned char protype);//�ӻ��й���
void  MPSub_Receiver_OUT(unsigned char protype);//�˳��ӻ�����


void  MPSub_Pro_Code(void);//�������ϴ���
void  MPSub_Beep(void);

void  MPSub_Volt_IN(unsigned char protype);//���ٽ����ѹ����
void  MPSub_Tached_Check(unsigned char protype); //������ϵͳǰ�ĺͶ����йص���Ϣ��ȷ��
void  MPSub_Viot_Curr_Over_IN(unsigned char protype);//PD7���ż���ѹ����
void  MPSub_Viot_Curr_Over_OUT(unsigned char protype);//PD7���ż���ѹ����

void  MPSub_Nrf24l01_Pair_IN(unsigned char protype);
void  MPSub_Nrf24l01_Pair_OUT(unsigned char protype);
#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/