/******************************************************************************/
/*					                                      */
/*	Project Name :	�����		                                      */
/*	Version      :	1.0			                              */
/*	MCU          :	ST 8-bit STM8S104K4T6C	                              */
/*	Clock        :	8MHz			                              */
/*	Author	     :	RENHAI   		                              */
/*  Date	     :	2016/10/9	                                      */
/*	Corporation  :	�лݴ��ǣ����ڣ����߹��缼�����޹�˾                    */
/*						                              */
/******************************************************************************/
/*******************************************************************************
-----------------------------     File start    --------------------------------
*******************************************************************************/
#ifndef _QUEUEMSG_H
#define _QUEUEMSG_H

/*******************************************************************************
-----------------------------    Macro define    -------------------------------
*******************************************************************************/
#define MAXQSIZE 19 // the max size of queue������4��ʱ�����ֶ������������
// ��Ϣ���ݽṹ
typedef struct
{
	unsigned char id; // ��Ϣ��ʶ
	void *pInf; // ָ����Ϣ���ݵ�ָ��
	unsigned char datalenth; //��Ϣ����
	unsigned long time; // ��Ϣ����ʱ��
}TMsg;

typedef TMsg TQElemType;

// data structure of circular queue
//�������ɣ��ڳ�ʼ��msgʱ��һ��Ҫ��ʼ��*RecvDate,��ʹ��malloc()����һ�鶯̬�ڴ�
typedef struct
{
	TQElemType base[MAXQSIZE]; // queue elements
	int front;
	int rear;
}TSqQueue;
 
extern TSqQueue queSEND;
/*******************************************************************************
-------------------------    Function declaration    ---------------------------
*******************************************************************************/
/*******************************************************************************
  Name:
    enQueue
  Description:
    Inserts a given element into the rear of given circular queue.
  Input:
    pQ -- Pointer to the given circular queue.
    pE -- Pointer to the given element.
  Output:
    
  Return:
    1 -- Succeed.
    0 -- Fails if the queue is full.
  Others:
    
*******************************************************************************/
int enQueue(TSqQueue *pQ, TQElemType *pE);
/*******************************************************************************
  Name:
    deQueue
  Description:
    Deletes the front element of the given circular queue, and makes a given
    pointer point to that element.
  Input:
    pQ -- Pointer to the given circular queue.
  Output:
    pE -- The given pointer to the deleted element.
  Return:
    1 -- Succeed.
    0 -- Fails if the queue is empty.
  Others:
    
*******************************************************************************/
int deQueue(TSqQueue *pQ, TQElemType *pE);

/*******************************************************************************
  Name:
    isFull
  Description:
    Whether a given circular queue is full.
  Input:
    pQ -- Pointer to the given circular queue.
  Output:
    
  Return:
    1 -- Full.
    0 -- Not full.
  Others:
    
*******************************************************************************/
int isFull(TSqQueue *pQ);
/*******************************************************************************
  Name:
    isEmpty
  Description:
    Whether a given circular queue is empty.
  Input:
    pQ -- Pointer to the given circular queue.
  Output:
    
  Return:
    1 -- Empty.
    0 -- Not empty.
  Others:
    
*******************************************************************************/
int isEmpty(TSqQueue *pQ);
#endif
/*******************************************************************************
-----------------------------    End of file    --------------------------------
*******************************************************************************/