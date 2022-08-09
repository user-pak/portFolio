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

    <title>출판사 수정 삭제 화면</title>

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
	  <h2>출판사 수정하기</h2>
	  <p><strong>${publisher.pubName }</strong>의 정보를 수정/삭제합니다. 삭제시 상태값을 변경합니다.</p>
	  <form class="form-horizontal" method="post" action="updatePub.do">
	    <div class="form-group">
	      <label for="email">출판사명:</label>
	      <input type="hidden" name="pubNo" value="${publisher.pubNo }">
	      <input type="text" class="form-control" id="email" name="pubName" value="${publisher.pubName }">
	    </div>
	    <div class="form-group">
	      <label for="pwd">연락처:</label>
	      <input type="text" class="form-control" id="pwd"  name="pubPhone" value="${publisher.pubPhone }">
	    </div>
	    <div class="form-group">
		    <div class="checkbox">
		      <c:if test="${publisher.dealYn eq 'Y' }">
		      <label>사용여부 <input type="checkbox" name="dealYn" value="Y" checked></label>
		      </c:if>
		      <c:if test="${publisher.dealYn eq 'N' }">
		      <label>사용여부 <input type="checkbox" name="dealYn" value="Y" ></label>
		      </c:if>
		      <small>체크를 지우면 신규도서등록시 옵션에서 제외됩니다</small>
		    </div>
	    </div>
	    <button type="submit" class="btn btn-default" >수정하기</button>
	    <button type="button" class="btn btn-default" onclick="delFn()">삭제하기</button>
	    <button type="button" class="btn btn-default" onclick="javascript:history.back()">취소하기</button>
	  </form>
	</div>

    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>
	<script>
		$(function() {
			$("input[name=pubNo]").val(Number($("input[name=pubNo]").val()));
		})
		function delFn() {
			if(confirm("삭제하시겠습니까")) {
				location.href="deletePub.do?pubNo=" +${publisher.pubNo};
			}			
		}
	</script>
</body>

</html>