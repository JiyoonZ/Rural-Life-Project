package com.project.rural.exp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;






@WebServlet("/exp/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//검색조건 받아오기
		String paramSido = req.getParameter("sido");
		String paramGugun = req.getParameter("gugun");
		String paramExpInf = req.getParameter("expInf");
		String paramRegion = req.getParameter("region");
		String paramOnlyApply = req.getParameter("onlyApply");

		//검색 조건 담기 
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("paramOrgGugun", paramGugun);
		//검색한 조건 받아온 매개변수 -> null값이거나 빈문자열이면 => "" // 아니라면 받아온 매개변수 그대로
		paramRegion = paramRegion == null || "".equals(paramRegion) ? "" : paramRegion;
		paramSido = paramSido == null || "".equals(paramSido) ? "" : paramSido;
		paramGugun = paramGugun == null || "".equals(paramGugun) ? "": paramGugun.substring(0, paramGugun.length()-1);
		paramExpInf = paramExpInf == null || "".equals(paramExpInf) ? "" : paramExpInf;
		String fSearch = "n";
		//하나라도 검색했다면 fsearch를 true값 주기
		if(!"".equals(paramRegion)|| !"".equals(paramSido)|| !"".equals(paramGugun)|| !"".equals(paramExpInf) ||
				"Y".equals(paramOnlyApply)) {
			fSearch = "y";
		}	
		map.put("paramOnlyApply", paramOnlyApply);
		map.put("paramRegion", paramRegion);
		map.put("paramSido", paramSido);
		map.put("paramGugun", paramGugun);
		map.put("paramExpInf", paramExpInf);
		map.put("fSearch", fSearch);

		
		
		//--------------------------------------------------------
		//list.do > list.do?page=1	//페이징 처리
		// -> 보고싶은 페이지를 정하기 위한 처리 
		int nowPage = 0;			//현재 페이지 번호
		int totalCount = 0;			// 총 게시물 수
		int pageSize = 6;			// 한 페이지당 출력할 게시물 수
		int totalPage = 0;			// 총 페이지 수
		int begin = 0;				// 가져올 게시물 시작 위치
		int end = 0;				// 가져올 게시물 끝 위치
		int n =0;					// 페이지바 제작
		int loop = 0;				// 페이지바 제작
		int blockSize = 5;			// 페이지바 제작
		
		//list.do?page=3
		
		String page = req.getParameter("page");
		
		if(page == null || page.equals("")) {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		//nowPage > 지금 보게될 페이지 번호 
		//1page -> where rnum between 1 and 6
		//2page -> where rnum between 7 and 13
		//3page -> where rnum between 14 and 20
		
		begin = ((nowPage-1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin+ "");
		map.put("end", end+ "");
		

		//1.
		ExpDAO dao = new ExpDAO();
		//2.
		ArrayList<ExpDTO> list = dao.list(map);
		//검샐결과 담을 테이블
//		ArrayList<ExpDTO> result = new ArrayList<ExpDTO>();
		
		for (ExpDTO dto:list) {
			
			//날짜 자르기
			String startDate = dto.getStartDate();
			String endDate = dto.getEndDate();
			
			startDate = startDate.substring(0,10);
			endDate = endDate.substring(0,10);
			
			dto.setStartDate(startDate);
			dto.setEndDate(endDate);

			//글자수 생략하기
			//체험명 10글자
			//마을이름 5글자
			String name = dto.getName();
			String town = dto.getTown();
			
			if (name.length()>8) name = name.substring(0,8) + "...";
			if (town.length()>5) town = town.substring(0, 5) + "...";
			dto.setName(name);
			dto.setTown(town);
	
		}
		
		//총 게시물 수 알아내기 => ctn 총게시물 수를 반환받는다. 
		totalCount = dao.getTotalCount(map);
		
		//총 페이지 수 알아내기
		// 총 20개의 게시물이라면 20/6 => 무조건 반올림
		totalPage = (int)Math.ceil((double)totalCount /pageSize);
		
		
		String pagebar = "<nav aria-label=\"...\">\r\n"
				+ "					<ul class=\"pagination justify-content-center\">";
		
		loop = 1; //루프변수
		n = ((nowPage -1)/ blockSize) * blockSize + 1; //출력되는 페이지 번호
		
		if (n == 1) {
			pagebar += String.format(" <li class='page-item disabled'><a class='page-link' href='#!' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> ");
		} else {
			if (fSearch.equals("y")) {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/exp/list.do?onlyApply=%s&sido=%s&gugun=%s&expInf=%s&region=%s&page=%d' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> "
						,paramOnlyApply, paramSido, paramGugun, paramExpInf, paramRegion, n-1);				
			} else {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/exp/list.do?page=%d' tabindex='-1'><img src='/rural/assets/img/logo/previous.png' style='width:14px;'/></a></li> ", n-1);
			}
		}
		
		if (totalPage == 0) {
			pagebar += " <li class='page-item active'><a class='page-link' href='#!'>1</a></li> ";
		}
		
		while (!(loop > blockSize || n > totalPage)) {
			
			if (n == nowPage) {
				pagebar += String.format(" <li class='page-item active'><a class='page-link' href='#!'>%d<span class='sr-only'>(current)</span></a></li> ", n);
			} else {
				if (fSearch.equals("y")) {
					pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/exp/list.do?onlyApply=%s&sido=%s&gugun=%s&expInf=%s&region=%s&page=%d' tabindex='-1'>%d</a></li> "
							,paramOnlyApply,  paramSido, paramGugun, paramExpInf, paramRegion, n, n);
				} else {
					pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/exp/list.do?page=%d' tabindex='-1'>%d</a></li> ", n, n);
				}
			}
			
			loop++;
			n++;
		}
		
		if (n > totalPage) {
			pagebar += String.format(" <li class='page-item disabled'><a class='page-link' href='#!'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a></li> "); 
		} else {
			if (fSearch.equals("y")) {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/exp/list.do?onlyApply=%s&sido=%s&gugun=%s&expInf=%s&region=%s&page=%d' tabindex='-1'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a></li> "
						,paramOnlyApply, paramSido, paramGugun, paramExpInf, paramRegion, n);
			} else {
				pagebar += String.format(" <li class='page-item'><a class='page-link' href='/rural/exp/list.do?page=%d' tabindex='-1'><img src='/rural/assets/img/logo/next.png' style='width:14px;'/></a></li> ", n);
			}
		}
		
		
		pagebar += "</ul>\r\n"
				+ "		</nav>";	
		//페이징 End
		
		
		//-----------------------------------------------------------------------------------
	

		//3.
		//if(result.size()>0 || fSearch.equals("y")) {
			//req.setAttribute("list", result);
			
		//} else {
			req.setAttribute("list", list);
		//}
		
		req.setAttribute("map", map);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", nowPage);
		
		req.setAttribute("pagebar", pagebar);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/exp/list.jsp");
		dispatcher.forward(req, resp);

	}
}