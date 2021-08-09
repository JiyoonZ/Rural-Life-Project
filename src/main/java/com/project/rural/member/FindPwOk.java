package com.project.rural.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/findpwok.do")
public class FindPwOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Random rnd = new Random();
		
		String name = req.getParameter("name");
		String id = req.getParameter("id");
		String email = req.getParameter("email3") + "@" + req.getParameter("email4") ;
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		// 받아온 name, id, eamil DTO에 값 추가
		dto.setName(name);
		dto.setId(id);
		dto.setEmail(email);

		// 사용자 패스워드 찾기
		MemberDTO result = dao.pwFind(dto);
		
		
		if (result != null) {
			
			// 찾은 사용자 이름, 패스워드
			String u_name = result.getName();
			
			// 비밀번호 초기화(랜덤 난수)
			int u_pw = rnd.nextInt(9999) + 5555;
			
			// 초기화된 비밀번호 DB 작업
			dao.pwClear(id, u_pw);
			
			String user = "rladudgur951128@gmail.com";
			String password = "kyh951128!!";
			
			Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com"); 
	        prop.put("mail.smtp.port", 465); 
	        prop.put("mail.smtp.auth", "true"); 
	        prop.put("mail.smtp.ssl.enable", "true"); 
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

	        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user, password);
	            }
	        });

	        try {
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(user));

	            //수신자메일주소
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 

	            // Subject
	            message.setSubject("안녕하세요. 슬기로운 농촌생활 입니다 ^^.");

	            // Text
	            message.setText(u_name + "님의 초기화된 비밀번호는  '" + u_pw + "'입니다.");    

	            // send the message
	            Transport.send(message);
	            System.out.println("message sent successfully...");
	        } catch (Exception e) {
	            e.printStackTrace();
	        } 
	        
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();			
			
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='UTF-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('입력하신 이메일 주소 '" + email + "' 으로 보냈습니다. 확인하시고 로그인 바랍니다.');");
			writer.print("location.href='/rural/member/login.do';");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			
			writer.close();

	        
		} else {
			
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();			
			
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='UTF-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('입력된 정보가 잘못되었습니다. 다시 입력해주세요.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			
			writer.close();

		}
	}
}


