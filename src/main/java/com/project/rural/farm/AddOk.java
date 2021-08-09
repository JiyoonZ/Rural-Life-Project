package com.project.rural.farm;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.rural.CheckMember;

@WebServlet("/farm/addok.do")
public class AddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);
		
		String path = req.getSession().getServletContext().getRealPath("/assets/img/farm");
		
		int size = 1024 * 1024 * 100; //100MB

		String name = "";
		String area = "";
		String price = "";
		String tel = "";
		String address = "";
		String detail = "";
		String image = "";
		
		try {

			MultipartRequest multi = new MultipartRequest(
										req,
										path,
										size,
										"UTF-8",
										new DefaultFileRenamePolicy()
									);
		
			name = multi.getParameter("name");
			area = multi.getParameter("area");
			price = multi.getParameter("price");
			tel = multi.getParameter("tel");
			address = multi.getParameter("address");
			detail = multi.getParameter("detail");
			
			image = multi.getFilesystemName("image");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		FarmDAO dao = new FarmDAO();
		FarmDTO dto = new FarmDTO();
		
		HttpSession session = req.getSession();
		
		dto.setId(session.getAttribute("id").toString());
		dto.setName(name);
		dto.setArea(area);
		dto.setPrice(price);
		dto.setTel(tel);
		dto.setAddress(address);
		dto.setDetail(detail);
		dto.setImage(image);
	
		int result = dao.add(dto);
		
		if (result == 1) {
			resp.sendRedirect("/rural/farm/list.do");
		} else {
			resp.sendRedirect("/rural/farm/add.do");
		}
		
	}
	
}
