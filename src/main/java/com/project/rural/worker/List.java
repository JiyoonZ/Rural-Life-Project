package com.project.rural.worker;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/worker/list.do")
public class List extends HttpServlet {

	@Override // Annotation - 프로그래밍 기능 주석
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//검색기능
		String cropInfo = req.getParameter("cropInfo");
		String pay = req.getParameter("pay");
		String sido = req.getParameter("sido");
		String gugun = req.getParameter("gugun");
		String possible = req.getParameter("possible");
		String search = req.getParameter("search");
		
		String isSearch = "n";
		
		if((cropInfo != null && !cropInfo.equals("")) ||
				 (pay != null && !pay.equals("")) ||
				 (sido != null && !sido.equals("")) ||
				 (gugun != null && !gugun.equals("")) ||
				 (possible != null && !possible.equals("")) ||
				 (search != null && !search.equals(""))
				 
				) {
			isSearch = "y";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cropInfo", cropInfo);
		map.put("pay", pay);
		map.put("sido", sido);
		map.put("gugun", gugun);
		map.put("possible", possible);
		map.put("isSearch", isSearch);

		
		//페이징 처리 
		// -> 보고 싶은 페이지를 정하기 위한 처리
		int nowPage = 0;		//현재 페이지 번호
		int totalCount = 0;		//총 게시물 수
		int pageSize = 5;		//한 페이지당 출력할 게시물 수
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
		

		//nowPage > 지금 보게될 페이지 번호
		//1page -> where rnum between 1 and 10
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		WorkerDAO dao = new WorkerDAO();
		
		//총 게시물 수 알아내기
		totalCount = dao.getTotalCount(map);
		//System.out.println(totalCount);
		
		//총 페이지 수 알아내기
		//393 / 10 = 39.3 > 40
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		//System.out.println(totalPage);
		
				
		String pagebar = "<nav aria-label='...'>\r\n"
				+ "			<ul class=\"pagination\">";
		
		loop = 1; //while 루프 변수
		n = ((nowPage - 1) / blockSize) * blockSize + 1; //출력되는 페이지 번호
		
		if (n == 1) {
			pagebar += String.format(" <li class='page-item disabled'><a class='page-link' href='#!' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> ");
		} else {
			if (isSearch.equals("y")) {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/worker/list.do?sido=%s&gugun=%s&cropInfo=%s&pay=%s&search=%s&possible=%s&page=%d' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> "
						, sido, gugun,cropInfo,pay, isSearch,possible, n-1);				
			} else {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/worker/list.do?page=%d' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> ", n-1);
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
					pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/worker/list.do?sido=%s&gugun=%s&cropInfo=%s&pay=%s&search=%s&possible=%s&page=%d' tabindex='-1'>%d</a></li> "
							, sido, gugun,cropInfo,pay, isSearch,possible,  n, n);
				} else {
					pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/worker/list.do?page=%d' tabindex='-1'>%d</a></li> ", n, n);
				}
			}
			
			loop++;
			n++;
		}
		
		if (n > totalPage) {
			pagebar += String.format(" <li class='page-item disabled'><a class='page-link' href='#!'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a></li> "); 
		} else {
			if (isSearch.equals("y")) {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/worker/list.do?sido=%s&gugun=%s&cropInfo=%s&pay=%s&search=%s&possible=%s&page=%d' tabindex='-1'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a></li> "
						, sido, gugun,cropInfo,pay, isSearch, possible, n);
			} else {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/worker/list.do?page=%d' tabindex='-1'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a></li> ", n);
			}
		}
		
		
		pagebar += "</ul>\r\n"
				+ "		</nav>";	
		//페이징 End
		
		ArrayList<WorkerDTO> list = dao.list(map);
		
		for(WorkerDTO dto : list) {
			
			//날짜 가공
			String startDate = dto.getStartDate();
			startDate = startDate.substring(0, 10);
			dto.setStartDate(startDate);
			
			String endDate = dto.getEndDate();
			endDate = endDate.substring(0, 10);
			dto.setEndDate(endDate);
			
			
			//제목이 길면 자르기
			String title = dto.getTitle();
		
			if(title.length() > 23) {
				title = title.substring(0, 23) + "..";
				dto.setTitle(title);
			}
		}
		
		// 신청가능한 공고 
		req.setAttribute("list", list);
		req.setAttribute("map", map);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", nowPage);
		
		req.setAttribute("pagebar", pagebar);

		RequestDispatcher dispathcher = req.getRequestDispatcher("/WEB-INF/views/worker/list.jsp");
		dispathcher.forward(req, resp);

	}
}
