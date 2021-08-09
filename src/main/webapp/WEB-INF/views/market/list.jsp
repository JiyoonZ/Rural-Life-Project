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
	clear: both;
	display: inline;
}
.detailopen {
	/* background-color: red; */
	text-align: right;
	cursor: pointer;
}
.place-img {
    object-fit: cover;
	width: 350px;
	height: 418px;
	overflow: hidden;
	border: 1px solid #f0f1f2;
	text-align: center;
	cursor:pointer;
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
.search {
	width: 600px;
	height: calc(2.25rem + 2px);
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}
table tr th {
	width: 20%;
	text-align: center;
	background-color: #F5F5F5;
}
#btns {
	text-align: justify
}
#registList {
	margin-left: 88%;
	position: relative;
	top: 70px;
}
.nav-item {
	cursor: pointer;
}
.like {
	width: 48px;
	height: 45px;
}
.pagebar {
	text-align: center;
	display: block;
}
#isLike {
	width: 20px;
	height:20px;
}
#menubox #navibar .active {
    border-radius: 10%;
    background-color: #EEE;
}
#menubox #navibar .disabled:hover {
    background-color: #EEE;
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

							<c:if test="${not empty id &&  lv == 2}">
								<button type="button" class="btn btn-dark" id="registList"
									onclick="location.href='/rural/market/addlist.do?id=${dto.id}';">등록내역보기</button>
							</c:if>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- 검색기능 -->
	<div class="section-padding2">
		<div class="container">

			<form method="GET" id="listForm" name="listForm" action="/rural/market/list.do">
				<table class="table table-bordered">
					<tr>
						<th>키워드 검색</th>
						<td><input type="text" id="search" name="search" value="${map.search}"
							class="form-control col-lg-13" placeholder="검색어를 입력해주세요."></td>
					</tr>
				</table>

				<div class="row justify-content-md-center"
					style="margin-bottom: 30px;">
					<input class="btn btn-success col-sm-2" type="submit"
						value="검색하기">
				</div>


			<c:if test="${map.isSearch == 'y' && map.marketinfo == null}">
				<div class="alert alert-secondary" style="padding: 30px;">'${map.search}'으로
					검색한 결과 ${list.size()}개의 게시물이 있습니다.</div>
			</c:if>


			<div class="favourite-place section-padding2">
				<div class="container">

					<!-- 		list.do?category=주말농장&search=키워드
			list.do?category=주말농장&search=키워드&avilable=y -->

					<div class="section-padding2">
						<div class="container">

								<!-- MarketInfo 메뉴 -->

								<div id="menubox">
									<ul class="nav nav-tabs" id="navibar"
					style="font-size: 1em; font-weight: bold; margin-bottom: 20px;">


					<c:if test="${ not empty marketinfo }">
						<li class="nav-item"><a class="nav-link disabled"
							href="/rural/market/list.do">전체보기</a></li>
					</c:if>


					<c:if test="${ empty marketinfo }">
						<li class="nav-item"><a class="nav-link active"
							href="/rural/market/list.do">전체보기</a></li>
					</c:if>

					<c:if test="${ marketinfo != '쌀/잡곡' }">
						<li class="nav-item"><a class="nav-link disabled"
							href="/rural/market/list.do?marketinfo=쌀/잡곡&search=${ search }&isLike=${ isLike }">쌀/잡곡</a></li>
					</c:if>
					<c:if test="${ marketinfo == '쌀/잡곡'}">
						<li class="nav-item"><a class="nav-link active"
							href="/rural/market/list.do?marketinfo=쌀/잡곡&search=${ search }&isLike=${ isLike }">쌀/잡곡</a></li>
					</c:if>

					<c:if test="${ marketinfo != '과일/견과'}">
						<li class="nav-item"><a class="nav-link disabled"
							href="/rural/market/list.do?marketinfo=과일/견과&search=${ map.search }&isLike=${ map.isLike }">과일/견과</a></li>
					</c:if>
					<c:if test="${ marketinfo == '과일/견과'}">
						<li class="nav-item"><a class="nav-link active"
							href="/rural/market/list.do?marketinfo=과일/견과&search=${ map.search }&isLike=${ map.isLike }">과일/견과</a></li>
					</c:if>


					<c:if test="${ marketinfo != '채소/버섯'}">
						<li class="nav-item"><a class="nav-link disabled"
							href="/rural/market/list.do?marketinfo=채소/버섯&search=${ map.search }&isLike=${ map.isLike }">채소/버섯</a></li>
					</c:if>
					<c:if test="${ marketinfo == '채소/버섯'}">
						<li class="nav-item"><a class="nav-link active"
							href="/rural/market/list.do?marketinfo=채소/버섯&search=${ map.search }&isLike=${ map.isLike }">채소/버섯</a></li>
					</c:if>

					<c:if test="${ marketinfo != '정육/계란'}">
						<li class="nav-item"><a class="nav-link disabled"
						href="/rural/market/list.do?marketinfo=정육/계란&search=${ map.search }&isLike=${ map.isLike }">정육/계란</a></li>
					</c:if>
					<c:if test="${ marketinfo == '정육/계란'}">
						<li class="nav-item"><a class="nav-link active"
						href="/rural/market/list.do?marketinfo=정육/계란&search=${ map.search }&isLike=${ map.isLike }">정육/계란</a></li>
					</c:if>

					<c:if test="${ marketinfo != '김치' }">
						<li class="nav-item"><a class="nav-link disabled"
							href="/rural/market/list.do?marketinfo=김치&search=${ map.search }&isLike=${ map.isLike }">김치</a></li>
					</c:if>
					<c:if test="${ marketinfo == '김치' }">
						<li class="nav-item"><a class="nav-link active"
							href="/rural/market/list.do?marketinfo=김치&search=${ map.search }&isLike=${ map.isLike }">김치</a></li>
					</c:if>

					<c:if test="${ marketinfo != '홍삼/건강식품' }">
						<li class="nav-item"><a class="nav-link disabled"
							href="/rural/market/list.do?marketinfo=홍삼/건강식품&search=${ map.search }&isLike=${ map.isLike }">홍삼/건강식품</a></li>
					</c:if>
					<c:if test="${ marketinfo == '홍삼/건강식품' }">
						<li class="nav-item"><a class="nav-link active"
							href="/rural/market/list.do?marketinfo=홍삼/건강식품&search=${ map.search }&isLike=${ map.isLike }">홍삼/건강식품</a></li>
					</c:if>

					<c:if test="${ marketinfo != '전통주' }">
						<li class="nav-item"><a class="nav-link disabled"
							href="/rural/market/list.do?marketinfo=전통주&search=${ map.search }&isLike=${ map.isLike }">전통주</a></li>
					</c:if>
					<c:if test="${ marketinfo == '전통주' }">
						<li class="nav-item"><a class="nav-link active"
							href="/rural/market/list.do?marketinfo=전통주&search=${ map.search }&isLike=${ map.isLike }">전통주</a></li>
					</c:if>

				</ul>
								</div>



							<!-- 관심내역 체크 -->
							<div class="row justify-content-between"
								style="padding: 15px; margin-top: 20px;">
								<div>
									<input type="checkbox" id="isLike" name="isLike" <c:if test="${map.isLike eq 'y'}">checked</c:if> /> <label for="likeList" style="margin-left: 15px;">관심내역 보기 </label>
								</div>

								<c:if test="${not empty id &&  lv == 2}">
								<button type="button" class="btn btn-success"
									onclick="location.href='/rural/market/add.do';">글쓰기</button>
								</c:if>
							</div>
						</form>


							<!-- Section Tittle -->

							<div class="row">


								<!-- 상품 리스트 -->
								<c:if test="${list.size() == 0}">
									<div>
										<div class=" alert alert-light "
											style="padding: 30px; text-align: center;">직거래 내역이
											없습니다.</div>
									</div>
								</c:if>


									<c:forEach items="${list}" var="dto">
										<div class="col-xl-4 col-lg-4 col-md-6" style=" display: block;">
											<div class="single-place mb-30">
												<div class="place-img">
													<img src="/rural/assets/img/market/${dto.image}" alt="image"
														onclick="location.href='/rural/market/view.do?seq=${dto.seq}';"
														class="img">
												</div>
												<div class="place-cap">
													<div class="place-cap-top d-flex img-section">
														<h3>
															<a href="/rural/market/view.do?seq=${dto.seq}">${dto.brandName}</a>

														</h3>
														<!-- 좋아요 기능 -->
														<img src="/rural/assets/img/market/unlike.png" id="like"
															name="like" class='ml-auto p-2 like' style="display: none;"
															onclick="location.href='/rural/market/likeok.do?seq=${dto.seq}';">


														<c:forEach items="${likelist}" var="ldto">
															<c:if test="${dto.seq == ldto.seq && id == ldto.id}">
															<img src="/rural/assets/img/market/like.png"
																id="unlike" name="unlike" class='ml-auto p-2 like'
																onclick="location.href='/rural/market/likedel.do?seq=${dto.seq}';">
															</c:if>
														</c:forEach>

														<input type="hidden" name="seq" value="${dto.seq}">

													</div>
													<div class="place-cap-bottom">
														<ul>
															<li>${dto.marketInfo}>${dto.name}</li>
														</ul>
														<ul>
															<div class="detailopen">
																<input type="button" class="btn btn-secondary"
																	value="상세보기"
																	onclick="location.href='/rural/market/view.do?seq=${dto.seq}';"></a>
															</div>
														</ul>
													</div>
												</div>
											</div>
										</div>


									</c:forEach>

									<c:if test="${isLike == 'n'}">
										<!-- 페이징바 -->
										<div class="row justify-content-md-center" style="width: 100%">${pagebar}</div>
									</c:if>
								</div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>


	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>

	<script>
		<c:if test="${map.isSearch == 'y'}">
			//상태 복원
			$('#search').val('${map.search}');
		</c:if>
		$(document).ready(function(){
		    $("#isLike").change(function(){
		        if($("#isLike").is(":checked")){
					$('#listForm').submit();
		        }else{
		        	location.href = "/rural/market/list.do?marketinfo=${map.marketinfo}&search=${map.search}&isLike=";
		        }
		    });
		});

		/* 좋아요 토글 */
		$(document).ready(function(){
			$(".img-section").each(function(index, item) {
				if ($(item).children().length == 3 ) {
					$(item).children().eq(1).css("display", "block");
				}
			});
		});
	</script>
</body>
</html>