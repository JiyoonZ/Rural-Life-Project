package com.project.rural.exp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/exp/reviewdelok.do")
public class ReviewDelOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//댓글번호, 참조 글번호 받아오기
		String seq = req.getParameter("seq");
		String pseq = req.getParameter("pseq");
		
		//
		ExpDAO dao = new ExpDAO();
		ExpReviewDTO dto = new ExpReviewDTO();
		
		//2.9 글 삭제하기
		int result = dao.expReviewDel(seq);

		//3.
		if (result==1) {
			resp.sendRedirect("/rural/exp/view.do?seq="+ pseq + "#review-section");
		} else {
			resp.sendRedirect("/rural/exp/view.do?seq="+ pseq);
		}


	}
}