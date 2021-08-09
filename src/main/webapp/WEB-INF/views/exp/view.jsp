<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 농촌생활</title>

<%@ include file="/inc/asset.jsp"%>

<style>
.img {
	/* border: 1px solid black; */
	width: auto;
	height: 100%;
}


table>tbody>tr:nth-child(2)>th {
	width: 30%;
	
}

table>tbody>tr:nth-child(2)>td:nth-child(2) {
	width: 50%;
}

.tbl {
	/* padding: 1000px; */
	width: 700px;
	margin-botton: 30px;
}

.detail {
	height: 300px;
	width: 1150px;
	border: 1px solid #DEE2E6;
	padding: 40px;
}

.title {
	margin : 30px 0 30px 20px;
	font-weight: bold;
}

.maintitle {
	margin-top: 10px;
	margin-bottom: 5px;
	font-weight: bold;
	color: #404040;
}

.date {
	color: #b0b0b0;
	text-align: right;
}

.btns {
	margin: 30px;
}


.place-img { width: 600px; height: 400px; overflow: hidden; text-align:center;}
.place-img img {
	object-fit: cover;
	width: auto;
	height: 100%;
    text-aling: center; }
.row table { margin-left: 15px;}
.row table tr:nth-child(n+2) { font-size: 1.2em; }
.row table tr:nth-child(1) {border-bottom: 1px solid black; height: 25%; }
.row table tr:nth-child(1) td {text-align: right;}
.row table tr:nth-child(1) th {font-size: 3em; vertical-align: top;}
input[name="star"]+label {margin-right: 10px;}
#review-list {width: 95%; margin: 0 auto;}
#review-list td:first-child { width:90%; border-right:hidden; padding-left:50px;}
#review-list td:nth-child(2){ text-align: center; border-left:hidden;}
.pagebar {margin: 0px 100px;}
</style>
</head>
<body>

	<!-- 홈화면에서 카테고리 들어갔을 처음 나오는 화면 -->
	<%@ include file="/inc/header.jsp"%>

	<!-- 이미지 카테고리명 -->
	<div class="slider-area ">
		<div class="single-slider slider-height2 d-flex align-items-center"
			data-background="/rural/assets/img/exp/exp.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap">
							<h2>농촌체험</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 구현부 -->
	<div class="section-padding2">
		<div class="container">


			<div class="favourite-place place-padding2">

				<table class="table">
					<tr>
						<th colspan="2"><h1 class="maintitle"> ${dto.town} </h1></th>
						<td class="date">${dto.regDate}</td>
					</tr>
				</table>
				<div class="row justify-content-md-center place-padding2">
					<div class="place-img">
						<c:if test="${not empty dto.image}">		
						<img src="/rural/assets/img/exp/${dto.image}" class="col img">
						</c:if>
						<c:if test="${empty dto.image}">
						<img src="/rural/assets/img/exp/noimage.gif" class="col img">
						</c:if>
					</div>
					<table class="col tbl justify-content-md-center">
						<tr>
							<th colspan="2">${dto.name}</th>
							<td>&#11088;${starAvg}</td>
							
						</tr>
						<tr>
							<th>분류</th>
							<td>${dto.expInfo}>${dto.name}</td>
							<td></td>
						</tr>
						<tr>
							<th>번호</th>
							<td>${dto.tel}</td>
							<td></td>
							
						</tr>
						<tr>
							<th>담당자</th>
							<td>${dto.userName}</td>
							<td></td>
							
						</tr>
						<tr>
							<th>홈페이지</th>
							<td><a href="http://${dto.site}">${dto.site}</a></td>
							<td></td>
						</tr>
						<tr style="text-align:right">
							<td colspan="3">
								<a href="#review-section"><button type="button" class="btn btn-primary btn-lg" style="width:150px;">
								농장후기 보기
								</button></a>
								<c:if test="${not empty lv && lv eq '1' && dto.applyCnt == 0 && dto.applyperson < dto.totalPerson}">
									<button type="button" class="btn btn-success btn-lg" style="width:150px;" onclick="location.href='/rural/exp/apply.do?seq=${dto.seq}&startDate=${startDate}&endDate=${endDate}';">
									신청하기
									</button>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
				<hr>				
				<h3 class="title">마을소개</h3>				
				<div class="row justify-content-md-center place-padding2">
					<div class="detail">${dto.townDetail}</div>			
				</div>
				
				<h3 class="title">프로그램 소개</h3>				
				<div class="row justify-content-md-center place-padding2">
					<div class="detail">${dto.townDetail}</div>
				</div>
				
				<h3 class="title">오시는 길</h3>				
				<div class="row justify-content-md-center place-padding2">
			
					<div class="col row">
							<div class="col" style="text-align:right;">
								<input type="button" id="btn1" value="확대" class="btn btn-secondary align-self-end">
								<input type="button" id="btn2" value="축소" class="btn btn-secondary align-self-end">
							</div>
					</div>
					<div class="detail" id="map" style="width:95%; height:350px;"></div>
					<div class="card row" style="width:95%;">
						<div class="card-body">
	  						<div class="col" >${dto.address}</div>
	  					</div>
  					</div>					
				</div> 
				
				
				<div class="row justify-content-md-center" style="padding: 30px;">
				<c:if test="${dto.id == id}">
					<button type="button" class="btn btn-secondary btns"
						onclick="location.href='/rural/exp/edit.do?seq=${dto.seq}';">수정하기</button>
				
				</c:if>
					
					<c:if test="${dto.id == id || lv.equals('3')}">
						<button type="submit" id="del" class="btn btn-danger btns"
						 onclick="del(${dto.seq})">삭제하기</button>
					</c:if>
				</div>

				<!-- 리뷰 -->
				<div id="review-section">
					<tr>
						<th colspan="2"><h3 class="title">농장후기</h3></th>
					</tr>
					<c:if test="${lv.equals('1')}">
						<!-- 일반회원 > 주말농장 신청등록 완료된 사람만 리뷰 가능하도록 -->
						<form method="POST" action="/rural/exp/addreviewok.do">
							<table class="table table-bordered">
								<tr>
									<td>
										<textarea name="detail" class="form-control" placeholder="리뷰를 작성하세요." maxlength="1000" style="resize:none; width:80%; height:100px;" required></textarea>
									</td>
								</tr>
								<tr class="text-right">
									<td>
										<input type="radio" name="star" value="1" id="1"><label for="1">&#11088;</label> 
										<input type="radio" name="star" value="2" id="2"><label for="2">&#11088;&#11088;</label> 
										<input type="radio" name="star" value="3" id="3" checked="checked"><label for="3">&#11088;&#11088;&#11088;</label>
										<input type="radio" name="star" value="4" id="4"><label for="4">&#11088;&#11088;&#11088;&#11088;</label>
										<input type="radio" name="star" value="5" id="5"><label for="5">&#11088;&#11088;&#11088;&#11088;&#11088;</label>
										<input type="submit" value="리뷰쓰기" class="btn btn-success">
									</td>
								</tr>
							</table>
							<input type="hidden" name="pseq" value="${dto.seq}">
						</form>
					</c:if>
	
					<table id="review-list" class="table table-bordered align-self-center">
						<thead class="thead-light text-center">
						<tr>
							<th colspan="2">리뷰 총 ${rlist.size()}건의 리뷰가 있습니다.</th>
							
						</tr>
						</thead>
						<tbody>
							<c:if test="${rlist.size() == 0}">
							<tr>
								<td colspan="2">리뷰가 없습니다.</td>
							</tr>
							</c:if>
							
							<c:forEach items="${rlist}" var="rdto">
							<tr>
								<td class="text-left">
									<div style="width:80%;">${rdto.detail}</div>
									<div class="text-right">
									<small>[아이디: ${rdto.id}] /작성날짜:${rdto.regDate}</small><span>&#11088;(별점${rdto.star}개)</span> 
									</div>
								</td>
								<td>
										<c:if test="${rdto.id == id || lv.equals('3')}">
										<form method="POST" action="/rural/exp/reviewdelok.do">
											<input type="submit" class="btn btn-danger btn-delRev" value="삭제">
											<input type="hidden" name="seq" value="${rdto.seq}">
											<input type="hidden" name="pseq" value="${rdto.pseq}">
										</form>
										</c:if>
									
								</td>
							</tr>
							</c:forEach>
							</tbody>
					</table>
					
					<div class="pagebar">
						${pagebar}
					</div>
					
				</div>
			</div>




			</div>
		</div>


	

	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d33bd5d491998a8a2da5ebbc26edd44&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		//지도 드래그 유무
		map.setDraggable(false);
		//지도 확대/축소 유무
		map.setZoomable(false);
		
		//지도 확대/축소 제어하기
		$('#btn1').click(function() {
		
			//확대 : ZoomIn
			//map.setLevel(1);
			map.setLevel(map.getLevel() -1);
		
			
		});
		$('#btn2').click(function() {
		
			//축소 : ZoomOut
			//map.setLevel(14);
			map.setLevel(map.getLevel() +1);
			
		});
		
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${dto.map}', function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.town}</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		
		 function del(seq) {
		        let result = confirm("정말 삭제하시겠습니까?");
		        if (result) {
		        	
		           location.href = "/rural/exp/delok.do?seq="+ seq;
		        } else {
		           
		       }
		    }
	</script>
</body>
</html>