package com.spring.admin.adminNotice.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.adminNotice.service.AdminNoticeService;
import com.spring.client.notice.vo.NoticeVO;
import com.spring.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminNotice/*")
@AllArgsConstructor
public class AdminNoticeController {
	private AdminNoticeService adminNoticeService;
	   
	   //글상세 페이지
	   @RequestMapping(value="/adminNoticeDetail", method=RequestMethod.GET)
	   public String adminNoticeDetail(@ModelAttribute("data") NoticeVO nvo, Model model) {
	      log.info("adminNoticeDetail 호출 성공");
	      
	      NoticeVO detail = adminNoticeService.adminNoticeDetail(nvo);
	      model.addAttribute("detail", detail);
	      
	      return "adminNotice/adminNoticeDetail";
	   }
	   
	   //글쓰기폼
	   @RequestMapping(value="/adminWriteForm")
	   public String adminWriteForm(@ModelAttribute("data") NoticeVO nvo) {
	      log.info("adminWriteForm 호출 성공");
	      
	      return "adminNotice/adminWriteForm";
	   }
	   
	   //글쓰기
	   @RequestMapping(value="/adminNoticeInsert", method=RequestMethod.POST)
	   public String adminNoticeInsert(NoticeVO nvo, Model model) {
	      log.info("Insert 호출 성공");
	      
	      int result = 0;
	      String url = "";
	      result = adminNoticeService.adminNoticeInsert(nvo);
	      if(result == 1) {
	         url = "/adminnotice/adminNoticeList";
	      }
	      else {
	         url = "/adminnotice/adminWriteForm";
	      }
	      
	      return "redirect:" + url;
	   }
	   
	   //글삭제
	   @RequestMapping(value="/adminNoticeDelete")
	   public String adminNoticeDelete(@ModelAttribute NoticeVO nvo, RedirectAttributes ras) {
	      log.info("Delete 호출 성공");
	      
	      int result = 0;
	      String url = "";
	      result = adminNoticeService.adminNoticeDelete(nvo.getNotice_no());
	      ras.addFlashAttribute("NoticeVO", nvo);
	      
	      if(result == 1) {
	         url="/adminNotice/adminNoticeList";
	      }
	      else{
	         url="/adminNotice/adminNoticeDetail";
	      }
	      return "redirect:" + url;
	   }
	   
	   //글수정폼
	   @RequestMapping(value="/adminNoticeUpdateForm")
	   public String adminNoticeUpdateForm(@ModelAttribute("data") NoticeVO nvo, Model model) {
	      log.info("updateForm 호출 성공");
	      log.info("notice_no= " + nvo.getNotice_no());
	      
	      NoticeVO updateData = adminNoticeService.adminNoticeUpdateForm(nvo);
	      
	      model.addAttribute("updateData", updateData);
	      return "adminNotice/adminNoticeUpdateForm";
	   }
	   

	   //글수정
	   @RequestMapping(value="/adminNoticeUpdate", method=RequestMethod.POST)
	   public String adminNoticeUpdate(@ModelAttribute NoticeVO nvo, RedirectAttributes ras) {
	      log.info("Update 호출 성공");
	      
	      int result = 0;
	      String url = "";
	      
	      result = adminNoticeService.adminNoticeUpdate(nvo);
	      ras.addFlashAttribute("data", nvo);
	      
	      if(result ==1) {
	         url="/adminNotice/adminNoticeDetail";
	      }
	      else {
	         url="/adminNotice/adminNoticeupdateForm";
	      }
	      
	      return "redirect:" + url;
	   }
	   
	   @GetMapping("adminNoticeList")
	   public String adminNoticeList(CommonVO vo, Model model
	         , @RequestParam(value="nowPage", required=false)String nowPage
	         , @RequestParam(value="cntPerPage", required=false)String cntPerPage
	         , @RequestParam(value="profitStart", required=false)String profitStart
	         , @RequestParam(value="profitEnd", required=false)String profitEnd) {
	      int total = adminNoticeService.countBoard();
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
	      model.addAttribute("viewAll", adminNoticeService.selectBoard(vo));
	      return "adminNotice/adminNoticeList";
	   }	  
}
