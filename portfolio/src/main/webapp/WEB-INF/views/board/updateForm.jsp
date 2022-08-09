<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>updateForm</title>
</head>
<body>
<%-- 		<label>제목</label>
		<input type="text" name="title" value="${board.title }"><br>
		<label>작성자</label>
		<input type="text" name="writer" value="${loginUser.userName.writer }" ><br>
		<label>내용</label><br>
		<textarea name="content" rows="30" cols="100">${board.content }</textarea><br>
		<label>첨부파일</label>
		<c:if test="${!empty board.originalFileName }">
			<a href="${pageContext.servletContext.contextPath }/resources/uploadFiles/${board.renameFileName}" 
				download="${board.originalFileName }">${board.originalFileName }</a>
		</c:if>
		<button onclick="location.href='selectBoardList.do';">목록으로</button>
		<button onclick="location.href='updateForm.do';">수정하기</button> --%>
		
</body>
</html>