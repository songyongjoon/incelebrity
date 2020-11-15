package com.spring.client.findPwd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.findPwd.dao.FindPwdDAO;
import com.spring.client.member.vo.MemberVO;

import lombok.Setter;

@Service
public class FindPwdServiceImpl implements FindPwdService {
	@Setter(onMethod_ = @Autowired)
	private FindPwdDAO findPwdDAO;

	@Override
	public MemberVO findPwd(MemberVO memberVO) {
		MemberVO detail = null;
		detail = findPwdDAO.findPwd(memberVO);
		return detail;
	}

}
