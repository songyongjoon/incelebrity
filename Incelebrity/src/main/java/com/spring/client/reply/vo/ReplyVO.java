package com.spring.client.reply.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {
	private int		r_num		=0;	//��۹�ȣ
	private int 	b_num		=0;	//�Խ��� �۹�ȣ
	private String 	r_name		="";//��� �ۼ���
	private String 	r_content	="";//��� ����
	private String 	r_pwd		="";//��� ��й�ȣ
	private String 	r_date		="";//��� �����
}