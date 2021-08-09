package com.project.rural.exp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/exp/applydelok.do")
public class ApplyDelOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//할일
		//1. 데이터 가져오기(seq)
		//2. DB작업 > DAO 위임 >delete
		//3. 결과처리
		
		//1
		String seq = req.getParameter("seq");

		
		//2.
		ExpDAO dao = new ExpDAO();
		
		ExpApplyDTO dto = new ExpApplyDTO();
		
	
		
		
		//2.9 글 삭제하기
		int result = dao.expApplyDel(seq);

		//3.
		if (result==1) {
			resp.sendRedirect("/rural/exp/applylist.do");
		} else {
			resp.sendRedirect("/rural/exp/applylist.do");
		}

	}
}