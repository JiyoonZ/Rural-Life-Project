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
#applicant {
	float: right;
}

#applylist, #addlist {
   margin-left: 88%;
   position: relative;
   top: 70px;
}

#search {
	margin: 30px auto;
	display: block;
}

#possible {
	margin-bottom: 20px;
}

#detail {
	margin-top: 15px;
}

#addButton {
	float: right;
	margin: 5px 0;
}

#sido, #gugun {
	width: 150px;
	float: left;
}

.table {
	width: 1150px;
}

.container .table td, .container .table th {
	vertical-align: middle;
}

.container .table th {
	text-align: center;
	background-color: #F5F5F5;
}

#content td {
	text-align: center;
}

#viewbtn {
	margin-bottom: 15px;
}

#list:hover {
      background-color: #EEE;
   }
#gugun {
	margin-left: 5px;
}   
   
input[type=checkbox] {
	zoom: 1.3;
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

								<c:if test="${not empty id && lv == 1}">
									<button type="button"
										onclick="location.href='/rural/worker/applylist.do';"
										class="btn btn-secondary" id="applylist">신청내역보기</button>
								</c:if>
	
								<c:if test="${not empty id && lv == 2}">
									<button type="button" 
										onclick="location.href='/rural/worker/addlist.do';"
										class="btn btn-secondary" id="addlist">등록내역보기</button>
								</c:if>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 구현부 -->
	<div class="section-padding2">
		<div class="container">

			<!-- 검색 -->
			<div class="searchbox">
				<form method="GET" action="/rural/worker/list.do">
					<table class="table table-bordered">
						<tr>
							<th>지역검색</th>
							<td id="region"><select name="sido" id="sido"
								class="form-control"></select> <select name="gugun" id="gugun"
								class="form-control"></select></td>
							<th>작물검색</th>
							<td><select class="form-control" name="cropInfo" id="cropInfo">
									<option value="">선택</option>
									<option value="과수류">과수류</option>
									<option value="과채류">과채류</option>
									<option value="경엽채류">경엽채류</option>
									<option value="근채류">근채류</option>
									<option value="인경채류">인경채류</option>
									<option value="곡류">곡류</option>
									<option value="두류">두류</option>
									<option value="서류">서류</option>
									<option value="유지류">유지류</option>
									<option value="약초류">약초류</option>
									<option value="산채류">산채류</option>
									<option value="인삼류">인삼류</option>
							</select></td>
						</tr>
						<tr>
							<th>수당</th>
							<td colspan="3"><input type="number" name="pay" id="pay">
							</td>
						</tr>
					</table>
					<button type="submit" class="btn btn-success col-sm-2" name="search"
						id="search">검색하기</button>

					<c:if test="${not empty id && lv == 2}">
						<button type="button"
							onclick="location.href='/rural/worker/add.do';"
							class="btn btn-secondary" id="addButton">등록하기</button>
					</c:if>

					<div style="clear: both;"></div>

					<input type="hidden" name="possible" value="${dto.possible}">
					
				</form>
				
					<input type="checkbox" id="possible" name="possible" value="y">
					<label for="possible">신청가능한 공고만 보기</label>
				
			</div>


			<!-- 내용 -->
			<table class="table table-bordered" id="content">
				<tr>
					<th>지역</th>
					<th>농업인이름</th>
					<th>작물종류</th>
					<th>모집내용</th>
					<th>수당</th>
					<th>기간</th>
					<th>문의처</th>
					<th>지원</th>
				</tr>
				
				<c:forEach items="${list}" var="dto">
					<tr id="list">
						<td>${dto.city}  ${dto.gu}</td>
						<td>${dto.name}</td>
						<td>${dto.cropInfo}</td>
						<td>${dto.title}
							<div id="detail">
								<button class="btn btn-secondary" id="viewbtn"
									onclick="location.href='/rural/worker/view.do?seq=${dto.seq}';">자세히보기</button>
							</div>
						</td>
						<td>${dto.pay}원</td>
						<td>
							<div>${dto.startDate}</div>
							<div>~</div>
							<div>${dto.endDate}</div>
						</td>
						<td>${dto.tel}</td>
						<td>
							<c:if test="${dto.isEnd == 'n'}">
								<button
									onclick="location.href='/rural/worker/apply.do?seq=${dto.seq}';"
									class="btn btn-info">지원신청</button>
							</c:if> 
							<c:if test="${dto.isEnd == 'y'}">
								<button class="btn btn-secondary" disabled="disabled" style="cursor: default;">지원신청</button>
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
				<!-- 페이징바 -->
				<div class="row justify-content-md-center" style="width: 100%">
				${pagebar}
				</div>
		</div>

	</div>

	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>
   <%@ include file="/inc/address.jsp" %>
   
   <script>
   
      //지역 선택 Select Box
      $('document').ready(function() {
         
          // 시/도 선택 박스 초기화
          $("#sido").append("<option value=''>선택</option>");
         sido.forEach(function(item) {            
            $("#sido").append("<option value='" + item + "'>" + item + "</option>");
         });
          
          // 구/군 선택 박스 초기화
         $("#gugun").append("<option value=''>선택</option>");
          
         // 시/도 선택시 구/군 설정
         $("#sido").change(function() {
             $("#gugun").children("option").remove(); // 구군 초기화
             $("#gugun").append("<option value=''>선택</option>");
             for (var i=0; i<sido.length; i++) {
               if (this.value == sido[i]) {
                  gugun[i].forEach(function(item) {
                     $("#gugun").append("<option value='" + item + "'>" + item + "</option>");                  
                  });
                  
                  break;
               }
            }
         });
         
         <c:if test="${map.isSearch == 'y' && !map.sido.equals('')}">
            $('#sido').val('${map.sido}');
            for (var i=0; i<sido.length; i++) {
               if (sido[i] == '${map.sido}') {
                  gugun[i].forEach(function(item) {
                     $("#gugun").append("<option value='" + item + "'>" + item + "</option>");                  
                  });
                  break;
               }
            }
            $('#gugun').val('${map.gugun}');
         </c:if>
      });
      
      
      
      // 상태 복원
      <c:if test="${map.isSearch == 'y'}">
      	$('#pay').val('${map.pay}');
      	$('#cropInfo').val('${map.cropInfo}');
      	
      	if('${map.possible}' == "y"){
      		$('#possible').prop("checked", true);
      	}
      </c:if>
      
      
      //신청가능한 공고보기
      //sido=${map.sido}&gugun=${map.gugun}&cropInfo=${map.cropInfo}&pay=${map.pay}&search=${map.search}&possible=y
      $('#possible').click(function(){
    	  if($('#possible').prop("checked")){
    		  location.href = "/rural/worker/list.do?sido=${map.sido}&gugun=${map.gugun}&cropInfo=${map.cropInfo}&pay=${map.pay}&search=${map.search}&possible=y";
    	  } else {
    		  location.href = "/rural/worker/list.do?sido=${map.sido}&gugun=${map.gugun}&cropInfo=${map.cropInfo}&pay=${map.pay}&search=${map.search}&possible=";
    	  }
      });
      
   </script>
</body>
</html>