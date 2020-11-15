package com.spring.client.notice.vo;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/*equals와 hashCode 메소드 자동 생성 시 부모 클래스의 필드까지 감안할지 안 할지에 대해서 설정시
 * callSuper = true로 설정하면 부모 클래스 필드 값들도 동일 한지 체크하며,
 * callSuper = false로 설정(기본값)하면 자신 클래스의 필드 값들만 고려한다. */

@Data
@EqualsAndHashCode(callSuper=false)
public class NoticeVO extends CommonVO{
	private int notice_no=		0;				//공지사항 번호
	private String notice_title=		"";		//공지사항 제목
	private String notice_content=		"";		//공지사항 내용
	private String notice_writeday=		"";		//공지사항 작성날짜
	private String notice_readcnt=		"";		//공지사항 조횟수
	private String notice_monday=		"";		//공지사항 수정날짜
	private String notice_name=			"";		//공지사항 작성자
	private String notice_img=			"";		//공지사항 이미지
}
