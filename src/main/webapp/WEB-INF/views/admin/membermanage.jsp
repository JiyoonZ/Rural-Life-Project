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
#manageMem {
	
	position: relative;
	top: 55px;
}
#searchBar {width: 80%; margin: 0px auto;}
#memSearch {width:600px; margin-right: 50px;}
#searchOp {width: 93%; margin: 0 auto;}
#list { margin-top: 50px;}
#searchOp tr td:first-child {width: 40%;}
#searchOp tr td:nth-child(2) label {margin-right:60px;}
</style>
</head>
<body>

	<!-- 홈화면에서 카테고리 들어갔을 처음 나오는 화면 -->
	<%@ include file="/inc/header.jsp" %>
	
       <!-- 이미지 카테고리명 -->
        <div class="slider-area ">
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="/rural/assets/img/hero/about.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap">
                                <h2>회원 관리</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<!-- 구현부 -->
        <div class="section-padding2">
            <div class="container">
				  
	           		<!-- 검색바 -->
	           		<div class="row justify-content-md-center" style="width: 100%; margin-bottom: 30px;">
		            	<form method="GET" action="/rural/admin/membermanage.do" style="display:inline-block;">
	                      	<select name="column" id="column" class="form-control" style="width: 130px; display:inline-block;">
								<option value="전체">전체회원</option>
								<option value="일반">일반회원</option>
								<option value="농업인">농업인회원</option>
		               		</select>
			                
							<input type="text" name="search" id="search" class="form-control" required 
								placeholder="검색할 아이디를 입력하세요." style="width: 300px; display:inline-block;"/>
							<input type="submit" value="검색하기" class="btn btn-secondary" style="margin-left: 10px; margin-bottom: 10px;"/>
		           		</form>
	           		</div>
					<!-- 검색끝 -->
					
					<!-- 게시글 리스트 정렬순 ( 최신순 / 댓글순 / 조회수 ) -->
	         		<div style="margin-top: 10px; margin-bottom: 5px; float: right; font-size:14px;">
	         			<a href="/rural/admin/membermanage.do?sort=전체">전체회원</a>&nbsp;/&nbsp;
	         			<a href="/rural/admin/membermanage.do?sort=정상">정상회원</a>&nbsp;/&nbsp;
	         			<a href="/rural/admin/membermanage.do?sort=탈퇴">탈퇴회원</a>&nbsp;/&nbsp;
	         			<a href="/rural/admin/membermanage.do?sort=정지">정지회원</a>
	           		</div>
					
					<!-- 검색 결과 개수 -->
	           		<c:if test="${ map.search != '' && map.isSearch == 'y'}">
						<div style="margin-top: 10px; margin-bottom: 10px;">
							'${ map.search }'으로 검색한 결과 ${ list.size() }개의 게시물이 있습니다.
						</div>		
					</c:if>
					
					<!-- 테이블 시작  -->
					<table class="table text-center table-hover" id="list">
						<thead class="thead-light text-center">
							<tr>
								<th scope="col">회원유형</th>
								<th scope="col">아이디</th>
								<th scope="col">이름</th>
								<th scope="col">가입날짜</th>
								<th scope="col">상태</th>
								<th scope="col">처리</th>
							</tr>
						</thead>
						<tbody>
							
							<c:forEach items="${ list }" var="dto">
							<c:if test="${ dto.lv != 3 }">
								<tr>
									<c:if test="${ dto.lv == 1 }">
										<td>일반</td>
									</c:if>
									<c:if test="${ dto.lv == 2 }">
										<td>농업인</td>
									</c:if>
									<td>${ dto.id }</td>
									<td>${ dto.name }</td>
									<td>${ dto.regDate }</td>
									<c:if test="${ dto.isOut eq 'y' }">
										<td>탈퇴 회원</td>
									</c:if>
									<c:if test="${ dto.isOut eq 'n' }">
										<c:if test="${ dto.isStop eq 'y' }">
										<td>정지 회원</td>
										</c:if>
										<c:if test="${ dto.isStop eq 'n' }">
										<td>정상 회원</td>
										</c:if>
									</c:if>
									<td>
										<c:if test="${ dto.isStop eq 'y' && dto.isOut eq 'n'}">
											<input type="button" class="btn btn-success btn-sm" value="정지해제" onclick="isStopN('${ dto.id }');"/>
										</c:if>
										<c:if test="${ dto.isStop eq 'n' && dto.isOut eq 'n'}">
											<input type="button" class="btn btn-danger btn-sm" value="정지하기" onclick="isStopY('${ dto.id }');"/>
										</c:if>
									</td>
								</tr>			
							</c:if>
							</c:forEach>
						</tbody>
					</table>
										
					<!-- 페이지바 -->
	           		<div class="row justify-content-md-center" style="width: 100%">
						${ pagebar }
					</div>
					
					<input type="button" class="btn btn-secondary" value="돌아가기"
							onclick="history.back();">
            </div>
        </div>
	
 	<%@ include file="/inc/footer.jsp" %>
 	<%@ include file="/inc/init.jsp" %>
	
	<script>
	
	
		// 회원 정지하기
		function isStopY(id) {
			
	        let result = confirm("정말 정지 시키겠습니까?");
	        if (result) {
	        	
	           location.href = "/rural/admin/memberstopy.do?id="+ id;
	           
	        } else {
	        	
	    	}
	    }
		
		// 회원 정지풀기
		function isStopN(id) {
	        let result = confirm("정말 정지를 해제 하시겠습니까?");
	        if (result) {
	           location.href = "/rural/admin/memberstopn.do?id="+ id;
	        } else {
	        	
	    	}
	    }
	
	</script>
</body>
</html>