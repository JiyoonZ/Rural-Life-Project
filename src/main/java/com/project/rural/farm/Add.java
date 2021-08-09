package com.project.rural.farm;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.rural.CheckMember;

@WebServlet("/farm/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/farm/add.jsp");
		dispatcher.forward(req, resp);
	}

}
