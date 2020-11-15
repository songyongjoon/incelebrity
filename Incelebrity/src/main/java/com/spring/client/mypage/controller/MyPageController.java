package com.spring.client.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.client.member.service.MemberService;
import com.spring.client.member.vo.MemberVO;
import com.spring.client.mypage.service.MyPageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/member/myPage/*")
public class MyPageController {
	private MyPageService myPageService;
	private MemberService memberService;

	// 마이페이지 메인
	@GetMapping("/myPageMain")
	public String myPageMain(@ModelAttribute MemberVO memberVO, Model model, HttpServletRequest req) {
		log.info("myPageMain 호출성공");
		HttpSession session = req.getSession();
		int loginCheck = 0;
		String result = "";

		loginCheck = memberService.memberLogin(memberVO);
		if (loginCheck == 1) {
			session.setAttribute("loginMember", memberVO);
			result = "success";
		} else {
			result = "fail";
		}
		model.addAttribute("result", result);

		return "member/myPage/myPageMain";
	}

	// 내정보 페이지
	@PostMapping("/myInfo")
	public String myInfo(@ModelAttribute MemberVO memberVO, Model model) {
		log.info("myInfo 호출성공");

		MemberVO detail = myPageService.myInfo(memberVO);
		model.addAttribute("detail", detail);

		return "member/myPage/myInfo";
	}

	// 수정시 비밀번호 확인
	@ResponseBody
	@RequestMapping(value = "/pwdConfirm", method = RequestMethod.POST)
	public String pwdConfirm(MemberVO memberVO) {
		log.info("pwdConfirm 호출성공");
		String value = "";

		int result = myPageService.pwdConfirm(memberVO);
		if (result == 1) {
			value = "success";
		} else {
			value = "fail";
		}

		return value;
	}

	// 수정폼
	@PostMapping("/myInfoUpdateForm")
	public String myInfoUpdateForm(@ModelAttribute MemberVO memberVO, Model model) {
		log.info("myInfoUpdateForm 호출성공");

		MemberVO detail = myPageService.myInfoUpdateForm(memberVO);
		model.addAttribute("detail", detail);

		return "member/myPage/myInfoUpdateForm";
	}

	// 수정
	@ResponseBody
	@PostMapping("/myInfoUpdate")
	public int myInfoUpdate(@ModelAttribute MemberVO memberVO) {
		log.info("myInfoUpdate 호출성공");

		int result = 0;
		result = myPageService.myInfoUpdate(memberVO);
		log.info(result);
		return result;

	}

	// 탈퇴
	@PostMapping("/quitUpdate")
	public String quitUpdate(@ModelAttribute MemberVO memberVO, RedirectAttributes ras, HttpSession session) {
		log.info("quitUpdate 호출성공");

		int result = 0;
		String url = "";
		result = myPageService.quitUpdate(memberVO);
		ras.addFlashAttribute("data", memberVO);

		if (result == 1) {
			session.invalidate();
			url = "/member/loginForm";
		} else {
			url = "/member/myPage/myInfoUpdateForm";
		}
		return "redirect:" + url;

	}

}
