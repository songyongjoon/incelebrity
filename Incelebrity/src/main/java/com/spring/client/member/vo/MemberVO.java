package com.spring.client.member.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	/*
	member_no            NUMBER(4) NOT NULL ,
    member_id            VARCHAR2(20) NOT NULL ,
    member_passwd        VARCHAR2(100) NOT NULL ,
    member_name          VARCHAR2(20) NOT NULL ,
    member_address       VARCHAR2(100) NOT NULL ,
    member_email         VARCHAR2(20) NOT NULL ,
    member_phone         VARCHAR2(20) NOT NULL ,
    member_birth         DATE NOT NULL ,
    member_passhint      VARCHAR2(100) NOT NULL ,
    member_passanswer    VARCHAR2(100) NOT NULL ,
    member_state         NUMBER(1) NOT NULL ,
	*/
	private int member_no=				0;
	private String member_id=			"";
	private String member_passwd=		"";
	private String member_name=			"";
	private String member_address=		"";
	private String member_email=		"";
	private String member_phone=		"";
	private String member_birth=		"";
	private String member_passhint=		"";
	private String member_passanswer=	"";
	private int member_state=			0;
}
