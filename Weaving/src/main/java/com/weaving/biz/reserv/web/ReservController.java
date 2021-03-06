package com.weaving.biz.reserv.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.reserv.ReservService;
import com.weaving.biz.reserv.ReservVO;

@Controller
public class ReservController {

	@Autowired
	ReservService service;

	// 예약현황
	@RequestMapping("/roomReserv")
	
	public String roomReserv(Model model, @RequestParam(value="check",
							defaultValue="false", required=false)String check,ReservVO vo) {
		model.addAttribute("check", check);
		model.addAttribute("list", service.getReservList(vo.getRoomButton()));
		return "room/roomReserv";
	}
	//회의실 예약
	@RequestMapping(value = "/roomInsertReserv", method = RequestMethod.POST)
	public String roomInsertReserv(Model model, ReservVO vo, HttpSession session) {		
		vo.setReservId(0);
		vo.setStartDate(vo.getReservDate() + " " + vo.getStartTime());
		vo.setEndDate(vo.getReservDate() + " " + vo.getEndTime());	
		// 현재 접속한 사용자 정보		
		Object emp = session.getAttribute("emp");
		if (emp != null) {
			vo.setEmpNo(((EmpVO) emp).getEmpNo());
		} else {
			vo.setEmpNo(1);
		}
		System.out.println(vo);
		int duplicateCheck = service.getDuplicateCheck(vo);
		boolean b = false;
		if (duplicateCheck > 0) {
			b = true;
		} else {
			service.insertReserv(vo);
		}
		return "redirect:/roomReserv?check="+b;
	}

	@RequestMapping("/updateReserv")
	@ResponseBody
	public ReservVO modifyReserv(@RequestBody ReservVO vo, HttpSession session) {
		System.out.println(vo);

		vo.setStartDate(vo.getReservDate() + " " + vo.getStartTime());
		vo.setEndDate(vo.getReservDate() + " " + vo.getEndTime());
		
		// 현재 접속한 사용자 정보
		EmpVO emp = SessionInfo.getInfo(session, "emp");
		if (emp != null) {
			vo.setEmpNo(emp.getEmpNo());
			vo.setEmpName(emp.getEmpName());
		}

		service.updateReserv(vo);
		return vo;
	}

	// 중복체크

}
