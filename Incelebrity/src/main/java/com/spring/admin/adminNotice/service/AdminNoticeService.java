package com.spring.admin.adminNotice.service;

import java.util.List;

import com.spring.client.notice.vo.NoticeVO;
import com.spring.common.vo.CommonVO;

public interface AdminNoticeService {
	public NoticeVO adminNoticeDetail(NoticeVO nvo);
	public int adminNoticeInsert(NoticeVO nvo);
	public NoticeVO adminNoticeUpdateForm(NoticeVO nvo);
	public int adminNoticeUpdate(NoticeVO nvo);
	public int adminNoticeDelete(int notice_no);
	public int countBoard();
	public List<NoticeVO> selectBoard(CommonVO cvo);
}
