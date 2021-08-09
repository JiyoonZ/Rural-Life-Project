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

.listimg {
	object-fit: cover;
	width: 263px;
	height: 263px;
	overflow: hidden;
	border: 1px solid #f0f1f2;
	text-align: center;

}

table>tbody>tr:nth-child(2)>th {
	width: 150px;
}

#listQna>tr {
	width: 300px;
}

.tbl {
	/* padding: 1000px; */
	width: 700px;
	margin-botton: 30px;
}

.detail {
	width: 1150px;
	border: 1px solid #DEE2E6;
	padding: 40px;
}

.title {
	margin-top: 100px;
	margin-botton: 30px;
	font-weight: bold;
}

.maintitle {
	margin-bottom: 5px;
	font-weight: bold;
	color: #404040;
}

.date {
	color: #b0b0b0;
	text-align: right;
}

.qna {
	width: 1150px;
	margin-bottom: 20px
}

#qnatitle {
	margin-bottom: 15px;
}

.qnalist {
	width: 1150px;
}

#listQna>tr>th:nth-child(1) {
	width: 550px;
}

.qbody {
	padding: 40px;
}

.place-img {
	width: 350px;
	height: 418px;
	overflow: hidden;
	border: 1px solid #f0f1f2;
	text-align: center;
}

.list {
	margin: 20px;
	display: flex;
	flex-wrap: wrap;
}

.favourite-place .single-place .place-img img {
	object-fit: cover;
	width: auto;
	height: 100%;
	text-aling: center;
	-webkit-transform: scale 1;
	-moz-transform: scale 1;
	-ms-transform: scale 1;
	-o-transform: scale 1;
	transform: scale 1;
	transition: all 0.5s ease-out 0s;
}

.qbody .qnaatag {
	font-weight: bold;
	font-size: 30px;
}
</style>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
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


			<div class="favourite-place place-padding2">

				<table class="table">
					<tr>
						<th colspan="2"><h1 class="maintitle">${dto.brandName}</h1></th>
						<td class="date">${dto.regDate}</td>
					</tr>
				</table>
				<div class="row justify-content-md-center place-padding2">
					<table class="tbl justify-content-md-center">

						<th>분류</th>
						<td>${dto.marketInfo}>${dto.name}</td>
						<td></td>
						</tr>
						<tr>
							<th>번호</th>
							<td>${dto.tel}</td>
							<td></td>
						</tr>
						<tr>
							<th>담당자</th>
							<td>${dto.farmername}</td>
							<td></td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${dto.address}</td>
							<td></td>
						</tr>
						<tr>
							<th>홈페이지</th>
							<td>${dto.site}</td>
							<td></td>
						</tr>
						<tr>
							<th>좋아요</th>
							<td><img src="/rural/assets/img/market/like.png" style="width:25px; height: auto; margin-right: 5px;"> ${cnt}개 </td>
							<td></td>
						</tr>
						<tr>
							<th>공유</th>
							<td>
								<!-- naver --> <span> <script type="text/javascript"
										src="https://ssl.pstatic.net/share/js/naver_sharebutton.js"></script>
									<script type="text/javascript">
                        new ShareNaver.makeButton({"type": "f"});
                     </script>
							</span> <!-- kakao --> <img
								src="/rural/assets/img/logo/kakao.png"
								style="width: 40px; margin-left: 10px; cursor: pointer;"
								id="btnKakao"
								onClick="shareKakao();" />

								<!-- twitter --> <img
								src="/rural/assets/img/logo/twitter.png"
								style="width: 40px; margin-left: 10px; cursor: pointer;"
								onclick="shareTwitter();"> </span>


							</td>
							<td></td>
						</tr>
					</table>
					<div class="place-img">
						<img src="/rural/assets/img/market/${dto.image}" class="img">
					</div>
				</div>


				<table class="table">
					<tr>
						<th colspan="2"><h3 class="title">상세내용</h3></th>
					</tr>
				</table>
				<div class="row justify-content-md-center place-padding2">

					<div class="detail">
						<div>${dto.detail}</div>

						<c:forEach items="${ ilist }" var="image" begin="0" end="3">
							<img class="listimg" style="margin-top: 30px;" src="/rural/assets/img/market/${ image }">
						</c:forEach>

					</div>

				</div>
				<div>
					<c:if test="${not empty id}">
						<c:if test="${dto.id == id}">
							<div class="row justify-content-md-center" style="padding: 30px;">
								<button type="button" class="btn btn-secondary btns"
									style="margin-right: 20px;"
									onclick="location.href='/rural/market/edit.do?seq=${dto.seq}';">수정하기</button>
								<button type="submit" id="del" class="btn btn-danger btns"
									onclick=del(${dto.seq})>삭제하기</button>
							</div>
						</c:if>
					</c:if>
					<c:if test= "${lv == 3 }">
						<div class="row justify-content-md-center" style="padding: 30px;">
							<button type="submit" id="del" class="btn btn-danger btns" onclick=del(${dto.seq})>삭제하기</button>
						</div>
					</c:if>
				</div>


				<div class="row justify-content-between"
					style="padding: 25px; margin-top: 80px;">
					<div>
						<h3 style="font-weight: bold;">문의사항</h3>
					</div>
				</div>


				<div class="row justify-content-md-center place-padding2">

					<!-- 사용자: QnA쓰기 form -->
					<form method="POST" action="/rural/market/addqna.do">
						<c:if test="${not empty id && lv == 1}">
							<table id="addQna" class="qna">
								<tr>
									<td><input type="text" name="title" id="title"
										class="form-control" style="margin-bottom: 10px;" required
										placeholder="문의사항 제목을 입력해주세요."></td>
								</tr>
								<tr>
									<td><textarea name="detailq" id="detailq"
											class="form-control" style="height: 100px; resize: none;"
											required placeholder="문의사항 내용을 입력해주세요."></textarea></td>
								</tr>
							</table>
							<div class="row justify-content-md-center"
								style="margin-bottom: 30px;">
								<input class="btn btn-success" type="submit" value="등록하기">
							</div>
							<!-- 현재 보고있는 글의 번호 -->
							<input type="hidden" name="pseq" value="${dto.seq}">
						</c:if>
					</form>



					<!-- QnA목록보기 -->
					<table class="table text-center  qnalist">
						<thead id="listQna" class="thead-light text-center">
							<tr>
								<th scope="col">제목</th>
								<th scope="col">날짜</th>
								<th scope="col">작성자</th>
								<th scope="col-1">처리</th>
							</tr>
						</thead>
						<tbody>

							<!-- qna리스트확인 -->

							<c:forEach items="${qlist}" var="qdto">
								<tr>
									<td name="title endDate">${qdto.title}</td>
									<td name="detailq">${qdto.regdateq}</td>
									<td name="detailq">${qdto.name}</td>

									<td><c:if test="${qdto.isa == 'n' && lv == 2}">
											<button class="btn btn-success btn-lg" type="button"
												data-toggle="collapse" data-target="#${qdto.seq}"
												aria-expanded="false" aria-controls="${qdto.seq}">
												답변하기</button>
										</c:if> <c:if test="${qdto.isa == 'n'}">
											<button class="btn btn-secondary btn-lg" type="button"
												data-toggle="collapse" data-target="#${qdto.seq}"
												aria-expanded="false" aria-controls="${qdto.seq}">
												미답변</button>
										</c:if> <c:if test="${qdto.isa == 'y'}">
											<div>
												<button class="btn btn-success btn-lg" type="button"
													data-toggle="collapse" data-target="#${qdto.seq}"
													aria-expanded="false" aria-controls="${qdto.seq}">
													답변완료</button>
										</c:if></td>
								</tr>
								<form method="POST" action="/rural/market/addreqna.do">
									<tr>
										<td colspan="4">
											<div class="collapse" id="${qdto.seq}">
												<div class="qbody">
													<a class="qnaatag" style="color: #939393;">Q.</a><br>
													${qdto.detailq}
													<div class= "mt-auto p-2" style =" color: #C1C1C1; ">${qdto.regdateq}</div>
												</div>

												<c:if test="${qdto.id == id }">
													<button type="button" id="del"
														class="btn btn-danger btns" style="margin-bottom: 20px;"
														onclick=delqna(${qdto.seq},${dto.seq})>문의삭제하기</button>
												</c:if>
												<c:if test="${lv == 3 }">
													<button type="button" id="del"
														class="btn btn-danger btns" style="margin-bottom: 20px;"
														onclick=delqna(${qdto.seq},${dto.seq})>문의삭제하기</button>
												</c:if>



												<c:if test="${ not empty qdto.detaila }">

													<div class="qbody""><a class="qnaatag" style="color: #939393;">A.</a><br>
														${qdto.detaila}
														<div class= "mt-auto p-2" style =" color: #C1C1C1; ">${qdto.regdatea}</div>
														</div>

													<c:if test="${dto.id == id }">
														<button type="submit" id="del"
															class="btn btn-danger btns"
															style="margin-bottom: 20px;"
															onclick=delreqna(${qdto.seq},${dto.seq})>답변삭제하기</button>
													</c:if>
												</c:if>

												<c:if test="${lv == 3 }">
													<button type="submit" id="del" class="btn btn-danger btns"
														style="margin-bottom: 20px;"
														onclick=delreqna(${qdto.seq},${dto.seq})>답변삭제하기</button>
												</c:if>




												<c:if test="${dto.id == id }">
													<!-- 답변달기 입력 폼 -->
													<textarea name="detaila" id="detaila" class="form-control"
														style="height: 100px; resize: none;" required
														placeholder="문의사항 답변을 입력해주세요."></textarea>

												<c:if test="${ not empty qdto.detaila}">
													<input class="btn btn-secondary" style="margin: 30px;"
														type="submit" value="답변수정"
														onclick="location.href='/rural/market/list.do';">
												</c:if>

												<c:if test="${ empty qdto.detaila && dto.id == id }">
													<input class="btn btn-secondary" style="margin: 30px;"
														type="submit" value="답변달기"
														onclick="location.href='/rural/market/list.do';">
												</c:if>
												</c:if>




											<!-- 현재 보고있는 글의 번호 -->
											</div>
											</div> <input type="hidden" name="seq" value="${qdto.seq}">
											<input type="hidden" name="pseq" value="${dto.seq}">
										</td>
									</tr>
								</form>
							</c:forEach>
						</tbody>
					</table>


					<c:if test="${qlist.size() == 0}">
						<div>
							<div class=" alert alert-light"
								style="padding: 30px; text-align: center;">문의사항이 없습니다.</div>
						</div>
					</c:if>


				</div>





			</div>
		</div>


	</div>

	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>

	<script>

    // 게시글 삭제(farmer)
    function del(seq) {
         let result = confirm("정말 삭제하시겠습니까?");
         if (result) {
            location.href = "/rural/market/delok.do?seq="+ seq;
         } else {

        }
     }

	//문의사항 삭제(User)
    function delqna(seq,pseq) {
        let result = confirm("문의사항을 삭제하시겠습니까?");
        if (result) {
           location.href = "/rural/market/delqna.do?seq="+ seq + "&pseq="+pseq;
        } else {

       }
    }

	//농업인 답변삭제(farmer)
    function delreqna(seq,pseq) {
        let result = confirm("답변을 삭제하시겠습니까?");
        if (result) {
           location.href = "/rural/market/delreqna.do?seq="+ seq + "&pseq="+pseq;
        } else {

       }
    }

    function shareTwitter() {
        var sendText = "슬기로운 농촌생활"; // 전달할 텍스트
        var sendUrl = "/rural/market/view.do?seq=${dto.seq}/"; // 전달할 URL
        window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
    }


    /* 카카오 */
    function shareKakao() {

  // 사용할 앱의 JavaScript 키 설정
  Kakao.init('eeafda384681d9c8849627417732b4cc');

  // 카카오링크 버튼 생성
  Kakao.Link.createDefaultButton({
    container: '#btnKakao', // 카카오공유버튼ID
    objectType: 'feed',
    content: {
      title: "${dto.brandName}", // 보여질 제목
      description: "${dto.detail}", // 보여질 설명
      imageUrl:'http://k.kakaocdn.net/dn/b4ZDkL/btraWuquBQG/BqAj3eUu7p0Yz3XeIjzwu0/kakaolink40_original.jpg', // 콘텐츠 URL
      link: {
         mobileWebUrl: "devpad.tistory.com/",
         webUrl: "devpad.tistory.com/"
      }
    }
  });
}


	</script>
</body>
</html>