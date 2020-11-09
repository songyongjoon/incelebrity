package com.spring.admin.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.admin.member.service.AdminMemberService;
import com.spring.admin.member.vo.AdminMemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
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

		return "admin/memberList";
	}

}
