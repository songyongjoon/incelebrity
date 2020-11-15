package com.spring.common.page;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PagingVO {
	// ����������, ����������, ��������, �Խñ� �� ����, �������� �� ����, ������������, SQL������ �� start, end
		private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
		private int cntPage = 5;
		//�˻� �ܾ� �ʵ�
		private String profitStart = "";
		private String profitEnd = "";
		private int profitTotal;
		
		public PagingVO() {
		}
		public PagingVO(int total, int nowPage, int cntPerPage, String profitStart, String profitEnd) {
			setNowPage(nowPage);
			setCntPerPage(cntPerPage);
			setTotal(total);
			calcLastPage(getTotal(), getCntPerPage());
			calcStartEndPage(getNowPage(), cntPage);
			calcStartEnd(getNowPage(), getCntPerPage());
			setProfitStart(profitStart);
			setProfitEnd(profitEnd);
		}
		// ���� ������ ������ ���
		public void calcLastPage(int total, int cntPerPage) {
			setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
		}
		// ����, �� ������ ���
		public void calcStartEndPage(int nowPage, int cntPage) {
			setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
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
