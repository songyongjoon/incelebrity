package com.spring.client.member.service;

import com.spring.client.member.vo.MemberVO;

public interface MemberService {
	public MemberVO getUserOne(MemberVO memberVO);

	public int memberSignUp(MemberVO memberVO);

	public int memberLogin(MemberVO memberVO);
}
