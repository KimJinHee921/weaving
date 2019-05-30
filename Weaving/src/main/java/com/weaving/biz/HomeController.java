package com.weaving.biz;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.doc.DocListService;
import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.emp.Empservice;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	Empservice service;
	@Autowired
	DocListService waitservice;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String home(Locale locale, Model model,  HttpSession session) {
		
		EmpVO vo = SessionInfo.getInfo(session, "emp");
		model.addAttribute("count", waitservice.getWaitDocList(vo.getEmpNo()).toArray().length);

		return "home";
	}

	@RequestMapping(value = "/adminHome", method = RequestMethod.GET)
	public String adminHome(Locale locale, Model model, HttpServletResponse response, HttpSession session)
			throws IOException {
		
		EmpVO emp = SessionInfo.getInfo(session, "emp");
		
		if (emp != null && emp.getAdminYn()) {
			return "/admin/adminHome";
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('Admin 권한이 없습니다');");
			out.print("history.go(-1);");
			out.print("</script>");
			return "empty/login";
		}
	}

	// TODO : 공용으로 사용하도록 적용 필요
	// 엑셀출력
	@RequestMapping("/empExcelView.do")
	public ModelAndView excelView(HttpServletResponse response) throws IOException {
		
		List<EmpVO> list = service.getEmpList(null);
		List<Map<String, Object>> temp = new ArrayList<Map<String,Object>>();
		
		ObjectMapper oMapper = new ObjectMapper();

		for(EmpVO data : list) {
			Map<String, Object> map = oMapper.convertValue(data, Map.class);
			temp.add(map);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String[] header = { "empNo"
				, "empName"
				, "position" };
		map.put("headers", header);
		map.put("filename", "excel_dept");
		map.put("datas", temp);
		return new ModelAndView("commonExcelView", map);
	}
	
	@RequestMapping("ui")
	public String ui() {
		return "sample/uiGuide";
	}
	
}
