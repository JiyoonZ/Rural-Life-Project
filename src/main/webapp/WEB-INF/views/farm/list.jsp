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
#apply, #registList {
	margin-left: 88%;
	position: relative;
	top: 70px;
}

#regist {
	margin-left: 92%;
	margin-bottom: 20px;
}

#region {
	width: 55%;
}

.form-row .form-group {
	margin-bottom: 0px;
	width: 95%;
}

table tr th {
	width: 10%;
	text-align: center;
	background-color: #F5F5F5;
}

.container .table td, .container .table th {
	vertical-align: middle;
}

#sido, #gugun {
	margin-left: 8px;
}

h3 {
	clear: both;
	display: inline;
}

.detailopen {
	/* background-color: red; */
	text-align: right;
	cursor: pointer;
}


label{
	margin-right: 72%;
}

.place-img { width: 100%; height: 300px; overflow: hidden; border: 1px solid #f0f1f2; text-align:center;}


.favourite-place .single-place .place-img img {
	object-fit: cover;
	width: auto;
	height: 100%;
    text-aling: center; 
    -webkit-transform: scale 1;
    -moz-transform: scale 1;
    -ms-transform: scale 1;
    -o-transform: scale 1;
    transform: scale 1;
    transition: all 0.5s ease-out 0s;
}
table tr th {
	width: 10%;
	text-align: center;
	background-color: #F5F5F5;
}

table tr td {
	text-align: center;
}

table tr td:nth-child(2) {
	width: 55%;
}

#btns {
	text-align: justify;
	border: 1px solid red;
}

.sel-area {
	width: 200px;
	display: inline-block;	
}
.sel-column {
	width: 100px;
	display: inline-block;
}
#area {
	width: 80%; 
	display: inline-block;
}
#search { 
	width: 470px;
	display: inline-block;
}
#price {
	width: 70%; 
	display: inline-block;
}

.img {
	cursor: pointer;
}

.place-cap-top {
	display: flex;
	justify-content: space-between;
}

.place-img {
  position: relative;
  text-align: center;
}
.top-left {
  position: absolute;
  color: red;
  background-color: white;
  font-weight: bold;
  top: 8px;
  left: 16px;
}
</style>
</head>
<body>

	<!-- 홈화면에서 카테고리 들어갔을 처음 나오는 화면 -->
	<%@ include file="/inc/header.jsp" %>
	
    <!-- 이미지 카테고리명 -->
	<div class="slider-area ">
		<div class="single-slider slider-height2 d-flex align-items-center"
			data-background="/rural/assets/img/farm.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap">
							<h2>주말농장</h2>
							<c:if test="${lv.equals('1')}">
								<button type="button" class="btn btn-dark" id="apply"
									onclick="location.href='/rural/farm/applylist.do';">신청내역보기</button>
							</c:if>
							<c:if test="${lv.equals('2')}">
								<button type="button" class="btn btn-dark" id="registList"
									onclick="location.href='/rural/farm/addlist.do';">등록내역보기</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 구현부 -->
	<div class="favourite-place section-padding2">
		<div class="container">

			<!-- 검색도구 Start -->
			<form method="GET" action="/rural/farm/list.do">
				<table class="table table-bordered">
					<tr>
						<th>지역검색</th>
						<td colspan="3">
							<span>시/도</span> 
							<select name="sido" id="sido" class="form-control sel-area"></select>
							<span style="padding-left: 30px;">시/군/구</span>
							<select name="gugun" id="gugun" class="form-control sel-area"></select>
						</td>
						<th>면적</th>
						<td>
							<input type="number" name="area" id="area" class="form-control"
								placeholder="평수를 입력하세요.">&nbsp;&nbsp;평
						</td>
					</tr>
					<tr>
						<th>검색어</th>
						<td colspan="3">
							<select name="column" id="column" class="form-control sel-column">
								<option value="all">전체</option>
								<option value="name">농장명</option>
								<option value="detail">내용</option>
							</select>
							<input type="text" name="search" id="search" class="form-control col-lg-13"
								placeholder="검색어를 입력하세요.">
						</td>
						<th>가격</th>
						<td>
							<input type="number" name="price" id="price" class="form-control"
								placeholder="가격을 입력하세요.">&nbsp;&nbsp;원 이하
						</td>
					</tr>
				</table>
				
				<div class="row justify-content-md-center" style="margin-bottom: 30px;">
				<input class="btn btn-primary col-sm-2" type="submit" value="검색하기">
			</div>
			</form>
			<!-- 검색도구 End -->
			
			<c:if test="${lv.equals('2')}">
				<button type="button" class="btn btn-dark" id="regist"
					onclick="location.href='/rural/farm/add.do';">등록하기</button>
			</c:if>
			
			<c:if test="${map.isSearch == 'y'}">
				<span class="text-right font-italic">총 ${totalCount}개의 게시물</span>
			</c:if>
						
			<hr style="margin-top: 10px;">
			
			
			<!-- 목록 Start -->
			<div class="row">
				<c:forEach items="${list}" var="dto">
					<div class="col-xl-4 col-lg-4 col-md-6">
						<div class="single-place mb-30">
						
							<c:if test="${not empty dto.image}">					
								<div class="place-img">
									<img src="/rural/assets/img/farm/${dto.image}" alt="ThumbnailImage"
										onclick="location.href='/rural/farm/view.do?seq=${dto.seq}';" class="img">
									<c:if test="${dto.isEnd.equals('y')}">
										<div class="top-left">마 감</div>
									</c:if>
								</div>
							</c:if>
							<c:if test="${empty dto.image}">					
								<div class="place-img">
									<img src="/rural/assets/img/no.png" alt="ThumbnailImage"
										onclick="location.href='/rural/farm/view.do?seq=${dto.seq}';" class="img">
								</div>
							</c:if>
							
							<div class="place-cap">
								<div class="place-cap-top">
									<h3>
										<a href="/rural/farm/view.do?seq=${dto.seq}">${dto.name}</a>
									</h3>
									<span>&#11088;${dto.avgStar}(${dto.reviewCount})</span>
								</div>
								
								<div class="place-cap-bottom">
									<ul>
										<li>잔여/총면적</li>
										<li>${dto.extraArea}/${dto.area}</li>
									</ul>
									<ul>
										<li>가격</li> 
										<li>${dto.price}</li>
									</ul>
									<ul>
										<li>전화번호</li>
										<li>${dto.tel}</li>
									</ul>
									<ul>
										<li><i class="fas fa-map-marker-alt"></i>${dto.address}</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 목록 End -->
			
			<c:if test="${totalCount == 0}">
				<blockquote class="blockquote text-center">
					<p class="mb-0">게시물이 없습니다.</p>
				</blockquote>
			</c:if>
			
			<div class="pagebar">
				${pagebar}
			</div>
			
		</div>
	</div>

	<%@ include file="/inc/footer.jsp" %>
 	<%@ include file="/inc/init.jsp" %>
 	<%@ include file="/inc/address.jsp" %>
	
	<script>
	
		//지역 선택 Select Box
		$('document').ready(function() {
			
		 	// 시/도 선택 박스 초기화
		 	$("#sido").append("<option value=''>전체</option>");
			sido.forEach(function(item) {				
				$("#sido").append("<option value='" + item + "'>" + item + "</option>");
			});
		 	
		 	// 구/군 선택 박스 초기화
			$("#gugun").append("<option value=''>전체</option>");
		 	
			// 시/도 선택시 구/군 설정
			$("#sido").change(function() {
			 	$("#gugun").children("option").remove(); // 구군 초기화
			 	$("#gugun").append("<option value=''>전체</option>");
			 	for (var i=0; i<sido.length; i++) {
					if (this.value == sido[i]) {
						gugun[i].forEach(function(item) {
							$("#gugun").append("<option value='" + item + "'>" + item + "</option>");						
						});
						break;
					}
				}
			});
			
			<c:if test="${map.isSearch == 'y' && !map.sido.equals('')}">
				$('#sido').val('${map.sido}');
				for (var i=0; i<sido.length; i++) {
					if (sido[i] == '${map.sido}') {
						gugun[i].forEach(function(item) {
							$("#gugun").append("<option value='" + item + "'>" + item + "</option>");						
						});
						break;
					}
				}
				$('#gugun').val('${map.gugun}');
			</c:if>
			
		});
		
		<c:if test="${map.isSearch == 'y'}">
			$('#area').val('${map.area}');
			$('#price').val('${map.price}');
			$('#column').val('${map.column}');
			$('#search').val('${map.search}');
		</c:if>
		
	</script>
</body>
</html>