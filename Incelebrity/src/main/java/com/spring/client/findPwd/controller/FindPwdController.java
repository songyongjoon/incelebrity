package com.spring.client.findPwd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.findPwd.service.FindPwdService;
import com.spring.client.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/findPwd/*")
@AllArgsConstructor
public class FindPwdController {

	private FindPwdService findPwdService;

	// 비밀번호 찾기폼
	@RequestMapping(value = "/findPwdForm")
	public String findPwdForm(@ModelAttribute("data") MemberVO memberVO) {
		log.info("findPwdForm 호출성공");
		return "member/findPwd/findPwdForm";
	}

	// 비밀번호 찾기 구현
	@RequestMapping(value = "/findPwd", method = RequestMethod.POST)
	public String findPwd(@ModelAttribute("data") MemberVO memberVO, Model model) {
		log.info("findPwd 호출성공");

		model.addAttribute("detail", findPwdService.findPwd(memberVO));

		return "member/findPwd/findPwd";
	}

}
