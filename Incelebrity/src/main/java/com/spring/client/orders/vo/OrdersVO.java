package com.spring.client.orders.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class OrdersVO {
	private int orders_no = 0;				// 번호
	private String orders_address = "";		// 주소
	private String orders_phone = "";		// 전화번호
	private int orders_state = 0;			// 주문상태
	private String orders_date = "";		// 작성일
	private String orders_detail_name = ""; //작성자.
	
}
