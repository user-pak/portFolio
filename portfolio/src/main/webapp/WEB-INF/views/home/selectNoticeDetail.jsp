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

    <title>공지사항 조회<c:if test="${!empty role and role eq 'admin'}"> 수정 삭제</c:if> 화면</title>

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
	
	<h2>공지사항 조회<c:if test="${!empty role and role eq 'admin'}">/수정/삭제</c:if> 하기</h2>
	<p><strong>공지사항${notice.noticeNo }번</strong>의 내용을 볼 수 있습니다 <c:if test="${!empty role and role eq 'admin' }"> 관리자는 수정/삭제할 수 있습니다. 삭제시 상태값을 변경합니다.</c:if></p>

  <form id="updateBookForm" action="updateNotice.do" class="form-horizontal" method="post" >
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">분류:</label>
      <div class="col-sm-10">
      	<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
        <input type="text" class="form-control" id="email" placeholder="" name="noticeCategory" value ="${notice.noticeCategory }" readonly required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">제목:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="pwd" placeholder="" name="noticeTitle" value="${notice.noticeTitle }" readonly required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">내용</label>
      <div class="col-sm-10">          
        <textarea name="content" readonly>${notice.content }</textarea>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">마지막수정일:</label>
      <div class="col-sm-10">          
        <input type="datetime" class="form-control" id="pwd" placeholder=""  value="${notice.createDate }" readonly>
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
      	<button type="button" class="btn" onclick="javascript: history.back()">뒤로가기</button>
      	<c:if test="${!empty role and role eq 'admin' }">
        <button type="submit" class="btn" >수정하기</button>
        <button type="reset" class="btn" >초기화</button>
        <button type="button" class="btn" onclick="delFn()"location.href='deleteNotice.do?noticeNo=${notice.noticeNo}';">삭제하기</button>
        </c:if>
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
	$(function() {
		if("${role}" == 'admin') {
			$(":input[type=text]").attr("readonly",false);
			$("textarea").attr("readonly",false);
		}
	})
	function delFn() {
		if(confirm("삭제하시겠습니까")) {
			location.href="deleteNotice.do?noticeNo="+${notice.noticeNo};
		}
	}
</script>
</body>

</html>