package com.spring.client.orders.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class OrdersDetailVO {
	private int orders_detail_no = 0;
	private int orders_no = 0;
	private String orders_detail_name = "";
	private int orders_detail_price = 0;
	private int orders_detail_count = 0;
	private String orders_detail_size = "";
	private String orders_detail_color = "";
	private String orders_date = "";
}
