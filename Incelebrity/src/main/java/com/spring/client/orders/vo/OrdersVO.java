package com.spring.client.orders.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class OrdersVO {
	private int orders_no = 0;				// ��ȣ
	private String orders_address = "";		// �ּ�
	private String orders_phone = "";		// ��ȭ��ȣ
	private int orders_state = 0;			// �ֹ�����
	private String orders_date = "";		// �ۼ���
	private String orders_detail_name = ""; //�ۼ���.
	
}
