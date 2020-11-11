package com.spring.admin.member.service;

import java.util.List;

import com.spring.admin.member.vo.AdminMemberVO;

public interface AdminMemberService {

	// 페이징 처리 게시글 조회
	public List<AdminMemberVO> memberList(AdminMemberVO vo);

	// 게시물 총 갯수
	public int countBoard();
	
	// 회원정보 상세조회
	public AdminMemberVO memberDetail(AdminMemberVO vo);

	// 회원상태 변경
	public int memberUpdate(AdminMemberVO vo);
}
