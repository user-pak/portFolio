<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head >

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>도서 구입 신청 화면</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body >

	<div class="container">
	  <h2>도서 구입 신청 하기</h2>
	  <p>출판사 도서명 저자명을 입력하고 등록하기를 클릭합니다</p>
	  <form class="form-horizontal" action="insertWishBook.do" method="post">
	    <div class="form-group">
	      <label for="email">출판사명:</label>
	      <input type="text" class="form-control" id="email" name="publisherNo">
	    </div>
	    <div class="form-group">
	      <label for="pwd">도서명:</label>
	      <input type="text" class="form-control" id="pwd"  name="bookTitle" required>
	    </div>
	    <div class="form-group">
	      <label for="pwd">저자명:</label>
	      <input type="text" class="form-control" id="pwd"  name="author">
	    </div>
	    <!-- <div class="checkbox">
	      <label><input type="checkbox" name="remember"> Remember me</label>
	    </div> -->
	    <button type="button" onclick="return check()" class="btn btn-default" >등록하기</button>
	    <button type="button" class="btn btn-default" onclick="javascript: history.back()">취소하기</button>
	    
	  </form>
	</div>
	<script>	
		function check() {
			if('${loginUser.id}' == '') {
				if(confirm("로그인 후 등록 할 수 있습니다")) {
					location.href="loginJsp.do";
				}
				return false;
			}
			else {
				$("form").submit();
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
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

</body>

</html>