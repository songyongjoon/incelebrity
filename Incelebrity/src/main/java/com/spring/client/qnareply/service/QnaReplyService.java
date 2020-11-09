package com.spring.client.qnareply.service;

import java.util.List;

import com.spring.client.qnareply.vo.QnaReplyVO;

public interface QnaReplyService {
   public List<QnaReplyVO> qnareplyList(int qna_no);
   public int qnareplyInsert(QnaReplyVO qvo);
   public int qnareplyUpdate(QnaReplyVO qvo);
   public int qnareplyDelete(Integer qna_reply_no);
   public QnaReplyVO qnareplySelect(Integer qna_reply_no);
}