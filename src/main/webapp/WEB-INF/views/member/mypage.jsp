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
	h4 { color: white;}
	#myimg div:first-child {
	  font-size: 100px; margin-bottom:0px;
	}
	.welcome {text-align: left; padding-left:20px;}
	.welcome>div:first-child { font-size: 1.7em; font-weight:bold; margin-bottom: 100px; }
	.welcome>div:nth-child(n+2) {font-size: 1.1em; font-weight:normal;}
	.btns>div:first-child { margin-top: 90px; }
	
	table {
		background-color: #F1F1F1;
		margin: 10px;
		width:100%;
		height:300px;
		border: 1px solid #F1F1F1;
	    border-collapse: separate; 
	    border-radius: 10px;
	}
	.container .my tr:nth-child(2) { height:70%; background-color: white;}
	.container .my tr:first-child { font-size:1.2em; font-weight:bold;}
	.btns {text-align: right;}
	.btns input {text-align: right; margin-bottom: 15px;}
	
	#second td {
		width: 50%;
	}

</style>
</head>
<body>

	<!-- 홈화면에서 카테고리 들어갔을 처음 나오는 화면 -->
	<%@ include file="/inc/header.jsp" %>
	
       <!-- 이미지 카테고리명 -->
        <div class="slider-area ">
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="/rural/assets/img/logo/mypage.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap">
                                <h2>마이페이지</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<!-- 구현부 -->
        <div class="section-padding2">
            <div class="container">

            
            	<div class="row my" id="profile">
				  <div class="col-sm-2  text-center" id="myimg">
					<c:if test="${lv == 2}">
					<img src="/rural/assets/img/logo/farmer.png" style="width: 150px; border-radius: 60%;"/>
					</c:if>
					<c:if test="${lv == 1}">
					<img src="/rural/assets/img/logo/user.png" style="width: 150px; border-radius: 60%; "/>
					</c:if>
					<div>
						<input type="button" value="로그아웃" class="btn btn-primary" style="margin-top: 20px;"
							onclick="location.href='/rural/member/logout.do';">
					</div>	
				  </div>
				  <div class="col-sm-6 welcome ">
				  		<div>${name}(${id})님, 반갑습니다!</div>
						<c:if test="${ lv == 2 }">
				  			<div style="margin-top: 100px;">농업인 회원</div>
				  		</c:if>
						<c:if test="${ lv == 1 }">
				  			<div>일반 회원</div>
				  		</c:if>
				  		<div>가입날짜: ${regDate}</div>
				  </div>
				  <div class="btns col-sm-4">
				  	<div><input type="button" value="탈퇴하기" class="btn btn-secondary"
				  		onclick="location.href='/rural/member/mydel.do';"></div>
				  	<div><input type="button" value="내 정보 수정" class="btn btn-success"
				  		onclick="location.href='/rural/member/myedit.do?id=${ id }';"></div>
				  </div>
				</div>
				<hr>
				<div class="text-right text font-weight-bold">활동내역</div>
				  <table class="my text-center" id="first">
				  	<tr>
				  		<td>일손돕기</td>
				  		<td>농촌체험</td>
				  		<td>주말농장</td>
				  	</tr>
				  	<tr style="font-size:1.2em; font-weight: bold; color:red;">
				  		<td>(12) </td>
				  		<td>(20)</td>
				  		<td>(7)</td>
				  	</tr>
				  	<tr>
				  		<c:if test="${lv.equals('1')}">
				  		<td>신청내역<span style='font-size:20px;'>&#9654;</span></td>
				  		<td>신청내역<span style='font-size:20px;'>&#9654;</span></td>
				  		<td>신청내역<span style='font-size:20px;'>&#9654;</span></td>
				  		</c:if>
				  		<c:if test="${lv.equals('2')}">
				  		<td>등록내역<span style='font-size:20px;'>&#9654;</span></td>
				  		<td>등록내역<span style='font-size:20px;'>&#9654;</span></td>
				  		<td>등록내역<span style='font-size:20px;'>&#9654;</span></td>
				  		</c:if>
				  	</tr>
				  </table>
				<table class="my text-center" id="second">
				  	<tr>
				  		<td>농작물 직거래</td>
				  		<td>커뮤니티</td>
				  	</tr>
				  	<tr style="font-size:1.2em; font-weight: bold; color:red;">
				  		<td>(42)</td>
				  		<td>(124)</td>
				  		
				  	</tr>
				  	<tr>
				 		<c:if test="${lv.equals('1')}">
				  		<td>신청내역<span style='font-size:20px;'>&#9654;</span></td>
				  		<td>신청내역<span style='font-size:20px;'>&#9654;</span></td>
				  		</c:if>
				  		<c:if test="${lv.equals('2')}">
				  		<td>등록내역<span style='font-size:20px;'>&#9654;</span></td>
				  		<td>등록내역<span style='font-size:20px;'>&#9654;</span></td>
				  		</c:if>				  		
				  	</tr>
				  </table>
        		
            </div>
            
            

        </div>
	
 	<%@ include file="/inc/footer.jsp" %>
 	<%@ include file="/inc/init.jsp" %>
	
	<script>
	
	</script>
</body>
</html>