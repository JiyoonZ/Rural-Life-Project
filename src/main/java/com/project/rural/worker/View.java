package com.project.rural.worker;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/worker/view.do")
public class View extends HttpServlet {

	@Override // Annotation - 프로그래밍 기능 주석
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		
		WorkerDAO dao = new WorkerDAO();
		
		WorkerDTO dto = dao.get(seq);
		
		ArrayList<WorkerDTO> list = dao.date();
		
		for(WorkerDTO date : list) {
			//날짜 가공
			String startDate = date.getStartDate();
			startDate = startDate.substring(0, 10);
			dto.setStartDate(startDate);
			
			String endDate = date.getEndDate();
			endDate = endDate.substring(0, 10);
			dto.setEndDate(endDate);
			
		}
		
		// 글 내용에 개행 문자 처리		
		String detail = dto.getDetail();
		
		detail = detail.replace("\r\n", "<br>");
		
		dto.setDetail(detail);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispathcher = req.getRequestDispatcher("/WEB-INF/views/worker/view.jsp");
		dispathcher.forward(req, resp);

	}
}
