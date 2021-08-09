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

import com.project.rural.CheckMember;


@WebServlet("/market/addlist.do")
public class AddList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);


		// 1. seq가져오기
		HttpSession session = req.getSession();
		String seq = req.getParameter("seq");
		String id = (String) session.getAttribute("id");

		System.out.println("id" + id);


		HashMap<String, String> map = new HashMap<String,String>();

		// 페이징 처리
		// -> 보고 싶은 페이지를 정하기 위한 처리
		int nowPage = 0; // 현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int pageSize = 10; // 한 페이지당 출력할 게시물 수
		int totalPage = 0; // 총 페이지 수
		int begin = 0; // 가져올 게시물 시작 위치
		int end = 0; // 가져올 게시물 끝 위치
		int n = 0; // 페이지바 제작
		int loop = 0; // 페이지바 제작
		int blockSize = 5; // 페이지바 제작


		//이제 페이지 번호를 넣어서 부를거야
		//list.do?page=3

		String page = req.getParameter("page");

		if(page == null || page.equals("")) {
			nowPage = 1;
		}else {
			nowPage = Integer.parseInt(page);
		}

		//nowPage > 지금 보게될 페이지 번호
		//1page -> where rnum between 1 and 10
		//2page -> where rnum between 11 and

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		map.put("id",id);
		map.put("begin", begin + "");
		map.put("end", end + "");



		MarketDAO dao = new MarketDAO();

		//총 게시물 수 알아내기
		totalCount = dao.getTotalCountAdd(map);
		//System.out.println("totalCount "+ totalCount);

		//총 페이지 수 알아내기
		//393 / 10 = 39.3 > 40
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		//System.out.println("totalPage" + totalPage);




		String pagebar = "<nav>\r\n"
				+ "				<ul class=\"pagination\">";

		loop = 1; //while 루프변수
		n = ((nowPage - 1 ) / blockSize) * blockSize + 1; //출력되는 페이지 번호


		if( n == 1 ) {

			pagebar += String.format("<li class='page-item disabled'><a class='page-link' href='#!' ><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li>" );

		} else {
			pagebar += String.format("<li class='page-item'><a class='page-link' href='/rural/market/addlist.do?page=%d' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li>"
										, n-1);
		}		if(totalPage == 0) {
			pagebar += "<li class='active'><a href='#!'>1</a></li>";
		}


		//부트스트랩 페이징
		while(!(loop > blockSize || n > totalPage )) {
			if( n == nowPage) {
				pagebar += String.format("<li class='page-item active'><a class='page-link' href='#!'>%d</a></li>", n, n);
			} else {

				pagebar += String.format("<li class='page-item'><a class='page-link' href='/rural/market/addlist.do?page=%d'>%d</a></li>", n, n);

			}
			loop++;
			n++;

		}


		if( n > totalPage ) {
			pagebar += String.format("<li class='page-item disabled'><a class='page-link' href='#!'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a> </li>", blockSize );
		} else {
			pagebar += String.format("<li class='page-item'><a class='page-link' href='/rural/market/addlist.do?page=%d'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a> </li>", n, blockSize );
		}


		pagebar += "</ul>\r\n"
				+ "			</nav>";










		// 2.
		MarketDTO dto = dao.get(seq);

		// dto.setId(id);

		ArrayList<MarketDTO> addlist = dao.addlist(map);

		// add list전달
		req.setAttribute("addlist", addlist);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", nowPage);

		req.setAttribute("pagebar", pagebar);


		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/market/addlist.jsp");
		dispatcher.forward(req, resp);

	}

}