package com.weaving.biz.cal.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.cal.CalService;
import com.weaving.biz.cal.CalVO;

@Service
public class CalServiceImpl implements CalService {

	@Autowired
	CalDAO dao;

	@Override
	public void insertCal(CalVO vo) {
		dao.insertCal(vo);
	}

	@Override
	public List<CalVO> getCalList(CalVO vo) {
		return dao.getCalList(vo);
	}
}
