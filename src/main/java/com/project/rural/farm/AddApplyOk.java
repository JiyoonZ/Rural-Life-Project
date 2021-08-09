package com.project.rural.farm;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.rural.CheckMember;

@WebServlet("/farm/addapplyok.do")
public class AddApplyOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		HttpSession session = req.getSession();
		
		String id = session.getAttribute("id").toString();
		String pseq = req.getParameter("pseq");
		String area = req.getParameter("area");
		
		FarmDAO dao = new FarmDAO();
		ApplyDTO dto = new ApplyDTO();
		
		dto.setId(id);
		dto.setPseq(pseq);
		dto.setArea(area);
		
		int result = dao.addApply(dto);

		if (result == 1) {
			
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();
			
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='utf-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('임대 신청이 완료되었습니다.');");
			writer.print("location.href='/rural/farm/view.do?seq=" + pseq + "';");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			
			writer.close();
			
		} else {
			
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();
			
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='utf-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('대여 신청 실패');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			
			writer.close();
			
		}
		
	}

}
