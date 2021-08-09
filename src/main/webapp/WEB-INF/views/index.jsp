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
	workbtn {
		margin-top: 23px;
	}
	
	table {
		text-align: center;
	}
	
	.place-img { width: 100%; height: 370px; overflow: hidden; border: 1px solid #f0f1f2; text-align:center;}
	
	
	.favourite-place .single-place .place-img img {
		object-fit: cover;
		width: auto;
		height: 100%;
	    text-aling: center; 
	    -webkit-transform: scale 1;
	    -moz-transform: scale 1;
	    -ms-transform: scale 1;
	    -o-transform: scale 1;
	    transform: scale 1;
	    transition: all 0.5s ease-out 0s;
	}
	
	
	
</style>
</head>
<body>
	<!-- index.jsp -->
	<%@ include file="/inc/header.jsp" %>
	 <main>

        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="slider-active">
                <div class="single-slider hero-overly slider-height d-flex align-items-center" data-background="assets/img/hero/04.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-9 col-lg-9 col-md-9">
                                <div class="hero__caption">
                                    <h1>Explore rural<span> Korea!</span> </h1>
                                    <p>농촌 활성화를 위한 플랫폼</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->
        
        <!-- Favourite Places Start -->
        <div class="favourite-place" style="padding: 120px 0 80px 0;">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>농촌생활을 즐겨봐요!</span>
                            <h2 style="margin-bottom: 60px">농촌체험</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                   
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="assets/img/index/farm_01.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>4.8</span> </span>
                                    <h3><a href="#">곤충잡기체험</a></h3>
                                    
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="fas fa-map-marker-alt">경상북도 상주시</i></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                 
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="assets/img/index/farm_02.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>4.6</span> </span>
                                    <h3><a href="#">옥수수따기체험</a></h3>
                                    
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="fas fa-map-marker-alt"></i>강원도 삼척시</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="assets/img/index/farm_04.JPG" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>4.9</span> </span>
                                    <h3><a href="#">다슬기잡기체험</a></h3>
                                    
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="fas fa-map-marker-alt"></i>전라남도 완도군</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Favourite Places End -->
              
        <!-- Blog Area Start -->
        <div class="home-blog-area section-padding2">
            <div class="container">
                <div class="row">
                    <!-- 일손돕기 -->
                    <div class="col-xl-6 col-lg-6 col-md-6  worker">
                         <!-- Section Tittle -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="section-tittle text-center">
                                        <span>땀흘려 일하고 농촌도 살리고!</span>
                                        <h2 style="margin-bottom: 60px">일손돕기</h2>
                                    </div>
                                </div>
                            </div>
                        <div class="home-blog-single mb-40">
                            
                            <table class="table table-bordered">
                                    <tr style="background-color: #F5F5F5">
                                        <th>지역</th>
                                        <th>제목</th>
                                        <th>날짜</th>
                                    </tr>
                                    <tr>
                                        <td>울산광역시</td>
                                        <td>부추 하우스 개보수 및 기타작업</td>
                                        <td>2021-07-28 ~ </td>
                                    </tr>
                                    <tr>
                                        <td>충청남도</td>
                                        <td>매실 수확 일꾼 모집</td>
                                        <td>2021-08-10 ~ </td>
                                    </tr>
                                    <tr>
                                        <td>전라북도</td>
                                        <td>고구마 제초작업 및 수확</td>
                                        <td>2021-08-08 ~ </td>
                                    </tr>
                                    <tr>
                                        <td>충청북도</td>
                                        <td>오이, 마늘, 밤, 기타 작업하실 분</td>
                                        <td>2021-09-25 ~ </td>
                                    </tr>
                                    <tr>
                                        <td>경상남도</td>
                                        <td>포도농가 일자리 참여자 모집</td>
                                        <td>2021-09-03 ~ </td>
                                    </tr>
                            </table>
                            <div style="float: right;">
                                <input type="button" class="btn btn-primary" id="workbtn" value="바로가기" onclick="location.href='/rural/worker/list.do';">
                            </div>
                        </div>
                    </div>

                    <!-- 주말농장 -->
                    <div class="col-xl-6 col-lg-6 col-md-6 weekend">
                          <!-- Section Tittle -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section-tittle text-center">
                                    <span>나만의 텃밭에서 키운 농작물!</span>
                                    <h2 style="margin-bottom: 60px">주말농장</h2>
                                </div>
                            </div>
                        </div>
                        <div class="home-blog-single mb-30">
                            <table class="table table-bordered">
	                                <tr style="background-color: #F5F5F5">
	                                    <th>지역</th>
	                                    <th>농장 이름</th>
	                                    <th>농장주</th>
	                                </tr>
	                                <tr>
	                                    <td>경기도 고양시</td>
	                                    <td>원석이네 행복농장</td>
	                                    <td>김수형</td>
	                                </tr>
	                                <tr>
	                                    <td>충청북도 청원군</td>
	                                    <td>산뜰에 농장</td>
	                                    <td>박이찬</td>
	                                </tr>
	                                <tr>
	                                    <td>경상북도 예천군</td>
	                                    <td>원천팜스테이 농장</td>
	                                    <td>김민정</td>
	                                </tr>
	                                <tr>
	                                    <td>경기도 남양주시</td>
	                                    <td>늘푸른 주말농장</td>
	                                    <td>최성철</td>
	                                </tr>
	                                <tr>
	                                    <td>경상북도 영주시</td>
	                                    <td>서오릉하늘 주말농장</td>
	                                    <td>이현정</td>
	                                </tr>
                            </table>
                            <div style="float: right;">
	                            <input type="button" value="바로가기" class="btn btn-primary" id="farmbtn" onclick="location.href='/rural/farm/list.do';">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Blog Area End -->
    </main>
    
    <%@ include file="/inc/footer.jsp" %>
	<%@ include file="/inc/init_index.jsp" %>
	
	<script>
	
	</script>
</body>
</html>