package com.spring.client.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.mypage.dao.MyPageDAO;

import lombok.Setter;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Setter(onMethod_ = @Autowired)
	private MyPageDAO myPageDAO;
}
