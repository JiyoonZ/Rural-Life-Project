package com.project.rural.notice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.rural.CheckMember;


@WebServlet("/notice/editok.do")
public class EditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		// 파일 업로드
		String realFolder="";
		String saveFolder = "/assets/img/community";		
		String encType = "UTF-8";	
		int maxSize=5*1024*1024;	
				
		ServletContext context = this.getServletContext();	
		realFolder = context.getRealPath(saveFolder);
		
		ArrayList<String> images = new ArrayList<String>();

		MultipartRequest multi = new MultipartRequest(req,realFolder,maxSize,encType,new DefaultFileRenamePolicy());

		Enumeration e = multi.getFileNames();
		
		while (e.hasMoreElements()) {
			images.add(multi.getFilesystemName(e.nextElement().toString()));
		}
		
		String seq = multi.getParameter("seq");
		String category = multi.getParameter("category");
		String title = multi.getParameter("title");
		String detail = multi.getParameter("detail");
		
		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = new NoticeDTO();
		
		if(images != null) {
			
			// 기존 이미지 다 지우기
			dao.delAllImg(seq);
			
			// 새로 추가된 이미지 추가하기
			dao.editImg(images, seq);
			
		}
		
		dto.setSeq(seq);
		dto.setCategory(category);
		dto.setTitle(title);
		dto.setDetail(detail);
		
		int result = dao.edit(dto);
		
		if ( result == 1 ) {
			resp.sendRedirect("/rural/notice/view.do?seq=" + seq);
		} else {
			resp.sendRedirect("/rural/notice/edit.do?seq=" + seq);
		}

	}

}
