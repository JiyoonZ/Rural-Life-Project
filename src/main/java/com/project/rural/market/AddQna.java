package com.project.rural.market;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.rural.CheckMember;

@WebServlet("/market/addqna.do")
public class AddQna extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);

		//User가 문의사항을 남기는 기능을 하는 서블릿

		//할일
		//1. 데이터 가져오기(detailq, pseq, title)
		//2. DB작업 > DAO 위임 > insert
		//3. 돌아가기 > view.do?seq=10

		//1.
		String pseq = req.getParameter("pseq"); //보고있던 글의 글번호(=작성중인 댓글의 부모 글)
		String detailq = req.getParameter("detailq"); //문의글
		String title = req.getParameter("title"); //문의글 제목

		//2.
		MarketDAO dao = new MarketDAO();
		MarketQADTO dto = new MarketQADTO();


		//3. 아이디 가져오기
		HttpSession session = req.getSession();

		dto.setId(session.getAttribute("id").toString()); //댓글 작성자

		dto.setPseq(pseq);
		dto.setDetailq(detailq);
		dto.setTitle(title);

		int result = dao.addQna(dto); //1,0

		//3.
		if(result == 1) {
			resp.sendRedirect("/rural/market/view.do?seq=" + pseq); //보고있던 글 번호를 가지고 돌아가기
		}else {
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















