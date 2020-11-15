package com.spring.client.notice.service;

import java.util.List;

import com.spring.client.notice.vo.NoticeVO;
import com.spring.common.vo.CommonVO;

public interface NoticeService {

	public NoticeVO noticeDetail(NoticeVO nvo);
	public int countBoard();
	public List<NoticeVO> selectBoard(CommonVO cvo);
}
