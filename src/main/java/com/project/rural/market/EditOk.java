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


@WebServlet("/market/editok.do")
public class EditOk extends HttpServlet {

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

		MultipartRequest multi = new MultipartRequest(req,realFolder,maxSize,encType,new DefaultFileRenamePolicy());

		String image = multi.getFilesystemName("image");
		Enumeration e = multi.getFileNames();

		while (e.hasMoreElements()) {
			images.add(multi.getFilesystemName(e.nextElement().toString()));
		}


		// 할일
		// 1. 데이터 가져오기
		// 2. DB 작업 > DAO 위임 > update
		// 3. 결과 처리

		// 1.
		String seq = multi.getParameter("seq");
		String marketInfo = multi.getParameter("marketInfo");
		String name = multi.getParameter("name");
		String brandName = multi.getParameter("brandName");
		String tel = multi.getParameter("tel");
		String address = multi.getParameter("address");
		String detail = multi.getParameter("detail");
		String site = multi.getParameter("site");

		// 2.
		MarketDAO dao = new MarketDAO();
		MarketDTO dto = new MarketDTO();

		if (images != null) {

			// 기존 이미지 다 지우기
			dao.delAllImg(seq);

			// 새로 추가된 이미지 추가하기
			dao.editImg(images, seq);

		}

		HttpSession session = req.getSession();

		dto.setSeq(seq);
		dto.setMaketInfo(marketInfo);
		dto.setName(name);
		dto.setBrandName(brandName);
		dto.setTel(tel);
		dto.setAddress(address);
		dto.setDetail(detail);
		dto.setImage(image);
		dto.setSite(site);

		int result = dao.edit(dto);

		// 3.
		if (result == 1) {
			resp.sendRedirect("/rural/market/view.do?seq=" + seq);
		} else {
			resp.sendRedirect("/rural/market/edit.do?seq=" + seq);
		}



	}

}
