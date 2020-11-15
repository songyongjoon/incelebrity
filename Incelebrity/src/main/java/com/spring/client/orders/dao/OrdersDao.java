package com.spring.client.orders.dao;

import java.util.List;

import com.spring.client.orders.vo.OrdersDetailVO;
import com.spring.client.orders.vo.OrdersVO;

public interface OrdersDao {
	public List<OrdersVO> ordersList(OrdersVO ovo);
	public List<OrdersDetailVO> ordersDetail(Integer orders_no);
	public int ordersDelete(int orders_no);
}
