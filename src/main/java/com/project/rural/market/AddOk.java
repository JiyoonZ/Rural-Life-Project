package com.project.rural.market;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.rural.CheckMember;

@WebServlet("/market/addok.do")
public class AddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CheckMember cm = new CheckMember();
		cm.check(req, resp);

		// 파일 업로드
		String realFolder = "";
		String saveFolder = "/assets/img/market";
		String encType = "UTF-8";
		int maxSize = 5 * 1024 * 1024;

		ServletContext context = this.getServletContext();
		realFolder = context.getRealPath(saveFolder);

		ArrayList<String> images = new ArrayList<String>();


		MultipartRequest multi = new MultipartRequest(req, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

		//String image = multi.getParameter("image");
		String image = multi.getFilesystemName("image");
		Enumeration e = multi.getFileNames(); //***

		while (e.hasMoreElements()) {
			images.add(multi.getFilesystemName(e.nextElement().toString()));
		}
		// 할일
		// 1. 인코딩
		// 2. 데이터 가져오기(제목, 내용, 태그)
		// 3. DB작엄 > DAO위임 > insert
		// 4. 결과 > 후처리

		// 2.
		String marketInfo = multi.getParameter("marketInfo");
		String name = multi.getParameter("name");
		String brandName = multi.getParameter("brandName");
		String tel = multi.getParameter("tel");
		String address = multi.getParameter("address");
		String detail = multi.getParameter("detail");
		String site = multi.getParameter("site");

		// 3.
		MarketDAO dao = new MarketDAO();
		MarketDTO dto = new MarketDTO();

		HttpSession session = req.getSession();

		dto.setId(session.getAttribute("id").toString());
		dto.setMaketInfo(marketInfo);
		dto.setName(name);
		dto.setBrandName(brandName);
		dto.setTel(tel);
		dto.setAddress(address);
		dto.setDetail(detail);
		dto.setImage(image);
		dto.setSite(site);
		dto.setImages(images);

		int result = dao.add(dto);

		if(images != null) {
			dao.addImg(images);
		}

		// 4.성공 or 실패
		if (result == 1) {
			resp.sendRedirect("/rural/market/list.do");
		} else {
			resp.sendRedirect("/rural/market/add.do");
		}

	}

}