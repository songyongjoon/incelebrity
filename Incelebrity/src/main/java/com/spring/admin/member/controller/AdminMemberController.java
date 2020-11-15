package com.spring.admin.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.member.service.AdminMemberService;
import com.spring.admin.member.vo.AdminMemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/member/*")
@AllArgsConstructor
public class AdminMemberController {

	private AdminMemberService adminMemberService;

	/* 전체 회원 조회 */
	@GetMapping("/memberList")
	public String memberList(@ModelAttribute AdminMemberVO vo, HttpSession session, Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage,
			@RequestParam(value="search", required=false)String search,
			@RequestParam(value="keyword", required=false)String keyword) throws Exception {
		log.info("memberList 호출성공");

		int total = adminMemberService.countBoard();
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "20";
		}
		
		vo = new AdminMemberVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), search, keyword);
		model.addAttribute("paging", vo);
		model.addAttribute("memberList", adminMemberService.memberList(vo));

		return "admin/member/memberList";
	}
	
	/* 회원정보 상세조회 */
	@GetMapping("/memberDetail")
	public String memberDetail(@ModelAttribute("data") AdminMemberVO vo, Model model,
			HttpSession session) {
		log.info("memberDetail 호출성공");
		
		AdminMemberVO detail = adminMemberService.memberDetail(vo);
		model.addAttribute("detail", detail);
		
		return "admin/member/memberDetail";
	}
	
	/* 회원상태 수정 */
	@PostMapping("/memberUpdate")
	public String memberUpdate(@ModelAttribute AdminMemberVO vo, RedirectAttributes ras) {
		log.info("memberUpdate 호출성공");
		
		int result =0;
		String url="";
		result = adminMemberService.memberUpdate(vo);
		ras.addFlashAttribute("data",vo);
		
		if(result == 1) {
			url = "/admin/member/memberList";
		}else {
			url = "/admin/member/memberDetail?member_no="+vo.getMember_no();
		}
		return "redirect:" + url;
		
	}
}
