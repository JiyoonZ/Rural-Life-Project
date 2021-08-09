package com.project.rural.exp;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/exp/editok.do")
public class EditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 파일이 저장되는 실제 경로 
		String realPath = req.getServletContext().getRealPath("/assets/img/exp");
		File dir = new File(realPath); 
		// 파일경로 존재하지 않으면 생성
		if (!dir.exists()) { dir.mkdirs(); }
		
		// 파일크기 제한 설정 (15mb)
		int sizeLimit = 15 * 1024 * 1024; 
		
		// MultipartRequest 객체를 생성하면 파일 업로드 수행 
		MultipartRequest multpartRequest = new MultipartRequest(
				req, 
				realPath, 
				sizeLimit, 
				"UTF-8", 
				new DefaultFileRenamePolicy()); 
		// 업로드한 파일명 가져오기 
		String image = multpartRequest.getFilesystemName("image"); 
		//할일
		//1. 데이터 가져오기
		//2. DB작업 > DAO 위임  > insert
		//3. 결과 > 후처리
		System.out.println("수정시선택한이미지:" +image);
//		System.out.println("젭알처음 editok seq:" + multpartRequest.getParameter("seq"));//null
				
			String seq = multpartRequest.getParameter("seq");
			String address = multpartRequest.getParameter("address");
			String town = multpartRequest.getParameter("town");
			String expInfo= multpartRequest.getParameter("expInfo");
			String name = multpartRequest.getParameter("name");
			String startDate = multpartRequest.getParameter("startDate");
			String endDate = multpartRequest.getParameter("endDate");
			String tel = multpartRequest.getParameter("tel");
			String site = multpartRequest.getParameter("site");
			String townDetail = multpartRequest.getParameter("townDetail");
			String detail = multpartRequest.getParameter("detail");
			String totalPerson = multpartRequest.getParameter("totalPerson");
			String origin = multpartRequest.getParameter("origin");
			System.out.println("원래이미지:" + origin);
	//		System.out.println("처음받는 editok seq:" + seq);//null
				
				

				
				//Addok 에서 req로 session 인증티켓에 id 받아오기
				
				
				//2.
				ExpDAO dao = new ExpDAO();
				
				ExpDTO dto = new ExpDTO();
				
				HttpSession session = req.getSession();
				dto.setSeq(seq);
				dto.setId(session.getAttribute("id").toString());
				dto.setAddress(address);
				dto.setTown(town);
				dto.setExpInfo(expInfo);
				dto.setName(name);
				dto.setStartDate(startDate);
				dto.setEndDate(endDate);
				dto.setTel(tel);
				dto.setSite(site);
				dto.setTownDetail(townDetail);
				dto.setDetail(detail);
				dto.setTotalPerson(totalPerson);
				
				//image.equals("원하는문자열") => 안좋은 방법
				//"원하는 문자열".equals(image) => 좋은 방법 
				if (image ==  null) {
					dto.setImage(origin);					
				} else {
					dto.setImage(image);					
				}
				
				
				
				
				//System.out.println("dao 전단계 editok seq:" + seq);//null
				
				//포장한거 전달하기
				int result = dao.edit(dto);
				
				//System.out.println("editok seq:" + seq);//null
		
				if (result==1) {
					resp.sendRedirect("/rural/exp/view.do?seq=" + seq);
				} else {
					resp.sendRedirect("/rural/exp/edit.do?seq=" + seq);
				}


	}
}
