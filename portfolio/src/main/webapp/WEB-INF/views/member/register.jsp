<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원가입 화면</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
	<style>
		.ok {color:green;}
		.ng {color:red;}
		.check {display:none}
	</style>
	<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                            </div>
                            <form class="user" action="register.do" method="post" id="registerForm">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user required" id="id" name="id"
                                            placeholder="아이디를 입력해 주세요" required >
                                        <input type="hidden" id="validId"> 
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0 ">
                                    	 <span  class="ok check">사용가능</span>
                                         <span  class="ng check">사용불가</span> 
                                    </div>
                                    
                                </div>
                                <div class="form-group">
                                  
                                        <input type="text" class="form-control form-control-user" id="exampleLastName" name="name"
                                            placeholder="이름을 입력해 주세요" required>
                             
                                    </div>
<!--                                 <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="exampleInputNo" name="no"
                                        placeholder="주민등록번호를 입력해주세요" >
                                </div> -->
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="exampleInputEmail" name="email"
                                        placeholder="이메일을 입력해주세요" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$">
                                </div>
<!--                                 <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="exampleInputPhone" name="phone"
                                        placeholder="전화번호를 입력해주세요" >
                                </div>  -->                               
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user" name="password"
                                            id="exampleInputPassword" placeholder="비밀번호를 입력해주세요" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleRepeatPassword" placeholder="다시한번 비밀번호를 입력해주세요" required>
                                    </div>
                                </div>
                                <button type="submit" onclick="return submitFn()" class="btn btn-primary btn-user btn-block">
                                    	가입하기
                                </button>
                                
<!--                                 <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> 구글로 가입하기
                                </a> -->
                                
                                

                            </form>
                           
                            <hr>
                                     <div class="text-center">
                                        <a class="small" href="home.do" >대시보드로</a>
                                    </div>
                                    <div class="text-center">
                                <a class="small" href="loginJsp.do">로그인</a>
                            </div>
                                    <hr>
                           <!--  <div class="text-center">
                                <a class="small" href="findInfoJsp.do">아이디/비밀번호 찾기</a>
                            </div> -->
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    	$(function() {
    		$("#id").on("keyup", function() {
    			if($("#id").val().length <5) {
    				$(".check").hide();
    				$("#validId").val(0);
    				return;
    			}
    			$.ajax({
    				url:"checkDuplId.do",
    				method:"post",
    				dataType:"text",
    				data: {id: $("#id").val()},
    				success: function(result) {
    					if(result > 0) {
    						$(".ok").hide(); $(".ng").show(); $("#validId").val(0);
    					}else {
    						$(".ok").show(); $(".ng").hide(); $("#validId").val(1);
    					}
    				},
    				error: function() {
    					alert("networking failed");
    				}
    			})
    		})
    	})
    	
    	function submitFn() {
    		if($("#validId").val()==0) { 
    			alert("중복된 아이디입니다"); 
    			return false;
    		}
    		if($("#exampleInputPassword").val() != $("#exampleRepeatPassword").val()) {
    			alert("비밀번호가 일치하지 않습니다");
    			$("#exampleRepeatPassword").focus();
    			return false;
    		}
    	}
    </script>

    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>
	
</body>

</html>