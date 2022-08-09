<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>

<div class="w3-container">
  <h2>도서 정보 상세 보기</h2>
  <p>관리자로 로그인하면 수정/삭제 할 수 있습니다</p>

    <ul class="w3-ul w3-border">
    
    <li>도서번호
    	<ul> ${book.bookNo }</ul>
    </li>
    <li>도서명
    	<ul>${book.bookTitle }</ul>
    </li>
    <li>작가
    	<ul>${book.author }</ul>
    </li>
    <li>책표지
    	<ul><img class="" src="resources/uploadImg/${book.renameFilename }"></ul>
    </li>
     <li>출판사
    	<c:forTokens items="${book.publisherNo }" delims="," var="publisher" varStatus="status">
   			<c:if test="${status.index eq 1 }">
   				<ul>${publisher }</ul>
   			</c:if>		
        </c:forTokens> 
    </li>
    <%-- <li>ISBN
    	<ul>${book.ISBN }</ul>
    </li> --%>
    <li>상위카테고리
    	<c:forTokens items="${book.mainCategory }" delims="," var="mainCategory" varStatus="status">
   			<c:if test="${status.index eq 1 }">
   				<ul>${mainCategory }</ul>
   			</c:if>		
        </c:forTokens> 
    </li>
    <li>하위카테고리
    	<c:forTokens items="${book.subCategory }" delims="," var="subCategory" varStatus="status">
   			<c:if test="${status.index eq 1 }">
   				<ul>${subCategory }</ul>
   			</c:if>		
        </c:forTokens>
     </li>
    <li>대출여부
    	<ul>
		<c:if test="${book.rentYn eq 'Y' }">
			대출 가능
			<button id="rentLink" onclick="rentBookFn()"> 대출신청하기</button>
		</c:if>
		<c:if test="${book.rentYn eq 'N' }">
			대출 불가
		</c:if>
    	</ul>
    </li>
<%--     <li>재고
    	<ul>${book.stock }</ul>
    </li> --%>
    <%-- <c:if test="${book.rentYn eq 'N' }">
    <li>
       	<ul><a id="rentLink" onclick="rentBookFn()" disabled>&larr; 대출신청하기</a></ul>
     </li>
     </c:if> --%>
     <li>
     	<ul><a href="javascript:history.back()">&larr; 도서조회목록으로</a></ul>
     </li>
     <c:if test="${!empty role and role eq 'admin' }">  
     <li>
     	<ul>
     	<a href="updateBookJsp.do?bookNo=${book.bookNo }">&larr; 수정/삭제하는화면으로</a></ul>
     </li>
<%--      <li>
     	<ul>
     	<a href="deleteBook.do?bookNo=${book.bookNo }">&larr; 삭제하기</a></ul>
     </li> --%>	
       </c:if>	
       
      </ul>

</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
	function rentBookFn() {
		if(confirm("대출 신청하시겠습니까")) {
			if("${loginUser}" == '') {
				location.href="loginJsp.do";
			}else {
				location.href="insertRentBook.do?bookNo="+${book.bookNo};
			}
			
		}
	}
</script>
</body>
</html>