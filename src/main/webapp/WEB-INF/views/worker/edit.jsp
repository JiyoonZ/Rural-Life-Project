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
	#subject {
		font-family: "Barlow Condensed";
		font-size: 20px;
		font-weight: 700;
	}

	#tbl > tbody > tr > th {
		text-align: center;
	}
	
	#startDate, #endDate, #isEnd {
		width: 180px;
		display: inline-block;
	} 
	
	#title {
		width: 400px;
	} 
	
	#totalPerson, #sido, #gugun, #tel {
		width: 150px;
		display: inline-block;
	}
	
	#phoneNum, #cropInfo, #pay {
		width: 200px;
		display: inline-block;
	}
	
	#maxAge, #minAge {
		width: 100px;
		display: inline-block;
	}
	
	#detail {
		width: 1050px;
		height: 500px;
		resize:none;
	}
	
	#btn {
		margin-top: 25px;
		float: right;
	}
	
	.container .table th {
		background-color: #F5F5F5;
		vertical-align: middle;
	
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
	<div class="section-padding2">
		<div class="container">
		<h2 style="margin-bottom: 30px;"><strong>수정하기</strong></h2>
		<hr style="margin-top: 10px;">
			<form method="POST" action="/rural/worker/editok.do">
				<table class="table table-bordered" id="tbl">
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" id="title"
							class="form-control" value="${dto.title}"></td>
						<th>상태</th>
						<td><select class="form-control" name="isEnd" id="isEnd">
								<c:if test="${dto.isEnd.equals('n')}">
									<option value="n">진행</option>
									<option value="y">마감</option>
								</c:if> 
								<c:if test="${dto.isEnd.equals('y')}">
									<option value="y">마감</option>
									<option value="n">진행</option>									
								</c:if> 
						</select></td>
					</tr>
					<tr>
						<th>문의처</th>
						<td><input type="text" name="tel" id="tel"
							class="form-control" maxlength="13" value="${dto.tel}"></td>
						<th>작업종료일</th>
						<td><input type="date" name="startDate" id="startDate"
							class="form-control" value=${dto.startDate}> <span>~</span> <input type="date"
							name="endDate" id="endDate" class="form-control" value=${dto.endDate}></td>
					</tr>
					<tr>
						<th>근무지역</th>
						<td><select name="sido" id="sido" class="form-control">
						</select>
							<select name="gugun" id="gugun" class="form-control"></select></td>
						<th>경력</th>
						<td>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="isCareer" name="isCareer" value="y"><label class="form-check-label"
									for="isCareer"> 경력 무관 </label>
							</div>
						</td>
					</tr>
					<tr>
						<th>모집인원</th>
						<td><input type="number" name="totalPerson" id="totalPerson"
							class="form-control" min="1" value="${dto.totalPerson}"> <span>명</span></td>
						<th>구인연령대</th>
						<td>
							<div>
								<input type="number" name="minAge" id="minAge"
									class="form-control" min="10" step="10" value="${dto.minAge}"><span>대
									~ </span> <input type="number" name="maxAge" id="maxAge"
									class="form-control" min="10" value="${dto.maxAge}"><span>대</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>작물 정보</th>
						<td colspan="3"><select class="form-control" name="cropInfo"
							id="cropInfo">
								<option value="${dto.cropInfo}">${dto.cropInfo}</option>
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
						<th>임금조건</th>
						<td><input type="number" name="pay" id="pay"
							class="form-control" min="0" value="${dto.pay}"><span> 원</span></td>
						<th>상세 주소</th>
						<td><input type="button" onClick="goPopup();" value="주소검색">
							<input type="text" id="address" name="address" value="${dto.address}"></td>
					</tr>
					<tr>
						<th>상세 내용</th>
						<td colspan="3">
							<textarea name="detail" id="detail" class="form-control">${dto.detail}</textarea>
						</td>
					</tr>
				</table>


				<div class="btns" id="btns" style="text-align: center;">
					<button class="btn btn-success" type="submit">수정하기</button>
					<button class="btn btn-secondary"
						onclick="location.href='/rural/worker/list.do';">뒤로가기</button>
				</div>
				
				<input type="hidden" name="seq" value="${dto.seq}">
				
			</form>

		</div>



	</div>

	<%@ include file="/inc/footer.jsp"%>
	<%@ include file="/inc/init.jsp"%>

	   <%@ include file="/inc/address.jsp" %>
   
   <script>
   
      //지역 선택 Select Box
      $('document').ready(function() {
         
          // 시/도 선택 박스 초기화
          $("#sido").append("<option value='${dto.city}'>"+ "${dto.city}" +"</option>");
         sido.forEach(function(item) {            
            $("#sido").append("<option value='" + item + "'>" + item + "</option>");
         });
         
          
          // 구/군 선택 박스 초기화
         $("#gugun").append("<option value='${dto.gu}'>" + "${dto.gu}" + "</option>");
          
         // 시/도 선택시 구/군 설정
         $("#sido").change(function() {
             $("#gugun").children("option").remove(); // 구군 초기화
             $("#gugun").append("<option value=''>전체</option>");
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
      
   </script>

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
    	 $("#address").val(roadAddrPart1.replace((roadAddrPart1.split(" ")[0] + " " + roadAddrPart1.split(" ")[1] + " "), "") + ", " + addrDetail);
     }

     // 수정 - 체크박스
	<c:if test="${dto.isCareer.equals('y')}">
    	$("input:checkbox[id='isCareer']").prop("checked", true);
 	</c:if>

	</script>
</body>
</html>