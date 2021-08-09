package com.project.rural.exp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/exp/applypassok.do")
public class ApplyPassOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String[] seqs = req.getParameterValues("seqs");
		String pseq = req.getParameter("pseq");
		
		ExpDAO dao = new ExpDAO();
		
		//승인처리된 항목들의 갯수를 반환받는다.
		int result = dao.passApply(seqs);
		
		if(result > 0) {
			resp.sendRedirect("/rural/exp/applicant.do?seq=" + pseq);
		} else {
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();
			
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('승인항목을 선택해주세요.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			
			writer.close();
			
		}
		 


	}
}