package com.spring.admin.profit.dao;

import java.util.List;

import com.spring.admin.profit.vo.ProfitVO;
import com.spring.common.page.PagingVO;

public interface ProfitDao {
	public int countBoard();
	public List<ProfitVO> selectBoard(PagingVO vo);
	public int countProfit();
	public ProfitVO profitDetail(ProfitVO pvo);
}
