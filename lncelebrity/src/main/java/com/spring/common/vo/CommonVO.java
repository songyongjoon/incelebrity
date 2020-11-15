package com.spring.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//import lombok.Data;

//@Data
@ToString
@Setter
@Getter
public class CommonVO {
	// 조건검색시 사용할 필드(검색대상 , 검색단어)
	private String search = "";
	private String keyword = "";
}
