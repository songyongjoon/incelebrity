package com.spring.client.mypage.dao;

import com.spring.client.member.vo.MemberVO;

public interface MyPageDAO {
	// ������ ��ȸ
	public MemberVO myInfo(MemberVO memberVO);

	// ��й�ȣ ��ȸ
	public int pwdConfirm(MemberVO memberVO);

	// ������Ʈ
	public int myInfoUpdate(MemberVO memberVO);

	// Ż��
	public int quitUpdate(MemberVO memberVO);
}
