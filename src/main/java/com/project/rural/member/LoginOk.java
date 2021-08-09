package com.project.rural.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/loginok.do")
public class LoginOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");		
		String pw = req.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		
		MemberDTO result = dao.login(dto);
		
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		if (result != null) {
			
			System.out.println(result.getIsOut());
			if ( result.getIsOut().equals("y")) {
				
				writer.print("<html>");
				writer.print("<head>");
				writer.print("<meta charset='UTF-8'>");
				writer.print("</head>");
				writer.print("<body>");
				writer.print("<script>");
				writer.print("alert('탈퇴회원입니다. 로그인이 불가능 합니다.');");
				writer.print("history.back();");
				writer.print("</script>");
				writer.print("</body>");
				writer.print("</html>");
				
				writer.close();
			}
			
			if ( result.getIsStop().equals("y")) {
				
				writer.print("<html>");
				writer.print("<head>");
				writer.print("<meta charset='UTF-8'>");
				writer.print("</head>");
				writer.print("<body>");
				writer.print("<script>");
				writer.print("alert('정지회원입니다. 로그인이 불가능 합니다.');");
				writer.print("history.back();");
				writer.print("</script>");
				writer.print("</body>");
				writer.print("</html>");
				
				writer.close();
				
			}
			
			HttpSession session = req.getSession();
			session.setAttribute("id", result.getId()); 
			session.setAttribute("name", result.getName()); 
			session.setAttribute("birth", result.getBirth());
			session.setAttribute("gender", result.getGender());
			session.setAttribute("tel", result.getTel());
			session.setAttribute("email", result.getEmail());
			session.setAttribute("address", result.getAddress());
			session.setAttribute("lv", result.getLv());
			session.setAttribute("regDate", result.getRegDate());
			session.setAttribute("isOut", result.getIsOut());
			session.setAttribute("isStop", result.getIsStop());
			resp.sendRedirect("/rural/index.do");
			
		} else {
			
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='UTF-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('아이디/패스워드가 틀렸습니다. 다시 입력해주세요.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			
			writer.close();
			
		}
		
	}

}
