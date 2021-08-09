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

	.table {
		text-align: center;
	}

	.table th:nth-child(1) { width: 80px; }
	.table th:nth-child(2) { width: 150px; }
	.table th:nth-child(3) { width: auto; }
	.table th:nth-child(4) { width: 120px; }
	.table th:nth-child(5) { width: 120px; }
	.table th:nth-child(6) { width: 120px; }
	
	.table td:nth-child(3) { text-align: left; }
	
	.table #content { color: black; }
	.table #content:hover { text-decoration: underline; }
	
	.btns {
		text-align: center;
	}
	
	#list:hover {
		background-color: #EEE;
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
	<%@ include file="/inc/header.jsp" %>
	
       <!-- 이미지 카테고리명 -->
        <div class="slider-area ">
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="/rural/assets/img/hero/community.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap">
                                <h2>커뮤니티</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
		<!-- 구현부 -->
        <div class="section-padding2">
            <div class="container">
            
            	<!-- 커뮤니티 메뉴 -->
            	<div id="menubox">
            		<!-- 카테고리 네비바 -->
					<ul class="nav nav-tabs" id="navibar" style="font-size:1em; font-weight: bold; margin-bottom: 20px;" >
	               		
	               		
           			   	<c:if test="${ category != '전체보기' }">
	               		<li class="nav-item">
	               			<a class="nav-link disabled" href="/rural/community/list.do?category=전체보기&sort=${ sort }&column=${ colum }&search=${ search }#board">
	               			전체보기</a>
	               		</li>
	               		</c:if>
	               		
	               		<c:if test="${ category == '전체보기' }">
	               		<li class="nav-item">
	               			<a class="nav-link active" href="/rural/community/list.do?category=전체보기&sort=${ sort }&column=${ colum }&search=${ search }#board">
	               			전체보기</a>
	               		</li>
	               		</c:if>
	
						<c:if test="${ category != '일손돕기' }">
						<li class="nav-item">
							<a class="nav-link disabled" href="/rural/community/list.do?category=일손돕기&sort=${ sort }&column=${ colum }&search=${ search }#board">
							일손돕기</a>
						</li>
						</c:if>
						
						<c:if test="${ category == '일손돕기' }">
						<li class="nav-item">
							<a class="nav-link active" href="/rural/community/list.do?category=일손돕기&sort=${ sort }&column=${ colum }&search=${ search }#board">
							일손돕기</a>
						</li>
						</c:if>
						
						
						<c:if test="${ category != '농촌체험' }">
						<li class="nav-item">
							<a class="nav-link disabled" href="/rural/community/list.do?category=농촌체험&sort=${ sort }&column=${ colum }&search=${ search }#board">
							농촌체험</a>
						</li>
						</c:if>
						
						<c:if test="${ category == '농촌체험' }">
						<li class="nav-item">
							<a class="nav-link active" href="/rural/community/list.do?category=농촌체험&sort=${ sort }&column=${ colum }&search=${ search }#board">
							농촌체험</a>
						</li>
						</c:if>
						
						<c:if test="${ category != '주말농장' }">
						<li class="nav-item"><a class="nav-link disabled" 
							href="/rural/community/list.do?category=주말농장&sort=${ sort }&column=${ colum }&search=${ search }#board">
							주말농장</a>
						</li>
						</c:if>	

						<c:if test="${ category == '주말농장' }">
						<li class="nav-item">
							<a class="nav-link active" href="/rural/community/list.do?category=주말농장&sort=${ sort }&column=${ colum }&search=${ search }#board">
							주말농장</a>
						</li>
						</c:if>	
						
						<c:if test="${ category != '농작물 직거래' }">
						<li class="nav-item">
							<a class="nav-link disabled" href="/rural/community/list.do?category=농작물 직거래&sort=${ sort }&column=${ colum }&search=${ search }#board">
							농작물 직거래</a>
						</li>
						</c:if>
						
						<c:if test="${ category == '농작물 직거래' }">
						<li class="nav-item">
							<a class="nav-link active" href="/rural/community/list.do?category=농작물 직거래&sort=${ sort }&column=${ colum }&search=${ search }#board">
							농작물 직거래</a>
						</li>
						</c:if>
						
	                </ul>
                </div>

				<!-- 내가 쓴글 보기(회원) -->
        		<c:if test="${ not empty id }">
	           		<input type="button" name="my" value="내가 쓴글 보기" class="btn btn-primary" style="margin-bottom: 10px; " id="board"
							onclick="location.href='/rural/community/list.do?id=${ id }';"/>
	           	</c:if>
           		
           		<!-- 게시글 리스트 정렬순 ( 최신순 / 댓글순 / 조회수 ) -->
         		<div style="margin-top: 10px; margin-bottom: 5px; float: right; font-size:14px;">
         			<a href="/rural/community/list.do?sort=최신순&category=${ category }&column=${ colum }&search=${ search }">최신순</a>&nbsp;/&nbsp;
         			<a href="/rural/community/list.do?sort=댓글순&category=${ category }&column=${ colum }&search=${ search }">댓글순</a>&nbsp;/&nbsp;
         			<a href="/rural/community/list.do?sort=조회순&category=${ category }&column=${ colum }&search=${ search }">조회순</a>
           		</div>
            	
           		<!-- 검색 결과 개수 -->
           		<c:if test="${ map.search != '' && map.isSearch == 'y'}">
					<div style="margin-top: 10px; margin-bottom: 10px;">
						'${ map.search }'으로 검색한 결과 ${ list.size() }개의 게시물이 있습니다.
					</div>		
				</c:if>
           		
           		<!-- 게시글 리스트 ( 번호, 메뉴, 제목, 작성날짜, 작성자, 조회수 ) -->
           		<table class="table">
		           	<tr>
						<th>글 번호</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>날짜</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
					<c:if test="${ list.size() == 0 }">
						<tr>
							<td colspan="5">게시글이 없습니다.</td>
						</tr>
					</c:if>
					
					<c:forEach items="${ list }" var="dto">
					<tr id="list">
						<td>${ dto.seq }</td>
						<td>${ dto.category }</td>
						<td>
							<!-- 제목 클릭시 이동 -->
							<a href="/rural/community/view.do?seq=${ dto.seq }&column=${ map.column }&search=${ map.search }" id="content">${ dto.title }</a>
							
							<!-- 이미지파일, 댓글수, 새로운 글(new) -->
							<span style="margin-left: 10px;">
								<c:if test="${ dto.imgCnt > 0 }">
									<img src="/rural/assets/img/logo/icon.png" style="border-radius: 50%; width:25px;"/>
								</c:if>
								<c:if test="${ dto.ccnt > 0 }">
									<span class="badge badge-pill badge-primary">${ dto.ccnt }</span>
								</c:if>
								<c:if test="${ dto.isnew < (2 / 24)}">
									<span class="badge badge-pill badge-danger">N</span>
								</c:if>
							</span>
						</td>
						<td>${ dto.regdate }</td>
						<td>${ dto.name }</td>
						<td>${ dto.cnt }</td>
					</tr>
					</c:forEach>
           		</table>
           		
           		<!-- 페이지바 -->
           		<div class="row justify-content-md-center" style="width: 100%">
					${ pagebar }
				</div>
				
           		<!-- 검색바 -->
           		<div class="row justify-content-md-center" style="width: 100%; margin-top: 30px;">
	            	<form method="GET" action="/rural/community/list.do" style="display:inline-block;">
                      	<select name="column" id="column" class="form-control" style="width: 100px; display:inline-block;">
							<option value="title">제목</option>
							<option value="detail">내용</option>
							<option value="name">이름</option>
							<option value="all">제목+내용</option>
	               		</select>
		                
						<input type="text" name="search" id="search" class="form-control" required 
							placeholder="검색어를 입력하세요." style="width: 300px; display:inline-block;"/>
						<input type="submit" value="검색하기" class="btn btn-secondary" style="margin-left: 10px; margin-bottom: 10px;"/>
						
						<input type="hidden" name="category" value="${ category }" />
						<input type="hidden" name="sort" value="${ sort }" />
	           		</form>
           		</div>
        		
        		<!-- 글쓰기버튼(회원) -->
           		<c:if test="${ not empty id }">
					<input type="button" class="btn btn-success" value="글쓰기" style="float: right;"
						onclick="location.href='/rural/community/add.do?${ seq }';">
				</c:if>
           		
            </div>
        </div>
	
 	<%@ include file="/inc/footer.jsp" %>
 	<%@ include file="/inc/init.jsp" %>
	<script>


	
	</script>
</body>
</html>