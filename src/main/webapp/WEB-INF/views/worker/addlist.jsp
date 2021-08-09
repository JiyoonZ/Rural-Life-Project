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
	#registList {
		margin-left: 88%;
		position: relative;
		top: 70px;
	}
	
	#tbl{
		width: 1200px;
		margin: 0px auto;
		
	}

	#tbl > tbody > tr > td {
	
		vertical-align: middle;
	}
	
	#edit {
		margin-bottom: 5px;
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


	<div class="favourite-place section-padding2 container">

		<h2 style="margin-bottom: 30px;">
			<strong>등록내역보기</strong>
		</h2>
		<hr style="margin-top: 10px;">
		<table class="table text-center table-hover" id="tbl">
			<thead class="thead-light text-center">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">지역</th>
					<th scope="col">담당자</th>
					<th scope="col">모집내용</th>
					<th scope="col">관리</th>
					<th scope="col">문의처</th>
					<th scope="col">지원</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.seq}</td>
						<td>${dto.city}</td>
						<td name="name">${dto.name}</td>
						<td name="title">${dto.title}</td>
						<td name="btn"><c:if test="${not empty id && lv == 2}">
								<button type="button" id="edit" class="btn btn-secondary"
									name="edit"
									onclick="location.href='/rural/worker/edit.do?seq=${dto.seq}';">수정하기</button>
							</c:if>
							<form method="POST" action="/rural/worker/delok.do">
								<c:if test="${not empty id && lv == 2 || lv == 3}">
									<button type="button" id="del" class="btn btn-danger delbtn"
										name="del">삭제하기</button>
								</c:if>
								<input type="hidden" name="seq" value="${dto.seq}">
							</form></td>
						<td name="tel">${dto.tel}</td>
						<td>
							<button type="button" id="applicant" class="btn btn-success"
								name="applicant"
								onclick="location.href='/rural/worker/applicant.do?seq=${dto.seq}';">신청현황보기</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 페이징바 -->
		<div class="row justify-content-md-center" style="width: 100%">
			${pagebar}
		</div>


	</div>





	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>

	<script>
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