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

<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>

	<!-- 홈화면에서 카테고리 들어갔을 처음 나오는 화면 -->
	<%@ include file="/inc/header.jsp" %>
	
       <!-- 이미지 카테고리명 -->
        <div class="slider-area ">
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="/rural/assets/img/hero/notice.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap">
                                <h2>알림마당</h2>
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
					</div>
					<div class="content">
						${ dto.detail }
						<div class="list">
							<c:forEach items="${ ilist }" var="image" begin="0" end="3">
								<img class="img" src="/rural/assets/img/notice/${ image }">
							</c:forEach>
						</div>
						
					</div>
				</div>
				
				<!-- 공유하기  -->
				<div style="margin-top: 30px;">
					<span style="float: right;">
						<!-- 돌아가기 -->
						<button type="button" class="btn btn-secondary" style="margin-right: 30px;"
							onclick="location.href='/rural/notice/list.do?column=${ column }&search=${ search }';">돌아가기</button>
						<!-- naver -->
						<span>
							<script type="text/javascript" src="https://ssl.pstatic.net/share/js/naver_sharebutton.js"></script>
							<script type="text/javascript">
								new ShareNaver.makeButton({"type": "f"});
							</script>
						</span>
						<!-- kakao -->
						<img src="/rural/assets/img/logo/kakao.png" style="width:40px; margin-left: 10px; cursor: pointer;" id="btnKakao" onClick="shareKakao();"/>
						<!-- twitter -->
						<img src="/rural/assets/img/logo/twitter.png" style="width:40px; margin-left: 10px; cursor: pointer;" onclick="shareTwitter();">
					</span>
					
				</div>
				
				<!-- 수정/삭제 기능 (관리자) -->
				<div class="btns">
					<c:if test="${ not empty id && lv == 3 }">
						<c:if test="${ dto.id == id}"> 
							<button type="button" class="btn btn-secondary"
								onclick="location.href='/rural/notice/edit.do?seq=${ dto.seq }';">수정하기</button>
							
							<button type="button" class="btn btn-danger"
								onclick="del(${ dto.seq })">삭제하기</button>
						</c:if>
					</c:if>
				</div>
				
            </div>
        </div>
	
 	<%@ include file="/inc/footer.jsp" %>
 	<%@ include file="/inc/init.jsp" %>
 	
	<script>
	
		function shareKakao() {
			 
			  // 사용할 앱의 JavaScript 키 설정
			  Kakao.init('eeafda384681d9c8849627417732b4cc');
			 
			  // 카카오링크 버튼 생성
			  Kakao.Link.createDefaultButton({
			    container: '#btnKakao', // 카카오공유버튼ID
			    objectType: 'feed',
			    content: {
			      title: "${ dto. title }", // 보여질 제목
			      description: "${ dto.detail }", // 보여질 설명
			      imageUrl:'http://k.kakaocdn.net/dn/b4ZDkL/btraWuquBQG/BqAj3eUu7p0Yz3XeIjzwu0/kakaolink40_original.jpg', // 콘텐츠 URL
			      link: {
			         mobileWebUrl: "http://developers.kakao.com/",
			         webUrl: "http://developers.kakao.com/"
			      }
			    }
			  });
			}
		
		<!-- twitter -->
		function shareTwitter() {
		    var sendText = "슬기로운 농촌생활"; // 전달할 텍스트
		    var sendUrl = "/rural/notice/view.do?seq=${ dto.seq }/"; // 전달할 URL
		    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
		}
		
		<!-- 게시글 삭제하기 -->
		function del(seq) {
	        let result = confirm("정말 삭제하시겠습니까?");
	        if (result) {
	           location.href = "/rural/notice/delok.do?seq="+ seq;
	        } else {
	        	
	    	}
	    }
		
	</script>
</body>
</html>