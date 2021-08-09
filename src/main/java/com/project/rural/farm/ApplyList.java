package com.project.rural.farm;

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

@WebServlet("/farm/applylist.do")
public class ApplyList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		FarmDAO dao = new FarmDAO();
		
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		
		ArrayList<ApplyDTO> list = dao.applyList(id);
		
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/farm/applylist.jsp");
		dispatcher.forward(req, resp);
	}

}
