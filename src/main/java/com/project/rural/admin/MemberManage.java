package com.project.rural.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.rural.CheckMember;
import com.project.rural.member.MemberDAO;
import com.project.rural.member.MemberDTO;

@WebServlet("/admin/membermanage.do")
public class MemberManage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		String column = req.getParameter("column");
		String search = req.getParameter("search");
		String sort = req.getParameter("sort");
		
		
		String isSearch = "n";
		
		if ( (column != null && search != null && !column.equals("") && !search.equals("")) ||
			 (sort != null && !sort.equals("")) ) {
			isSearch = "y";
		}
		
		if (column == null) {
			column = "";
		} 
		if (search == null) {
			search = "";
		}
		if (sort == null) {
			sort = "";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		MemberDAO dao = new MemberDAO();
		
		map.put("column", column);
		map.put("search", search);
		map.put("isSearch", isSearch);
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
			pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/admin/membermanage.do?page=%d&sort=%s&column=%s&search=%s' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> ", n-1, sort, column, search);
		}
		
		// 페이지 글 X
		if (totalPage == 0) {
			pagebar +=  " <li class='page-item active'><a class='page-link' href='#!'>1</a></li> ";
		}
		
		while ( !(loop > blockSize || n > totalPage ) ) {
			if ( n == nowPage ) {
				pagebar += String.format(" <li class='page-item active'><a class='page-link' href='#!'>%d<span class='sr-only'>(current)</span></a></li> ", n);
			} else {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/admin/membermanage.do?page=%d&sort=%s&column=%s&search=%s' tabindex='-1'>%d</a></li> ", n, sort, column, search, n);
			}
			
			loop ++;
			n++;
		}
		
		// 다음 페이지
		if ( n > totalPage ) {
			pagebar += String.format(" <li class='page-item disabled'><a class='page-link' href='#!'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a></li> ");
		} else {
			pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/admin/membermanage.do?page=%d&sort=%s&column=%s&search=%s' tabindex='-1'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a></li> ", n, sort, column, search);
		}
		
		pagebar += "</ul>\r\n"
				+ "  		</nav>";
		
		ArrayList<MemberDTO> list = dao.memberList(map);
		
		for ( MemberDTO dto : list ) {
			
			String regdate = dto.getRegDate();
			regdate = regdate.substring(0, 10);
			dto.setRegDate(regdate);
			
		}
		
		req.setAttribute("list", list);
		req.setAttribute("map", map);
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("sort", sort);
		req.setAttribute("column", column);
		req.setAttribute("search", search);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/membermanage.jsp");
		dispatcher.forward(req, resp);

	}
}