package com.project.rural.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.rural.CheckMember;

@WebServlet("/admin/manage.do")
public class Manage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		ChartDAO dao = new ChartDAO();
		
		ArrayList<ChartDTO> list1 = dao.list1(); // 게시물 목록
		ChartDTO list2 = dao.list2(); // 게시물 목록
		
		req.setAttribute("list1", list1);
		req.setAttribute("list2", list2);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/manage.jsp");
		dispatcher.forward(req, resp);

	}
}