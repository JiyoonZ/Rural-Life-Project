package com.project.rural.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/myeditok.do")
public class MyEditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String tel = req.getParameter("tel1") + "-" + req.getParameter("tel2") + "-" + req.getParameter("tel3");
		String email = req.getParameter("email1") + "@" + req.getParameter("email2");
		String nowpw = req.getParameter("nowpw");
		String pw = req.getParameter("pw");
		String address = req.getParameter("address");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		// 입력한 현재 비밀번호 DB 작업 > 확인
		int check = dao.pwCheck(id, nowpw);
		
		// 현재 비밀번호를 잘못 눌렀을 때..
		if ( check == 0 ) {
			
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();			
			
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='UTF-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('현재 비밀번호를 잘못 입력하셨습니다 확인하시고 다시 입력 해주시기 바랍니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			
			writer.close();
			
		} else {
			dto.setId(id);
			dto.setGender(gender);
			dto.setTel(tel);
			dto.setEmail(email);
			dto.setPw(pw);
			dto.setAddress(address);
			
			// 수정할 정보 DB 작업
			int result = dao.edit(dto);
			
			if ( result == 1 ) {
				
				resp.setCharacterEncoding("UTF-8");
				
				PrintWriter writer = resp.getWriter();			
				
				writer.print("<html>");
				writer.print("<head>");
				writer.print("<meta charset='UTF-8'>");
				writer.print("</head>");
				writer.print("<body>");
				writer.print("<script>");
				writer.print("alert('" + name + "님의 정보가 수정이 완료되었습니다.');");
				writer.print("location.href='/rural/member/mypage.do';");
				writer.print("</script>");
				writer.print("</body>");
				writer.print("</html>");
				
				writer.close();
				
			} else {
				
				resp.setCharacterEncoding("UTF-8");
				
				PrintWriter writer = resp.getWriter();			
				
				writer.print("<html>");
				writer.print("<head>");
				writer.print("<meta charset='UTF-8'>");
				writer.print("</head>");
				writer.print("<body>");
				writer.print("<script>");
				writer.print("alert('" + name + "님의 정보가 수정이 실패하였습니다. 다시 입력 해주시기 바랍니다.');");
				writer.print("location.href='/rural/member/myedit.do';");
				writer.print("</script>");
				writer.print("</body>");
				writer.print("</html>");
				
				writer.close();
			}
		}
		
		
	}

}
