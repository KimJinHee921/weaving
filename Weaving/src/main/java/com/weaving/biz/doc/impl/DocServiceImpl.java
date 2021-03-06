package com.weaving.biz.doc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.doc.DocApprovalVO;
import com.weaving.biz.doc.DocDeleteVO;
import com.weaving.biz.doc.DocDetailVO;
import com.weaving.biz.doc.DocHistoryVO;
import com.weaving.biz.doc.DocService;
import com.weaving.biz.doc.DocUpdateVO;
import com.weaving.biz.doc.DocInsertVO;
@Service("docService")
public class DocServiceImpl implements DocService {

	//@Autowired BoardDAO dao;
	//@Autowired BoardDAOSpring dao;
	@Autowired DocDAO dao;
	@Autowired DocHistoryDAO hdao;
	// service단위로 메서드 호출
	/*
	@Override
	public void insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		//앞단에서 around Aop 트랜잭션 처리 됨.
		//그리고 아래가 실행됨.
		dao.insertBoard(vo);
		//dao.insertBoard(vo);
		//위에 처리가 된 후에 commit가 된다.
	}
*/

	@Override
	public void insertDoc(DocInsertVO vo) {
		// TODO Auto-generated method stub
		dao.insertDoc(vo);
	}
	
	@Override
	public void insertDocDetail(DocInsertVO vo) {
		// TODO Auto-generated method stub
		dao.insertDocDetail(vo);
	}
	
	@Override
	public void updateDoc(DocUpdateVO vo) {
		// TODO Auto-generated method stub
		dao.updateDoc(vo);
	}
	
	@Override
	public void updateApprovalDoc(DocApprovalVO vo) {
		// TODO Auto-generated method stub
		dao.updateApprovalDoc(vo);
		dao.updateReturnEmpNoNull(vo);
	}
	
	@Override
	public void updateReturnEmpNo(DocApprovalVO vo) {
		// TODO Auto-generated method stub
		dao.updateReturnEmpNo(vo);
	}

	@Override
	public void updateReturnDoc(DocApprovalVO vo) {
		// TODO Auto-generated method stub
		dao.updateReturnDoc(vo);
	}
	
	@Override
	public void updateReturnComment(DocApprovalVO vo) {
		// TODO Auto-generated method stub
		dao.updateReturnComment(vo);
	}
	
	@Override
	public void updateApprovalNullDate(DocApprovalVO vo) {
		// TODO Auto-generated method stub
		dao.updateApprovalNullDate(vo);
	}
	
	@Override
	public void deleteDoc(DocInsertVO vo) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void deleteDocDetail(DocDeleteVO vo) {
		// TODO Auto-generated method stub
		dao.delteDocDetail(vo);
	}	
	@Override
	public DocDetailVO getDocument(DocDetailVO vo) {
		// TODO Auto-generated method stub
		return dao.getDocument(vo);
	}
	@Override
	public DocDetailVO getReturnComment(DocDetailVO vo) {
		// TODO Auto-generated method stub
		return dao.getReturnComment(vo);
	}
	
	@Override
	public List<DocInsertVO> getDocDetail(DocDetailVO vo) {
		// TODO Auto-generated method stub
		return dao.getDocDetail(vo);
	}

	@Override
	public int getDocCount(DocInsertVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertDocHistory(DocHistoryVO vo) {
		// TODO Auto-generated method stub
		hdao.insertDocHistory(vo);
	}
}
