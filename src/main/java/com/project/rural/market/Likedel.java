package com.project.rural.market;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.rural.CheckMember;

@WebServlet("/market/likedel.do")
public class Likedel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);

		// 할일
		// 1. 인코딩
		// 2. 데이터 가져오기(제목, 내용, 태그)
		// 3. DB작엄 > DAO위임 > insert
		// 4. 결과 > 후처리

		// 2.
		String seq = req.getParameter("seq");

		System.out.println("서블릿seq: "+ seq);
		// 3.
		MarketDAO dao = new MarketDAO();
		LikeDTO dto = new LikeDTO();

		// 로그인한 아이디세션 가져오기
		HttpSession session = req.getSession();

		dto.setId(session.getAttribute("id").toString()); // 좋아요 누른 사용자
		dto.setSeq(seq); // 좋아요 누른 글번호

		int result = dao.dellike(dto);

		if (result == 1) {
			resp.sendRedirect("/rural/market/list.do?");
		} else {
			resp.setCharacterEncoding("UTF-8");

			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('error');");
			writer.print("history.back()");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");

			writer.close();


		}

	}
}