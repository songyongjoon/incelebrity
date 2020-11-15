package com.spring.client.notice.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.client.notice.service.NoticeService;
import com.spring.client.notice.vo.NoticeVO;
import com.spring.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {
	private NoticeService noticeService;
	
	
	   
	 //글상세 페이지
	   @RequestMapping(value="/noticeDetail", method=RequestMethod.GET)
	   public String noticeDetail(@ModelAttribute("data") NoticeVO nvo, Model model) {
	      log.info("noticeDetail 호출 성공");
	      
	      NoticeVO detail = noticeService.noticeDetail(nvo);
	      model.addAttribute("detail", detail);
	      
	      return "notice/noticeDetail";
	   }
	   
	   @GetMapping("noticeList")
	   public String noticeList(CommonVO vo, Model model
	         , @RequestParam(value="nowPage", required=false)String nowPage
	         , @RequestParam(value="cntPerPage", required=false)String cntPerPage
	         , @RequestParam(value="profitStart", required=false)String profitStart
	         , @RequestParam(value="profitEnd", required=false)String profitEnd) {
	      int total = noticeService.countBoard();
	      if(nowPage == null && cntPerPage == null) {
	         nowPage = "1";
	         cntPerPage = "20";
	      }else if(nowPage == null) {
	         nowPage = "1";
	      }else if(cntPerPage == null) {
	         cntPerPage = "20";
	      }
	      vo = new CommonVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), profitStart, profitEnd);
	      model.addAttribute("paging", vo);
	      model.addAttribute("viewAll", noticeService.selectBoard(vo));
	      return "notice/noticeList";
	   }
	   
}
