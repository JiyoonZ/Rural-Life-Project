package com.project.rural.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/signup.do")
public class SignUp extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String step = req.getParameter("step");
		
		String lv = req.getParameter("lv");
		
		req.setAttribute("lv", lv);
		
		if (step == null) {
			step = "1";
		}

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/signupStep" + step + ".jsp");
		dispatcher.forward(req, resp);
	}

}
