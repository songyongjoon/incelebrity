package com.spring.client.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.member.vo.MemberVO;
import com.spring.client.mypage.dao.MyPageDAO;

import lombok.Setter;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Setter(onMethod_ = @Autowired)
	private MyPageDAO myPageDAO;

	@Override
	public MemberVO myInfo(MemberVO memberVO) {
		MemberVO detail = null;
		detail = myPageDAO.myInfo(memberVO);

		return detail;
	}

	@Override
	public int pwdConfirm(MemberVO memberVO) {
		int result = 0;
		result = myPageDAO.pwdConfirm(memberVO);
		return result;
	}

	@Override
	public MemberVO myInfoUpdateForm(MemberVO memberVO) {
		MemberVO detail = null;
		detail = myPageDAO.myInfo(memberVO);

		return detail;
	}

	@Override
	public int myInfoUpdate(MemberVO memberVO) {
		int result = 0;
		result = myPageDAO.myInfoUpdate(memberVO);
		return result;
	}
	
	public int quitUpdate(MemberVO memberVO) {
		int result = 0;
		result = myPageDAO.quitUpdate(memberVO);
		return result;
	}

}
