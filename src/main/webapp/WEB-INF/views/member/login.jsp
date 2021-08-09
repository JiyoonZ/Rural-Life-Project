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
	
	#login {
		margin-top: 50px;
		margin-left: 350px;
	}
	
	#login input[type=text], 
	#login input[type=password] {
		display:inline-block; 
		width: 200px;
		margin-bottom: 20px;
	}
	
	#id, #pw {
		width: 600px;
	}	
	
	#pw a:hover {
		text-decoration: underline;
	}
	
	#signup {
		margin-top: 30px;
		text-align: center;
	}
	
	#signup div {
		font-size: 1.2em;
		font-weight: bold;
		margin-bottom: 20px;
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
				
				<form method="POST" action="/rural/member/loginok.do">
					<div id="login">
						<!-- 아이디 -->
						<div id="id">
							<span style="margin-left: 10px; margin-right: 20px; font-weight: bold;">아이디</span>
							<img src="https://img.icons8.com/ios-glyphs/30/000000/user-male-circle.png" style="margin-right: 20px;"/>
							<input type="text" name="id" class="form-control" required placeholder="아이디" />
							<input type="submit" class="genric-btn info circle" value="로그인" style="margin-left: 20px;"/>
						</div>
						
						<!-- 비밀번호 -->
						<div id="pw">
							<span style="margin-right: 14px; font-weight: bold;">비밀번호</span>
							<img src="https://img.icons8.com/material-rounded/30/000000/password1.png" style="margin-right: 20px;"/>
							<input type="password" name="pw" class="form-control" required placeholder="비밀번호" />
							<a href="/rural/member/loginfind.do" style="color: #aaa; margin-left: 20px;">아이디/비밀번호 찾기</a>
						</div>
					</div>
				</form>
				
				<!-- end -->
				<div id="signup">
					<div>아직 회원이 아니신가요?</div>
					<button type="button" class="genric-btn info circle"
							onclick="location.href='/rural/member/signup.do';">회원가입 페이지 이동</button>
				</div>

            </div>
        </div>
	
 	<%@ include file="/inc/init.jsp" %>
	<script>
	
	</script>
</body>
</html>