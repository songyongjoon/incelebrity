package com.spring.client.orders.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.client.orders.service.OrdersService;
import com.spring.client.orders.vo.OrdersDetailVO;
import com.spring.client.orders.vo.OrdersVO;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/orders/*")
@AllArgsConstructor
public class OrdersController {

	private  OrdersService ordersService;
	
	//�۸�� ���� (jsp)
   	//@GetMapping("ordersList")	
	@RequestMapping(value="/ordersList" , method = RequestMethod.GET)
	public String ordersList(@ModelAttribute("date") OrdersVO ovo , Model model) {
		log.info( "ordersList ȣ�� ���� ");
		
		// ��ü ���ڵ� ��ȸ
		List<OrdersVO> ordersList = ordersService.ordersList(ovo);
		model.addAttribute("ordersList", ordersList);
		
		return "orders/ordersList";
	}
	
	@ResponseBody // ȭ�鿡 ���
	@GetMapping(value = "/{orders_no}" , produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<OrdersDetailVO>> ordersDetail(@PathVariable("orders_no") Integer orders_no) {
		log.info("list ȣ�� ����");
		
		//ResponseEnitity ��ü�� 404, 405, 500 ������ ������ � ������ ������ �˷��ִ� ��ü�̴�. 
		ResponseEntity<List<OrdersDetailVO>> entity = null;
			    
		//�츮�� ���� ���°��� �������� �� �ִ�. 
		entity = new ResponseEntity<>(ordersService.ordersDetail(orders_no), HttpStatus.OK);
		return entity;
	}
	
	// ������ �ֹ� ������ ����
	@RequestMapping(value = "/boardDelete")
	public String ordersDelete(@ModelAttribute OrdersDetailVO odv , RedirectAttributes ras) {
		log.info("ordersDelet ȣ�⼺��");
		int result = 0;
		String url = "";
		
		result = ordersService.ordersDelete(odv.getOrders_detail_no());
		ras.addFlashAttribute("OrdersDetailVO" , odv);
		log.info("result = " + result);
		if(result == 1) {
			url = "/orders/ordersList";
		} else {
			url="/orders/ordersDetail?orders_no=" + odv.getOrders_no();
		}
		return "redirect : " + url;
	}
}
