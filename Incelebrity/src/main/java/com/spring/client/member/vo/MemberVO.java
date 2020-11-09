package com.spring.client.member.vo;

import lombok.Data;

@Data
public class MemberVO {
	private int member_no=0;
	private String member_id="";
	private String member_passwd="";
	private String member_name="";
	private String member_address="";
	private String member_email="";
	private String member_phone="";
	private String member_birth="";
	private String member_passhint="";
	private String member_passanswer="";
	private int member_state=0;
	
}
