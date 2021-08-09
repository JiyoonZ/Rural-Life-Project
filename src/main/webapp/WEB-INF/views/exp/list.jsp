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
#apply, #registList {
	margin-left: 88%;
	position: relative;
	top: 70px;
}

#regist {
	margin-left: 92%;
	margin-bottom: 20px;
}

#region {
	width: 55%;
}

.form-row .form-group {
	margin-bottom: 0px;
	width: 95%;
}

table tr th {
	width: 10%;
	text-align: center;
	background-color: #F5F5F5;
}

.container .table td, .container .table th {
	vertical-align: middle;
}

#sido, #gugun {
	margin-left: 8px;
}

h3 {
	clear: both;
	display: inline;
}

.detailopen {
	/* background-color: red; */
	text-align: right;
	cursor: pointer;
}


label{
	margin-right: 72%;
}

.place-img { width: 100%; height: 300px; overflow: hidden; border: 1px solid #f0f1f2; text-align:center;}


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
table tr th {
	width: 10%;
	text-align: center;
	background-color: #F5F5F5;
}

#btns {
	text-align: justify border: 1px solid red;
}
.listSection ul:nth-child(3) li:first-child {margin-left:15px;}
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
							<c:if test="${not empty lv && lv eq '1'}">
								<button type="button" class="btn btn-dark" id="apply" onclick="location.href='/rural/exp/applylist.do';">신청내역보기</button>
							</c:if>
							<c:if test="${not empty lv && lv eq '2'}">
								<button type="button" class="btn btn-dark" id="registList"
									onclick="location.href='/rural/exp/addlist.do';">등록내역보기</button>
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
			<form method="GET" id="searchForm" action="/rural/exp/list.do" >
			<input type="hidden" id="onlyApply" name = "onlyApply"/>
			<table class="table table-bordered">
				<tr>
					<th>지역검색</th>
					<td id="region">
						<div class="form-row">

							<div class="form-group default-select">
								<select name="sido" id="sido" class="custom-select col-md-4" value="${map.paramSido}">
								</select> <select name="gugun" id="gugun" class="custom-select col-md-3" value="${map.paramGugun}">
								</select> <small>&nbsp;&nbsp;&nbsp;지역을 선택해주세요.</small>
							</div>



						</div>
					</td>
					<th>체험별 검색</th>
					<td><select name="expInf" class="custom-select" id="inputGroupSelect01">
							<option value="" selected>[ 체험선택 ]</option>
							<option value="농사체험" >농사체험</option>
							<option value="바다체험">바다체험</option>
							<option value="생태체험">생태체험</option>
							<option value="전통음식체험">전통음식체험</option>
							<option value="전통문화체험">전통문화체험</option>
							<option value="만들기체험">만들기체험</option>
							<option value="놀이체험">놀이체험</option>
							<option value="기타체험">기타체험</option>
					</select></td>
				</tr>
				<tr>
					<th>지역검색</th>
					<td colspan="3"><input name="region" type="text" value="${map.paramRegion}"
						class="form-control col-lg-6" placeholder="지역명을 입력해주세요.">
					</td>

				</tr>
			</table>

			<div class="row justify-content-md-center"
				style="margin-bottom: 30px;">
				<input class="btn btn-success col-sm-2" type="submit" value="검색하기">
			</div>
			<!-- 검색도구 끝  -->


			
			<c:if test="${not empty lv && lv eq '2'}">
				<button type="button" class="btn btn-dark" id="regist"
					onclick="location.href='/rural/exp/add.do';">등록하기</button>
			</c:if>
			<input type="checkbox" id="applyList"><label for="applyList"
				style="margin-left: 15px;">신청가능한 체험만 보기</label>

			<c:if test="${not empty map.paramRegion || not empty map.paramSido || not empty map.paramGugun || not empty map.paramExpInf || not empty map.paramOnlyApply}">
			<span class="text-right font-italic">총 ${totalCount}개의 게시물</span>
			</c:if>
			
			</form>
			<hr style="margin-top: 10px;">

			<!-- list -->

			<!-- 리스트1개 -->
			<div class="row">
			<c:forEach items="${list}" var="dto">


				<!-- 상품 리스트 ${dto.startDate} ~ ${dto.endDate}-->

				<div class="col-xl-4 col-lg-4 col-md-6">
					<div class="single-place mb-30">
					<c:if test="${not empty dto.image}">					
						<div class="place-img">
							<img src="/rural/assets/img/exp/${dto.image}" alt="sumnailImage"
								onclick="location.href='/rural/exp/view.do?seq=${dto.seq}&startDate=${dto.startDate}&endDate=${dto.endDate}';" class="img">
						</div>
					</c:if>
					<c:if test="${empty dto.image}">					
						<div class="place-img">
							<img src="/rural/assets/img/exp/noimage.gif" alt="sumnailImage"
								onclick="location.href='/rural/exp/view.do?seq=${dto.seq}&startDate=${dto.startDate}&endDate=${dto.endDate}';" class="img">
						</div>
					</c:if>
						
						<div class="place-cap">
							<div class="place-cap-top">
								<h3>
									<a href="/rural/exp/view.do?seq=${dto.seq}&startDate=${dto.startDate}&endDate=${dto.endDate}">${dto.name}</a>
								</h3>
								<span>&#11088;${dto.starRs}</span>



							</div>
							<div class="listSection place-cap-bottom">
								<ul>
									<li>체험종류</li>
									<li>${dto.expInfo}</li>
								</ul>
								<ul>
									<li>체험기간</li>
									<li>${dto.startDate} ~ ${dto.endDate}</li>
								</ul>
								<ul>
									<li>마을명</li>
									<li>${dto.town}</li>
								</ul>
								<ul>
									<div class="detailopen">
										<input type="button" class="btn btn-secondary" value="상세보기"
											onclick="location.href='/rural/exp/view.do?seq=${dto.seq}';">
									</div>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
			<!-- 리스트 1개 끝 -->
			<c:if test="${list.size()==0}">
				<blockquote class="blockquote text-center">
					<p class="mb-0">게시물이 없습니다.</p>
				</blockquote>
			</c:if>
			<!-- 페이지바 -->
			<!-- <div class="row justify-content-md-center">
				<nav aria-label="...">
					<ul class="pagination">
						<li class="page-item disabled">
							<a class="page-link" href="#" tabindex="-1">Previous</a>
						</li>
						<li class="page-item active">
							<a class="page-link" href="#">1</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">2</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">3</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</nav>
			</div> -->
			
			<div class="pagebar">
				${pagebar}
			</div>
			<!-- 페이지바 끝-->
		</div>
	</div>

	<!-- Favourite Places End -->


	



	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>

	<script>

    var area0 = ["서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
    
    var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
    var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
    var area3 = ["대덕구","동구","서구","유성구","중구"];
    var area4 = ["광산구","남구","동구",     "북구","서구"];
    var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
    var area6 = ["남구","동구","북구","중구","울주군"];
    var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
    var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
    var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
    var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
    var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
    var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
    var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
    var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
    var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
    var area16 = ["서귀포시","제주시","남제주군","북제주군"];

	$('document').ready(function() {
        

         // 시/도 선택 박스 초기화

        $("#sido").each(function() {
           $selsido = $(this);

           $selsido.append("<option value=''>시/도 선택</option>");
           $.each(eval(area0), function() {
                 $selsido.append("<option value='"+this+"'>"+this+"</option>");
             });
           $selsido.next().append("<option value=''>구/군 선택</option>");
         });
  
         if('${map.paramOnlyApply}' == 'Y'){
        	 $("#applyList").prop('checked', true);
         }
        $("#sido").val('${map.paramSido}');//.trigger('change');

				/*area + (현재 옵션에서 몇번째 인덱스가 selected 되었는지)~16  */
        setArea("area"+$("option",$(this)).index($("option:selected",$(this))));
        $("#gugun").val('${map.paramOrgGugun}');  
       	if('${map.paramExpInf}' != ""){
            $("#inputGroupSelect01").val('${map.paramExpInf}');       		
       	}
        // 시/도 선택시 구/군 설정
  
        $("#sido").change(function() {
            var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
            
            setArea(area);
        });
        $("#applyList").change(function(e) {
        	if(e.target.checked)
        		$("#onlyApply").val("Y");
        	else
        		$("#onlyApply").val("N");
        	$("#searchForm").submit();
        });
        
     });
	function setArea(area){
		var $gugun = $("#gugun"); // 선택영역 군구 객체
        $("option",$gugun).remove(); // 구군 초기화
        if(area == "area0")
             $gugun.append("<option value=''>구/군 선택</option>");
         else {

             $gugun.append("<option value=''>구/군 선택</option>");
             $.each(eval(area), function() {
              	$gugun.append("<option value='"+this+"'>"+this+"</option>");
             });
         }
	}
	
	</script>
</body>
</html>