package com.spring.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
public class CommonVO {

	// �˻� Ű���� �ʵ�
	private String search = "";
	private String keyword = "";
	
	
	private int nowPage; // ����������
	private int startPage;// ����������
	private int endPage; // ��������
	private int total; // �Խñ� �� ����
	private int cntPerPage; // �������� �� ����
	private int lastPage; // ������������
	private int start; // SQL������ �� start
	private int end; // SQL������ �� end
	private int cntPage=5;

	public CommonVO() {
	}

	public CommonVO(int total, int nowPage, int cntPerPage, String search, String keyword) {
		setSearch(search);
		setKeyword(keyword);
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}

	// ���� ������ ������ ���
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double) total / (double) cntPerPage));
	}

	// ����, �� ������ ���
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int) Math.ceil((double) nowPage / (double) cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}

	// DB �������� ����� start, end�� ���
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
}
