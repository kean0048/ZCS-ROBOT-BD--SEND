/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   GL_power_control.h
 * Author: cwj
 *
 * Created on 2016年8月11日, 上午11:43
 */

#ifndef GL_POWER_CONTROL_H
#define GL_POWER_CONTROL_H
//PC2（MCU_PULSE_DET 检锅中断输入）
//PC3（MCU_PULSE 检锅输出）
//PC4（OVER_DET 保护中断输入）
//只有PF4（MCU_OPEN igbt信号开关输出）
#define MCU_PULSE_DET PC_IDR_IDR2
#define MCU_PULSE PC_ODR_ODR3
#define OVER_DET PC_IDR_IDR4
#define MCU_OPEN PF_ODR_ODR4

void GL_power_control(void);
void TrigControl();
void setTrigTime(int Tcycle);
void IGBT_control2();
void Variable_Clear(void);
#endif /* GL_POWER_CONTROL_H */

