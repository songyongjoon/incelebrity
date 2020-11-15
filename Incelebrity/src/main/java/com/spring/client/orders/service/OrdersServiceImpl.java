package com.spring.client.orders.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.orders.dao.OrdersDao;
import com.spring.client.orders.vo.OrdersDetailVO;
import com.spring.client.orders.vo.OrdersVO;


import lombok.Setter;

@Service
public class OrdersServiceImpl implements OrdersService {
	
	@Setter(onMethod_ = @Autowired )
	private OrdersDao ordersDao;
	
	//包府磊 orders 备泅
	@Override
	public List<OrdersVO> ordersList(OrdersVO ovo) {
		List<OrdersVO> list = null;
		list = ordersDao.ordersList(ovo);
		
		return list;
	}
	
	@Override
	public List<OrdersDetailVO> ordersDetail(Integer orders_no) {
		List<OrdersDetailVO> list = null;
		list = ordersDao.ordersDetail(orders_no);
		
		return list;
	}
	
	
	// 臂 昏力
	@Override
	public int ordersDelete(int orders_no) {
		int result = 0;
		result = ordersDao.ordersDelete(orders_no);
		
		return result;
	}
	
}
