
/* 
 * File:   com_def.h    ͨ�ö���
 * Author: cwj
 *
 * Created on 2016��8��11��, ����2:26
 */

#ifndef COM_DEF_H
#define COM_DEF_H





#define Me C_Master_BD_JQR_Charging
#define Target C_Salve_BD_JQR_Charging




//�����������״̬
#define  C_MSIdle	0		// ����
#define  C_MSScan	1		// ��ѯ
#define  C_MSPair	2		// ���
#define  C_MSWork	3		// ����
#define  C_MSProt	4               //�쳣


//�лݻ������Ա�
#define  C_Master_DianFanBao 	  0x0001	//�緹�ҷ����
#define  C_Salve_DianFanBao       0x0002        //�����˷����
#define  C_Master_Jiqiren	  0x0003	//����������
#define  C_Salve_Jiqiren          0x0004        //�ӻ�������
#define  C_Master_Guanlong	  0x0007	//��������
#define  C_Salve_Guanlong          0x0008        //�����ӻ�
#define  C_Master_BD_JQR_Head	  0x0009	//��Ļ�����ͷ������
#define  C_Salve_BD_JQR_Head      0x000a        //��Ļ�����ͷ���ӻ�
#define  C_Master_BD_JQR_Charging	  0x000b	//��Ļ����˳������
#define  C_Salve_BD_JQR_Charging      0x000c        //��Ļ����˳��ӻ�
#endif /* COM_DEF_H */

