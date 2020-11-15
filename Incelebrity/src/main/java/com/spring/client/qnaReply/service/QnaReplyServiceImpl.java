package com.spring.client.qnaReply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.qnaReply.dao.QnaReplyDAO;
import com.spring.client.qnaReply.vo.QnaReplyVO;


import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class QnaReplyServiceImpl implements QnaReplyService {

   @Setter(onMethod_ = @Autowired)
   private QnaReplyDAO qnaReplyDAO;
      
   //글 목록 구현
   @Override
   public List<QnaReplyVO> qnaReplyList(int qna_no){
      List<QnaReplyVO> list = null;
      list = qnaReplyDAO.qnaReplyList(qna_no);
      return list;
   }
   
   //글 입력 구현
   @Override
   public int qnareplyInsert(QnaReplyVO qvo) {
      int result = 0;
      try {
         result = qnaReplyDAO.qnareplyInsert(qvo);
      }catch(Exception e) {
         e.printStackTrace();
         result = 0;
      }
      return result;
   }
   
   //수정 전 레코드 조회
   @Override
   public QnaReplyVO qnareplySelect(Integer qna_reply_no) {
      QnaReplyVO qvo = null;
      qvo = qnaReplyDAO.qnareplySelect(qna_reply_no);
      return qvo;
   }
   
   //글 수정 구현
   @Override
   public int qnareplyUpdate(QnaReplyVO qvo) {
      int result = 0;
      try {
         result = qnaReplyDAO.qnareplyUpdate(qvo);
      }catch(Exception e) {
         e.printStackTrace();
         result = 0;
      }
      return result;
   }
   
   @Override
   public int qnareplyDelete(Integer qna_reply_no) {
      int result = 0;
      try {
         result = qnaReplyDAO.qnareplyDelete(qna_reply_no);
      }catch(Exception e) {
         e.printStackTrace();
         result = 0;
      }
      return result;
   }
}