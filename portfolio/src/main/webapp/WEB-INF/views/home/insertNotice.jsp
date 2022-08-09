<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>공지사항 작성 화면</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
	<style>
		.btn {
		  background-color: #04AA6D;
		  color: white;
		  padding: 12px;
		  margin: 10px 0;
		  border: none;

		  border-radius: 3px;
		  cursor: pointer;
		  font-size: 17px;
		}

		textarea {
		  maxlength :255;
		  width: 100%;
		}
	</style>
</head>

<body >
<div class="container">
   <h2>공지사항 작성하기</h2>
	<p>공지사항을 작성합니다</p>
  <form id="updateBookForm" action="insertNotice.do" class="form-horizontal" method="post" >
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">분류:</label>
      <div class="col-sm-10">     	
        <input type="text" class="form-control" id="email" placeholder="" name="noticeCategory" >
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">제목:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="pwd" placeholder="" name="noticeTitle" >
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">내용</label>
      <div class="col-sm-10">          
        <textarea name="content"></textarea>
      </div>
    </div>
    <!-- <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox" name="remember"> Remember me</label>
        </div>
      </div>
    </div> -->
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn" >작성하기</button>
        <button type="button" class="btn" onclick="history.back();">취소하기</button>
      </div>
    </div>
  </form>
</div>

    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	
</script>
</body>

</html>