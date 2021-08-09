package com.project.rural.farm;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.rural.CheckMember;

@WebServlet("/farm/addreviewok.do")
public class AddReviewOK extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		String pseq = req.getParameter("pseq");
		String detail = req.getParameter("detail");
		String star = req.getParameter("star");
		
		FarmDAO dao = new FarmDAO();
		ReviewDTO dto = new ReviewDTO();
		
		HttpSession session = req.getSession();
		
		dto.setId(session.getAttribute("id").toString());
		dto.setPseq(pseq);
		dto.setDetail(detail);
		dto.setStar(star);
		
		int result = dao.addReview(dto);

		if (result == 1) {
			resp.sendRedirect("/rural/farm/view.do?seq=" + pseq);
		} else {
			
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();
			
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='utf-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('이용 회원만 리뷰 작성이 가능합니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			
			writer.close();
		}
		
	}

}
