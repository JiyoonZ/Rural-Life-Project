package com.project.rural.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/signupok.do")
public class SignUpOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth").split("-")[0].substring(2) + req.getParameter("birth").split("-")[1] + req.getParameter("birth").split("-")[2];
		String gender = req.getParameter("gender");
		String tel = req.getParameter("tel1") + "-" + req.getParameter("tel2") + "-" + req.getParameter("tel3");
		String eamil = req.getParameter("email1") + "@" +req.getParameter("email2");
		String address = req.getParameter("address");
		String lv = req.getParameter("lv");
				
		MemberDAO dao = new MemberDAO();
		
		if (dao.checkId(id)) {
		
			MemberDTO dto = new MemberDTO();
			
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setBirth(birth);
			dto.setGender(gender);
			dto.setTel(tel);
			dto.setEmail(eamil);
			dto.setAddress(address);
			dto.setLv(lv);
			
			dao.signup(dto);
			
			resp.sendRedirect("/rural/member/signup.do?step=3&lv=" + lv);
			
		} else {
			
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('이미 사용중인 아이디입니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			
			writer.close();
		}
	}

}