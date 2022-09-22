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

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">


                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <!-- <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form> -->
					<div class="navbar-nav ml-auto">
						<i class="fas fa-search fa-sm"><a href="messagingJsp.do">무엇이든 질문하고 대화하세요</a></i>
					</div>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <!-- <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            Dropdown - Messages
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li> -->

                        <!-- Nav Item - Alerts -->

                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <c:if test="${!empty msg }">
                                <span class="badge badge-danger badge-counter" id="newSpan">new</span>
                                </c:if>
                            </a>

                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <!-- <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div> -->
                                    <div>
                                        <!-- <div class="small text-gray-500">December 12, 2019</div> -->
                                        <c:if test="${!empty msg }">
                                        <span class="font-weight-bold" id="msgSpan">${msg }</span>
                                        </c:if>
                                        <c:if test="${empty msg }">
                                        <span class="font-weight-bold">알림이 없습니다</span>
                                        </c:if>
                                    </div>
                                </a>
                                
                                <!-- <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a> -->
                                <!-- <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a> -->
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                        <c:if test="${empty replyRefList }">
                            <a class="nav-link dropdown-toggle" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                               
                                <!-- <span class="badge badge-danger badge-counter" id="newBage">new</span> -->
                               
                            </a>
                            </c:if>
                             <c:if test="${!empty replyRefList }">
                              <a class="nav-link dropdown-toggle" onclick="updateMsgCenter();" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                              	<c:if test="${!empty newBadge}">
                                <span class="badge badge-danger badge-counter" id="newBage">new</span>
                               </c:if>
                            </a>
                           </c:if>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                
                                <c:if test="${!empty replyRefList }">
                                <c:forEach items="${replyRefList }" var="reply">
                                
                                <a class="dropdown-item d-flex align-items-center" href="selectBoardDetail.do?boardNo=${reply.refBno }" style="cursor:pointer">
                                    <!-- <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div> -->
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">${reply.replyContent }</div>
                                        <div class="small text-gray-500">${reply.replyAuthor }</div>
                                    </div>
                                </a>
                                </c:forEach>
                                </c:if>

                                <c:if test="${empty replyRefList }">
                                 <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="font-weight-bold">댓글이 없습니다</div>
                                    </a>
                                    </c:if>
                                 <!-- <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a> -->
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                        <c:if test="${empty loginUser }">
                        <a class="nav-link dropdown-toggle" href="loginJsp.do" >
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">로그인/회원가입</span>
                                
                            </a>
                        </c:if>
                        <c:if test="${!empty loginUser }">
                        
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${loginUser.name }</span>
                                <img class="img-profile rounded-circle"
                                    src="resources/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="updateMemberJsp.do">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    회원정보조회
                                </a>
                               <!--  <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a> -->
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃
                                </a>
                            </div>
                         </c:if>   
                        </li>
					
                    </ul>

                </nav>
                <!-- End of Topbar -->
                

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃 하시겠습니까</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                    <a class="btn btn-primary" href="logout.do">예</a>
                </div>
            </div>
        </div>
    </div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {		
		$("#msgSpan").one("click", function() {
			$("#msgSpan").html("전부 확인 했습니다");
			$("#newSpan").html('');
		})
	})
	function updateMsgCenter() {
		var replyNoArr = new Array();
		<c:forEach items="${replyRefList}" var="reply">
			replyNoArr.push("${reply.replyNo}");
		</c:forEach>
		var param = JSON.stringify(replyNoArr);
		$.ajax({
			url:"updateReplyCheck.do",
			method:"post",			
			dataType:"json",
			data:{replyNoArr:param},
			success:function() {
				<% session.removeAttribute("newBadge"); %>
			},
			error:function() {
//				alert("ajax error");
			}
		}) 
	}
</script>
</body>
</html>