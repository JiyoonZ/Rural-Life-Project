package com.project.rural.farm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/farm/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String sido = req.getParameter("sido");
		String gugun = req.getParameter("gugun");
		
		String address = "";
		if (req.getParameter("sido") != null && !req.getParameter("sido").equals("")) {
			address = req.getParameter("sido") + " " + req.getParameter("gugun");
		}
		String area = req.getParameter("area");
		String price = req.getParameter("price");
		String column = req.getParameter("column");
		String search = req.getParameter("search");
		String isSearch = "n";
		
		if ((!address.equals("")) || (area != null && !area.equals("")) || (price != null && !price.equals(""))
				|| (column != null && !column.equals("") && search != null && !search.equals(""))) {
			isSearch = "y";
		}
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("sido", sido);
		map.put("gugun", gugun);
		map.put("address", address);
		map.put("area", area);
		map.put("price", price);
		map.put("column", column);
		map.put("search", search);
		map.put("isSearch", isSearch);
		
		//페이징
		int nowPage = 0;		//현재 페이지 번호
		int totalCount = 0;		//총 게시물 수
		int pageSize = 6;		//한 페이지당 출력할 게시물 수
		int totalPage = 0;		//총 페이지 수
		int begin = 0;			//가져올 게시물 시작 위치
		int end = 0;			//가져올 게시물 끝 위치
		int n = 0;				//페이지바 제작
		int loop = 0;			//페이지바 제작
		int blockSize = 5;		//페이지바 제작
		
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
		
		FarmDAO dao = new FarmDAO();
		
		totalCount = dao.getTotalCount(map);
		
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		String pagebar = "<nav aria-label='...'>\r\n"
				+ "			<ul class=\"pagination justify-content-center\">";
		
		loop = 1; //while 루프 변수
		n = ((nowPage - 1) / blockSize) * blockSize + 1; //출력되는 페이지 번호
		
		if (n == 1) {
			pagebar += String.format(" <li class='page-item disabled'><a class='page-link' href='#!' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> ");
		} else {
			if (isSearch.equals("y")) {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/farm/list.do?sido=%s&gugun=%s&area=%s&price=%s&column=%s&search=%s&page=%d#list' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> "
						, sido, gugun, area, price, column, search, n-1);			
			} else {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/farm/list.do?page=%d#list' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> ", n-1);
			}
		}
		
		if (totalPage == 0) {
			pagebar += " <li class='page-item active'><a class='page-link' href='#!'>1</a></li> ";
		}
		
		while (!(loop > blockSize || n > totalPage)) {
			
			if (n == nowPage) {
				pagebar += String.format(" <li class='page-item active'><a class='page-link' href='#!'>%d<span class='sr-only'>(current)</span></a></li> ", n);
			} else {
				if (isSearch.equals("y")) {
					pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/farm/list.do?sido=%s&gugun=%s&area=%s&price=%s&column=%s&search=%s&page=%d#list'>%d</a></li> "
											, sido, gugun, area, price, column, search, n, n);
				} else {
					pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/farm/list.do?page=%d#list'>%d</a></li> ", n, n);
				}
			}
			
			loop++;
			n++;
		}
		
		if (n > totalPage) {
			pagebar += String.format(" <li class='page-item disabled'><a class='page-link' href='#!'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a></li> "); 
		} else {
			if (isSearch.equals("y")) {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/farm/list.do?sido=%s&gugun=%s&area=%s&price=%s&column=%s&search=%s&page=%d#list'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a></li> "
										, sido, gugun, area, price, column, search, n);
			} else {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/farm/list.do?page=%d#list'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a></li> ", n);
			}
		}
		
		
		pagebar += "</ul>\r\n"
				+ "		</nav>";	
		//페이징 End
		
		ArrayList<FarmDTO> list = dao.list(map);
		
		req.setAttribute("list", list);
		req.setAttribute("map", map);
		
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", nowPage);
		
		req.setAttribute("pagebar", pagebar);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/farm/list.jsp");
		dispatcher.forward(req, resp);
	}

}