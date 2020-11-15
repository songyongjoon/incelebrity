package com.spring.client.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.qna.dao.QnaDAO;
import com.spring.client.qna.vo.QnaVO;


import lombok.Setter;


@Service
public class QnaServiceImpl implements QnaService {
   
      @Setter(onMethod_=@Autowired)
      private QnaDAO qnaDAO;
      
      
      //글목록
      @Override
      public List<QnaVO> qnaList(QnaVO qvo){
         List<QnaVO> list = null;
         list = qnaDAO.qnaList(qvo);
         return list;
      }
      
      //글쓰기
      @Override
      public int qnaInsert(QnaVO qvo) {
         int result = 0;
         result = qnaDAO.qnaInsert(qvo);
         return result;
      }
      
      //글상세보기
      @Override
      public QnaVO qnaDetail(QnaVO qvo) {
         QnaVO vo = null;
         vo = qnaDAO.qnaDetail(qvo);
         return vo;
      }
      
      //글업데이트폼
      @Override
      public QnaVO updateForm(QnaVO qvo) {
         QnaVO detail = null;
         detail = qnaDAO.qnaDetail(qvo);
         return detail;
      }
      
      //글 업데이트
      @Override
      public int qnaUpdate(QnaVO qvo) {
         int result = 0;
         result = qnaDAO.qnaUpdate(qvo);
         return result;
      }
      
      //글삭제
      @Override
      public int qnaDelete(int qna_no) {
         int result = 0;
         result = qnaDAO.qnaDelete(qna_no);
         return result;
      }
      
      
   }