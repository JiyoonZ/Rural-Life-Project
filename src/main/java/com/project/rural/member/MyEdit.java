package com.project.rural.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/myedit.do")
public class MyEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.get(id);
		
		String tel = dto.getTel();
		String[] tels = tel.split("-");
		String tel1 = tels[0];
		String tel2 = tels[1];
		String tel3 = tels[2];
		
		String email = dto.getEmail();
		String[] emails = email.split("@");
		
		String email1 = emails[0];
		String email2 = emails[1];
		
		req.setAttribute("dto", dto);
		req.setAttribute("tel1", tel1);
		req.setAttribute("tel2", tel2);
		req.setAttribute("tel3", tel3);
		req.setAttribute("email1", email1);
		req.setAttribute("email2", email2);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/myedit.jsp");
		dispatcher.forward(req, resp);

	}

}

