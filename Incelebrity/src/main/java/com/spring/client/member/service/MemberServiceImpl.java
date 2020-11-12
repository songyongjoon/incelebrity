package com.spring.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.member.dao.MemberDAO;
import com.spring.client.member.vo.MemberVO;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {
	@Setter(onMethod_=@Autowired)
	private MemberDAO memberDAO;

	@Override
	public int getUserOne(MemberVO memberVO) {
		int result = 0;
		result = memberDAO.getUserOne(memberVO);

		return result;
	}

	@Override
	public int memberSignUp(MemberVO memberVO) {
		int result = 0;
		result = memberDAO.memberSignUp(memberVO);

		return result;
	}

	@Override
	public int memberLogin(MemberVO memberVO) {
		int result = 0;
		result = memberDAO.memberLogin(memberVO);

		return result;
	}
}
