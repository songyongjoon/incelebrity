package com.spring.client.mypage.service;

import com.spring.client.member.vo.MemberVO;

public interface MyPageService {

	// ������ ��ȸ
	public MemberVO myInfo(MemberVO memberVO);

	// ��й�ȣ ��ȸ
	public int pwdConfirm(MemberVO memberVO);

	// ������Ʈ��
	public MemberVO myInfoUpdateForm(MemberVO memberVO);

	// ������Ʈ
	public int myInfoUpdate(MemberVO memberVO);

	// Ż��
	public int quitUpdate(MemberVO memberVO);
}
