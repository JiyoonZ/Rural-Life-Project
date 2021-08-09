package com.project.rural.notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/notice/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		String column = req.getParameter("column");
		String search = req.getParameter("search");

		
		NoticeDAO dao = new NoticeDAO();
		
		if (session.getAttribute("read") != null & session.getAttribute("read").toString().equals("n")) {
			dao.updateReadCount(seq);
			session.setAttribute("read", "y");
		}
		
		NoticeDTO dto = dao.get(seq);
		
		String title = dto.getTitle();
		String detail = dto.getDetail();
		
		// 무조건 글 제목과 내용에 들어있는 <script>태그는 비활성화 시키기!!
		title = title.replace("<script", "&lt;script").replace("</script>", "&lt;/script&gt;");
		dto.setTitle(title);
		detail = detail.replace("<script", "&lt;script").replace("</script>", "&lt;/script&gt;");
		dto.setDetail(detail);

		// 글 내용(content)에 개행 문자 처리하기
		detail = detail.replace("\r\n", "<br>");
		dto.setDetail(detail);
		
		// 내용으로 검색 중일 때 검색어 강조시키기
		if ( column != null && search != null && column.equals("detail")) {
			detail = detail.replace(search, "<span style='color: tomato; background-color: yellow;'>" 
													+ search + "</span>");
			dto.setDetail(detail);
		}
		
		// 이미지 리스트 불러오기
		ArrayList<String> ilist = dao.listImg(seq);
		
		// 댓글 수
		req.setAttribute("dto", dto);
		req.setAttribute("column", column);
		req.setAttribute("search", search);
		req.setAttribute("ilist", ilist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/notice/view.jsp");
		dispatcher.forward(req, resp);

	}

}

