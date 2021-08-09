package com.project.rural.exp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/exp/applyok.do")
public class ApplyOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pseq = req.getParameter("seq");
		String totalPerson = req.getParameter("totalPerson");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		String detail = req.getParameter("detail");
		
		ExpDAO dao = new ExpDAO();
		ExpApplyDTO dto = new ExpApplyDTO(); 
		
		//세션에서 로그인한 사람의 id 받아오기
		HttpSession session = req.getSession();
		
		dto.setId(session.getAttribute("id").toString());
		dto.setPseq(pseq);
		dto.setTotalPerson(totalPerson);
		dto.setStartDate(startDate);
		dto.setEndDate(endDate);
		dto.setDetail(detail);
		
		
		//포장한거 전달하기
		int result = dao.apply(dto);
		
		if (result ==1) {
			resp.sendRedirect("/rural/exp/applylist.do");
		} else {
			resp.sendRedirect("/rural/exp/apply.do?seq=" + pseq);
		}
		
		

	}
}