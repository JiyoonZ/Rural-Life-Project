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
	
	.write { width: 100%; }
	
	.write .first { 
		border-top: 1px solid #CCC;
		border-bottom: 1px solid #CCC;
		height: 60px;
	}
	
	.write .first .title { 
		width: auto;
		font-weight: bold;
		display: inline-block;
		margin: 10px;
	}

	.write .first span:nth-child(2){ 
		font-size: 1em;
		width: 180px;
		float: right;
		margin-top: 15px;
	}
	
	.write .info {
		margin-top: 10px;
		height: 80px;
		border-bottom: 1px solid #CCC;
	}
	
	.write .info span:nth-child(1) {
		font-size: 1em;
	}
	
	.write .info span:nth-child(2),
	.write .info span:nth-child(3) {
		margin-right: 20px;
		float: right;
	}
	
	.write .content {
		border-bottom: 1px solid #CCC;
		margin-top: 50px;
		margin-left: 10px;
	}
	
	.list {
		margin-top: 20px;
		display: flex;
		flex-wrap: wrap;

	}
	
	.list .img {
		max-width:700px;
		max-height:500px;
		width: auto;
		height: auto;
     	margin-bottom: 30px;
     	background-repeat: no-repeat;
     	background-position: center center;
     	background-size: contain;
     	margin-right: 10px;	
	}
	
	#tblListComment {
		width: 900px;
		margin: 0 auto;
		margin-bottom: 30px;
		margin-top: 30px;
	}
	
	#tblListComment td:nth-child(1) { width: 620px; }
	#tblListComment td:nth-child(2) { width: 300px; }
	 
	#tblListComment td span {
		float: right;
		bottom: 5px;
		color: #AAA;
		font-size: 13px;
	}
	
	#tblListComment td span a:hover {
		text-decoration: underline;
	}
	
	#tblAddComment {
		margin-top: 30px;
		margin-left: 130px;
	}
	
	#tblAddComment td:nth-child(1) { width: 620px; }
	
	#tblListComment td #replyList {
		width: 300px;
	}
	
	
	.btns {
		margin-top: 20px;
		text-align: left;
	}
	
	.endline {
		margin-top: 50px;
		width: 100%;
		border-bottom: 1px solid #CCC;
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
            	
            	<!-- 상세 내용 -->
				<div class="write">
					<div class="first">
						<small style="">[${ dto.category }]</small><h3 class="title">${ dto.title }</h3>
						<span style='float: right; margin-right: 20px; margin-top: 10px;'>${ dto.regdate }</span>
					</div>
					<div class="info">
						<span>작성자: ${ dto.name }(${ dto.id }) </span>
						<span>조회수: ${ dto.cnt } </span>
						<span>댓글수: ${ dto.ccnt } </span>
					</div>
					<div class="content">
						${ dto.detail }
						<div class="list">
							<c:forEach items="${ ilist }" var="image" begin="0" end="3">
								<img class="img" src="/rural/assets/img/community/${ image }">
							</c:forEach>
						</div>
						
					</div>
				</div>
				
				<!-- 댓글 기능 -->
				<div>
					<table id="tblListComment">
						<!-- 댓글기능 > 댓글 list 없을때 -->
						<c:if test="${ clist.size() == 0 }">
							<tr>
								<td colspan="2">댓글이 없습니다.</td>
							</tr>
						</c:if>
						
						<c:forEach items="${ clist }" var="cdto">
							<c:if test="${ cdto.pseq == null }">
							<tr>
								<!-- 댓글 기능 > 댓글 list 출력 -->
								<td style="border-bottom: 1px solid #CCC; padding: 10px;">
									${ cdto.detail }
									<span>
										${ cdto.name } ${ cdto.regdate }
										<c:if test="${ cdto.id == id || lv == 3}">
											<a style="cursor: pointer; font-weight: bold;" onclick="cdel(${ cdto.seq },${ dto.seq });"> 삭제하기</a>
										</c:if>
									</span>
								</td>
								<!-- 댓글 기능 > 답글달기 / 삭제하기 (회원) -->
								<td>
							      	<button class="btn btn-success" type="button" data-toggle="collapse" data-target="#${ cdto.seq }" aria-expanded="false" aria-controls="${ cdto.seq }" style="margin-left: 50px;">
									  답글달기
									</button>
								</td>
							</tr>
							</c:if>
							<tr>
								<td colspan="2">
									<div class="collapse" id="${ cdto.seq }" style="margin: 30px;">
										<div class="card card-body" style="border: 3px solid #ccc;">
											
											<c:forEach items="${ clist }" var="rdto">
												<!-- 답글 기능 > 답글 list 출력 -->
												<c:if test="${ rdto.pseq == cdto.seq }">
													<div style="border-bottom: 1px solid #CCC; margin: 20px; display:inline-block;">
														${ rdto.detail }
														<span style="float: right">${ rdto.name } ${ rdto.regdate }</span>
													</div> 
												</c:if>
											</c:forEach>
											
											<!-- 답글 기능 > 작성하기(회원) -->
											<c:if test="${ not empty id }">
											<form method="POST" action="/rural/community/addreply.do">
												<table id="tblAddReply">
													<tr>
														<td><input type="text" name="detail" id="detail" class="form-control" required placeholder="답글을 작성하세요." style="margin-left:20px;"/></td>
														<td><input type="submit" value="답글쓰기" class="btn btn-success" style="margin-left: 30px;"/></td>
													</tr>
												</table>
												<input type="hidden" name="pseq" value="${ cdto.seq }" />
												<input type="hidden" name="postSeq" value="${ dto.seq }" />
											</form>
											</c:if>
											
									  	</div>
									</div>
								</td>
							</tr>
						</c:forEach>	
					</table>
					
					<div class="row justify-content-md-center" style="width: 100%">
						${ pagebar }
					</div>
					
					<!-- 댓글 기능 > 작성하기 (회원) -->
					<c:if test="${ not empty id }">
					<form method="POST" action="/rural/community/addcomment.do">
						<table id="tblAddComment">
							<tr>
								<td><input type="text" name="detail" id="detail" class="form-control" required placeholder="댓글을 작성하세요. "/></td>
								<td><input type="submit" value="댓글쓰기" class="btn btn-success" style="margin-left: 40px;"/></td>
							</tr>
						</table>
						<input type="hidden" name="postSeq" value="${ dto.seq }" />
					</form>
					</c:if>
				</div>
				
				<div class="endline"></div>		
				
				<!-- 수정/삭제 기능 (회원) -->
				<div class="btns">
					<c:if test="${ not empty id }">
					
						<c:if test="${ dto.id == id}"> 
							<button type="button" class="btn btn-secondary"
								onclick="location.href='/rural/community/edit.do?seq=${ dto.seq }';">수정하기</button>
						</c:if>
						
						<c:if test="${ dto.id == id || lv == 3 }"> 
							<button type="button" class="btn btn-danger"
								onclick="del(${ dto.seq })">삭제하기</button>
						</c:if>
						
					</c:if>
					<button type="button" class="btn btn-secondary" style="float: right;"
						onclick="location.href='/rural/community/list.do?column=${ column }&search=${ search }';">돌아가기</button>
				</div>
				
				
            </div>
        </div>
	
 	<%@ include file="/inc/footer.jsp" %>
 	<%@ include file="/inc/init.jsp" %>
 	
	<script>
		
		// 게시글 삭제
		function del(seq) {
	        let result = confirm("정말 삭제하시겠습니까?");
	        if (result) {
	           location.href = "/rural/community/delok.do?seq="+ seq;
	        } else {
	        	
	    	}
	    }
		
		// 댓글 삭제
		function cdel(seq, postSeq) {
	        let result = confirm("정말 삭제하시겠습니까?");
	        if (result) {
	           location.href = "/rural/community/delcomment.do?seq=" + seq + "&postSeq=" + postSeq;
	        } else {
	        	
	    	}
	    } 
	
	</script>
</body>
</html>