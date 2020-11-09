package com.spring.admin.member.service;

import java.util.List;

import com.spring.admin.member.vo.AdminMemberVO;

public interface AdminMemberService {

	// 페이징 처리 게시글 조회
	public List<AdminMemberVO> memberList(AdminMemberVO vo);

	// 게시물 총 갯수
	public int countBoard();
}
