package com.spring.admin.profit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.profit.dao.ProfitDao;
import com.spring.admin.profit.vo.ProfitVO;
import com.spring.common.page.PagingVO;

import lombok.Setter;

@Service
public class ProfitServiceImpl implements ProfitService {
	
	@Setter(onMethod_=@Autowired)
	private ProfitDao profitDao;
	
	@Override
	public int countBoard() {
		return profitDao.countBoard();
	}
	
	@Override
	public List<ProfitVO> selectBoard(PagingVO vo){
		return profitDao.selectBoard(vo);
	}

	@Override
	public int countProfit() {
		return profitDao.countProfit();
	}

	@Override
	public ProfitVO profitDetail(ProfitVO pvo) {
		ProfitVO detail = null;
		detail = profitDao.profitDetail(pvo);
	
		return detail;
	}

}
