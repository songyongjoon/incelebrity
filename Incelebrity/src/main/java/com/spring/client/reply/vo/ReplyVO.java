package com.spring.client.reply.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {
	private int		r_num		=0;	//댓글번호
	private int 	b_num		=0;	//게시판 글번호
	private String 	r_name		="";//댓글 작성자
	private String 	r_content	="";//댓글 내용
	private String 	r_pwd		="";//댓글 비밀번호
	private String 	r_date		="";//댓글 등록일
}