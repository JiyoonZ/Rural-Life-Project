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
	#isCareer, #totalApply {
		width:120px;
		display: inline-block;
	}
	
	.container .table {
		width: 1200px;
	}
	
	.container .table th  {
		width: 200px;
		background-color: #F5F5F5; 
		text-align: center;
		vertical-align: middle;
	}
	
	#detail {
		width:1000px;
		height:500px;
		resize:none;
	}
	
	#btn {
		display: inline-block;
		float: right;
	}
	
	#regdate {
		width: 200px;
	}
	
</style>
</head>
<body>

	<!-- 홈화면에서 카테고리 들어갔을 처음 나오는 화면 -->
	<%@ include file="/inc/header.jsp" %>
	
       <!-- 이미지 카테고리명 -->
        <div class="slider-area ">
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="/rural/assets/img/worker/workerList.jpg">
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
            	<h2 style="margin-bottom: 30px;"><strong>신청하기</strong></h2>
            	<hr style="margin-top: 10px;">
            	<form method="POST" action="/rural/worker/applyok.do">
            		<table class="table table-bordered">
            			<tr>
            				<th>
            					인원
            				</th>
            				<td>
	            				<input type="number" min="1" name="totalApply" class="form-control" id="totalApply"> 
	            				<span>명</span>
            				</td>
            			</tr>
            			<tr>
            				<th>경력사항</th>
            				<td>
								<select class="form-control" id="isCareer" name="isCareer">
									<option>선택</option>
									<option value="y">경력</option>
									<option value="n">신입</option>
								</select>
            				</td>
            			</tr>
            			<tr>
            				<th>
            					신청내용
            				</th>
            				<td>
            					<textarea name="detail" id="detail" class="form-control" required></textarea>
            				</td>
            			</tr>
            		</table>

				<div class="btns" id="btns" style="text-align: center">
					<button class="btn btn-success" type="submit">신청하기</button>
					<button class="btn btn-secondary" onclick="location.href='/rural/worker/list.do';">뒤로가기</button>
				</div>
				
				<input type="hidden" name="seq" value="${seq}">
				
			</form>
				
            </div>
        </div>
	
 	<%@ include file="/inc/footer.jsp" %>
 	<%@ include file="/inc/init.jsp" %>
	
	<script>

	</script>
</body>
</html>