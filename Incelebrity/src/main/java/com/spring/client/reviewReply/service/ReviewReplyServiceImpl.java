package com.spring.client.reviewReply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.reviewReply.dao.ReviewReplyDao;
import com.spring.client.reviewReply.vo.ReviewReplyVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ReviewReplyServiceImpl implements ReviewReplyService {
	@Setter(onMethod_=@Autowired)
	private ReviewReplyDao replyDao;
	
	/* ´ñ±Û ¸ñ·Ï ºÒ·¯¿À±â */
	@Override
	public List<ReviewReplyVO> reviewReplyList(Integer review_no) {
		List<ReviewReplyVO> list = null;
		list = replyDao.reviewReplyList(review_no);
		return list;
	}
	
	/* ´ñ±Û µî·Ï */
	@Override
	public int replyInsert(ReviewReplyVO rrvo) {
		int result = 0;
		try {
			result = replyDao.replyInsert(rrvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public ReviewReplyVO replySelect(Integer review_reply_no) {
		ReviewReplyVO rrvo = null;
		rrvo = replyDao.replySelect(review_reply_no);
		return rrvo;
	}
	
	/* ´ñ±Û ¼öÁ¤ */
	@Override
	public int replyUpdate(ReviewReplyVO rrvo) {
		int result = 0;
		try {
			result = replyDao.replyUpdate(rrvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	/* ´ñ±Û »èÁ¦ */
	@Override
	public int replyDelete(Integer review_reply_no) {
		int result = 0;
		try {
			result=replyDao.replyDelete(review_reply_no);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
