package com.spring.client.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.notice.dao.NoticeDAO;
import com.spring.client.notice.vo.NoticeVO;

import lombok.Setter;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Setter(onMethod_=@Autowired)
	private NoticeDAO noticeDAO;
	
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo){
		List<NoticeVO> list = null;
		list = noticeDAO.noticeList(nvo);
		return list;
	}
	
	/*@Override
	public int noticeInsert(NoticeVO nvo) {
		int result = 0;
		result = noticeDAO.noticeInsert(nvo);
		return result;
	}
	*/
	
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		NoticeVO vo = null;
		vo = noticeDAO.noticeDetail(nvo);
		return vo;
	}
	
	/*
	@Override
	public BoardVO updateForm(NoticeVO nvo) {
		NoticeVO detail = null;
		detail = noticeDAO.noticeDetail(nvo);
		return detail;
	}*/
	
	/*
	@Override
	public int noticeUpdate(NoticeVO nvo) {
		int result = 0;
		result = noticeDAO.noticeUpdate(nvo);
		return result;
	}*/
	
	/*
	@Override
	public int noticeDelete(int notice_no) {
		int result = 0;
		result = noticeDAO.noticeDelete(notice_no);
		return result;
	}*/
		
}
