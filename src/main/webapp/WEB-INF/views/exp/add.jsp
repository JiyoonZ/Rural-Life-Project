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

.registAdd {
	padding: 50px 50px;
	border: 1px solid #E6E6E6;
	border-radius: 5px;
}

.registAdd .row {
	margin-top: 15px;
	margin-bottom: 10px;
}
.btns { text-align:center;}
.btns button { margin: 30px 15px;}

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
							<h2>농촌체험</h2>
							<c:if test="${not empty id && id == 'farmer'}">
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

		<form method="POST" action="/rural/exp/addok.do" enctype="multipart/form-data">
			<div class="container registAdd">
				<h2 style="margin-bottom: 40px;">
					<strong>모집공고 양식</strong>
				</h2>
				<div class="row justify-content-start">
					<div class="col-sm-1" style="text-align: left;">
						<strong>체험분류</strong>
					</div>
					<div class="col-sm-3">
						<select class="custom-select" name="expInfo" required>
							<option selected>농사체험</option>
							<option value="바다체험">바다체험</option>
							<option value="생태체험">생태체험</option>
							<option value="전통음식체험">전통음식체험</option>
							<option value="전통문화체험">전통문화체험</option>
							<option value="만들기체험">만들기체험</option>
							<option value="놀이체험">놀이체험</option>
							<option value="기타체험">기타체험</option>
						</select>
					</div>
				</div>

				<div class="row justify-content-start">
					<div class="col-sm-1" style="text-align: left;">
						<strong>마을이름</strong>
					</div>
					<div class="col-sm-8">
						<input type="text" class="form-control col-sm-6"
							placeholder="마을이름을 입력해주세요." name="town" required>
					</div>
				</div>

				<div class="row justify-content-start">
					<div class="col-sm-1" style="text-align: left;">
						<strong>체험명</strong>
					</div>
					<div class="col-sm-8">
						<input type="text" class="form-control col-sm-6"
							placeholder="체험명을 입력해주세요." name="name" required>
					</div>
				</div>
				
				<div class="row justify-content-start">
					<div class="col-sm-1" style="text-align: left;">
						<strong>모집인원</strong>
					</div>
					<div class="col-sm-4">
						<input type="number" class="form-control col-sm-3" name="totalPerson" required>
					</div>
				</div>

				<div class="row justify-content-start">
					<div class="col-sm-1" style="text-align: left;">
						<strong>체험기간</strong>
					</div>
					<div class="col-sm-9">
						<input type="date" class="col-sm-3 form-control" name="startDate" id="startDate" required> 
						<input type="date" class="col-sm-3 form-control" name="endDate" id="endDate" required>
					</div>
				</div>

				<div class="row justify-content-start">
					<div class="col-sm-1" style="text-align: left;">
						<strong>전화번호</strong>
					</div>
					<div class="col-sm-2">
						<input type="tel" name="tel" class="form-control" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="010-0000-0000" required>
					</div>
				</div>

				<div class="row justify-content-start">
					<div class="col-1" style="text-align: left;">
						<strong>주소</strong>
					</div>
					<div class="col-6">
						<input type="text" name="address" id="address" class="form-control col-sm-8" required>
						<input type="button" class="form-control col-sm-2" onClick="goPopup();" value="주소검색">
					</div>
					<div class="col-1" style="text-align: left;">
						<strong>홈페이지</strong>
					</div>
					<div class="col-4">
						<input type="text" name="site" class="form-control" placeholder="홈페이지를 입력해주세요.">
					</div>				
				</div>
				<div class="row justify-content-start">
					<div class="col-sm-1" style="text-align: left;">
						<strong>이미지:</strong>
					</div>
					<div class="col-sm-8">
						<input type="file" name="image" class="form-control col-sm-6"  accept=".gif, .jpg, .png">
					</div>
				</div>

					

				<strong class="row col-2" style="text-align: left;">마을 소개글</strong>
				<textarea class="form-control" name="townDetail" placeholder="내용을 입력해주세요"
					style="width: 100%; height: 300px; resize: none;" required></textarea>
				<strong class="row col-2" style="text-align: left;">프로그램
					소개글</strong>
				<textarea name="detail" class="form-control" placeholder="내용을 입력해주세요"
					style="width: 100%; height: 300px; resize: none;" required></textarea>

				<div class="btns">
					<button type="submit" class="btn btn-primary" >글쓰기</button>
					<button type="submit" class="btn btn-secondary"
						onclick="location.href='/rural/exp/list.do';">돌아가기</button>
				</div>

			</div>
		</form>
	</div>
	<!-- Favourite Places End -->





	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>


	   <script>
      function goPopup(){
         // IE에서 opener관련 오류가 발생하는 경우, window에 이름을 명시해줍니다.
         window.name="jusoPopup";
         
         // 주소검색을 수행할 팝업 페이지를 호출합니다.
         // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
         var pop = window.open("<%= request.getContextPath() %>/inc/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
      }
   
   
      function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
         // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
         //$("#address").val(roadAddrPart1 + ", " + addrDetail);
         $("#address").val(roadFullAddr);
      }
      
      $('document').ready(function() {
	       $("#startDate").change(function(e) {
	    	   $("#endDate").attr("min", e.target.value);
	    	   //console.log(e.target.value);
	       });
		});
    
   </script>
</body>
</html>