package com.spring.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommonVO {

	// 검색 키워드 필드
	private String search = "";
	private String keyword = "";

}
