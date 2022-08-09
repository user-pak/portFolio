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

    <title>출판사 목록 조회 화면</title>

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
                    <h1 class="h3 mb-2 text-gray-800">출판사정보조회</h1>
                    <p class="mb-4">신규도서를 등록할때 필요한 옵션을 조회하고 등록합니다.클릭하면 수정/삭제 화면으로 이동합니다.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">새로운 출판사를 등록할 수 있습니다</h6>
                                    <a href="insertPubJsp.do" class="btn btn-primary btn-icon-split btn-sm">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                        <span class="text">신규출판사등록하기</span>
                                    </a>
                        </div>
                        
                        <div class="card-body">
                            <div class="table-responsive">

                                <table class="table table-bordered" id="table_pubList" width="100%" cellspacing="0" style="cursor: pointer">
                                    <thead>
                                        <tr>
                                            <th>출판사번호</th>
                                            <th>출판사이름</th>
                                            <th>연락처</th>
                                            <th>사용여부</th>
                                            <th>등록일</th>
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
		if("${msg}" != "") {alert(${msg});}

			var table = $("#table_pubList").DataTable({
				data : ${pubList},
				processing: true,
				columns:[
					{data:"pubNo"},
					{data:"pubName"},
					{data:"pubPhone"},
					{data:"dealYn",
						render: function(data, row, type) {
							if(data == "Y") { return "사용중";} else {return "사용중지";}
					}},
					{data:"createDate"}
				],
				order:[[4,"desc"]]
			})
		
			

		
		/* $("#table_pubList tbody tr td").mouseenter(function(){
  		$(this).parent().css({"background-color":"lightgray", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css("background-color", "white");
		}); */
			
		$('#table_pubList tbody tr').on( 'click', function () {
			if(confirm("수정하시겠습니까")) {
				location.href="updatePubJsp.do?pubNo="+table.row(this).data().pubNo;
			} 

			}
		 );
	})

	
</script>

</body>

</html>