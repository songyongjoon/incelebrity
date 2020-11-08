package com.spring.client.member.service;

import java.util.List;

import com.spring.client.member.vo.MemberVO;

public interface MemberService {
	public int getUserOne(MemberVO memberVO);
	public int memberSignUp(MemberVO memberVO);
	public int memberLogin(MemberVO memberVO);
}

	
