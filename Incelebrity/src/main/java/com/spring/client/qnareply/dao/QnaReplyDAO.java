package com.spring.client.qnareply.dao;

import java.util.List;

import com.spring.client.qnareply.vo.QnaReplyVO;

public interface QnaReplyDAO {
	public List<QnaReplyVO> replyList(int qna_no);
	public int replyInsert(QnaReplyVO qvo);
	public int pwdConfirm(QnaReplyVO qvo);
	public int replyUpdate(QnaReplyVO qvo);
	public int replyDelete(Integer qna_reply_no);
	public QnaReplyVO replySelect(Integer qna_reply_no);
	public int replyCnt(int qna_no);
}
