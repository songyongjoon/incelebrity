package com.spring.admin.member.dao;

import java.util.List;

import com.spring.admin.member.vo.AdminMemberVO;

public interface AdminMemberDAO {

	List<AdminMemberVO> memberList(AdminMemberVO vo);
}
