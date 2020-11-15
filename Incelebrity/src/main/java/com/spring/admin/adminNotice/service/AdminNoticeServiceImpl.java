package com.spring.admin.adminNotice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.adminNotice.dao.AdminNoticeDao;
import com.spring.client.notice.vo.NoticeVO;
import com.spring.common.vo.CommonVO;

import lombok.Setter;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {
	@Setter(onMethod_=@Autowired)
	private AdminNoticeDao adminNoticeDao;
	
	
	@Override
	public NoticeVO adminNoticeDetail(NoticeVO nvo) {
		NoticeVO vo = null;
		vo = adminNoticeDao.adminNoticeDetail(nvo);
		return vo;
	}
	
	//글쓰기
    @Override
    public int adminNoticeInsert(NoticeVO nvo) {
       int result = 0;
       result = adminNoticeDao.adminNoticeInsert(nvo);
       return result;
    }
    
  //글업데이트폼
    @Override
    public NoticeVO adminNoticeUpdateForm(NoticeVO nvo) {
       NoticeVO detail = null;
       detail = adminNoticeDao.adminNoticeDetail(nvo);
       return detail;
    }
    
    //글 업데이트
    @Override
    public int adminNoticeUpdate(NoticeVO nvo) {
       int result = 0;
       result = adminNoticeDao.adminNoticeUpdate(nvo);
       return result;
    }
    
  //글삭제
    @Override
    public int adminNoticeDelete(int notice_no) {
       int result = 0;
       result = adminNoticeDao.adminNoticeDelete(notice_no);
       return result;
    }
    
	@Override
   public int countBoard() {
      return adminNoticeDao.countBoard();
   }

   @Override
   public List<NoticeVO> selectBoard(CommonVO cvo) {
      return adminNoticeDao.selectBoard(cvo);
   }    
}
