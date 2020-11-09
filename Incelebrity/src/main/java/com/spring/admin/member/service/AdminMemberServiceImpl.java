package com.spring.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.member.dao.AdminMemberDAO;
import com.spring.admin.member.vo.AdminMemberVO;
import com.spring.common.vo.CommonVO;

import lombok.Setter;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {

	@Setter(onMethod_ = @Autowired)
	private AdminMemberDAO adminMemberDAO;

	@Override
	public List<AdminMemberVO> memberList(AdminMemberVO vo) {
		List<AdminMemberVO> list = null;
		list = adminMemberDAO.memberList(vo);
		return list;
	}
}
