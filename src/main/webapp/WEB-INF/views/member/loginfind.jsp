<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 농촌생활</title>

<%@ include file="/inc/asset.jsp" %>

<style>
	
	#idfind {
		width: 700px;
		margin: 0 auto;
	}
	
	#pwfind {
		width: 700px;
		margin: 0 auto;
		margin-top: 50px;
	}
	
	#idfind input[type=text], 
	#pwfind input[type=text] {
		width: 150px;
		display: inline-block;
	}
	
	
	#pagefooter {
		margin-top: 50px;
		text-align: center;
	}
	
	

</style>
</head>
<body>

       	<!-- 이미지 카테고리명 -->
        
		<!-- 구현부 -->
        <div class="section-padding2">
            <div class="container">
            
            	<!-- start -->
				<div class="logo" style="text-align: center; margin-top: 100px;">
                        <a href="/rural/index.do"><img src="<%= request.getContextPath() %>/assets/img/logo/logo4.png"></a>
                </div>
				
				<!-- 아이디 찾기 -->
				<form method="POST" action="/rural/member/findidok.do">
					<div id="idfind">
						<h3 style="display:inline-block;">아이디 찾기</h3>
						<img src="https://img.icons8.com/ios-glyphs/50/000000/user-male-circle.png" style="margin-left: 20px; margin-bottom: 10px;"/>						
						<div style="border: 1px solid #AAA; padding: 30px; ">
							<div style="margin-bottom: 20px;">
								<span style="margin-left: 16px; margin-right: 20px; font-weight: bold;">이름</span>
								<input type="text" name="name" class="form-control" required placeholder="이름"/>
							</div>

							<div style="margin-bottom: 30px;">
								<span style="margin-right: 20px; font-weight: bold;">이메일</span>
		                        <input type="text" name="email1" id="email1" class="form-control" maxlength="25" required> @ 
		                        <input type="text" name="email2" id="email2" class="form-control" maxlength="25" required>
		                        <select id="domain1" class="form-control" style="width: 150px; display:inline-block;">
		                           <option value="">--직접 입력--</option>
		                           <option value="naver.com">naver.com</option>
		                           <option value="google.com">google.com</option>
		                           <option value="daum.net">daum.net</option>
		                           <option value="hanmail.net">hanmail.net</option>
		                           <option value="nate.com">nate.com</option>
		                           <option value="yahoo.co.kr">yahoo.co.kr</option>
                        		</select>							
                        	</div>
							
							<input type="submit" value="아이디 찾기" class="genric-btn info circle" style="display:block; margin: 0 auto;;" />
						</div>
					</div>
				</form>
				
				<!-- 비밀번호 찾기 -->
				<form method="POST" action="/rural/member/findpwok.do">
					<div id="pwfind">
						<h3 style="display:inline-block;">비밀번호 찾기</h3>
						<img src="https://img.icons8.com/material-rounded/50/000000/password1.png" style="margin-left: 20px; margin-bottom: 10px;"/>						
						<div style="border: 1px solid #AAA; padding: 30px; ">
							<div style="margin-bottom: 20px;">
								<span style="margin-left: 16px; margin-right: 20px; font-weight: bold;">이름</span>
								<input type="text" name="name" class="form-control" required placeholder="이름"/>
							</div>
							
							<div style="margin-bottom: 20px;">
								<span style="margin-right: 20px; font-weight: bold;">아이디</span>
								<input type="text" name="id" class="form-control" required placeholder="아이디"/>
							</div>

							<div style="margin-bottom: 30px;">
								<span style="margin-right: 20px; font-weight: bold;">이메일</span>
		                        <input type="text" name="email3" id="email3" class="form-control" maxlength="25" required> @ 
		                        <input type="text" name="email4" id="email4" class="form-control" maxlength="25" required>
		                        <select id="domain2" class="form-control" style="width: 150px; display:inline-block;">
		                           <option value="">--직접 입력--</option>
		                           <option value="naver.com">naver.com</option>
		                           <option value="google.com">google.com</option>
		                           <option value="daum.net">daum.net</option>
		                           <option value="hanmail.net">hanmail.net</option>
		                           <option value="nate.com">nate.com</option>
		                           <option value="yahoo.co.kr">yahoo.co.kr</option>
                        		</select>
							</div>
							
							<input type="submit" value="비밀번호 찾기" class="genric-btn info circle" style="display:block; margin: 0 auto;;" />
						</div>
					</div>
				</form>
				
				<!-- end -->
				<div id="pagefooter">
					<button type="button" class="genric-btn primary circle"
							onclick="location.href='/rural/member/login.do';">로그인 페이지 이동</button>
				</div>

            </div>
        </div>
	
 	<%@ include file="/inc/init.jsp" %>
	<script>
	
		// 이메일 도메인 idfind
	    $("#domain1").change(function() {
			if ($(this).val() == "") {
			   $("#email2").val("");
			   $("#email2").prop("readonly", false);
			} else {
			   $("#email2").val($(this).val());
			   $("#email2").prop("readonly", true);
			}
	    });
		
		// 이메일 도메인 pwfind
	    $("#domain2").change(function() {
			if ($(this).val() == "") {
			   $("#email4").val("");
			   $("#email4").prop("readonly", false);
			} else {
			   $("#email4").val($(this).val());
			   $("#email4").prop("readonly", true);
			}
	    });
	
	</script>
</body>
</html>