package com.spring.common.vo;

import lombok.Data;

@Data
public class CommonVO {
	private String page; // 페이지 번호
	private String pageSize; // 페이지에 보여주는 줄 수
	private String start_row; // 시작 레코드 번호
	private String end_row; // 종료 레코드 번호

	// 조건검색시 사용할 필드
	private String search = "";
	private String keyword = "";
	

	// 날짜 검색시 사용할 필드
	private String start_date = "";
	private String end_date = "";
}
