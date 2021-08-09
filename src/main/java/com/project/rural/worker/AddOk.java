package com.project.rural.worker;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.rural.CheckMember;

@WebServlet("/worker/addok.do")
public class AddOk extends HttpServlet {

	@Override // Annotation - 프로그래밍 기능 주석
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		
		String title = req.getParameter("title");
		String tel = req.getParameter("tel");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		String sido = req.getParameter("sido");
		String gugun = req.getParameter("gugun");
		String isCareer = req.getParameter("isCareer");
		String totalPerson = req.getParameter("totalPerson");
		String minAge = req.getParameter("minAge");
		String maxAge = req.getParameter("maxAge");
		String cropInfo = req.getParameter("cropInfo");
		String pay = req.getParameter("pay");
		String detail = req.getParameter("detail");
		String address = req.getParameter("address");
		
		WorkerDAO dao = new WorkerDAO();
		WorkerDTO dto = new WorkerDTO();
		
		HttpSession session = req.getSession();
		dto.setId(session.getAttribute("id").toString());
		dto.setTitle(title);
		dto.setTel(tel);
		dto.setStartDate(startDate);
		dto.setEndDate(endDate);
		dto.setCity(sido);
		dto.setGu(gugun);
		dto.setIsCareer(isCareer);
		dto.setTotalPerson(totalPerson);
		dto.setMinAge(minAge);
		dto.setMaxAge(maxAge);
		dto.setCropInfo(cropInfo);
		dto.setPay(pay);
		dto.setDetail(detail);
		dto.setAddress(address);
		
		int result = dao.add(dto);
		
		if (result == 1) {
			resp.sendRedirect("/rural/worker/list.do");
		} else {
			resp.sendRedirect("/rural/worker/add.do");
		}	
	}
}
