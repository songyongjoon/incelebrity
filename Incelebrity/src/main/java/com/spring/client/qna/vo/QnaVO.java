package com.spring.client.qna.vo;

import com.spring.common.vo.CommonVO;
//import lombok.AllArgsConstructor;
//import lombok.NoArgsConstructor;


import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
//@AllArgsConstructor
//@NoArgsConstructor
public class QnaVO extends CommonVO{
	private int qna_no=				0;	//글번호
	private String qna_title=		"";	//글제목
	private String qna_content=		"";	//글내용
	private String qna_writeday=	"";	//작성일
	private String qna_modday=		"";	//수정날짜
	private String qna_name=		"";	//작성자
	
}
