package com.project.rural.worker;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.rural.CheckMember;

@WebServlet("/worker/delok.do")
public class DelOk extends HttpServlet {

	@Override // Annotation - 프로그래밍 기능 주석
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		// 등록내역 삭제하기 
		String seq = req.getParameter("seq");
		
		WorkerDAO dao = new WorkerDAO();
		WorkApplyDAO adao = new WorkApplyDAO();
		
		adao.allApplydel(seq);
		int result = dao.del(seq);
		
		HttpSession session = req.getSession();
		String lv = session.getAttribute("lv").toString();
		
		
		if(result == 1) {
			if(lv.equals("2")) resp.sendRedirect("/rural/worker/addlist.do");
			
			else if(lv.equals("3")) resp.sendRedirect("/rural/worker/list.do");
		} else {
			
			if(lv.equals("2")) resp.sendRedirect("/rural/worker/addlist.do");
			
			else if(lv.equals("3")) resp.sendRedirect("/rural/worker/view.do?seq=" + seq);

		}

	}
}
