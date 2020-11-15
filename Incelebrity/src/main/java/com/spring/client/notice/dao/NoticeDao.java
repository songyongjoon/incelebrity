package com.spring.client.notice.dao;

import java.util.List;

import com.spring.client.notice.vo.NoticeVO;
import com.spring.common.vo.CommonVO;

public interface NoticeDao {
	
	public NoticeVO noticeDetail(NoticeVO nvo);
	public int countBoard();
	public List<NoticeVO> selectBoard(CommonVO cvo);
}
