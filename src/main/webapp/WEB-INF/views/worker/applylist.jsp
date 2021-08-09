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

	#content {
		margin-top: 15px;
	}
	
	#tbl > tbody > tr:nth-child(1) > td {
	
		vertical-align: middle;
	}
	
	#viewDetail {
		color: black;
	}
	
	#viewDetail:hover {
		text-decoration: underline;
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
		<h2 style="margin-bottom: 30px;"><strong>신청내역보기</strong></h2>
		<hr style="margin-top: 10px;">
		<table class="table text-center table-hover" id="tbl">
			<thead class="thead-light text-center">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">지역</th>
					<th scope="col">담당자</th>
					<th scope="col">모집내용</th>
					<th scope="col">처리상태</th>
					<th scope="col">문의처</th>
					<th scope="col">지원</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.pseq}</td>
						<td>${dto.city}  ${dto.gu}</td>
						<td name="name">${dto.name}</td>
						<td name="detail">
							<div><a href="/rural/worker/view.do?seq=${dto.pseq}" id="viewDetail">${dto.title}</a></div>
						</td>
						<td name="isPass"><c:if test="${dto.isPass eq 'n'}">미승인</c:if>
							<c:if test="${dto.isPass eq 'y'}">승인</c:if></td>
						<td name="tel">${dto.tel}</td>
						<td>
							<form method="POST" action="/rural/worker/applydelok.do">
								<button type="button" id="cancel" class="btn btn-primary cancelbtn"
									name="cancel">신청취소하기</button>
								<input type="hidden" name="seq" value="${dto.seq}">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>


	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>

	<script>
		$('.cancelbtn').click(function(){
			if(confirm("정말 취소하시겠습니까?")){
				this.form.submit();
			}
		});
	</script>
</body>
</html>