package com.spring.admin.member.service;

import java.util.List;

import com.spring.admin.member.vo.AdminMemberVO;

public interface AdminMemberService {

	// ����¡ ó�� �Խñ� ��ȸ
	public List<AdminMemberVO> memberList(AdminMemberVO vo);

	// �Խù� �� ����
	public int countBoard();
}
