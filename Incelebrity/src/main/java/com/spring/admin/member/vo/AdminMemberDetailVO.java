package com.spring.admin.member.vo;

import lombok.Data;

@Data
public class AdminMemberDetailVO {
	private int member_detail_no = 0;
	private String member_detail_loginday = "";
	private String member_detail_modday = "";
	private String member_detail_writeday = "";
	private int member_no = 0;
}
