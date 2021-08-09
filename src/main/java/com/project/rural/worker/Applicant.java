package com.project.rural.worker;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.rural.CheckMember;

@WebServlet("/worker/applicant.do")
public class Applicant extends HttpServlet {

	@Override // Annotation - 프로그래밍 기능 주석
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		
		WorkApplyDAO dao = new WorkApplyDAO();
		
		String seq = req.getParameter("seq");
		
	
		ArrayList<WorkApplyDTO> list = dao.applycant(seq);
		
		for(WorkApplyDTO dto : list) {
			
			//날짜 가공
			String regDate = dto.getRegDate();
			regDate = regDate.substring(0, 10);
			dto.setRegDate(regDate);
			
			//나이
	         String tmpAge = "19" + dto.getBirth().substring(0,2);
	         
	         int age2 = (2021 - Integer.parseInt(tmpAge) + 1);
	         String age = String.valueOf(age2);
	         dto.setBirth(age);
		
	         String detail = dto.getDetail();
	         
	         detail = detail.replace("\r\n", "<br>");
	         
	         dto.setDetail(detail);
	        
		}
		
		
	
		req.setAttribute("list", list);

		RequestDispatcher dispathcher = req.getRequestDispatcher("/WEB-INF/views/worker/applicant.jsp");
		dispathcher.forward(req, resp);

	}
}
