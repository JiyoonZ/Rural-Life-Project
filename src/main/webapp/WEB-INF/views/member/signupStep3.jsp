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
	
	#step span:nth-child(5) {
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
	
	#end {
		text-align: center;
	}
	
	#end img {
		border-radius: 50%;
		width: 300px;
		height: 300px;
		margin-top: 30px;
		margin-bottom: 30px;
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
                
                <!-- 가입완료 멘트 -->
                <div id="end">
                	<!-- 일반인 -->
                	<c:if test="${ lv == 1 }">
                		<img src="/rural/assets/img/logo/user.png" />
                	</c:if>
                	<!-- 농업인 -->
                	<c:if test="${ lv == 2 }">
                		<img src="/rural/assets/img/logo/farmer.png" />
                	</c:if>
                	
	                <h2 style="margin-bottom: 30px;">슬기로운 농촌생활 회원가입이 완료되었습니다.</h2>
	                <div style="font-size:1.2em; margin-bottom: 30px;">회원이 되신걸 환영합니다. 로그인 후 서비스를 이용해주세요.</div>
	                <input type="button" value="로그인 페이지로 이동" class="genric-btn info circle" 
                			onclick="location.href='/rural/member/login.do';"/>
                </div>
                

            </div>
        </div>
	
 	<%@ include file="/inc/footer.jsp" %>
 	<%@ include file="/inc/init.jsp" %>
	<script>
	
	</script>
</body>
</html>