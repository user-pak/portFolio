<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.ibatis.javassist.compiler.Javac"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>신규 도서 등록 화면</title>

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
  <h2>신규 도서 등록하기</h2> 
  <p>출판사, 메인/하위카테고리 select는 ajax로 목록을 불러옵니다</p>
  <form action="insertBook.do" class="form-horizontal" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">도서명:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="email" placeholder="" name="bookTitle" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">저자명:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="pwd" placeholder="" name="author" required>
      </div>
    </div>
    <!-- <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">가격(원):</label>
      <div class="col-sm-10">          
        <input type="number" class="form-control" id="priceInput" placeholder="" name="price" value=1000>
      </div>
    </div> -->
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">출판사:</label>
      <div class="col-sm-10">          
        <select name="publisherNo" class="form-control" id="selectPub">
        	
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
        <input type="number" class="form-control" id="pageInput" placeholder="" name="page" min=1 value=1>
      </div>
    </div> -->
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">메인카테고리:</label>
      <div class="col-sm-10">          
        <select name="mainCategory" class="form-control" id="selectMainCategory">
        	
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">하위카테고리:</label>
      <div class="col-sm-10">          
        <select id="selectSubCategory" class="form-control" name="subCategory" >
        	
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">발행일:</label>
      <div class="col-sm-10">          
        <input type="date" class="form-control" id="issueDateInput" placeholder="" name="issueDate">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="img">
          <label class="control-label">책표지로 사용할 이미지: </label>
          <input type="file" name="bookImg">
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-10">          
        <a href="imgFileList">이미지파일목록 조회하기</a>
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
        <button type="submit" class="btn"  >등록하기</button>
        <button type="reset" class="btn">초기화</button>
        <button type="button" class="btn" onclick="location.href='home.do';">취소하기</button>
        <button type="button" class="btn" onclick="location.href='selectBookList.do';">전체도서목록보기</button>
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
		var subCategory = new Map();
		$.ajax({
			url:"selectInsertBook.do",
			method:"post",
			dataType:"json",
			success: function(insertBookMap) {
				$.map(insertBookMap, function(element, index) {
					if(index == "pubList") {
						$("#selectPub").html('');	
						$.each(element, function(index,value) {
							$("#selectPub").append("<option value="+value.pubNo+">"+value.pubName+"</option>");
						})
					}
					if(index == "catList") {
						$("#selectMainCategory").html('');
						$("#selectMainCategory").append("<option value=''>카테고리를 선택하세요</option>")
						$.each(element, function(index, value) {
							subCategory.set(value.catNo, value.subCategory);	
							$("#selectMainCategory").append("<option value="+value.catNo+">" + value.catName + "</option>");
						})
					}					
				})
			},
			error: function() {
				alert("selectpublist error");
			}
		})
		$("#selectMainCategory").on("change", function() {
			var subCatList = subCategory.get($("#selectMainCategory").val());
			$("#selectSubCategory").html('');
			$.each(subCatList, function(index, element) {				
				$("#selectSubCategory").append("<option value=" + element.catNo + ">" + element.catName + "</option>");
			})
		})
	})
	function isEmpty() {
		if($("input[name=bookTitle]").val() == '') {
			alert("도서명을 입력하세요");
			return false;
		}
	}
	
</script>
</body>

</html>