package com.weaving.biz.doc.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.doc.DocApprovalVO;
import com.weaving.biz.doc.DocDeleteVO;
import com.weaving.biz.doc.DocDetailVO;
import com.weaving.biz.doc.DocHistoryVO;
import com.weaving.biz.doc.DocService;
import com.weaving.biz.doc.DocUpdateVO;
import com.weaving.biz.doc.DocInsertVO;
import com.weaving.biz.docForm.DocFormService;
import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.emp.Empservice;

@Controller
public class DocController {
	@Autowired
	DocService docService;
	
	@Autowired
	DocFormService docFormService;

	@Autowired
	Empservice empService;
	

	@RequestMapping("/docInsertView")
	public String docInsertView(Model model) {
		EmpVO evo = new EmpVO(); 
		
		model.addAttribute("empList", empService.getExEmpList1(evo));
		//model.addAttribute("empList", empService.getEmpList(evo));
		model.addAttribute("list", docFormService.getDocFormList());
		return "approval/docInsert";
	}

	@RequestMapping(value="/docInsert", method=RequestMethod.POST)
	public String docInsert(DocInsertVO vo, HttpServletRequest request) {

		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date date = new Date();
		String curTime = f.format(date);
		String[] d  = curTime.split(" ");
		String[] dateArr = d[0].split("-");
		
		String docType = request.getParameter("docType") +"-" + dateArr[0] + dateArr[1] + dateArr[2]+"-";
		String jsonString = request.getParameter("approvalList");
		
		vo.setDocType(docType);
		vo.setRegDate(curTime);

		docService.insertDoc(vo);

		ObjectMapper mapper = new ObjectMapper();
		int docId = 0;
		String writerStatus = "";
		try {
			List<DocInsertVO> docObj = Arrays.asList(mapper.readValue(jsonString, DocInsertVO[].class));
			
			boolean b = true;
			for (DocInsertVO v : docObj) {
				
				if (b) {
					writerStatus = v.getStatus();
					v.setApprovalDate(curTime);	
					b = false;
				} else {
					v.setStatus("WAIT");	
				}
				v.setDocType(vo.getDocType());

				v.setDocTypeSeq(vo.getDocTypeSeq());
						
				docService.insertDocDetail(v);
				docId = v.getDocId();
			}		
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DocHistoryVO hvo = new DocHistoryVO();
		hvo.setDocId(docId);
		hvo.setEmpNo(vo.getWriterEmpNo());
		hvo.setCurStatus(writerStatus);
		hvo.setChangeDate(curTime);

		docService.insertDocHistory(hvo);
		
		return "redirect:docList?listType=ING";
	}
	
	@RequestMapping(value="/docDetailView", method= RequestMethod.GET)	
	public String docDetailView(Model model, HttpSession session, HttpServletRequest request) {
		int empNo = SessionInfo.getInfo(session, "empNo");
		DocDetailVO vo = new DocDetailVO();
		
		vo.setEmpNo(empNo);
		vo.setDocId(Integer.parseInt(request.getParameter("docId")));

		model.addAttribute("docListType", (String)request.getParameter("listType"));
		model.addAttribute("docInfo", docService.getDocument(vo));
		model.addAttribute("docDetailInfo", docService.getDocDetail(vo));
		model.addAttribute("docDetailInfo", docService.getDocDetail(vo));
		model.addAttribute("docCommentInfo", docService.getReturnComment(vo));
		return "approval/docDetailView";
	}
	
	@RequestMapping(value="/updateDone"
			, headers = {"Content-type=application/json"}
			, method= RequestMethod.PUT
	)
	@ResponseBody
	public DocApprovalVO updateDone(@RequestBody DocApprovalVO vo, Model model) {
		docService.updateApprovalDoc(vo);
		return vo;
	}

	@RequestMapping(value="/updateReturn"
			, headers = {"Content-type=application/json"}
			, method= RequestMethod.PUT
	)
	@ResponseBody
	public DocApprovalVO updateReturn(@RequestBody DocApprovalVO vo, Model model) {
		System.out.println("===================");
		//System.out.println(vo.);
		System.out.println("===================");
		docService.updateReturnEmpNo(vo);
		docService.updateApprovalNullDate(vo);
		docService.updateReturnDoc(vo);
		docService.updateReturnComment(vo);
		return vo;
	}
	
	@RequestMapping("/docUpdateView")
	public String docUpdateView(Model model, HttpSession session, HttpServletRequest request) {
		int empNo = SessionInfo.getInfo(session, "empNo");
		DocDetailVO vo = new DocDetailVO();
		
		vo.setEmpNo(empNo);
		vo.setDocId(Integer.parseInt(request.getParameter("docId")));
 
		EmpVO evo = new EmpVO(); 
		
		model.addAttribute("empList", empService.getExEmpList1(evo));
		model.addAttribute("list", docFormService.getDocFormList());
		
		model.addAttribute("docListType", (String)request.getParameter("listType"));
		model.addAttribute("docInfo", docService.getDocument(vo));
		model.addAttribute("docDetailInfo", docService.getDocDetail(vo));
		
		return "approval/docUpdate";
	}
	
	@RequestMapping(value="/docUpdate", method=RequestMethod.POST)
	public String docUpdate(DocUpdateVO vo, HttpServletRequest request) {

		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date date = new Date();
		String curTime = f.format(date);
		String[] d  = curTime.split(" ");
		String[] dateArr = d[0].split("-");
		
		//'문서타입-년월일-'
		String docType = request.getParameter("docType") +"-" + dateArr[0] + dateArr[1] + dateArr[2]+"-";
		
		vo.setDocType(docType);
		docService.updateDoc(vo);

		DocDeleteVO delVo = new DocDeleteVO();
		delVo.setDocId(vo.getDocId());

		docService.deleteDocDetail(delVo);
		
		String jsonString = request.getParameter("approvalList");

		ObjectMapper mapper = new ObjectMapper();
		String writerStatus = "";
		try {
			List<DocInsertVO> docObj = Arrays.asList(mapper.readValue(jsonString, DocInsertVO[].class));
			
			boolean b = true;
			for (DocInsertVO v : docObj) {
				
				if (b) {
					v.setStatus("DONE");
					v.setApprovalDate(curTime);	
					writerStatus = v.getStatus();	
					b = false;
				} else {
					v.setStatus("WAIT");	
				}
				v.setDocId(vo.getDocId());

				docService.insertDocDetail(v);

			}		
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return "redirect:docList?listType=ING";
	}
	
	@RequestMapping(value="/docTemp", method=RequestMethod.POST)
	public String docTemp(DocUpdateVO vo, HttpServletRequest request) {

		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date date = new Date();
		String curTime = f.format(date);
		String[] d  = curTime.split(" ");
		String[] dateArr = d[0].split("-");
		
		//'문서타입-년월일-'
		String docType = request.getParameter("docType") +"-" + dateArr[0] + dateArr[1] + dateArr[2]+"-";


		vo.setDocType(docType);
		vo.setTempYn(1);
		docService.updateDoc(vo);

		DocDeleteVO delVo = new DocDeleteVO();
		delVo.setDocId(vo.getDocId());

		docService.deleteDocDetail(delVo);
		
		String jsonString = request.getParameter("approvalList");

		ObjectMapper mapper = new ObjectMapper();

		try {
			List<DocInsertVO> docObj = Arrays.asList(mapper.readValue(jsonString, DocInsertVO[].class));
			
			for (DocInsertVO v : docObj) {
				
				v.setDocId(vo.getDocId());
				v.setStatus("WAIT");

				docService.insertDocDetail(v);

			}		
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return "redirect:docList?listType=TEMP";
	}
}
