package com.spring.client.reply.dao;

import java.util.List;

import com.spring.client.reply.vo.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> replyList(int b_num);
	public int replyInsert(ReplyVO rvo);
	public int pwdConfirm(ReplyVO rvo);
	public int replyUpdate(ReplyVO rvo);
	public int replyDelete(Integer r_num);
	public ReplyVO replySelect(Integer r_num);
	public int replyCnt(int b_num);
}
