package com.project.rural.worker;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.rural.CheckMember;

@WebServlet("/worker/editok.do")
public class EditOk extends HttpServlet {

	@Override // Annotation - 프로그래밍 기능 주석
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		String seq = req.getParameter("seq");
		String title = req.getParameter("title");
		String isEnd = req.getParameter("isEnd");
		String tel = req.getParameter("tel");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		String sido = req.getParameter("sido");
		String gugun = req.getParameter("gugun");
		String isCareer = "";
		
		if(req.getParameter("isCareer") == null) {
			isCareer = "n";
		} else {
			isCareer = "y";
		}
		
		String totalPerson = req.getParameter("totalPerson");
		String minAge = req.getParameter("minAge");
		String maxAge = req.getParameter("maxAge");
		String cropInfo = req.getParameter("cropInfo");
		String pay = req.getParameter("pay");
		String address = req.getParameter("address");
		String detail = req.getParameter("detail");
		
		WorkerDAO dao = new WorkerDAO();
		WorkerDTO dto = new WorkerDTO();
		
		dto.setSeq(seq);
		dto.setTitle(title);
		dto.setIsEnd(isEnd);
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
		dto.setAddress(address);
		dto.setDetail(detail);
		
		int result = dao.editok(dto);
		
		if (result == 1) {
			resp.sendRedirect("/rural/worker/addlist.do");
		} else {
			resp.sendRedirect("/rural/worker/edit.do?seq=" + seq);
		}	

	}
}