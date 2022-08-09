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

    <title>게시판 조회<c:if test="${!empty role}"> 수정 삭제</c:if> 화면</title>

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
<jsp:include page="../common/topbar.jsp"></jsp:include>
<div class="container">
	
	<h2>게시글 조회<c:if test="${!empty loginUser and loginUser.id eq book.bookAuthor}">/수정/삭제</c:if> 하기</h2>
	<p><strong>게시글${board.boardNo }번</strong>의 내용을 볼 수 있습니다 <c:if test="${!empty loginUser and loginUser.id eq book.bookAuthor}"> 로그인한 작성자는 수정/삭제할 수 있습니다. 삭제시 상태값을 변경합니다.</c:if></p>

  <form id="" action="updateBoard.do" class="form-horizontal" method="post" >
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">제목:</label>
      <div class="col-sm-10">
      	<input type="hidden" name="boardNo" value="${board.boardNo }">
        <input type="text" class="form-control" id="boardTitle" placeholder="" name="boardTitle" value ="${board.boardTitle }" readonly required>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">작성자:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="pwd" placeholder="" name="" value="${board.boardAuthor}" readonly required>
      </div>
    </div> 
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">내용</label>
      <div class="col-sm-10">          
        <textarea name="boardContent" readonly>${board.boardContent }</textarea>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">마지막수정일:</label>
      <div class="col-sm-10">          
        <input type="datetime" class="form-control" id="pwd" placeholder=""  value="${board.createDate }" readonly>
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

      	<c:if test="${!empty loginUser and loginUser.id eq board.boardAuthor}">
        <button type="submit" class="btn" >수정하기</button>
        <button type="button" class="btn" onclick="location.href='home.do';">취소하기</button>
        <button type="button" class="btn" onclick="confirmFn()" >삭제하기</button>
        </c:if>
      </div>
    </div>
  </form>
	<p>로그인한 회원은 <strong>${board.boardNo }</strong>번 게시글에 댓글을 달 수 있습니다</p>

    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
      <c:if test="${empty board.replyList }">
      <ul id="emptyUl" class="list-group" >
      		<li class="list-group-item">댓글이 없습니다</li>
      </ul>
	      		
	  </c:if>
	  	
	      <ul id="replyUl" class="list-group">
	      <c:if test="${!empty board.replyList }">
      	<c:forEach items="${board.replyList }" var="reply">
	      		<li class="list-group-item" >${reply.replyContent }<br><span class="badge">${reply.replyAuthor }/${reply.replyCreateDate }</span>
		      		<c:if test="${loginUser.id eq reply.replyAuthor }">
		      		<small><a id="${reply.replyNo }" onclick="delReply(this.id)" style="cursor:pointer">삭제하기</a></small>
		      		</c:if>
	      		</li>
	      	</c:forEach>
	 	 </c:if>	
		  </ul>
		 
	<c:if test="${!empty loginUser}">
	
		<input type="text" id="replyInput" placeholder="댓글을 달아주세요">
        <button type="button" class="btn" onclick="insertReply()" >댓글달기</button>

        </c:if>
      	
              	<button type="button" class="btn" onclick="location.href='boardList.do';">목록으로</button>
              		 </div>
	 </div>
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
 	$(function () {
 		if("${loginUser.id}" == "${board.boardAuthor}") {
 			$("#boardTitle").removeAttr("readonly");
 			$("textarea").removeAttr("readonly");
 		}
 		$(".showAndHide").show();
 		setInterval(getReplyList,5000);
 	})
 	function confirmFn() {
 		if(confirm("삭제하시겠습니까")) {
 			location.href='deleteBoard.do?boardNo=${board.boardNo}';
 		}
 	}
 	function insertReply() {
 		if($("#replyInput").val() == '') {
 			alert("내용을 입력하세요");
 			return;
 		}
 		$.ajax({
 			url:"insertReply.do",
 			method:"post",
 			data:{refBno:'${board.boardNo}',
 				  replyAuthor:'${loginUser.id}',
 				  replyContent:$("#replyInput").val()},
 			dataType:"json",
 			success:function(result) {
 				$("#emptyUl").hide();
 				$("#replyInput").val('');
 				getReplyList();
 			},
 			error:function() {
 				alert('에러가 발생했습니다 다시 작성해 주세요');
 			}
 		})
 	}
 	function getReplyList() {
 		$.ajax({
 			url:"getReplyList.do",
 			method:"post",
 			data:{refBno:'${board.boardNo}'},
 			dataType:"json",
 			success:function(replyList) {
 				if(replyList == '') {
 					$("#emptyUl").show();
 				}
 				$("#replyUl").html('');
 				$.each(replyList, function(index, element) {
 //					console.log(element);
 					$liHtml = "<li class='list-group-item' >"+element.replyContent+"<br><span class='badge'>"+element.replyAuthor+"/"+element.replyCreateDate+"</span></li>";
 					$authorLiHtml = "<li class='list-group-item' >"+element.replyContent+"<br><span class='badge'>"+element.replyAuthor+"/"+element.replyCreateDate+"</span>"+ " " +"<small><a id=" +element.replyNo +" onclick='delReply(this.id)' style='cursor:pointer'>삭제하기</a></small></li>";
 					if("${loginUser.id}" == element.replyAuthor) {
 						$("#replyUl").append($authorLiHtml);
 					}else {
 						$("#replyUl").append($liHtml);
 					}
 				})
 			},
 			error:function() {
 				//alert('getReply failed');
 			}
 		})
 	}
	function delReply(param) {
		if(confirm("삭제하시겠습니까")) {
			$.ajax({
				url:"deleteReplyAjax.do",
				method:"post",
				/* dataType:"text", */
				data:{replyNo:param},
				success:function(msg) {					
					if(msg != '') {
						alert(msg);
					}
					getReplyList();
				},
				error:function() {
					alert("ajax error");
				}
			})
		}
	}
</script>
</body>

</html>