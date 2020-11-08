package com.spring.client.notice.vo;

import com.spring.common.vo.CommonVO;

//import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
//import lombok.NoArgsConstructor;


@Data
@EqualsAndHashCode(callSuper=false)
//@AllArgsConstructor
//@NoArgsConstructor
public class NoticeVO extends CommonVO{
	
	private int notice_no=			0;		//글 번호
	private String notice_title=	"";		//글 제목	
	private String notice_content=	"";		//글 내용
	private String notice_writeday=	"";		//작성날짜
	private String notice_readcnt=	"";		//조회수
	private String notice_img=		"";		//이미지
	private String notice_modday=	"";		//수정날짜
	private String notice_name=		"";		//작성자

}
