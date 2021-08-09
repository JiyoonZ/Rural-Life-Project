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
#tbl {
	width: 1200px;
}

#tbl>tbody>tr>th {
	text-align: center;
}

#tbl>tbody>tr:nth-child(8)>td {
	text-align: center;
}

#map {
	width: 100%;
	height: 420px;
}

#tbl > tbody > tr:nth-child(8) > td {
	text-align: left;
}

#tbl > tbody > tr > th {
	background-color: #EEE;
}

#del {
	margin-right: 5px;
}

</style>
</head>
<body>

	<!-- 홈화면에서 카테고리 들어갔을 처음 나오는 화면 -->
	<%@ include file="/inc/header.jsp"%>

	<!-- 이미지 카테고리명 -->
	<div class="slider-area ">
		<div class="single-slider slider-height2 d-flex align-items-center"
			data-background="/rural/assets/img/worker/workerList.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap">
							<h2>일손돕기</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 구현부 -->
	<div class="section-padding2 container">
		<div class="container">
			<table class="table table-bordered" id="tbl">
				<tr>
					<th>제목</th>
					<td>${dto.title}</td>
					<th>담당자</th>
					<td>${dto.name}</td>
				</tr>
				<tr>
					<th>상태</th>
					<td><c:if test="${dto.isEnd == 'y'}">
						마감
					</c:if> <c:if test="${dto.isEnd == 'n'}">
						진행
					</c:if></td>
					<th>문의처</th>
					<td>${dto.tel}  ${dto.name}</td>
				</tr>
				<tr>
					<th>작업종료일</th>
					<td>${dto.startDate} ~ ${dto.endDate}</td>
					<th>근무지역</th>
					<td>${dto.city}  ${dto.gu}</td>
				</tr>
				<tr>
					<th>경력</th>
					<td><c:if test="${dto.isCareer == 'n'}">
							경력
						</c:if> 
						<c:if test="${dto.isCareer == 'y'}">
							경력무관
						</c:if></td>
					<th>모집인원</th>
					<td>${dto.totalPerson}명</td>
				</tr>
				<tr>
					<th>구인연령대</th>
					<td>${dto.minAge}대~ ${dto.maxAge}대</td>
					<th>작물 정보</th>
					<td>${dto.cropInfo}</td>
				</tr>
				<tr>
					<th>임금조건</th>
					<td>${dto.pay}(일급)</td>
					<th>상세 주소</th>
					<td>${dto.address}</td>
				</tr>
				<tr>
					<th colspan="4">상세 내용</th>
				</tr>
				<tr>
					<td colspan="4">${dto.detail}</td>
				</tr>
				<tr>
					<th colspan="4">센터 위치 지도 확인</th>
				</tr>
				<tr>
					<td colspan="4">
						<div id="map"></div>
					</td>
				</tr>
			</table>

			<div class="row justify-content-md-center place-padding2">
				<form method="POST" action="/rural/worker/delok.do">
				
				
				<c:if test="${dto.id == id || lv.equals('3')}">
					<button type="button" id="del" class="btn btn-danger delbtn" name="del">삭제하기</button>
				</c:if>	
					<input type="hidden" name="seq" value="${dto.seq}">
				</form>	
				<button class="btn btn-secondary"
					onclick="location.href='/rural/worker/list.do';">뒤로가기</button>
			</div>

		</div>

	</div>

	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1cb1e84a708b70ba9279211ea5e5de7&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        /* draggable: false, */
	        level: 3 // 지도의 확대 레벨
	    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${dto.city}${dto.gu}${dto.address}', function(result, status) {
		
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
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.city}${dto.gu}${dto.address}</div>'
		        });
		        
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    }
		     map.setZoomable(false);
		});     
	
		
		
		
		$('.delbtn').click(function(){
			
			if (confirm("정말 삭제하시겠습니까?")) {
				this.form.submit();
			} else {
				
				alert("취소되었습니다.");
			}
		});
		
		
	</script>
</body>
</html>