package com.spring.client.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.member.service.MemberService;
import com.spring.client.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	private MemberService memberService;

	@RequestMapping(value="/loginForm")
	public String loginForm(@ModelAttribute("data") MemberVO memberVO){
		log.info("loginForm �샇異� �꽦怨�");

		return "member/loginForm";
	}

	@RequestMapping(value="/memberLogin")
	@ResponseBody
	public String login(@ModelAttribute("data") MemberVO memberVO, HttpServletRequest req){
		log.info("memberLogin �샇異� �꽦怨�");

		HttpSession session = req.getSession();
		int memberIdCheck = 0;
		int loginCheck = 0;
		String result = "";

		memberIdCheck = memberService.getUserOne(memberVO);

		if(memberIdCheck == 0){
			result = "fail";
		}
		else if(memberIdCheck == 1){
			loginCheck = memberService.memberLogin(memberVO);

			if(loginCheck == 1){
				session.setAttribute("loginMember", memberVO);
				result = "success";
			}
			else{
				result = "fail";
			}
		}

		return result;
	}

	@RequestMapping(value="/signUpForm")
	public String signUpForm(@ModelAttribute("data") MemberVO memberVO) {
		log.info("signUpForm �샇異� �꽦怨�");

		return "member/signUpForm";
	}

	@RequestMapping(value="/memberSignUp")
	public String signUp(@ModelAttribute("data") MemberVO memberVO, Model model) {
		log.info("memberSignUp �샇異� �꽦怨�");

		String url = "";
		int result = 0;

		result = memberService.memberSignUp(memberVO);

		if(result == 1){
			url = "/member/loginForm"; //�굹以묒뿉 �쉶�썝媛��엯 �셿猷� �럹�씠吏��룄 異붽� �븷 寃�
		}
		else{
			url = "/member/memberSignUp";
		}

		return "redirect:" + url;
	}

	@RequestMapping(value="/getUserOne", method = RequestMethod.POST)
	@ResponseBody
	public String getUserOne(@ModelAttribute("data") MemberVO memberVO){
		log.info("getUserOne �샇異� �꽦怨�");

		int value = 0;
		String result = "";

		value = memberService.getUserOne(memberVO);

		if(value == 1) {
			result = "fail";
		}
		else{
			result = "success";
		}

		log.info("result : " + result);

		return result;
	}

	@RequestMapping(value="/memberLogout")
	public String memberLogout(HttpSession session){
		session.invalidate();

		return "member/loginForm";
	}
}
