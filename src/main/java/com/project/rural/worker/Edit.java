package com.project.rural.worker;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.rural.CheckMember;

@WebServlet("/worker/edit.do")
public class Edit extends HttpServlet {

	@Override // Annotation - 프로그래밍 기능 주석
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		String seq = req.getParameter("seq");
		
		WorkerDAO dao = new WorkerDAO();
		
		WorkerDTO dto = dao.edit(seq);
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispathcher = req.getRequestDispatcher("/WEB-INF/views/worker/edit.jsp");
		dispathcher.forward(req, resp);

	}
}
