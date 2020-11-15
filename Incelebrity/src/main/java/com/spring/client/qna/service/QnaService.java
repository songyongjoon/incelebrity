package com.spring.client.qna.service;

import java.util.List;

import com.spring.client.qna.vo.QnaVO;
import com.spring.common.vo.CommonVO;

public interface QnaService {
  
   public int qnaInsert(QnaVO qvo);
   public QnaVO qnaDetail(QnaVO qvo);
   public QnaVO updateForm(QnaVO qvo);
   public int qnaUpdate(QnaVO qvo);
   public int qnaDelete(int qna_no);
   public int countBoard();
   public List<QnaVO> selectBoard(CommonVO cvo);


}