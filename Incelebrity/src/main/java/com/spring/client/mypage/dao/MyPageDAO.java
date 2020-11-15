package com.spring.client.mypage.dao;

import com.spring.client.mypage.vo.MyPageVO;

public interface MyPageDAO {
	// 내정보 조회
	public MyPageVO myInfo(MyPageVO vo);

	// 비밀번호 조회
	public int pwdConfirm(MyPageVO vo);

	// 업데이트
	public int myInfoUpdate(MyPageVO vo);

	// 탈퇴
	public int quitUpdate(MyPageVO vo);
}
