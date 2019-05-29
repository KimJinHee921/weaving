package com.weaving.biz.doc.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.doc.DocBaseVO;
import com.weaving.biz.doc.DocWaitVO;

@Repository
public class DocListDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<DocBaseVO> getDoneDocList(int empNo) {
		return mybatis.selectList("DocListDAO.getDoneDocList", empNo); 
	}
	
	public List<DocWaitVO> getWaitDocList(int empNo) {
		return mybatis.selectList("DocListDAO.getWaitDocList", empNo);
	}
}