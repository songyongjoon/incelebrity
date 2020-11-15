package com.spring.common.vo;

import lombok.Data;

@Data
public class CommonVO {
	private String page; // ������ ��ȣ
	private String pageSize; // �������� �����ִ� �� ��
	private String start_row; // ���� ���ڵ� ��ȣ
	private String end_row; // ���� ���ڵ� ��ȣ

	// ���ǰ˻��� ����� �ʵ�
	private String search = "";
	private String keyword = "";
	

	// ��¥ �˻��� ����� �ʵ�
	private String start_date = "";
	private String end_date = "";
}
