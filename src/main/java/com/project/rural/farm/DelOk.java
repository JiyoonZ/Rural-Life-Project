package com.project.rural.farm;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.rural.CheckMember;

@WebServlet("/farm/delok.do")
public class DelOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		String seq = req.getParameter("seq");
		String image = "";
		
		FarmDAO dao = new FarmDAO();
		
		image = dao.get(seq).getImage();
		
		dao.delAllReview(seq); //리뷰 삭제
		
		dao.delAllapply(seq); //신청 내역 삭제
		
		int result = dao.del(seq);
		
		if (result == 1) {
			if (image != null && !image.equals("")) { //이미지 존재 O
				//이미지 파일 삭제
				String filePath = req.getSession().getServletContext().getRealPath("/assets/img/farm/") + image;
				File file = new File(filePath);
				if (file.exists()) {
					file.delete();
				}
			}
			//resp.sendRedirect("/rural/farm/list.do");
			resp.sendRedirect("/rural/farm/list.do");
		} else {
			resp.sendRedirect("/rural/farm/view.do?seq=" + seq);
		}

	}

}
