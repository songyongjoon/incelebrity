package com.spring.client.notice.dao;

import java.util.List;
import com.spring.client.notice.vo.NoticeVO;

public interface NoticeDAO {
	public List<NoticeVO> noticeList(NoticeVO nvo);
	//public int NoticeInsert(NoticeVO nvo);
	public NoticeVO noticeDetail(NoticeVO nvo);
	//public int pwdConfirm(NoticeVO nvo);
	//public int NoticeUpdate(NoticeVO nvo);
	//public int NoticeDelete(int notice_no);
}
