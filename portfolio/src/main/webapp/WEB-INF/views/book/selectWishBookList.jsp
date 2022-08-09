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

    <title>도서 구입 신청 내역 조회 화면</title>

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
                    <h1 class="h3 mb-2 text-gray-800">도서 신청 내역 조회</h1>
                    <p class="mb-4">사원이 구입을 희망하는 도서 목록을 볼 수 있습니다</p>

                   <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">..개발중입니다..</h6>
                                    <a href="" class="btn btn-primary btn-icon-split btn-sm">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                        <span class="text">구입하기로..</span>
                                    </a>
                        </div>
              
      
              
                        <div class="card-body">
                            <div class="table-responsive">

                                <table class="table table-bordered" id="table_wishBookList" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>도서명</th>
                                            <th>작가명</th>
                                            <th>출판사이름</th>
                                            <th>신청자</th>
                                            <th>신청일</th>

                                            
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
	$(function() {
		if("${msg}" != "") {alert('${msg}');}
		var table = $("#table_wishBookList").DataTable({
			data : ${wishBookList},
			processing: true,
			columns:[
				{data:"bookTitle"},
				{data:"author"},
				{data:"publisherNo"},
				{data:"ISBN"},
				{data:"issueDate"}
			],
			order:[[4,"desc"]]
		})
			
		
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