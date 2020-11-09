package com.spring.admin.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String memberList(@ModelAttribute AdminMemberVO vo, HttpSession session, Model model) throws Exception {

		log.info("memberList 호출성공");

		List<AdminMemberVO> list = adminMemberService.memberList(vo);
		model.addAttribute("memberList", list);

		return "admin/memberList";
	}

}
