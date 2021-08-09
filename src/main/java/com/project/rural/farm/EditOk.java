package com.project.rural.farm;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.rural.CheckMember;

@WebServlet("/farm/editok.do")
public class EditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		String path = req.getSession().getServletContext().getRealPath("/assets/img/farm");
		
		int size = 1024 * 1024 * 100; //100MB

		String seq = "";
		String name = "";
		String area = "";
		String price = "";
		String tel = "";
		String address = "";
		String detail = "";
		String image = "";
		String isEnd = "";
		String orgImage = "";
		
		try {

			MultipartRequest multi = new MultipartRequest(
										req,
										path,
										size,
										"UTF-8",
										new DefaultFileRenamePolicy()
									);
		
			seq = multi.getParameter("seq");
			name = multi.getParameter("name");
			area = multi.getParameter("area");
			price = multi.getParameter("price");
			tel = multi.getParameter("tel");
			address = multi.getParameter("address");
			detail = multi.getParameter("detail");
			orgImage = multi.getParameter("orgImage");
			
			if ((image = multi.getFilesystemName("image")) == null) { 
				//이미지 첨부 X 
				//경우 기존 이미지 경로 대입
				image = orgImage;
			} else {
				//이미지 수정 O
				if (orgImage != null && !orgImage.equals("")) {	//기존 이미지 있던 경우 해당 파일 삭제
					String filePath = req.getSession().getServletContext().getRealPath("/assets/img/farm/") + orgImage;
					System.out.println(filePath);
					File file = new File(filePath);
					if (file.exists()) {
						file.delete();
					}
				}
			}
			isEnd = multi.getParameter("isEnd") == null ? "n" : "y";
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//-------------------------------------
		
		//dto에 데이터 담기
		
		FarmDAO dao = new FarmDAO();
		FarmDTO dto = new FarmDTO();
		
		dto.setSeq(seq);
		dto.setName(name);
		dto.setArea(area);
		dto.setPrice(price);
		dto.setTel(tel);
		dto.setAddress(address);
		dto.setDetail(detail);
		dto.setImage(image);
		dto.setIsEnd(isEnd);
		
		int result = dao.edit(dto);
		
		if (result == 1) {
			resp.sendRedirect("/rural/farm/view.do?seq=" + seq);
		} else {
			//파일 업로드가 된 상태에서 DB에 insert 실패한 경우 -> 파일 삭제해줘야함...
			resp.sendRedirect("/rural/farm/edit.do?seq=" + seq);
		}
		
	}
	
}
