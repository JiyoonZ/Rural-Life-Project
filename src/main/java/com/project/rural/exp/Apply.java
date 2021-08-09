package com.project.rural.exp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.rural.CheckMember;

@WebServlet("/exp/apply.do")
public class Apply extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		String seq = req.getParameter("seq");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
	
		req.setAttribute("seq", seq);
		req.setAttribute("startDate", startDate);
		req.setAttribute("endDate", endDate);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/exp/apply.jsp");
		dispatcher.forward(req, resp);

	}
}