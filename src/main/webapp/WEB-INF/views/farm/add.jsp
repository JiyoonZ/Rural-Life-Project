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
#addform tr th {
	text-align: center;
	background-color: #F5F5F5;
	vertical-align: middle;
}
#addform tr td {
	vertical-align: middle;
}
#address { width: 600px; }
#detail {
	height: 300px;
	overflow: auto;
}

.btns { text-align:center;}
.btns button { margin: 30px 15px;}
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

			<form method="POST" action="/rural/farm/addok.do" enctype="multipart/form-data">
				<table class="table table-bordered" id="addform">
					<tr>
						<th>농장명 <small>*</small></th>
						<td>
							<input type="text" name="name" id="name" class="form-control" maxlength="20" required>
						</td>
						<th>사진</th>
						<td>
							<input type="file" name="image" id="image" class="form-control">
						</td>
					</tr>
					<tr>
						<th>총면적(최소단위: 5평) <small>*</small></th>
						<td>
							<input type="number" name="area" id="area" class="form-control" min="5" step="5" required>
						</td>
						<th>분양가격(원/5평) <small>*</small></th>
							<td><input type="number" name="price" id="price" class="form-control" min="0" required>
						</td>
					</tr>
					<tr>
						<th>전화번호 <small>*</small></th>
						<td colspan="3">
							<input type="text" name="tel" id="tel" class="form-control" 
								pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required>
						</td>
					</tr>
					<tr>
						<th>주소 <small>*</small></th>
						<td colspan="3">
							<input type="button" onClick="goPopup();" value="주소검색">
							<input type="text" id="address"  name="address" maxlength="100" readonly required>
						</td>
					</tr>
					<tr>
						<th colspan="4">상세내용 <small>*</small></th>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="detail" id="detail" class="form-control" maxlength="1000" required></textarea>
						</td>
					</tr>
				</table>

				<div class="btns">
					<button type="submit" class="btn btn-primary">글쓰기</button>
					<button type="button" class="btn btn-secondary"
						onclick="location.href='/rural/farm/list.do';">돌아가기</button>
				</div>
			</form>

		</div>
	</div>

	<%@ include file="/inc/footer.jsp" %>
 	<%@ include file="/inc/init.jsp" %>
	
	<script>
		function goPopup(){
			window.name="jusoPopup";
			var pop = window.open("<%= request.getContextPath() %>/inc/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		}
	
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			if (roadFullAddr.length > 100) {
				alert("주소를 100자 이내로 입력해주세요");
			} else {
				$("#address").val(roadFullAddr);				
			}
		}
	</script>
</body>
</html>