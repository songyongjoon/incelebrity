package com.spring.client.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.review.dao.ReviewDao;
import com.spring.client.review.vo.ReviewVO;
import com.spring.common.page.PagingVO;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Setter(onMethod_=@Autowired)
	private ReviewDao reviewDao;
	
	@Override
	public int countBoard() {
		return reviewDao.countBoard();
	}

	@Override
	public List<ReviewVO> selectBoard(PagingVO vo) {
		return reviewDao.selectBoard(vo);
	}

	/* ¸®ºä ±Û »ó¼¼ */
	@Override
	public ReviewVO reviewDetail(ReviewVO rvo) {
		ReviewVO detail = null;
		detail = reviewDao.reviewDetail(rvo);
		if(detail!=null) {
			detail.setReview_content(detail.getReview_content().toString().replace("\n","<br>"));
		}
		return detail;
	}
	
	/*¸®ºä ÀÔ·Â*/
	@Override
	public int reviewInsert(ReviewVO rvo) {
		int result = 0;
		result = reviewDao.reviewInsert(rvo);
		return result;
	}

	@Override
	public int reviewDelete(int review_no) {
		int result=0;
		result = reviewDao.reviewDelete(review_no);
		return result;
	}

	@Override
	public ReviewVO reviewUpdateForm(ReviewVO rvo) {
		ReviewVO detail = null;
		detail = reviewDao.reviewDetail(rvo);
		return detail;
	}

	@Override
	public int reviewUpdate(ReviewVO rvo) {
		int result = 0;
		result = reviewDao.reviewUpdate(rvo);
		return result;
	}
	
	
}
