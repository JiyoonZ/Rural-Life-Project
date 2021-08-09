package com.project.rural.market;

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


@WebServlet("/market/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//세션에 저장되어있는 id가져오기 -> 관심내역보기에 쓰기위함
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		/*
		 * System.out.println("아이디:" + id);
		 */


		//검색기능
		String search = req.getParameter("search");
		String isSearch = "n";

		String isLike = req.getParameter("isLike");

		//마켓카테고리 검색("쌀/잡곡" 등)
		String marketinfo = req.getParameter("marketinfo");

		if( ( search != null && !search.equals("")) || (marketinfo != null && !marketinfo.equals("")) ){
			isSearch = "y";
		}


		if(isLike != null && (isLike.equals("on") || isLike.equals("y")))
			isLike = "y";
		else
			isLike = "n";


//		 System.out.println("isLike "+ req.getParameter("isLike"));
//		 System.out.println("keyWord "+ req.getParameter("search"));



		HashMap<String, String> map = new HashMap<String, String>();
		map.put("marketinfo", marketinfo);
		map.put("search", search);
		map.put("isSearch", isSearch);
		map.put("isLike", isLike);
		map.put("id", id);





		//할일
		//1. DB작업 > DAO위임 > select
		//2. ArrayList<BoardDTO> 반환
		//3. JSP 호출하기 + 2번전달




		// 페이징 처리
		// -> 보고 싶은 페이지를 정하기 위한 처리
		int nowPage = 0; // 현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int pageSize = 6;// 한 페이지당 출력할 게시물 수
		int totalPage = 0; // 총 페이지 수
		int begin = 0; // 가져올 게시물 시작 위치
		int end = 0; // 가져올 게시물 끝 위치
		int n = 0; // 페이지바 제작
		int loop = 0; // 페이지바 제작
		int blockSize = 5; // 페이지바 제작

		//list.do > list.do?page=1
		//list.do?page=3
		String page = req.getParameter("page");

		if(page == null || page.equals("")) {
			nowPage = 1;
		}else {
			nowPage = Integer.parseInt(page);
		}

		//nowpage > 지금 보게될 페이지 번호
		//1page -> where rnum between 1 and 10

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		map.put("begin", begin + "");
		map.put("end", end + "");

		//1.
		MarketDAO dao = new MarketDAO();

		// 총 게시물 수 알아내기
		totalCount = dao.getTotalCount(map);
		// System.out.println(totalCount);

		// 총 페이지 수 알아내기
		// 393 / 10 = 39.3 > 40
		totalPage = (int) Math.ceil((double) totalCount / pageSize);
		// System.out.println(totalPage);

		String pagebar = "<nav>\r\n"
				+ "				<ul class=\"pagination\">";


		loop = 1; //while 루프변수
		n = ((nowPage - 1 ) / blockSize) * blockSize + 1; //출력되는 페이지 번호

		if( n == 1 ) {

			pagebar += String.format("<li class='page-item disabled'><a class='page-link' href='#!' ><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> " );

		} else {
			if (isSearch.equals("y")) {
					pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/market/list.do?marketinfo=%s&search=%s&isLike=%s&page=%d' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> "
													,marketinfo, search, isLike, n-1);
			}else {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/market/list.do?page=%d#list' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> ", n-1);
			}
		}



		if(totalPage == 0) {
			pagebar += "<li class='active'><a href='#!'>1</a></li>";
		}

		//부트스트랩 페이징
		while(!(loop > blockSize || n > totalPage )) {
			if( n == nowPage) {
				pagebar += String.format("<li class='page-item active'><a class='page-link' href='#!'>%d</a></li>", n);
			} else {
				if (isSearch.equals("y")) {
					pagebar += String.format("<li class='page-item'><a class='page-link' href='/rural/market/list.do?marketinfo=%s&search=%s&isLike=%s&page=%d'>%d</a></li>"
							,marketinfo ,search, isLike, n, n);
				}else {
					pagebar += String.format("<li class='page-item'><a class='page-link' href='/rural/market/list.do?page=%d'>%d</a></li>"
							,n, n);
				}
			}
			loop++;
			n++;

		}

		if( n > totalPage ) {
			pagebar += String.format("<li class='page-item disabled'><a class='page-link' href='#!'>Next</a> </li>");
		} else {
			if (isSearch.equals("y")) {
				pagebar += String.format("<li class='page-item'><a class='page-link' href='/rural/market/list.do?marketinfo=%s&search=%s&isLike=%s&page=%d'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a> </li>"
						,marketinfo, search, isLike, n);
			}else {
				pagebar += String.format("<li class='page-item'><a class='page-link' href='/rural/market/list.do?page=%d'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a> </li>"
						, n);
			}
		}


		pagebar += "</ul>\r\n"
				+ "			</nav>";

		//좋아요 하트 체크 여부 확인
		ArrayList<LikeDTO> likelist = dao.likelist(id);
		System.out.println("likelist"+likelist);



		//2.
		ArrayList<MarketDTO> list = dao.list(map);

		//3.
		req.setAttribute("list", list);
		req.setAttribute("map", map);
		req.setAttribute("likelist", likelist);

		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", nowPage);

		req.setAttribute("isLike", isLike);
		req.setAttribute("search", search);
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("marketinfo", marketinfo);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/market/list.jsp");
		dispatcher.forward(req, resp);

	}

}