package com.spring.client.qnaReply.service;

import java.util.List;
import com.spring.client.qnaReply.vo.QnaReplyVO;

public interface QnaReplyService {
	public List<QnaReplyVO> qnaReplyList(int qna_no);
	public int qnareplyInsert(QnaReplyVO qvo);
	public int qnareplyUpdate(QnaReplyVO qvo);
	public int qnareplyDelete(Integer qna_reply_no);
	public QnaReplyVO qnareplySelect(Integer qna_reply_no);
	
}