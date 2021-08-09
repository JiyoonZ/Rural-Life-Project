<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.view-link { color: black; }
.view-link:hover {
	color: black;
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
		
			<table class="table text-center table-hover">
				<thead class="thead-light text-center">
					<tr>
						<th>농장명</th>
						<th>면적(평)</th>
						<th>임대료(원)</th>
						<th>주소</th>
						<th>전화번호</th>
						<th>농장주</th>
						<th>처리상태</th>
						<th>비고</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${list}" var="dto">
					<tr>
						<td>
							<a href="/rural/farm/view.do?seq=${dto.pseq}" class="view-link">${dto.name}</a>
						</td>
						<td>${dto.area}</td>
						<td>
							<c:set var="price" value="${(dto.area / 5) * dto.price}" />
							<fmt:formatNumber value="${price}" type="number" />
							
						</td>
						<td>${dto.address}</td>
						<td>${dto.tel}</td>
						<td>${dto.ownerName}</td>
						<td>
							<c:if test="${dto.isPass.equals('y')}">
								승인
							</c:if>
							<c:if test="${dto.isPass.equals('n')}">
								미승인
							</c:if>
						</td>
<%-- 							<button type="button" class="btn btn-primary"
								onclick="location.href='/rural/farm/view.do?seq=${dto.pseq}';">상세보기</button> --%>
						<td>
							<c:if test="${dto.isPass.equals('y')}">
								<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="이미 처리된 내역입니다.">
								  <button class="btn btn-secondary" style="pointer-events: none;" type="button" disabled>신청취소하기</button>
								</span>
							</c:if>
							<c:if test="${dto.isPass.equals('n')}">
								<button type="button" class="btn btn-primary btn-lg" onclick="delApply(${dto.seq}, ${dto.pseq});">신청취소하기</button>
							</c:if>
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
		
		</div>
	</div>

	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>

	<script>
	
		//글 삭제
		function delApply(seq, pseq) {
			let result = confirm("정말 취소하시겠습니까?");
			if (result) {
				//yes
				location.href = "/rural/farm/delapplyok.do?seq=" + seq + "&pseq=" + pseq;
			} else {
				//no
			}
		}
	
	</script>
</body>
</html>