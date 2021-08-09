package com.project.rural.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.rural.CheckMember;

@WebServlet("/community/delok.do")
public class DelOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		String seq = req.getParameter("seq");
		
		CommunityDAO dao = new CommunityDAO();
		CommentDAO cdao = new CommentDAO();
		
		// 댓글 존재한다면 전부 삭제
		cdao.delAllComment(seq);
		
		// 이미지가 존재한다면 전부 삭제
		dao.delAllImg(seq);
		
		int result = dao.del(seq);
		
		if ( result == 1 ) {
			resp.sendRedirect("/rural/community/list.do");
		} else {
			resp.sendRedirect("/rural/community/delok.do?seq="+seq);
		}

	}

}
