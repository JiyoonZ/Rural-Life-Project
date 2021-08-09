package com.project.rural.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/logout.do")
public class Logout extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		session.removeAttribute("id"); 
		session.removeAttribute("name");
		session.removeAttribute("birth");
		session.removeAttribute("gender");
		session.removeAttribute("tel");
		session.removeAttribute("email");
		session.removeAttribute("address");
		session.removeAttribute("lv");
		session.removeAttribute("regDate");
		session.removeAttribute("isOut");
		session.removeAttribute("isStop");
		
		resp.sendRedirect("/rural/index.do");

	}

}
