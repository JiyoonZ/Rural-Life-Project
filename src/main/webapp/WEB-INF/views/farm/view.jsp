<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	width: 20%;
	
}

table>tbody>tr:nth-child(2)>td:nth-child(2) {
	width: 30%;
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
	overflow: auto;
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

.avgstar {
	font-size: 15pt;
	font-weight: bold;
}
#div-apply { text-align: right; }
#div-apply select { display: inline-block; }
#div-apply input { display: inline-block; }
#sel-area {
	width: 7%;
	text-align: right;
}
#sel-price { 
	width: 10%;
	text-align: right;
}
span.tab {
	padding-right: 4%;
}
.isEnd {
	color: red;
	font-weight: bold;
	padding-right: 30px;
}
</style>
</head>
<body>

	<!-- 홈화면에서 카테고리 들어갔을 처음 나오는 화면 -->
	<%@ include file="/inc/header.jsp"%>

	<!-- 이미지 카테고리명 -->
	<div class="slider-area ">
		<div class="single-slider slider-height2 d-flex align-items-center"
			data-background="/rural/assets/img/farm.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap">
							<h2>주말농장</h2>
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
						<td class="date">
							<c:if test="${dto.isEnd.equals('y')}">
								<span class="isEnd">마감</span>
							</c:if>
							${dto.regDate}
						</td>
					</tr>
				</table>
				
				<div class="row justify-content-md-center place-padding2">
					<div class="place-img">
						<c:if test="${not empty dto.image}">		
							<img src="/rural/assets/img/farm/${dto.image}" class="col img">
						</c:if>
						<c:if test="${empty dto.image}">
							<img src="/rural/assets/img/no.png" class="col img">
						</c:if>
					</div>
				
					<table class="col tbl justify-content-md-center">
						<tr>
							<th colspan="2">${dto.name}</th>
							<td><span class="avgstar">&#11088; ${dto.avgStar} (${dto.reviewCount})</span></td>
						</tr>
						<tr>
							<th>총면적</th>
							<td>${dto.area} 평</td>
							<th>잔여면적</th>
							<td>${dto.extraArea} 평</td>
						</tr>
						<tr>
							<th>분양가격</th>
							<td>${dto.price} (원/5평)</td>
							<th>농장주</th>
							<td>${dto.ownerName}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td colspan="3">${dto.tel}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td colspan="3">${dto.address}</td>
						</tr>
						
						<tr style="text-align:right">
							<td colspan="3">
								<a href="#review-list">
									<button type="button" class="btn btn-primary btn-lg"
										style="width:150px;">농장후기 보기</button>
								</a>
							</td>
						</tr>
					</table>
				</div>
				
				<hr>
				
				<div id="div-apply">
					<c:if test="${lv.equals('1') && dto.isEnd.equals('n')}">
						<form method="POST" action="/rural/farm/addapplyok.do">
							면적: <select name="area" class="form-control" id="sel-area"></select> <span class="tab">평</span>
							가격: <input type="text" class="form-control" id="sel-price" readonly> <span class="tab">원</span>
							<input type="button" class="btn btn-success btn-lg" id="btn-apply" style="width:150px;" value="신청하기">
							<input type="hidden" name="pseq" value="${dto.seq}">
						</form>
					</c:if>
				</div>
				
				
				<h3 class="title">상세내용</h3>
				<div class="row justify-content-md-center place-padding2">
					<textarea class="detail">${dto.detail}</textarea>
				</div>

				<h3 class="title">오시는 길</h3>				
				<div class="row justify-content-md-center place-padding2">
					<div class="detail" id="map" style="width:95%; height:350px;"></div>
					<div class="card" style="width:95%;">
  						<div class="card-body">${dto.address}</div>
  					</div>					
				</div> 					
				
				<!-- 수정/삭제 버튼 -->
				
				<c:if test="${lv.equals('3') || id == dto.id}">
					<div class="row justify-content-md-center" style="padding: 30px;">
						<c:if test="${id == dto.id}">
							<button type="button" class="btn btn-secondary btns"
								onclick="location.href='/rural/farm/edit.do?seq=${dto.seq}';">수정하기</button>
						</c:if>
						<form method="POST" action="/rural/farm/delok.do">
							<input type="button" class="btn btn-danger btns" id="btn-del" value="삭제하기">
							<input type="hidden" name="seq" value="${dto.seq}">
						</form>
					</div>
				</c:if>

				<!-- 리뷰 -->
				<div id="review-section">
					<div>
						<h3 class="title">농장후기</h3>
					</div>
					<c:if test="${lv.equals('1')}">
						<!-- 일반회원 > 주말농장 신청등록 완료된 사람만 리뷰 가능하도록 -->
						<form method="POST" action="/rural/farm/addreviewok.do">
							<table class="table table-bordered">
								<tr>
									<td>
										<textarea name="detail" class="form-control"
											placeholder="리뷰를 작성하세요." maxlength="1000"
											style="resize: none; width: 80%; height: 100px;" required></textarea>
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
								<th colspan="2">총 ${totalCount}건의 리뷰가 있습니다.</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${totalCount == 0}">
								<tr>
									<td colspan="2">리뷰가 없습니다.</td>
								</tr>
							</c:if>

							<c:forEach items="${rlist}" var="rdto">
								<tr>
									<td class="text-left">
										<div style="width: 80%;">${rdto.detail}</div>
										<div class="text-right">
											<small>[${rdto.id}] ${rdto.regDate}</small><span>&#11088;(별점${rdto.star}개)</span>
										</div>
									</td>
									<td>
										<c:if test="${rdto.id == id}">
											<form method="POST" action="/rural/exp/delreviewok.do">
												<input type="button" class="btn btn-primary btn-delRev" value="삭제">
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
	<!-- 카카오 맵 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8c8697657ed9c8281f0f8f31c45cdcb&libraries=services"></script>

	<script>
	
		//신청하기
		$("#btn-apply").click(function() {
			if (confirm($("#sel-area").val() + "평을 임대 신청하시겠습니까?")) {
				this.form.submit();
			}
		})
		
		//글 삭제
		$('#btn-del').click(function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				this.form.submit();
			}
		});
		
		//리뷰 삭제
		$('.btn-delRev').click(function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				this.form.submit();
			}
		});
		
		//면적 선택 select > option 추가
		$('document').ready(function() {
			$("#sel-price").val(${dto.price});
			for (var i=5; i<=${dto.extraArea}; i=i+5) {
				$("#sel-area").append("<option value='" + i + "'>" + i + "</option>");
			}
		});
		
		//면적 선택 > 가격 출력
		$("#sel-area").change(function() {
			let price = ${dto.price};
			let area = $("#sel-area").val();
			$("#sel-price").val(price*area/5);
		});
		
		//지도 출력
		
		var address = '${dto.address}';
		address = address.split(',')[0];
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
	
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address, function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    }
		});
		
	</script>
</body>
</html>