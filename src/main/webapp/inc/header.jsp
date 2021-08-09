<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Header Start -->
<header>
   <div class="header-area">
      <div class="main-header">
         <!-- 최상단 로그인/외원가입 Start -->
         <div class="header-top top-bg d-none d-lg-block ">
            <div class="container">
               <div class="row justify-content-between align-items-center">
                  <div class="col-lg-8"></div>
                  <div class="col-lg-4">
                     <div class="header-info-right f-right">
                        <ul class="header-social">
                           <c:if test="${empty id}"> <!-- 비로그인 -->
                           <li><a href="/rural/member/login.do">로그인</a></li>
                           <li><a href="/rural/member/signup.do">회원가입</a></li>
                           </c:if>
                           
                           <c:if test="${not empty id}"> <!-- 로그인 -->
                           <li>${name}(${id}) 님</li>
                           <li><a href="/rural/member/logout.do">로그아웃</a></li>
                           		<c:if test="${lv eq '2' || lv eq '1' }">
                           		<li><a href="/rural/member/mypage.do">마이페이지</a></li>
                           		</c:if>
                          		<c:if test="${lv eq '3'}">
                           		<li><a href="/rural/admin/manage.do">페이지관리</a></li>
                           		</c:if>
                           </c:if>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- 최상단 로그인/외원가입 End -->
         <div class="header-bottom  header-sticky">
            <div class="container">
               <div class="row align-items-center">
                  <!-- Logo -->
                  <div class="col-xl-2 col-lg-2 col-md-1">
                     <div class="logo">
                        <a href="/rural/index.do" ><img src="<%= request.getContextPath() %>/assets/img/logo/logo4.png" /></a>
                        
                     </div>
                  </div>
                  <div class="col-xl-10 col-lg-10 col-md-10">
                     <!-- Main-menu -->
                     <div class="main-menu f-right d-none d-lg-block">
                        <nav>
                           <ul id="navigation">
                              <li><a href="/rural/worker/list.do">일손돕기</a></li>
                              <li><a href="/rural/exp/list.do">농촌체험</a></li>
                              <li><a href="/rural/farm/list.do">주말농장</a></li>
                              <li><a href="/rural/market/list.do">농작물 직거래</a></li>
                              <li><a href="/rural/community/list.do">커뮤니티</a></li>
                              <li><a href="/rural/notice/list.do">알림마당</a></li>
                           </ul>
                        </nav>
                     </div>
                  </div>
                  <!-- Mobile Menu -->
                  <div class="col-12">
                     <div class="mobile_menu d-block d-lg-none"></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</header>
<!-- Header End -->