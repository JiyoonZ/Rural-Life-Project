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
h3 {
	margin-bottom: 50px;
	font-weight: bold;
}

.table #detail {
	height: 300px;
}
</style>
</head>
<body>

	<!-- 홈화면에서 카테고리 들어갔을 처음 나오는 화면 -->
	<%@ include file="/inc/header.jsp"%>

	<!-- 이미지 카테고리명 -->
	<div class="slider-area ">
		<div class="single-slider slider-height2 d-flex align-items-center"
			data-background="/rural/assets/img/market/about.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap">
							<h2>농작물 직거래</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 구현부 -->
	<div class="section-padding2">
		<div class="container">
		<h2 style="margin-bottom: 30px;"> <strong>글쓰기</strong></h2>

			<form method="POST" action="/rural/market/addok.do"
				enctype="multipart/form-data">
				<table class="table">
					<tr>
						<th>분류</th>
						<td colspan="3"><select name="marketInfo" id="marketInfo"
							class="form-control form-control-sm">
								<option value="쌀/잡곡">쌀/잡곡</option>
								<option value="과일/견과">과일/견과</option>
								<option value="채소/버섯">채소/버섯</option>
								<option value="정육/계란">정육/계란</option>
								<option value="김치">김치</option>
								<option value="홍삼/건강식품">홍삼/건강식품</option>
								<option value="전통주">전통주</option>
						</select>
					</tr>
					<tr>
						<th>제품명</th>
						<td colspan="3"><input type="text" name="name" id="name"
							class="form-control" required placeholder="제품명을 입력하세요."></td>
					</tr>
					<tr>
						<th>브랜드명</th>
						<td colspan="3"><input type="text" name="brandName"
							id="brandName" class="form-control" required></td>
					</tr>
					<tr>
						<th>홈페이지</th>
						<td colspan="3"><input type="text" name="site" id="site"
							class="form-control" required></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="3"><input type="text" name="tel" id="tel"
							class="form-control" required>
						<td></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="2"><input type="text" name="address"
							id="address" class="form-control" required></td>
						<td><input class="btn btn-secondary" type="button"
							onClick="goPopup();" value="주소검색"></td>


						<!-- <td><input type="button" value="주소찾기"class="btn btn-secondary"></td> -->

					</tr>
					<tr>
						<th>상세내용</th>
						<td colspan="3"><textarea name="detail" id="detail"
								class="form-control" required></textarea></td>
					</tr>
					<tr>
						<th>썸네일 이미지 첨부</th>
						<td colspan="3"><input type="file" name="image"
							accept=".gif, .jpg, .png"></td>
					</tr>

					<tr>
						<th>세부 이미지 첨부<br>(최대 3개)
						</th>
						<td colspan="3"><input type="file" name="image1"
							accept=".gif, .jpg, .png" /></td>
					</tr>


				</table>

			<div class="btns">
						<input type="button" value="이미지 추가하기" class="btn btn-success" id="btnAdd" name="btnAdd" />
					<button type="submit" class="btn btn-success">등록하기</button>
					<button type="button" class="btn btn-secondary"
						onclick="history.back();">뒤로가기</button>
				</div>

			</form>
		</div>


	</div>

	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>

	<script>

	let index = 1;

	$('#btnAdd').click(function() {
		index++;

		$("table tbody").append("<tr><th></th><td><input type='file' name='image" + index + "\" class='form-control' /><input type='button' value='삭제' class='btn btn-secondary' onclick='delBtn();'  accept='.gif, .jpg, .png' /></td></tr>")

		if ( index > 2 ) {
			btnDisabled()
		}
	});

	function delBtn() {
		$(event.srcElement).parent().parent().remove();
	}

	function btnDisabled()  {
		  const target = document.getElementById('btnAdd');
		  target.disabled = true;
	}




	//주소 검색
      function goPopup(){
         // IE에서 opener관련 오류가 발생하는 경우, window에 이름을 명시해줍니다.
         window.name="jusoPopup";

         // 주소검색을 수행할 팝업 페이지를 호출합니다.
         // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
         var pop = window.open("<%= request.getContextPath() %>/inc/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}

		function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
				roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn,
				bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm,
				rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			//$("#address").val(roadAddrPart1 + ", " + addrDetail);
			$("#address").val(roadFullAddr);
		}
	</script>
</body>
</html>