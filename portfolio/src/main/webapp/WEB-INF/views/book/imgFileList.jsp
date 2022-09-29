<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>책표지 이미지파일 목록 조회</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	</style>
</head>
<body>

<div class="container">
  <h2>이미지파일 목록조회</h2> 
  <p>링크를 클릭하면 다운로드합니다 아이콘을 클릭하면 삭제할 수 있습니다</p>	

  	<ul class="list-group">
  		<c:if test ="${empty files }">
  			<p>파일이 없습니다</p>
  		</c:if>
  		<c:if test ="${!empty files }">
  		<c:forEach items="${files }" var ="file">
  			<li class="list-group-item"><i class="glyphicon glyphicon-remove" onclick="confirmDel(this)"></i><a href="${file }" >${file }</a></li>
  		</c:forEach>
  		</c:if>
  	</ul>
    <button type="button" class="btn" onclick="history.back()">뒤로가기</button>
</div>
<script>
	function confirmDel(element) {
		if(confirm("삭제하시겠습니까")) {
			location.href="deleteImgFile?fileUrl=" +element.nextElementSibling;
		}
	}
</script>
</body>
</html>