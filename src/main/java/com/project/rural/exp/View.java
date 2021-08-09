package com.project.rural.exp;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/exp/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//데이터 받아주기

		//1. 
		String seq = req.getParameter("seq");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		HttpSession session = req.getSession();
		Object oId = session.getAttribute("id");//.toString();
		//null에 toString()하면 error이기때문에 처리해주깈ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
		String id = oId == null ? "" : oId.toString();
		
		ExpDAO dao = new ExpDAO();
		
		ExpDTO dto = dao.get(seq,id);
		
		//리뷰쓰기		
		ArrayList<ExpReviewDTO> rlist = dao.reviewList(seq);
		String starAvg = dao.starAvg(seq);
		
		//주소 상세빼고 부터는 자르기
		if (dto.getAddress().contains(",")) {
			
			String address = dto.getAddress();
			int idx = address.indexOf(",");
			
			address = address.substring(0,idx);
			//System.out.println(address);
			//가공한 데이터 다시 집어넣기
			dto.setMap(address);
		}

		//3.
		req.setAttribute("rlist", rlist);
		req.setAttribute("dto", dto);
		req.setAttribute("startDate", startDate);
		req.setAttribute("endDate", endDate);
		req.setAttribute("starAvg", starAvg);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/exp/view.jsp");
		dispatcher.forward(req, resp);

	}
}
