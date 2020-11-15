package com.spring.admin.profit.vo;

import com.spring.common.page.PagingVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProfitVO extends PagingVO {
	private int profit_no = 0;
	private int profit_sum = 0;
	private String profit_date = "";
	private int orders_no = 0;
	private int product_no = 0;
	
	public ProfitVO(int total,  int nowPage, int cntPerPage, String profitStart, String profitEnd) {
		super(total,  nowPage, cntPerPage, profitStart, profitEnd);
	}
}
