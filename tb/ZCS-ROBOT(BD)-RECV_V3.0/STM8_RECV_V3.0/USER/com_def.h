
/* 
 * File:   com_def.h    通用定义
 * Author: cwj
 *
 * Created on 2016年8月11日, 下午2:26
 */

#ifndef COM_DEF_H
#define COM_DEF_H





#define Me C_Master_BD_JQR_Charging
#define Target C_Salve_BD_JQR_Charging




//发射机工作的状态
#define  C_MSIdle	0		// 待机
#define  C_MSScan	1		// 查询
#define  C_MSPair	2		// 配对
#define  C_MSWork	3		// 供电
#define  C_MSProt	4               //异常


//中惠机器属性表
#define  C_Master_DianFanBao 	  0x0001	//电饭煲发射机
#define  C_Salve_DianFanBao       0x0002        //机器人发射机
#define  C_Master_Jiqiren	  0x0003	//主机机器人
#define  C_Salve_Jiqiren          0x0004        //从机机器人
#define  C_Master_Guanlong	  0x0007	//罐笼主机
#define  C_Salve_Guanlong          0x0008        //罐笼从机
#define  C_Master_BD_JQR_Head	  0x0009	//帮的机器人头部主机
#define  C_Salve_BD_JQR_Head      0x000a        //帮的机器人头部从机
#define  C_Master_BD_JQR_Charging	  0x000b	//帮的机器人充电主机
#define  C_Salve_BD_JQR_Charging      0x000c        //帮的机器人充电从机
#endif /* COM_DEF_H */

