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
	<div class="favourite-place section-padding2">

		<div class="container">
			<h2 style="margin-bottom: 30px;">
				<strong>신청현황보기</strong>
			</h2>
			<hr style="margin-top: 10px;">
			<table class="table text-center table-hover">
				<thead class="thead-light text-center">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">이름</th>
						<th scope="col">성별</th>
						<th scope="col">나이</th>
						<th scope="col">신청인원</th>
						<th scope="col-1">내용</th>
						<th scope="col-1">연락처</th>
						<th scope="col-1">신청날짜</th>
						<th scope="col">처리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.seq}</td>
							<td id="name">${dto.name}</td>
							<td id="gender">${dto.gender}</td>
							<td id="age">${dto.birth}세</td>
							<td id="totalApply">${dto.totalApply}명</td>
							<td id="detail"><button type="button"
									class="btn btn-success btn-sm" data-toggle="modal"
									data-target="#${dto.seq}">상세보기</button></td>
							<td id="tel">${dto.tel}</td>
							<td>${dto.regDate}</td>
							<td><c:if test="${dto.isPass == 'n'}">
									<form method="POST" action="/rural/worker/applicantok.do">
										<button type="button" id="approve"
											class="btn btn-primary approvebtn" name="approve">승인하기</button>
										<input type="hidden" name="seq" value="${dto.seq}">
									</form>
								</c:if> <c:if test="${dto.isPass == 'y'}">
									<button class="btn btn-secondary approvebtn" disabled="disabled"
										style="cursor: default;">승인완료</button>
								</c:if></td>
						</tr>
						
					<!-- 모달창 -->
					<div class="modal fade" id="${dto.seq}" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">${dto.name}님의 신청내역입니다.</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form>
											<div>
												<label for="message-text" class="col-form-label"><b>이름(나이)</b></label>
												<div>${dto.name}(${dto.birth}세)</div>											
											</div>
											<div>
												<label for="message-text" class="col-form-label"><b>신청인원</b></label>
												<div>${dto.totalApply}명</div>											
											</div>
											<div>
												<label for="message-text" class="col-form-label"><b>경력유무</b></label>
												<div>${dto.isCareer}</div>											
											</div>
											<div class="form-group">
												<label for="message-text" class="col-form-label"><b>신청내용</b></label>
												<div>${dto.detail}</div>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</tbody>
			</table>

		</div>

	</div>

	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>

	<script>
		$('.approvebtn').click(function() {
			if (confirm("승인하시겠습니까?")) {
				this.form.submit();
			}
		});
	</script>
</body>
</html>