package com.project.rural.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.rural.CheckMember;

@WebServlet("/notice/delok.do")
public class DelOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		String seq = req.getParameter("seq");
		
		NoticeDAO dao = new NoticeDAO();
		
		// 이미지가 존재한다면 전부 삭제
		dao.delAllImg(seq);
		
		int result = dao.del(seq);
		
		if ( result == 1 ) {
			resp.sendRedirect("/rural/notice/list.do");
		} else {
			resp.sendRedirect("/rural/notice/delok.do?seq="+seq);
		}

	}

}

