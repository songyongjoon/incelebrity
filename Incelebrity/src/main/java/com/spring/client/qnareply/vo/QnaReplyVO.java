package com.spring.client.qnareply.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaReplyVO {
	private int		qna_reply_no		=0;	
	private int 	qna_no		=0;	
	private String 	qna_reply_name		="";
	private String 	qna_reply_content	="";
	private String 	qna_reply_wirteday		="";
}