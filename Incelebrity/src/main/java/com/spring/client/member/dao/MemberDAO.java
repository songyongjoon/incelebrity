package com.spring.client.member.dao;

import com.spring.client.member.vo.MemberVO;

public  interface MemberDAO {
	public int getUserOne(MemberVO memberVO);
	public int memberSignUp(MemberVO memberVO);
	public int memberLogin(MemberVO memberVO);
}
