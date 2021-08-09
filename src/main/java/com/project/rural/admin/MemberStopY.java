package com.project.rural.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.rural.CheckMember;
import com.project.rural.member.MemberDAO;

@WebServlet("/admin/memberstopy.do")
public class MemberStopY extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		String id = req.getParameter("id");
		
		MemberDAO dao = new MemberDAO();
		
		int result = dao.stopY(id);
		
		if ( result == 1 ) {
			
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();			
			
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset=\"UTF-8\">");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('회원 정지에 성공했습니다.');");
			writer.print("location.href='/rural/admin/membermanage.do';");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			
			writer.close();
			
		} else {
			
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();			
			
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset=\"UTF-8\">");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('회원 정지에 실패했습니다.');");
			writer.print("location.href='/rural/admin/membermanage.do';");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			
			writer.close();
		}
		
	}

}
