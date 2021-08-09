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
#viewLink {cursor:pointer;}
#viewLink:hover {text-decoration: underline;}
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
							<c:if test="${not empty lv && lv eq '2'}">
								<button type="button" class="btn btn-dark" id="registList" onclick="location.href='/rural/exp/addlist.do';">등록내역보기</button>
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
			<h2 style="margin-bottom: 30px;"><strong>등록내역보기</strong></h2>
			<table class="table text-center table-hover">
				<thead class="thead-light text-center">
					<tr>
						<th scope="col">체험분류</th>
						<th scope="col">체험기간</th>
						<th scope="col">체험명</th>
						<th scope="col">관리</th>
						<th scope="col-1">비고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="dto">
					<tr>
						<td name="expInfo">${dto.expInfo}</td>
						<td name="startDate endDate">${dto.startDate} - ${dto.endDate}</td>
						<td id="viewLink" name="name" onClick="location.href='/rural/exp/view.do?seq=${dto.seq}'">${dto.name}</td>
						<td>
							<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/rural/exp/edit.do?seq=${dto.seq}';">수정하기</button>
							<button type="button" class="btn btn-danger btn-sm" onclick="del(${dto.seq})">삭제하기</button>
						</td>
						<td><button type="button" class="btn btn-success btn-lg" onclick="location.href='/rural/exp/applicant.do?seq=${dto.seq}&name=${dto.name}';">신청현황 보기(${dto.count})</button></td>
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
	<!-- Favourite Places End -->





	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>

	<script>
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