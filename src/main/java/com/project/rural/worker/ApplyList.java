package com.project.rural.worker;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.rural.CheckMember;

@WebServlet("/worker/applylist.do")
public class ApplyList extends HttpServlet {

	@Override // Annotation - 프로그래밍 기능 주석
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		WorkerDAO dao = new WorkerDAO();
		
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		
		ArrayList<WorkerDTO> list = dao.applyList(id);
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispathcher = req.getRequestDispatcher("/WEB-INF/views/worker/applylist.jsp");
		dispathcher.forward(req, resp);

	}
}