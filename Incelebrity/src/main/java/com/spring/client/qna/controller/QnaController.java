package com.spring.client.qna.controller;

	import java.util.List;

	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.GetMapping;
	import org.springframework.web.bind.annotation.ModelAttribute;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;
	import org.springframework.web.bind.annotation.RequestParam;
	import org.springframework.web.servlet.mvc.support.RedirectAttributes;
	import com.spring.client.qna.service.QnaService;
	import com.spring.client.qna.vo.QnaVO;
	import com.spring.common.vo.CommonVO;


	import lombok.AllArgsConstructor;
	import lombok.extern.log4j.Log4j;

	@Controller
	@Log4j
	@RequestMapping("/qna/*")
	@AllArgsConstructor
	public class QnaController {
	   private QnaService qnaService;
	   
	  
	  //글쓰기폼
	   @RequestMapping(value="/writeForm")
	   public String writeForm(@ModelAttribute("data") QnaVO qvo) {
	      log.info("writeForm 호출 성공");
	      
	      return "qna/writeForm";
	   }
	   
	 //글쓰기
	   @RequestMapping(value="/qnaInsert", method=RequestMethod.POST)
	   public String qnaInsert(QnaVO qvo, Model model) {
	      log.info("Insert 호출 성공");
	      
	      int result = 0;
	      String url = "";
	      result = qnaService.qnaInsert(qvo);
	      if(result == 1) {
	         url = "/qna/qnaList";
	      }
	      else {
	         url = "/qna/WriteForm";
	      }
	      
	      return "redirect:" + url;
	   }
	   
	   
	   //글상세페이지
	   @RequestMapping(value="/qnaDetail", method=RequestMethod.GET)
	   public String qnaDetail(@ModelAttribute("data") QnaVO qvo, Model model) {
	      log.info("qnaDetail 호출 성공");
	      
	      QnaVO detail = qnaService.qnaDetail(qvo);
	      model.addAttribute("detail", detail);
	      
	      return "qna/qnaDetail";
	   }
	   
	   
	   //글삭제
	   @RequestMapping(value="/qnaDelete")
	   public String qnaDelete(@ModelAttribute QnaVO qvo, RedirectAttributes ras) {
	      log.info("qnaDelete 호출 성공");
	      
	      int result = 0;
	      String url = "";
	      result = qnaService.qnaDelete(qvo.getQna_no());
	      ras.addFlashAttribute("qnaVO", qvo);
	      
	      if(result == 1) {
	         url="/qna/qnaList";
	      }
	      else{
	         url="/qna/qnaDetail";
	      }
	      return "redirect:" + url;
	   }
	   
	   //글수정폼
	   @RequestMapping(value="/updateForm")
	   public String updateForm(@ModelAttribute("data") QnaVO qvo, Model model) {
	      log.info("updateForm 호출 성공");
	      log.info("qna_no= " + qvo.getQna_no());
	      
	      QnaVO updateData = qnaService.updateForm(qvo);
	      
	      model.addAttribute("updateData", updateData);
	      return "qna/updateForm";
	   }
	   

	   //글수정
	   @RequestMapping(value="/qnaUpdate", method=RequestMethod.POST)
	   public String qnaUpdate(@ModelAttribute QnaVO qvo, RedirectAttributes ras) {
	      log.info("qnaUpdate 호출 성공");
	      
	      int result = 0;
	      String url = "";
	      
	      result = qnaService.qnaUpdate(qvo);
	      ras.addFlashAttribute("data", qvo);
	      
	      if(result ==1) {
	         url="/qna/qnaDetail";
	      }
	      else {
	         url="/qna/updateForm";
	      }
	      
	      return "redirect:" + url;
	   }
	   @GetMapping("qnaList")
	   public String qnaList(CommonVO vo, Model model
	         , @RequestParam(value="nowPage", required=false)String nowPage
	         , @RequestParam(value="cntPerPage", required=false)String cntPerPage
	         , @RequestParam(value="profitStart", required=false)String profitStart
	         , @RequestParam(value="profitEnd", required=false)String profitEnd) {
	      int total = qnaService.countBoard();
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
	      model.addAttribute("viewAll", qnaService.selectBoard(vo));
	      return "qna/qnaList";
	   }  
	   
	}