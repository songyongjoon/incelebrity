package com.spring.client.qna.dao;

import java.util.List;

import com.spring.client.qna.vo.QnaVO;

public interface QnaDAO {
	public List<QnaVO> qnaList(QnaVO qvo);
	public int qnaInsert(QnaVO qvo);
	public QnaVO qnaDetail(QnaVO qvo);
	public int qnaUpdate(QnaVO qvo);
	public int qnaDelete(int qna_no);
}
