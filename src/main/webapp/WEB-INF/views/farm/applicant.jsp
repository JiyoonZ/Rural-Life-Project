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
		position: relative;
	    margin-left: 88%;
	    top: 50px;
	}
	.hero-cap h4 { color: white;}
	table thead tr th:first-child {width: 10%; }
	table thead tr th:first-child label {vertical-align: bottom; margin-bottom: 0;}

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
							<h2>주말농장-신청현황</h2>
							<h4>${dto.name}</h4>
							<button type="button" class="btn btn-dark" id="registList"
								onclick="location.href='/rural/farm/addlist.do';">등록내역보기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 구현부 -->
	<div class="favourite-place section-padding2">

		<div class="container">

			<div class="row justify-content-between">
				<div class="col-5">
					<select class="custom-select col-md-5" name="isView" id="isView" required>
						<option value="">전체보기</option>
						<option value="y">승인 내역보기</option>
						<option value="n">미승인 내역보기</option>
					</select>
				</div>
				<div class="col-4" style="text-align: right;">
					<input type="button" id="btnPass" value="승인하기" class="btn btn-success">
				</div>
			</div>

			<hr style="margin-top: 10px;">
			
			<form id="form1" method="POST" action="/rural/farm/applypassok.do">
				<table class="table text-center table-hover">
					<thead class="thead-light text-center">
						<tr>
							<th scope="col">
								<input type="checkbox" id="cbAll"><label for="pass" style="margin-left: 15px;">전체선택</label>
							</th>
							<th scope="col">이름</th>
							<th scope="col">면적</th>
							<th scope="col">연락처</th>
							<th scope="col">신청날짜</th>
							<th scope="col-1">승인날짜</th>
							<th scope="col-1">처리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="dto">
							<tr class="applicant">
								<td>
									<c:if test="${dto.isPass.equals('y')}">
										<input type="checkbox" disabled>
									</c:if>
									<c:if test="${dto.isPass.equals('n')}">
										<input type="checkbox" class="cb" name="seqs" value="${dto.seq}">
									</c:if>
								</td>
								<td>${dto.userName}</td>
								<td>${dto.area}</td>
								<td>${dto.userTel}</td>
								<td>${dto.regDate}</td>
								<td>
									<c:if test="${dto.isPass.equals('y')}">
										${dto.passDate}
									</c:if>
									<c:if test="${dto.isPass.equals('n')}">
										-
									</c:if>
								</td>
								<td class="${dto.isPass}">
									<c:if test="${dto.isPass.equals('y')}">
										승인
									</c:if>
									<c:if test="${dto.isPass.equals('n')}">
										미승인
									</c:if>
								</td>
							</tr>
						</c:forEach>	
					</tbody>
				</table>
				<input type="hidden" name="pseq" value="${seq}">
			</form>

			<%-- <input type="button" class="btn btn-primary" value="뒤로가기"
				onclick="location.href='/rural/farm/view.do?seq=${seq}';"> --%>

			<div class='pagebar'>
				${pagebar}
			</div>
		</div>
	</div>

	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>

	<script>
	
		//승인/미승인 내역보기
		$('#isView').change(function() {
			location.href = "/rural/farm/applicant.do?seq=${seq}&isView=" + $(this).val();
		});
		
		<c:if test="${isView.equals('y')}">
			$('#isView').val("y");
		</c:if>
		<c:if test="${isView.equals('n')}">
			$('#isView').val("n");
		</c:if>
		
		//전체선택
		$('#cbAll').click(function() {
			if ($(this).prop('checked')) {
				$('.cb').prop("checked", true);
			} else {
				$('.cb').prop("checked", false);
			}
		});
		
		$('.cb').click(function() {
			if ($('#cbAll').prop('checked')) {
				$('#cbAll').prop('checked', false);
			}
		});
		
		//승인
		$('#btnPass').click(function() {
			if ($('.cb:checked').length > 0) {
				$('#form1').submit();
			} else {
				alert("1개 이상 선택해주세요.");
			}
		});
		
	</script>
</body>
</html>