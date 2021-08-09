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

@WebServlet("/community/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 검색
		String column = req.getParameter("column");
		String search = req.getParameter("search");

		// 카테고리 (전체보기, 일손돕기, 농촌체험, 주말농장, 농작물 직거래)
		String category = req.getParameter("category");
		// 정렬 (최신순, 댓글순, 조회순)
		String sort = req.getParameter("sort");
		
		// 내가 쓴 글
		String id = req.getParameter("id");
		
		String isSearch = "n";
		if ( (column != null && search != null && !column.equals("") && !search.equals("")) ||
			 (category != null && !category.equals("")) || 
			 (id != null && !id.equals("")) || 
			 (sort != null && !sort.equals("")) ) {
			isSearch = "y";
		}
		
		if (column == null) {
			column = "";
		} 
		if (search == null) {
			search = "";
		}
		if (category == null) {
			category = "";
		}
		if (sort == null) {
			sort = "";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		CommunityDAO dao = new CommunityDAO();
		
		map.put("column", column);
		map.put("search", search);
		map.put("isSearch", isSearch);
		map.put("category", category);
		map.put("id", id);
		map.put("sort", sort);
		
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
		
		map.put("begin", begin + "");
		map.put("end", end + "");

		totalCount = dao.getTotalCount(map);
		totalPage = (int)Math.ceil( (double)totalCount / pageSize );
		
		String pagebar = "<nav aria-label=\"...\">\r\n"
				+ "			<ul class='pagination'>";
		
		loop = 1;
		n = ( (nowPage - 1) / blockSize ) * blockSize + 1;
		
		// 이전 페이지
		if ( n == 1 ) {
			pagebar += String.format(" <li class='page-item disabled'><a class='page-link' href='#!' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> ");
		} else {
			pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/community/list.do?page=%d&category=%s&sort=%s&column=%s&search=%s' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> ", n-1, category, sort, column, search);
		}
		
		// 페이지 글 X
		if (totalPage == 0) {
			pagebar +=  " <li class='page-item active'><a class='page-link' href='#!'>1</a></li> ";
		}
		
		while ( !(loop > blockSize || n > totalPage ) ) {
			if ( n == nowPage ) {
				pagebar += String.format(" <li class='page-item active'><a class='page-link' href='#!'>%d<span class='sr-only'>(current)</span></a></li> ", n);
			} else {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/community/list.do?page=%d&category=%s&sort=%s&column=%s&search=%s' tabindex='-1'>%d</a></li> ", n, category, sort, column, search, n);
			}
			
			loop ++;
			n++;
		}
		
		// 다음 페이지
		if ( n > totalPage ) {
			pagebar += String.format(" <li class='page-item disabled'><a class='page-link' href='#!'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a></li> ");
		} else {
			pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/community/list.do?page=%d&category=%s&sort=%s&column=%s&search=%s' tabindex='-1'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a></li> ", n, category, sort, column, search);
		}
		
		pagebar += "</ul>\r\n"
				+ "  		</nav>";

		
		// list 호출
		ArrayList<CommunityDTO> list = dao.list(map);
		
		for ( CommunityDTO dto : list ) {
			
			// 날짜(regdate): 시분초 제거
			String regdate = dto.getRegdate();
			regdate = regdate.substring(0, 10);
			dto.setRegdate(regdate);
			
			// 글 내용 스크립트 문구 치환
			String detail = dto.getDetail();
			detail = detail.replace("<script", "&lt;script").replace("</script>", "&lt;/script&gt;");
			dto.setDetail(detail);
			
			// 글 제목 40자 이내로 줄이기
			String title = dto.getTitle();
			if ( title.length() > 30 ) {
				title = title.substring(0, 25) + "...";
				dto.setTitle(title);
			}
			
			// 검색어 표시
			if ( isSearch.equals("y") && column.equals("title")) {
				title = title.replace(search, "<span style='color: tomato; background-color: yellow;'>" 
														+ search + "</span>");
				dto.setTitle(title);
			}

		}
		
		// 조회수 카운트 시 새로고침 방지
		HttpSession session = req.getSession();
		session.setAttribute("read", "n");
		
		req.setAttribute("list", list);
		req.setAttribute("map", map);
		req.setAttribute("pagebar", pagebar);
		
		// 카테고리, 내글보기, 정렬, 검색  
		req.setAttribute("category", category);
		req.setAttribute("id", id);
		req.setAttribute("sort", sort);
		req.setAttribute("column", column);
		req.setAttribute("search", search);


		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/community/list.jsp");
		dispatcher.forward(req, resp);

	}

}
