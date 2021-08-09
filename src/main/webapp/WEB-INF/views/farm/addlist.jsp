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
#registList {
	margin-left: 88%;
	position: relative;
	top: 70px;
}
form { display: inline-block; }
.viewLink {cursor:pointer;}
.viewLink:hover {text-decoration: underline;}
</style>
</head>
<body>

	<!-- 홈화면에서 카테고리 들어갔을 처음 나오는 화면 -->
	<%@ include file="/inc/header.jsp"%>

	<!-- 이미지 카테고리명 -->
	<div class="slider-area ">
		<div class="single-slider slider-height2 d-flex align-items-center" data-background="/rural/assets/img/farm.jpg">
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
	<div class="favourite-place section-padding2">
		<div class="container">
			<h2 style="margin-bottom: 30px;"><strong>등록내역보기</strong></h2>
			
			<table class="table text-center table-hover">
				<thead class="thead-light text-center">
					<tr>
						<th scope="col">농장명</th>
						<th scope="col">잔여면적(평)</th>
						<th scope="col">총면적(평)</th>
						<th scope="col">임대료(원/5평)</th>
						<th scope="col">마감</th>
						<th scope="col">관리</th>
						<th scope="col">신청현황</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="dto">
				<tr>
					<td>
						<span class="viewLink" onclick="location.href='/rural/farm/view.do?seq=${dto.seq}';">${dto.name}</span>
					</td>
					<td>${dto.extraArea}</td>
					<td>${dto.area}</td>
					<td>${dto.price}</td>
					<td>
						<c:if test="${dto.isEnd.equals('y')}">
							<span style="color: red;">Y</span>
						</c:if>
						<c:if test="${dto.isEnd.equals('n')}">
							<span style="color: cornflowerblue;">N</span>
						</c:if>
					</td>
					<td>
						<button type="button" class="btn btn-secondary btn-sm"
							onclick="location.href='/rural/farm/edit.do?seq=${dto.seq}';">수정하기</button>
						<form method="POST" action="/rural/farm/delok.do">
							<input type="button" class="btn btn-danger btn-sm btn-del" value="삭제하기">
							<input type="hidden" name="seq" value="${dto.seq}">
						</form>
					</td>
					<td>
						<button type="button" class="btn btn-success btn-lg"
							onclick="location.href='/rural/farm/applicant.do?seq=${dto.seq}';">신청현황 보기</button>
					</td>
				</tr>
				</c:forEach>
				<c:if test="${list.size() == 0}">
					<tr>
						<td colspan="5">게시물이 없습니다.</td>
					</tr>	
				</c:if>
				</tbody>
			</table>
			
			<div class='pagebar'>
				${pagebar}
			</div>
		</div>
	</div>

	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>

	<script>
	
		//글 삭제
		$('.btn-del').click(function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				this.form.submit();
			}
		});
	
	</script>
</body>
</html>