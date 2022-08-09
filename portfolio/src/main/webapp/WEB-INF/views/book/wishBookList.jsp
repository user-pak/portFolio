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

    <title>도서 신청 화면</title>

    <!-- Custom fonts for this template -->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
		<jsp:include page="../common/sidebar.jsp"></jsp:include>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
			<jsp:include page="../common/topbar.jsp"></jsp:include>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">도서 검색 및 신청하기</h1>
                    <p class="mb-4">도서를 검색하고 희망하는 도서가 없으면 구입 신청합니다</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                    <!-- Topbar Search -->
                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" >
          	
                        <div class="input-group" >
                        	 <select name="condition" class="form-control" id="condition">
					        	<option value="book">도서명</option>
					        	<option value="author">저자명</option>
					        	<option value="publisher">출판사명</option>
					        </select> 	
                            <input type="text" class="form-control bg-light border-1 " placeholder="검색할 내용"
                                aria-label="Search" aria-describedby="basic-addon2" name="content" >
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button" onclick="search()">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                              </form>
                        </div>
              
      
              
                        <div class="card-body">
                            <div class="table-responsive">

                                <table class="table table-bordered" id="table_seachList" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>도서번호</th>
                                            <th>도서명</th>
                                            <th>작가명</th>
                                            <th>가격</th>
                                            <th>출판사이름</th>
                                            <th>ISBN</th>
                                            <th>장수</th>
                                            <th>메인카테고리</th>
                                            <th>하위카테고리</th>
                                            <th>발행일</th>
                                            <th>대출여부</th>
                                            <th>재고</th>
                                            
                                        </tr>
                                    </thead>

                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="resources/js/demo/datatables-demo.js"></script>
<script src="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	function search() {
		$.ajax({
			url: "searchBook.do",
			method: "get",
			data: {condition: $("#condition").val(),
				   content: $("input[name=content]").val()},
			dataType: "json",
			success:function(searchBookList) {
				var table = $("#table_seachList").DataTable({
					data : searchBookList,
					processing: true,
					columns:[
						{data:"bookNo"},
						{data:"bookTitle"},
						{data:"author"},
						{data:"price"},
						{data:"publisherNo"},
						{data:"ISBN"},
						{data:"page"},
						{data:"mainCategory"},
						{data:"subCategory"},
						{data:"issueDate"},
						{data:"rentYn",
							render: function(data, row, type) {
								if(data == 'Y') {						
								return "대출중";}
							else if(data == 'N') {
								return "대출가능";}
						}},
						{data:"stock"}
					]
				})
			},
			error:function() {
				if(confirm("검색하신 도서는 현재 없습니다 구입 신청하시겠습니까")) {
					location.href="buyBook.do?condition="+ $('#condition').val()+ "&content=" +$('input[name=content]').val();
				}
			}
		})
	}
	$(function() {
		if("${msg}" != "") {alert('${msg}');}

			
		
		$("#table_bookList tbody tr td").on("mouseenter", function(){
	  		$(this).parent().css({"background-color":"lightgray", "cursor":"pointer"});
			}).on("mouseout", function(){
				$(this).parent().css("background-color", "white");
			});
				
		$('#table_bookList tbody').on( 'click', 'tr', function () {
			if(confirm("상세조회 하시겠습니까")) {
				location.href="selectBookDetail.do?bookNo=" + table.row(this).data().bookNo;
			}
			}
		 );
		
/* 	    $('#example tbody').on('click', 'button', function () {
	        var data = table.row($(this).parents('tr')).data();
	        alert(data[0] + "'s salary is: " + data[5]);
	    }); */
	})

	
</script>

</body>

</html>