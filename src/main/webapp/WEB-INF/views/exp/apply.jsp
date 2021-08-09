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


.registAdd {
	padding: 100px 100px;
	border: 1px solid #E6E6E6;
	border-radius: 5px;
}

.registAdd .row {
	margin-top: 15px;
	margin-bottom: 10px;
}
.btns { text-align:center;}
.btns button { margin: 30px 15px;}
.subTitle, .block {margin-bottom: 15px;}
textarea.form-control {margin-left: 14px; margin-top: 20px; width: 100%; height: 400px; resize: none;}

#address { float: left; margin-right: 10px;}
#address::after {content:""; display: block; clear:both;}
#startDate { float: left; margin-right: 10px;}
#startDate::after {content:""; display: block; clear:both;}
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
							<h2>농촌체험-신청하기</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 구현부 -->


	<div class="favourite-place section-padding2">

		<form method="POST" action="/rural/exp/applyok.do">
			<div class="container registAdd">
				<h2 style="margin-bottom: 40px;">
					<strong>신청 양식</strong>
				</h2>
				
				<div class="justify-content-start block">
					<div class="col-md-2 subTitle" style="text-align: left;">
						<strong>모집인원</strong>
					</div>
					<div class="col-md-8">
						<input type="number" class="form-control col-sm-3" name="totalPerson" required>
					</div>
				</div>

				<div class="justify-content-start block">
					<div class="col-md-2 subTitle" style="text-align: left;">
						<strong>체험기간</strong>
					</div>
					<div class="col-md-8">
						<input type="date" min="${startDate}" max="${endDate}" class="col-sm-3 form-control" name="startDate" id="startDate" required> 
						<input type="date" min="${startDate}" max="${endDate}" class="col-sm-3 form-control" name="endDate" id="endDate" required>
					</div>
				</div>

									
				<div class="justify-content-start block">
					<strong class="col-2 subTitle" style="text-align: left;">신청내용</strong>
					<textarea class="form-control" name="detail" placeholder="내용을 입력해주세요" required></textarea>
				</div>
				
				<div class="btns">
					<button type="submit" class="btn btn-primary" >신청하기</button>
					<button type="submit" class="btn btn-secondary"
						onclick="location.href='/rural/exp/view.do?seq=${pseq}';">돌아가기</button>
				</div>

			</div>
			<input type="hidden" name="seq" value="${seq}">
		</form>
	</div>
	<!-- Favourite Places End -->





	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>


	   <script>

		$('document').ready(function() {
	       $("#startDate").change(function(e) {
	    	   $("#endDate").attr("min", e.target.value);
	    	   //console.log(e.target.value);
	       });
		});
     
   </script>
</body>
</html>