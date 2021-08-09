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

import com.project.rural.CheckMember;

@WebServlet("/exp/applicant.do")
public class Applicant extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		//글번호 받아오기
		// DB 특정 글번호의 정보 받아오기 (신청테이블)
		// applicant.jsp 에 전달하기
		String seq = req.getParameter("seq");
		String name = req.getParameter("name");
		//현재 선택상태받아오기
		String isView = req.getParameter("isView");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("seq", seq);
		map.put("isView", isView);
		
		
		ExpDAO dao = new ExpDAO();
		
		
		//=================================================
//		HttpSession session = req.getSession();
//		String id = session.getAttribute("id").toString();

		ArrayList<ExpApplyDTO> list = dao.appliCantList(map);
		
		//2.5
		for (ExpApplyDTO dto : list) {
			
			//남자/여자
			String gender = dto.getGender();
			if ("m".equals(gender) ) {
				gender = "남자";
			} else if ("f".equals(gender)) {
				gender = "여자";
			}
			dto.setGender(gender);
			
			//나이
			String tmpAge = "19"+dto.getAge().substring(0,2);
			System.out.println(tmpAge);
			
			int age2 = (2021 - Integer.parseInt(tmpAge) + 1);
			String age = String.valueOf(age2);
			dto.setAge(age);
			
			//날짜
			String startDate = dto.getStartDate();
			String endDate = dto.getEndDate();
			
			startDate = startDate.substring(0,10);
			endDate = endDate.substring(0,10);
			
			dto.setStartDate(startDate);
			dto.setEndDate(endDate);
		
			
			
		}
		
	
		//3.
		req.setAttribute("list", list);
		req.setAttribute("seq", seq);
		req.setAttribute("expName", name);
		req.setAttribute("isView", isView);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/exp/applicant.jsp");
		dispatcher.forward(req, resp);

	}
}