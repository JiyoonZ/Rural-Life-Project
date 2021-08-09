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

	#signup {
		margin: 0 auto;
		width: 800px;
	}
	
	#signup tr th:nth-child(1) { 
		width: 180px; 
	}
	
	#signup tr td select { 
		display:inline-block; 
	}
	
	#signup tr td input[type=text],
	#signup tr td input[type=number],
	#signup tr td input[type=password] { 
		width: 200px; display:inline-block; 
	}
	
</style>
</head>
<body>

	<!-- 홈화면에서 카테고리 들어갔을 처음 나오는 화면 -->
	<%@ include file="/inc/header.jsp" %>
	
       <!-- 이미지 카테고리명 -->
        <div class="slider-area ">
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="/rural/assets/img/logo/mypage.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap">
                                <h2>내 정보 수정</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
		<!-- 구현부 -->
        <div class="section-padding2">
            <div class="container">
                
                <!-- 내 정보 수정 양식 -->
                <form method="POST" action="/rural/member/myeditok.do">
					<div id="signup">
						<table class="table table-bordered">
							<tr>
								<th>이름</th>
								<td><input type="text" name="name" class="form-control" required value="${ dto.name }" readonly /></td>
								<th>성별</th>
								<td>
									<select name="gender" class="form-control" style="width: 100px;">
										<c:if test="${ dto.gender == 'm' }">
											<option value="m" selected >남자</option>
											<option value="f">여자</option>
										</c:if>
										<c:if test="${ dto.gender == 'f' }">
											<option value="m">남자</option>
											<option value="f" selected >여자</option>
										</c:if>
									</select>
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="text" name="birth" class="form-control" required value="${ dto.birth }" readonly /></td>
								<th>가입유형</th>
								<td>
									<c:if test="${ dto.lv == 1 }">일반</c:if>
									<c:if test="${ dto.lv == 2 }">농업인</c:if>
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td colspan="3">
									<select name="tel1" id="tel1" class="form-control" style="width: 100px;">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="02">02</option>
									</select>
									-
									<input type="number" name="tel2" class="form-control" required value="${ tel2 }" style="width: 100px;"/>
									-
									<input type="number" name="tel3" class="form-control" required value="${ tel3 }" style="width: 100px;"/>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td colspan="3">
									<input type="text" name="email1" id="email1" class="form-control" required value="${ email1 }"/>
									@
									<input type="text"name="email2" id="email2" class="form-control" required value="${ email2 }" />
			                        <select id="domain1" class="form-control" style="width: 150px; display:inline-block;">
										<option value="">--직접 입력--</option>
										<option value="naver.com">naver.com</option>
										<option value="google.com">google.com</option>
										<option value="daum.net">daum.net</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="yahoo.co.kr">yahoo.co.kr</option>
                        			</select>							
								</td>
							</tr>
							<tr>
								<th>아이디</th>
								<td colspan="3">
									<input type="text" name="id" class="form-control" required value="${ dto.id }" readonly/>
									<input type="button" name="check" value="중복검사" class="genric-btn info circle" />
								</td>
							</tr>
							<tr>
								<th>현재 패스워드</th>
								<td colspan="3"><input type="password" name="nowpw" class="form-control" required /></td>
							</tr>
							
							<tr>
								<th>변경할 패스워드</th>
								<td colspan="3"><input type="password" name="pw" class="form-control" required /></td>
							</tr>
							<tr>
								<th>변경할 패스워드 확인</th>
								<td colspan="3"><input type="password" name="pwCheck" class="form-control" required /></td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan="3"><input type="text" name="address" class="form-control" required value="${ dto.address }" style="width: 400px;"/></td>
							</tr>
						</table>
						
						<!-- 버튼 -->
						<div class="btns">
							<button type="button" class="genric-btn primary circle"
								onclick="location.href='/rural/member/mypage.do';">돌아가기</button>
							<button type="submit" class="genric-btn info circle" style="float: right;">수정하기</button>
						</div>
						
					</div>
					
					<input type="hidden" name="lv" value="${ dto.id }" />
				</form>
				
            </div>
        </div>
	
 	<%@ include file="/inc/footer.jsp" %>
 	<%@ include file="/inc/init.jsp" %>
	<script>
		
		// 이메일 도메인
	    $("#domain1").change(function() {
			if ($(this).val() == "") {
			   $("#email2").val("");
			   $("#email2").prop("readonly", false);
			} else {
			   $("#email2").val($(this).val());
			   $("#email2").prop("readonly", true);
			}
	    });
		
		// 전화번호 앞자리
		$("#tel1").val("${ tel1 }");

	
	</script>
</body>
</html>