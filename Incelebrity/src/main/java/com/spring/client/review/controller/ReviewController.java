package com.spring.client.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.client.review.service.ReviewService;
import com.spring.client.review.vo.ReviewVO;
import com.spring.common.page.PagingVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review/*")
@Log4j
@AllArgsConstructor
public class ReviewController {
	private ReviewService reviewService;
	@GetMapping("reviewList")
	public String reviewList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(value="profitStart", required=false)String profitStart
			, @RequestParam(value="profitEnd", required=false)String profitEnd) {
		int total = reviewService.countBoard();
		int profitTotal = 0;
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
		model.addAttribute("viewAll", reviewService.selectBoard(vo));
		return "review/reviewList";
	}
	
	/*¸®ºä »ó¼¼*/
	@RequestMapping(value="/reviewDetail", method=RequestMethod.GET)
	public String reviewDetail(@ModelAttribute("data") ReviewVO rvo, Model model) {
		log.info("reviewDetail È£Ãâ");
		
		ReviewVO detail = reviewService.reviewDetail(rvo);
		model.addAttribute("detail", detail);
		
		return "review/reviewDetail";
	}
	
	/* ¸®ºä ÀÛ¼º Æû */
	@RequestMapping(value="/reviewWriteForm")
	public String reviewWriteForm() {
		
		return "review/reviewWriteForm";
	}
	
	/* ¸®ºä »ðÀÔ */
	@RequestMapping(value="/reviewInsert", method=RequestMethod.POST)
	public String reviewInsert(ReviewVO rvo, Model model) {
		
		int result = 0;
		String url = "";
		
		result = reviewService.reviewInsert(rvo);
		if(result == 1) {
			url = "/review/reviewList";
		}else {
			url = "/review/reviewWriteForm";
		}
		return "redirect:"+url;
	}
	/* ¸®ºä »èÁ¦ */
	@RequestMapping(value="/reviewDelete")
	public String reviewDelete(@ModelAttribute ReviewVO rvo, RedirectAttributes ras) {
		int result = 0;
		String url = "";
		
		result = reviewService.reviewDelete(rvo.getReview_no());
		ras.addFlashAttribute("reviewVO", rvo);
		
		if(result==1) {
			url="/review/reviewList";
		}else {
			url="/review/reviewDetail";
		}
		return "redirect:"+url;
	}
	
	/* ¸®ºä ¼öÁ¤ Æû Ãâ·Â*/
	@RequestMapping(value="/reviewUpdateForm")
	public String reviewUpdateForm(@ModelAttribute("data") ReviewVO rvo, Model model) {
		ReviewVO updateData = reviewService.reviewUpdateForm(rvo);
		
		model.addAttribute("reviewUpdateForm", updateData);
		return "review/reviewUpdateForm";
	}
	/* ¸®ºä ¼öÁ¤ ±¸Çö */
	@RequestMapping(value="/reviewUpdate")
	public String reviewUpdate(@ModelAttribute ReviewVO rvo, RedirectAttributes ras) {
		int result = 0;
		String url = "";
		
		result = reviewService.reviewUpdate(rvo);
		ras.addFlashAttribute("data", rvo);
		
		if(result == 1) {
			url="/review/reviewDetail";
		}else {
			url="/review/reviewUpdateForm";
		}
		return "redirect:"+url;
	}
	
}
