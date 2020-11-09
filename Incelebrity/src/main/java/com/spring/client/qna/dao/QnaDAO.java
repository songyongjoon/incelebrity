package com.spring.client.qna.dao;

import com.spring.client.qna.vo.QnaVO;

import java.util.List;

public interface QnaDAO {
    public List<QnaVO> qnaList(QnaVO qvo);
    public int qnaInsert(QnaVO qvo);
    public QnaVO qnaDetail(QnaVO qvo);
    public QnaVO updateForm(QnaVO qvo);
    public int qnaUpdate(QnaVO qvo);
    public int qnaDelete(int qna_no);
}
