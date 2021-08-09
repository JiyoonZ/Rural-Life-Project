package com.project.rural.exp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/exp/delok.do")
public class DelOk extends HttpServlet {

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
			
		//2.
		//아이디 얻어오기!
		HttpSession session = req.getSession();
		String lv = session.getAttribute("lv").toString();
		
		//글삭제하기 전에 리뷰/ 신청내역 삭제하기!
		dao.delAllReview(seq);
		dao.delAllApply(seq);
		
		
		//2.9 글 삭제하기
		int result = dao.del(seq);

		//3.
		if (result==1) {
			if (lv.equals("2")) resp.sendRedirect("/rural/exp/addlist.do");
			else if (lv.equals("3")) resp.sendRedirect("/rural/exp/list.do");
		} else {
			if (lv.equals("2")) resp.sendRedirect("/rural/exp/addlist.do");
			else if (lv.equals("3")) resp.sendRedirect("/rural/exp/view.do?seq=" + seq);
		}

	}
}