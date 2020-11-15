package com.spring.client.mypage.service;

import com.spring.client.member.vo.MemberVO;

public interface MyPageService {

	// 내정보 조회
	public MemberVO myInfo(MemberVO memberVO);

	// 비밀번호 조회
	public int pwdConfirm(MemberVO memberVO);

	// 업데이트폼
	public MemberVO myInfoUpdateForm(MemberVO memberVO);

	// 업데이트
	public int myInfoUpdate(MemberVO memberVO);

	// 탈퇴
	public int quitUpdate(MemberVO memberVO);
}
