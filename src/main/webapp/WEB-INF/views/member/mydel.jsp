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
		margin-left: 50px;
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
				<h3 style="text-align: center; margin-top: 50px;">탈퇴하기 > <small>아이디 / 패스워드 확인</small></h3>
				<form method="POST" action="/rural/member/mydelok.do" id="target">
					<div id="login">
						<!-- 아이디 -->
						<div id="id">
							<span style="margin-left: 10px; margin-right: 20px; font-weight: bold;">아이디</span>
							<img src="https://img.icons8.com/ios-glyphs/30/000000/user-male-circle.png" style="margin-right: 20px;"/>
							<input type="text" name="id" class="form-control" required placeholder="아이디" />
						</div>
						
						<!-- 비밀번호 -->
						<div id="pw">
							<span style="margin-right: 14px; font-weight: bold;">비밀번호</span>
							<img src="https://img.icons8.com/material-rounded/30/000000/password1.png" style="margin-right: 20px;"/>
							<input type="password" name="pw" class="form-control" required placeholder="비밀번호" />
						</div>
					</div>
					<div style="text-align: center; margin-left: 60px; margin-top: 30px;">
					<input type="button" class="genric-btn info circle"  value="돌아가기" style="margin-right: 20px;"
						onclick="history.back();"/>
					<input type="button" class="genric-btn danger circle" value="탈퇴하기" 
						onclick="del()"/>
					</div>
				</form>
				
            </div>
        </div>
	
 	<%@ include file="/inc/init.jsp" %>
	<script>
	
		// 회원 탈퇴 경고 메세지
		function del() {
	        let result = confirm("정말 탈퇴하시겠습니까?");
	        if (result) {
	        	$('#target').submit();
	        } else {
	        	
	    	}
	    }
		
	</script>
</body>
</html>