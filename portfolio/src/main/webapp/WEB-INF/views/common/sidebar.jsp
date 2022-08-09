<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>홈페이지에 포함한 사이드 메뉴 화면</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${request.ContextPath }">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">뒤로가기<!-- <sup>2</sup> --></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="home.do">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>대시보드</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>



            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="selectNoticeList.do">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>공지사항조회</span>
                </a>
                <!-- <a class="nav-link collapsed" href="selectBookList.do">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>전체도서목록보기</span>
                </a> -->
                 
                <a class="nav-link collapsed" href="historyRentList.do" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>도서정보조회</span>
               
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    	<!-- <a class="collapse-item" href="selectNoticeList.do">공지사항조회</a>-->
                        <a class="collapse-item" href="selectBookList.do">전체도서목록보기</a> 
                        <c:if test="${role eq 'admin' }">
                        <a class="collapse-item" href="historyRentList.do">도서이용현황조회</a>
                        </c:if>
                        <c:if test="${role ne 'admin' }">
                    	 <h6 class="collapse-header">회원서비스</h6>
                    	<a class="collapse-item" href="insertRentBookJsp.do">도서대출신청하기</a>
                    	<a class="collapse-item" href="insertWishBookJsp.do">도서구입신청하기</a>
                    	</c:if>

                    </div>
                </div>
                
            </li>
                        <!-- Nav Item - Pages Collapse Menu -->
            <c:if test="${!empty role and role eq 'admin'}">            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>도서관리</span>
                </a>
                
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    	<%-- <c:if test="${role ne 'admin' }">
                    	<!-- <h6 class="collapse-header">마이페이지</h6> -->
                    	<a class="collapse-item" href="insertRentBookJsp.do">도서대출신청하기</a>
                    	<a class="collapse-item" href="insertWishBookJsp.do">도서구입신청하기</a>
                    	</c:if> --%>
                    	<%-- <c:if test="${!empty role }">
                        <a class="collapse-item" href="historyRentList.do">도서이용현황조회</a>
                        </c:if> --%>
                    	<c:if test="${role eq 'admin'}"> 
                    	<h6 class="collapse-header">도서등록</h6>                  	 
                    	<a class="collapse-item" href="selectWishBookList.do">도서구입신청내역보기</a>                    
                        <a class="collapse-item" href="insertBookJsp.do">신규도서등록하기</a>
                        <h6 class="collapse-header">도서등록옵션</h6>
                        <a class="collapse-item" href="selectPubList.do">출판사조회및등록하기</a>
                        <a class="collapse-item" href="selectCatList.do">카테고리조회및등록하기</a>
                        </c:if>
                    </div>
                </div>
               
            </li>
 			</c:if>
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <c:if test="${!empty role}">
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>개인정보관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    	<c:if test="${role ne 'admin'}">
                        <h6 class="collapse-header">마이페이지</h6>
                        <!-- <a class="collapse-item" href="loginJsp.do">로그인</a>                       
                        <a class="collapse-item" href="registerJsp.do">회원가입</a> -->
                        <!-- <a class="collapse-item" href="">아이디/비밀번호 찾기</a> -->
                        
                        <a class="collapse-item" href="updateMemberJsp.do">회원정보조회/수정</a>
                        
                        <a class="collapse-item" href="historyRentList.do">도서이용현황조회</a>
                        </c:if>
                        <div class="collapse-divider"></div>

                        <c:if test="${role eq 'admin'}">
                        <h6 class="collapse-header">사원관리</h6>
                        <a class="collapse-item" href="selectEmployeeList.do">전체사원정보보기</a>
                        <a class="collapse-item" href="selectMemberList.do">신입사원등록하기</a>
                        <h6 class="collapse-header">사원등록옵션</h6>
                        <a class="collapse-item" href="employeeInfo.do">옵션조회및 등록하기</a>

                        </c:if>
						
                    </div>
                </div>
            </li>
 </c:if>
            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="boardList.do">
                    <i class="fas fa-fw fa-table"></i>
                    <span>일반게시판</span></a>
            </li>

            <!-- Nav Item - Tables -->
           <!--  <li class="nav-item">
                <a class="nav-link" href="">
                    <i class="fas fa-fw fa-table"></i>
                    <span>질문과 답변</span></a>
            </li> -->

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message -->
            <div class="sidebar-card d-none d-lg-flex">
               <!--  <img class="sidebar-card-illustration mb-2" src="img/undraw_rocket.svg" alt="..."> -->
                <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
            </div>

        </ul>
        <!-- End of Sidebar -->



</body>
</html>