package com.project.rural.worker;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.rural.CheckMember;

@WebServlet("/worker/applicantok.do")
public class ApplicantOk extends HttpServlet {

	@Override // Annotation - 프로그래밍 기능 주석
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		
		String seq = req.getParameter("seq");
		
		WorkApplyDAO dao = new WorkApplyDAO();
		WorkApplyDTO dto = new WorkApplyDTO();
		
		dto.setSeq(seq);
		
		int result = dao.applycantok(dto);
		
		if(result == 1) {
			resp.sendRedirect("/rural/worker/applicant.do?seq=" + seq);
		} else {
			resp.sendRedirect("/rural/worker/applicant.do?seq=" + seq);
		}
	}
}