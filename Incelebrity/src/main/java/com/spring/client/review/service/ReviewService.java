package com.spring.client.review.service;

import java.util.List;

import com.spring.client.review.vo.ReviewVO;
import com.spring.common.page.PagingVO;

public interface ReviewService {
	public int countBoard();
	public List<ReviewVO> selectBoard(PagingVO vo);
	public ReviewVO reviewDetail(ReviewVO rvo);
	public int reviewInsert(ReviewVO rvo);
	public int reviewDelete(int review_no);
	public ReviewVO reviewUpdateForm(ReviewVO rvo);
	public int reviewUpdate(ReviewVO rvo);
}
