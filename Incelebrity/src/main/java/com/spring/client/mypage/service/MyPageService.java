package com.spring.client.mypage.service;

import com.spring.client.mypage.vo.MyPageVO;

public interface MyPageService {

	// ������ ��ȸ
	public MyPageVO myInfo(MyPageVO vo);

	// ��й�ȣ ��ȸ
	public int pwdConfirm(MyPageVO vo);

	// ������Ʈ��
	public MyPageVO myInfoUpdateForm(MyPageVO vo);

	// ������Ʈ
	public int myInfoUpdate(MyPageVO vo);

	// Ż��
	public int quitUpdate(MyPageVO vo);
}
