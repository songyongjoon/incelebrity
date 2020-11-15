package com.spring.admin.profit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.admin.profit.service.ProfitService;
import com.spring.admin.profit.vo.ProfitVO;
import com.spring.common.page.PagingVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/profit/*")
@Log4j
@AllArgsConstructor
public class ProfitController {
	private ProfitService profitService;
	
	@GetMapping("profitList")
	public String reviewList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(value="profitStart", required=false)String profitStart
			, @RequestParam(value="profitEnd", required=false)String profitEnd) {
		int total = profitService.countBoard();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "20";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "20";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), profitStart, profitEnd);
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", profitService.selectBoard(vo));
		System.out.println(vo);
		return "profit/profitList";
	}
	
	@RequestMapping(value="/profitDetail", method=RequestMethod.GET)
	public String profitDetail(@ModelAttribute("data") ProfitVO pvo, Model model) {
		ProfitVO detail = profitService.profitDetail(pvo);
		model.addAttribute("detail", detail);
		
		return "profit/profitDetail";
	}
}
