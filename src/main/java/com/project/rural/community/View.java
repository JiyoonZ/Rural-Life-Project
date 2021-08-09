package com.project.rural.community;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/community/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		String column = req.getParameter("column");
		String search = req.getParameter("search");

		CommunityDAO dao = new CommunityDAO();
		CommentDAO cdao = new CommentDAO();
		
		if (session.getAttribute("read") != null & session.getAttribute("read").toString().equals("n")) {
			dao.updateReadCount(seq);
			session.setAttribute("read", "y");
		}
		
		if (column == null) {
			column = "";
		} 
		if (search == null) {
			search = "";
		}
		
		CommunityDTO dto = dao.get(seq);
		
		String title = dto.getTitle();
		String detail = dto.getDetail();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		int nowPage = 0; 		// 현재 페이지번호
		int totalCount = 0;		// 총 게시물
		int pageSize = 10;		// 한 페이지당 출력할 게시물 수
		int totalPage = 0;		// 총 페이지 수
		int begin = 0;			// 가져올 게시물 시작 위치
		int end = 0;			// 가져올 게시물 끝 위치 
		int n = 0;				// 페이지바 제작 (출력되는 페이지 변수)
		int blockSize = 5;		// 페이지바 제작 (출력되는 페이지 변수)
		int loop = 0;			// 페이지바 제작 (루프 변수)
		
		String page = req.getParameter("page");
		
		if (page == null || page.equals("")) {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("seq", seq);
		map.put("begin", begin + "");
		map.put("end", end + "");

		totalCount = dao.getViewTotalCount(map);
		totalPage = (int)Math.ceil( (double)totalCount / pageSize );
		
		String pagebar = "<nav aria-label=\"...\">\r\n"
				+ "			<ul class='pagination'>";
		
		loop = 1;
		n = ( (nowPage - 1) / blockSize ) * blockSize + 1;
		
		// 이전 페이지
		if ( n == 1 ) {
			pagebar += String.format(" <li class='page-item disabled'><a class='page-link' href='#!' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> ");
		} else {
			pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/community/view.do?page=%d&column=%s&search=%s&seq=%s' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> ", n-1, column, search, seq);
		}
		
		// 페이지 글 X
		if (totalPage == 0) {
			pagebar +=  " <li class='page-item active'><a class='page-link' href='#!'>1</a></li> ";
		}
		
		while ( !(loop > blockSize || n > totalPage ) ) {
			if ( n == nowPage ) {
				pagebar += String.format(" <li class='page-item active'><a class='page-link' href='#!'>%d<span class='sr-only'>(current)</span></a></li> ", n);
			} else {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/community/view.do?page=%d&column=%s&search=%s&seq=%s' tabindex='-1'>%d</a></li> ", n, column, search, seq, n);
			}
			
			loop ++;
			n++;
		}
		
		// 다음 페이지
		if ( n > totalPage ) {
			pagebar += String.format(" <li class='page-item disabled'><a class='page-link' href='#!'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a></li> ");
		} else {
			pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/community/view.do?page=%d&column=%s&search=%s&seq=%s' tabindex='-1'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a></li> ", n, column, search, seq);
		}
		
		pagebar += "</ul>\r\n"
				+ "  		</nav>";
		
		
		
		
		
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
		
		// 댓글 리스트 불러오기
		ArrayList<CommentDTO> clist = cdao.listComment(map);
		
		// 댓글 수
		req.setAttribute("dto", dto);
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("column", column);
		req.setAttribute("search", search);
		req.setAttribute("clist", clist);
		req.setAttribute("ilist", ilist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/community/view.jsp");
		dispatcher.forward(req, resp);

	}

}

