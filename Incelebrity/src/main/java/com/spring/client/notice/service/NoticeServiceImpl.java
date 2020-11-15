package com.spring.client.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.notice.dao.NoticeDao;
import com.spring.client.notice.vo.NoticeVO;
import com.spring.common.vo.CommonVO;

import lombok.Setter;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Setter(onMethod_=@Autowired)
	private NoticeDao noticeDao;
	
	
	
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		NoticeVO vo = null;
		vo = noticeDao.noticeDetail(nvo);
		return vo;
	}
	
		@Override
	   public int countBoard() {
	      return noticeDao.countBoard();
	   }

	   @Override
	   public List<NoticeVO> selectBoard(CommonVO cvo) {
	      return noticeDao.selectBoard(cvo);
	   }
	
}
