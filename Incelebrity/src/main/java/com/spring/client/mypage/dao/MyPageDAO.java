package com.spring.client.mypage.dao;

import com.spring.client.mypage.vo.MyPageVO;

public interface MyPageDAO {
	// ������ ��ȸ
	public MyPageVO myInfo(MyPageVO vo);

	// ��й�ȣ ��ȸ
	public int pwdConfirm(MyPageVO vo);

	// ������Ʈ
	public int myInfoUpdate(MyPageVO vo);

	// Ż��
	public int quitUpdate(MyPageVO vo);
}
