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

	.table th { width: 120px; text-align: center; }
	.table td { width: 680px; }
	.table #detail { height: 300px; }
	
	.list {
		margin: 20px;	
		display: flex;
		flex-wrap: wrap;

	}
	
	.list .img {
		max-width:400px;
		max-height:300px;
		width: auto;
		height: auto;
     	margin: 50px;
     	background-repeat: no-repeat;
     	background-position: center center;
     	background-size: contain;
	}
	
	
	.btns {
		text-align: center;
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
            
                <h2 style="margin-bottom: 30px;"><strong>수정하기</strong></h2>
                <!-- 수정하기 양식 -->
        		<form method="POST" action="/rural/community/editok.do" enctype="multipart/form-data">
					<table class="table table-bordered">
						<tr>
							<th>카테고리</th>
							<td>
								<select name="category" id="category" class="form-control short" style="width: 150px;">
									<option value="${ dto.category }" selected disabled hidden="">${ dto.category }</option>
									<option value="일손돕기">일손돕기</option>
									<option value="농촌체험">농촌체험</option>
									<option value="주말농장">주말농장</option>
									<option value="농작물 직거래">농작물 직거래</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" id="title" class='form-control' required value="${ dto.title }" /></td>
						</tr>
						<tr>
							<th>글 내용</th>
							<td>
								<textarea name="detail" id="detail" class="form-control" required >${ dto.detail }</textarea>
							</td>
						</tr>
						<tr>
							<th>첨부 이미지</th>
							<td>
								<div class="list">
								<c:forEach items="${ ilist }" var="image" begin="0" end="3">
										<img class="img" src="/rural/assets/img/community/${ image }">
								</c:forEach>
								</div>
							</td>
						</tr>
						<!-- 이미지 파일첨부 -->
						<tr>
							<th>이미지 첨부하기<br>(최대 3개)</th>
							<td><input type="file" name="image1" accept=".gif, .jpg, .png"/></td>
						</tr>
					</table>
					
					<!-- 수정하기/돌아가기 버튼 -->
					<div style="display:inline-block;">
						<input type="button" value="이미지 추가하기" class="btn btn-primary" id="btnAdd"/>
					</div>
					<div style="display:inline-block; margin-left: 300px;">
						<button type="submit" class="btn btn-success" style="text-align: right;">수정하기</button>
						<button type="button" class="btn btn-secondary"
							onclick="location.href='/rural/community/list.do';">돌아가기</button>
					</div>
					
					<input type="hidden" name="seq" value="${ dto.seq }"/>
				</form>

            </div>
        </div>
	
 	<%@ include file="/inc/footer.jsp" %>
 	<%@ include file="/inc/init.jsp" %>
	<script>
		let index = 1;
		
		$('#btnAdd').click(function() {
			
			index++;
			
			$("table tbody").append("<tr><th></th><td><input type='file' name='image" + index + "\" class='form-control' /><input type='button' value='delete' class='btn btn-danger' onclick='delBtn();'  accept='.gif, .jpg, .png' /></td></tr>")
			
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
	</script>
</body>
</html>