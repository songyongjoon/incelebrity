package com.spring.client.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.mypage.dao.MyPageDAO;
import com.spring.client.mypage.vo.MyPageVO;

import lombok.Setter;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Setter(onMethod_ = @Autowired)
	private MyPageDAO myPageDAO;

	@Override
	public MyPageVO myInfo(MyPageVO vo) {
		MyPageVO detail = null;
		detail = myPageDAO.myInfo(vo);

		return detail;
	}

	@Override
	public int pwdConfirm(MyPageVO vo) {
		int result = 0;
		result = myPageDAO.pwdConfirm(vo);
		return result;
	}

	@Override
	public MyPageVO myInfoUpdateForm(MyPageVO vo) {
		MyPageVO detail = null;
		detail = myPageDAO.myInfo(vo);

		return detail;
	}

	@Override
	public int myInfoUpdate(MyPageVO vo) {
		int result = 0;
		result = myPageDAO.myInfoUpdate(vo);
		return result;
	}
	
	public int quitUpdate(MyPageVO vo) {
		int result = 0;
		result = myPageDAO.quitUpdate(vo);
		return result;
	}

}
