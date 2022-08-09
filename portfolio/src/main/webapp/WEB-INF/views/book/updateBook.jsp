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

    <title>도서  수정 삭제 화면</title>

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
	</style>
</head>

<body >
<div class="container">
   <h2>도서정보수정하기</h2>
	<p><strong>${book.bookTitle }</strong>의 정보를 수정/삭제합니다. 삭제시 상태값을 변경합니다.</p>
  <form id="updateBookForm" action="updateBook.do" class="form-horizontal" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">도서명:</label>
      <div class="col-sm-10">
      	<input type="hidden" name="bookNo" value="${book.bookNo }">
        <input type="text" class="form-control" id="email" placeholder="" name="bookTitle" value ="${book.bookTitle }" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">저자명:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="pwd" placeholder="" name="author" value="${book.author }" required>
      </div>
    </div>
    <%-- <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">가격(원):</label>
      <div class="col-sm-10">          
        <input type="number" class="form-control" id="priceInput" placeholder="" name="price" value="${book.price }">
      </div>
    </div> --%>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">출판사:</label>
      <div class="col-sm-10">
      	<c:forTokens items="${book.publisherNo }" delims="," var="publisher" varStatus="status">
      		<c:choose>
      			<c:when test="${status.index eq 0 }">
      				<c:set var="publisherNo" value="${publisher } "/>
      			</c:when>
      			<c:when test="${status.index eq 1 }">
      				<c:set var="publisherName" value="${publisher }"/>
      			</c:when>
      		</c:choose>
        </c:forTokens> 
        <select name="publisherNo" class="form-control" id="selectPub" >
        	<option value="${publisherNo }">${publisherName }</option>
        </select>  
      </div>
     </div> 
     <!-- <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">ISBN:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="pwd" placeholder="" name="ISBN">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">장수:</label>
      <div class="col-sm-10">          
        <input type="number" class="form-control" id="pageInput" placeholder="" name="page">
      </div>
    </div> -->
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">메인카테고리:</label>
      <div class="col-sm-10"> 
      <c:if test="${book.mainCategory ne '' }">
	      <c:forTokens items="${book.mainCategory }" delims="," var="mainCategory" varStatus="status">
	      	<c:choose>
	      		<c:when test="${status.index eq 0 }">
	      			<c:set var="mainCategoryNo" value="${mainCategory }"/>
	      		</c:when>
	      		<c:when test="${status.index eq 1 }">
	      			<c:set var="mainCategoryName" value="${mainCategory }"/>
	      		</c:when>
	      	</c:choose>
	        </c:forTokens>     
	        <select name="mainCategory" class="form-control" id="selectMainCategory" >
	        	<option value="${mainCategoryNo }">${mainCategoryName }</option>
	        </select>
	  </c:if>
	  <c:if test="${book.mainCategory eq '' }">
	  	<select name="mainCategory" class="form-control" id="selectMainCategory" >
	        	<option value="">카테고리를 선택하세요</option>
	     </select>
	  </c:if>           
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">하위카테고리:</label>
      <div class="col-sm-10">  
      	<c:forTokens items="${book.subCategory }" delims="," var="subCategory" varStatus="status">
      		<c:choose>
	   			<c:when test="${status.index eq 0 }">
	   				<c:set var = "subCategoryNo" value="${subCategory}"/>
	   			</c:when>
	   			<c:when test="${status.index eq 1 }">
	   				<c:set var= "subCategoryName" value="${subCategory }"/>
	   			</c:when>
	   		</c:choose>		
	        </c:forTokens> 
	        <select name="subCategory" class="form-control" id="selectSubCategory" >
	        	<option value="${subCategoryNo }">${subCategoryName}</option>
	        </select>        
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">발행일:</label>
      <div class="col-sm-10">          
        <input type="date" class="form-control" id="issueDateInput" placeholder="" name="issueDate" value="${book.issueDate }">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
      <label class="control-label">책표지로 사용할 이미지: </label>
        <div class="img">         
          <img class="" src="resources/uploadImg/${book.renameFilename }" alt="책표지가 없습니다.등록해주세요">
        </div>
        <input type="file" name="updateBookImg">
      </div>
    </div>
    <!-- <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">재고:</label>
      <div class="col-sm-10">          
        <input type="number" class="form-control" id="pageInput" placeholder="" name="stock" min=1>
      </div>
    </div> -->
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
	      <c:if test="${book.rentYn eq 'N' }">
	      <label>대출중인 도서입니다 삭제할 수 없습니다</label>
	      </c:if>
	    </div>
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
      	<button type="button" class="btn" onclick="location.href='selectBookList.do';">취소하기</button>
        <button type="submit" class="btn" onclick="return checkValues()">수정하기</button>
        <button type="reset" class="btn" onclick="location.href='updateBookJsp.do?bookNo=${book.bookNo}';">초기화</button>
        <c:if test="${book.rentYn eq 'Y' }">
        <button type="button" class="btn" onclick="delFn()">삭제하기</button>
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
		var pubList = new Array();
		var subCategory = new Map();
		var catList = new Array();
		$.ajax({
			url:"selectInsertBook.do",
			method:"post",
			dataType:"json",
			success: function(insertBookMap) {
				$.map(insertBookMap, function(element, index) {
					if(index == "pubList") {
						pubList = element;
					}
					if(index == "catList") {
						catList = element;
						$.each(element, function(index, value) {
							subCategory.set(value.catNo, value.subCategory);	
						})
					}					
				})
			},
			error: function() {
				alert("selectInsertBookMap error");
			}
		})
		$("#selectMainCategory").one("click", function() {			
			$("#selectMainCategory").html('');
			$("#selectMainCategory").append("<option value=''>카테고리를 선택하세요</option>");
			$.each(catList, function(index, element) {
				$("#selectMainCategory").append("<option value="+element.catNo+">" + element.catName + "</option>");
			})
		})
		$("#selectMainCategory").on("change",function() {
			var subCatList = subCategory.get($("#selectMainCategory").val());
			$("#selectSubCategory").html('');
			$.each(subCatList, function(index, element) {				
				$("#selectSubCategory").append("<option value=" + element.catNo + ">" + element.catName + "</option>");
			})
		})
		$("#selectSubCategory").on("click", function() {
			var subCatList = subCategory.get($("#selectMainCategory").val());
			$("#selectSubCategory").html('');
			$.each(subCatList, function(index, element) {				
				$("#selectSubCategory").append("<option value=" + element.catNo + ">" + element.catName + "</option>");
			})
		})
		$("#selectPub").one("click", function() {
			$("#selectPub").html('');
			$.each(pubList, function(index,value) {
				$("#selectPub").append("<option value="+value.pubNo+">"+value.pubName+"</option>");
			})
		})
		
	})
	
	/* function checkValues() {
		if($("#updateBookForm input[name=price]").val('')) {$("#priceInput").val(0);}
		if($("#pageInput").val('')) {$("#pageInput").val(0);}
		if($("input[name=stock]").val('')) {$("input[name=stock]").val(1);}
		if($("#issueDateInput").val('')) {$("#issueDateInput").val(new Date().toISOString().slice(0, 10));}
		return true;
	} */
	function delFn() {
		if(confirm("삭제하시겠습니까")) {
			location.href="deleteBook.do?bookNo="+${book.bookNo};
		}
	}
	
</script>
</body>

</html>