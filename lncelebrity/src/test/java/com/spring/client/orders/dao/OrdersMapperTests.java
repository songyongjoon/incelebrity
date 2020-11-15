package com.spring.client.orders.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.orders.vo.OrdersVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrdersMapperTests {
	@Setter(onMethod_ = @Autowired)
	private OrdersDao OrdersDao;
	
	@Test
	public void testMultipleBoardList() {
		OrdersVO ovo = new OrdersVO();
		List<OrdersVO> list = OrdersDao.ordersList(ovo);
		for(OrdersVO vo : list) {
			log.info(vo);
		}
	}
}
