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
	
	//글목록 구현 (jsp)
   	//@GetMapping("ordersList")	
	@RequestMapping(value="/ordersList" , method = RequestMethod.GET)
	public String ordersList(@ModelAttribute("date") OrdersVO ovo , Model model) {
		log.info( "ordersList 호출 성공 ");
		
		// 전체 레코드 조회
		List<OrdersVO> ordersList = ordersService.ordersList(ovo);
		model.addAttribute("ordersList", ordersList);
		
		return "orders/ordersList";
	}
	
	@ResponseBody // 화면에 출력
	@GetMapping(value = "/{orders_no}" , produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<OrdersDetailVO>> ordersDetail(@PathVariable("orders_no") Integer orders_no) {
		log.info("list 호출 성공");
		
		//ResponseEnitity 객체는 404, 405, 500 에러가 났을때 어떤 에러가 났는지 알려주는 객체이다. 
		ResponseEntity<List<OrdersDetailVO>> entity = null;
			    
		//우리는 이제 상태값을 지정해줄 수 있다. 
		entity = new ResponseEntity<>(ordersService.ordersDetail(orders_no), HttpStatus.OK);
		return entity;
	}
	
	// 관리자 주문 데이터 삭제
	@RequestMapping(value = "/boardDelete")
	public String ordersDelete(@ModelAttribute OrdersDetailVO odv , RedirectAttributes ras) {
		log.info("ordersDelet 호출성공");
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
