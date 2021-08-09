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

	#step {
		text-align: center;
		margin-bottom: 50px;
	}
	
	#step span:nth-child(1) {
		background-color: #4DCC81;
	}
	
	#step span:nth-child(1),
	#step span:nth-child(2),
 	#step span:nth-child(3),
 	#step span:nth-child(4),
 	#step span:nth-child(5) {
		border: 1px solid #CCC;
		border-radius: 50px;
		font-size: 2.5em;
		font-weight: bold;
		display: inline-block;
		width: 150px;
		margin-right: 30px;
	}

	#intro {
		text-align: center;
	}
	
	#cross {
		text-align: center;
		margin-top: 30px;
	}
	
	#cross .user {
		display: inline-block;
		width: 300px;
		height: 400px;
		margin-right: 30px;
	}
	
	#cross .user img {
		border-radius: 50%;
		width: 200px;
		height: 200px;
		margin-top: 60px;
	}
	
	#cross .farmer {
		display: inline-block;
		width: 300px;
		height: 400px;
	}
	
	#cross .farmer img {
		border-radius: 50%;
		width: 200px;
		height: 200px;
		margin-top: 60px;
	}
	
</style>
</head>
<body>

	<!-- 홈화면에서 카테고리 들어갔을 처음 나오는 화면 -->
	<%@ include file="/inc/header.jsp" %>
	
       <!-- 이미지 카테고리명 -->
        <div class="slider-area ">
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="/rural/assets/img/hero/oranges.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap">
                                <h2>회원가입</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
		<!-- 구현부 -->
        <div class="section-padding2">
            <div class="container">
                
                <!-- step1,2,3 표시 -->
                <div id="step">
                	<span>STEP1</span>
                	<span style="border-bottom: 2px solid black; width: 100px; margin-bottom: 10px;"></span>
                	<span>SETP2</span>
                	<span style="border-bottom: 2px solid black; width: 100px; margin-bottom: 10px;"></span>
                	<span>SETP3</span>
                </div>
                
                <!-- 인트로 소개 -->
                <div id="intro">
	                <h2>슬기로운 농촌생활</h2>
	                <h2><span style="color: #4DCC81">통합 회원가입</span>을 환영합니다</h2>
                </div>
                
                <!-- 일반 사용자, 농업인 선택 -->
                <div id="cross">
                	<span class="user">
                		<img src="/rural/assets/img/logo/user.png" /> 
                		<span style="display:block; font-size:1.2em; font-weight: bold; margin-top:10px; margin-bottom:10px;">일반 회원</span>
                		<input type="button" name="lv" value="선택하기" class="genric-btn info circle" 
                			onclick="location.href='/rural/member/signup.do?step=2&lv=1';"/>
                	</span>
               	
                	<span class="farmer">
                		<img src="/rural/assets/img/logo/farmer.png" />
                		<span style="display:block; font-size:1.2em; font-weight: bold; margin-top:10px; margin-bottom:10px;">농업인 회원</span>
                		<input type="button" name="lv" value="선택하기" class="genric-btn info circle" 
                			onclick="location.href='/rural/member/signup.do?step=2&lv=2';"/>
                	</span>
                </div>

            </div>
        </div>
	
 	<%@ include file="/inc/footer.jsp" %>
 	<%@ include file="/inc/init.jsp" %>
	<script>
	
	</script>
</body>
</html>