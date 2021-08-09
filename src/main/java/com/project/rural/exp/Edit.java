package com.project.rural.exp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.rural.CheckMember;

@WebServlet("/exp/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		//글번호 받기
		String seq = req.getParameter("seq");
		
		ExpDAO dao = new ExpDAO();
		ExpDTO dto = new ExpDTO();
		
		HttpSession session = req.getSession();
		Object oId = session.getAttribute("id");//.toString();
		//null에 toString()하면 error이기때문에 처리해주깈ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
		String id = oId == null ? "" : oId.toString();
		//일단 원래 있던것을 가져와서 기본 값으로 세팅해놓기 위해서!
		dto = dao.get(seq,id);
		
		//들고가기전에 날짜 가공하기			
		//date input태그의 value값에 넣기 위해서 날짜 자르기
		String startDate = dto.getStartDate();
		String endDate = dto.getEndDate();
		
		startDate = startDate.substring(0,10);
		endDate = endDate.substring(0,10);
		
		dto.setStartDate(startDate);
		dto.setEndDate(endDate);
		

		//수정페이지 수정전 원본값을 들고가기
		req.setAttribute("dto", dto);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/exp/edit.jsp");
		dispatcher.forward(req, resp);

	}
}
