package com.project.rural.community;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.rural.CheckMember;

@WebServlet("/community/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		String seq = req.getParameter("seq");
		
		CommunityDAO dao = new CommunityDAO();
		CommunityDTO dto = dao.get(seq);
		
		ArrayList<String> ilist = dao.listImg(seq);
		
		req.setAttribute("dto", dto);
		req.setAttribute("ilist", ilist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/community/edit.jsp");
		dispatcher.forward(req, resp);

	}

}
