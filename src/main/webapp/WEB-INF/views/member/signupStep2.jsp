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

	#step {
		text-align: center;
		margin-bottom: 50px;
	}
	
	#step span:nth-child(3) {
		background-color: #4DCC81;
	}
	
	#step span:nth-child(1),
	#step span:nth-child(2),
 	#step span:nth-child(3),
 	#step span:nth-child(4),
 	#step span:nth-child(5) {
		border: 1px solid #CCC;
		border-radius: 50px;
		font-size: 2.5em;
		font-weight: bold;
		display: inline-block;
		width: 150px;
		margin-right: 30px;
	}
	
	#signup {
		margin: 0 auto;
		width: 800px;
	}
	
	#signup tr th:nth-child(1) { 
		width: 130px; 
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
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="/rural/assets/img/hero/oranges.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap">
                                <h2>회원가입</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
		<!-- 구현부 -->
        <div class="section-padding2">
            <div class="container">
                
                <!-- step1,2,3 표시 -->
                <div id="step">
                	<span>STEP1</span>
                	<span style="border-bottom: 2px solid black; width: 100px; margin-bottom: 10px;"></span>
                	<span>SETP2</span>
                	<span style="border-bottom: 2px solid black; width: 100px; margin-bottom: 10px;"></span>
                	<span>SETP3</span>
                </div>
                
                <!-- 회원가입 양식 -->
                <form method="POST" action="/rural/member/signupok.do">
					<div id="signup">
						<table class="table table-bordered">
							<tr>
								<th>이름</th>
								<td>
									<input type="text" name="name" id="name" class="form-control" maxlength="6" required>
								</td>
								<th>성별</th>
								<td>
									<input type="radio" name="gender" value="m" checked>남
									<input type="radio" name="gender" value="f">여
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
									<input type="date" name="birth" id="birth" class="form-control" required>
								</td>
								<th>가입유형</th>
								<td>
									<c:if test="${lv.equals('1')}">일반</c:if>
									<c:if test="${lv.equals('2')}">농업인</c:if>
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td colspan="3">
									<input type="text" name="tel1" id="tel1" class="tel form-control" maxlength="3" pattern="[0-9]{2,3}" style="width: 70px;" required>
									-<input type="text" name="tel2" id="tel2" class="tel form-control" maxlength="4" pattern="[0-9]{3,4}" style="width: 70px;" required>
									-<input type="text" name="tel3" id="tel3" class="tel form-control" maxlength="4" pattern="[0-9]{4}" style="width: 70px;" required>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td colspan="3">
									<input type="text" name="email1" id="email1" class="form-control" maxlength="25" required> @ 
									<input type="text" name="email2" id="email2" class="form-control" maxlength="25" required>
									<select id="domain" class="form-control" style="width: 150px;">
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
									<!-- 영어 대/소문자, 숫자 1개 이상씩 -->
									<input type="text" name="id" id="id" class="form-control" maxlength="20" pattern="[A-Za-z0-9+]{4,12}" required> 
								</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td colspan="3">
									<input type="password" name="pw" id="pw" class="form-control" maxlength="20" required>
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td colspan="3">
									<input type="password" id="pwChk" class="form-control" maxlength="20" required>
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan="3">
									<input type="button" onClick="goPopup();" value="주소검색">
									<input type="text"  style="width:500px;" id="address"  name="address" maxlength="100" readonly required>
								</td>
							</tr>
						</table>
	
						<!-- 버튼 -->
						<div class="btns">
							<button type="button" class="genric-btn primary circle"
								onclick="history.go(-1);">돌아가기</button>
							<button type="button" class="genric-btn info circle" id="signUp"
								style="float: right;">가입하기</button>
						</div>
	
					</div>
	
					<input type="hidden" name="lv" value="${lv}">
				</form>
				
            </div>
        </div>
	
 	<%@ include file="/inc/footer.jsp" %>
 	<%@ include file="/inc/init.jsp" %>
	<script>
	
	//이메일 도메인
	$("#domain").change(function() {
		if ($(this).val() == "") {
			$("#email2").val("");
			$("#email2").prop("readonly", false);
		} else {
			$("#email2").val($(this).val());
			$("#email2").prop("readonly", true);
		}
	});

	//주소검색
	function goPopup(){
		window.name="jusoPopup";
		var pop = window.open("<%= request.getContextPath() %>/inc/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		if (roadFullAddr.length > 100) {
			alert("주소를 100자 이내로 입력해주세요");
		} else {
			$("#address").val(roadFullAddr);				
		}
	}
	
	//전화번호 숫자만 입력 가능
    var replaceNotInt = /[^0-9]/gi; // 숫자가 아닌 정규식
	
	$(document).ready(function(){
	        
        $(".tel").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceNotInt)) {
                   x = x.replace(replaceNotInt, "");
                }
                $(this).val(x);
            }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceNotInt, ""));
        });
	 
	});
	
		//폼 유효성 검사
		$('#signUp').click(function() {
			
			//이름 유효성 검사
			var regExpName = /^[가-힣]{2,6}$/;
			var name = $("#name").val();
			if (!regExpName.test(name)) {
				alert("유효하지 않은 이름입니다. 한글 2~6자로 입력해주세요.");
				return;
			}
			
			//생년월일 유효성 검사
			if ($("#birth").val() == "") {
				alert("생년월일을 입력하세요.");
				return;
			}
			
			//전화번호 유효성 검사
		    var regExpTel = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
		    var tel = $("#tel1").val() + "-" + $("#tel2").val() + "-" +$("#tel3").val();
		    if (!regExpTel.test(tel)) {
		    	alert("유효하지 않은 전화번호입니다.");
		    	return;
		    }
		    
		    //이메일 유효성 검사
		    var regExpEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			var email = $("#email1").val() + "@" + $("#email2").val();
			if (!regExpEmail.test(email)) {
		    	alert("유효하지 않은 이메일 주소입니다.");
		    	return;
		    }
			
			//아이디 유효성 검사
			var regExpId = /^[0-9a-zA-Z]{4,20}$/;
			var id = $("#id").val();
			if (!regExpId.test(id)) {
		    	alert("유효하지 않은 아이디입니다. 영문/숫자 4~20자로 입력해주세요.");
		    	return;
		    }
			
			//패스워드 유효성 검사
			var regExpPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$/;
			var pw = $("#pw").val();
			if (!regExpPw.test(pw)) {
				alert("유효하지 않은 비밀번호입니다. 8~16자를 입력해주세요. 하나 이상의 대문자, 소문자, 숫자를 포함해야 합니다.");
				return;
			}
			
			//패스워드 확인 일치 검사
			if ($("#pw").val() != $("#pwChk").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			
			//주소 유효성 검사
			if ($("#address").val().length > 100) {
				alert("주소를 100자 이내로 입력해주세요");
				return;
			}
			
			this.form.submit();
			
		});
	</script>
</body>
</html>