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

    <title>도서 대출 이용 현황 조회 화면</title>

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
                    <h1 class="h3 mb-2 text-gray-800">도서 대출 이용 현황</h1>
                    <p class="mb-4">관리자는 대출된 모든 도서 목록을 볼 수 있습니다</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">개인 대출 정보를 볼 수 있습니다</h6>
                            	반납예정일이 남아있는 도서를 클릭하면 반납할지 묻습니다<br>반납완료된 도서는 반납한 날짜를 보여줍니다          
                        </div>
                        
                        <div class="card-body">
                            <div class="table-responsive">

                                <table class="table table-bordered" id="table_rentBookList" width="100%" cellspacing="0" style="cursor:pointer">
                                    <thead>
                                        <tr>
                                            <th>도서번호</th>
                                            <th>도서명</th>
                                             <c:if test="${!empty role and role eq 'admin' }">
                                             <c:set var="idCheck" value='0'/>
                                            <th>대출한 회원 아이디</th>
                                           	</c:if>
                                           	<c:if test="${!empty role and role ne 'admin' }">
                                           	<c:set var="idCheck" value='1'/>
                                           	<th>저자명</th>
                                           	</c:if>
                                            <th>대출 일자</th>
                                            <th>반납 예정일</th>                                          
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

			var table = $("#table_rentBookList").DataTable({
				data : ${historyRentList},
				processing: true,
				columns:[
					{data:"refBno"},
					{data:"bookName"},
					{data:"refMemId",
						render: function(data) {
							data = data.split(',');
							if(${idCheck} == 0) {								
								return data[0];
							}else {
								return data[1];
							}
						}},
					{data:"rentDate"},
					{data:"returnDate",
						  render: function(data, type, row) {
							  if(row.returnCk == 0) {
								  if(data < new Date().toISOString()) {
									  return "연체중";
								  }
								  return data;
							  }else if(row.returnCk == 1) {
								  return "반납완료";
							  }
						  }}
				],
				order:[[3,"desc"]]
			})
/* 		
		$("#table_bookList tbody tr td").on("mouseenter", function(){
	  		$(this).parent().css({"background-color":"lightgray", "cursor":"pointer"});
			}).on("mouseout", function(){
				$(this).parent().css("background-color", "white");
			}); */
				
		$('#table_rentBookList tbody').on( 'click', 'tr', function () {
			if(table.row(this).data().returnCk == 1) {
				alert(table.row(this).data().returnDate + "에 반납하셨습니다");
			}
			else if(confirm("반납 하시겠습니까")) {
				location.href="updateRentBook.do?refBno=" + table.row(this).data().refBno;
			}
			}
		 );
	})

	
</script>

</body>

</html>