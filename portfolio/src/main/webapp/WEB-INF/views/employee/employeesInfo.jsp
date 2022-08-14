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

    <title>사원 등록 옵션 조회 화면</title>

    <!-- Custom fonts for this template -->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">


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
                    <h1 class="h3 mb-2 text-gray-800">사원 등록 옵션정보조회</h1>
                    <p class="mb-4">신입사원을 등록할때 필요한 옵션을 조회합니다</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">'추가하기'를 클릭하여 새 코드를 입력하거나 네모안의 내용은 수정하고 삭제할 코드는 체크한 뒤 '저장하기'를 클릭하면 실시간 반영됩니다</h6>
                                     <a href="javascript:saveData()" class="btn btn-primary btn-icon-split btn-sm">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                        <span class="text">저장하기</span>
                                    </a> 
                                    <a href="employeeInfo.do" class="btn btn-primary btn-icon-split btn-sm">
                                        <!-- <span class="icon text-white-50">
                                            <i class="fas fa-arrow-right"></i>
                                        </span> -->
                                        <span class="text">전체초기화</span>
                                    </a> 
                                    
                        </div>
                        
                        <div class="card-body">
                            <div class="container">
<!--   <h2>부서정보조회</h2>
  <p>클릭하면 하위카테고리를 조회할 수 있습니다</p> -->
  <form action="insertEmployeeOption.do" method="post">
  <div class="container">
    <div class="row">

      <div class="col-sm">
      <h5><strong>부서정보조회</strong></h5>
        <table style="border:1px solid" id="dept_table">
        <tr>
        	<th>부서코드</th>
        	<th>부서명</th>
        	<th>삭제여부</th>
        </tr>
        <c:forEach items="${selectDeptList }" var="deptList">
   
        <tr>
        	
        		<td>${deptList.codeId }</td>
        		<td><input type="text" class="inputDept" value="${deptList.codeName }"></td>
        		<td><input type="checkbox"></td>
        </tr>
        </c:forEach>
        <tbody></tbody>
        <tfoot>
        	<tr style="text-align:center">
        		<td colspan="3">
        		<button class="btn-sm" type="button" onclick="insertDept()">추가하기</button>
        		<button class="btn-sm" type="button" onclick="$('#dept').remove()">취소하기</button></td>
        	</tr>
        </tfoot>
        </table>


    </div>
    
      <div class="col-sm">
      <h5><strong>직급정보조회</strong></h5>
        <table style="border:1px solid" id='job_table'>
        <tr>
        	<th>직급코드</th>
        	<th>직급명</th>
        	<th>삭제여부</th>
        </tr>
        <c:forEach items="${selectJobList }" var="jobList">
        <tr>
        	
        		<td>${jobList.codeId }</td>
        		<td><input type="text" class="inputJob" value="${jobList.codeName }"></td>
        		<td><input type="checkbox"></td>
        </tr>
        </c:forEach>
        <tbody></tbody>
        <tfoot>
        	<tr style="text-align:center">
        		<td colspan="3"><button class="btn-sm" type="button" onclick="insertJob()">추가하기</button>
        		<button class="btn-sm" type="button" onclick="$('#job').remove()">취소하기</button></td>
        	</tr>
        </tfoot>
        </table>


    </div>
    
      <div class="col-sm">
      <h5><strong>급여등급정보조회</strong></h5>
        <table style="border:1px solid" id="salGrade_table">
        <tr>
        	<th>급여등급코드</th>
        	<th>등급명</th>
        	<th>등급최소급여</th>
        	<th>등급최대급여</th>
        	<th>삭제여부</th>
        </tr>
        <c:forEach items="${selectSalGradeList }" var="salGradeList">
        <tr>
        	
        		<td>${salGradeList.codeId }</td>
        		<td><input type="text" class="inputSalGradeName" value="${salGradeList.codeName }"></td>
        		<td><input type="number" class="inputSalGradeMinSal" value="${salGradeList.minSal }"></td>
        		<td><input type="number" class="inputSalGradeMaxSal" value="${salGradeList.maxSal }"></td>
        		<td><input type="checkbox"></td>
        </tr>
        </c:forEach>
        <tbody></tbody>
        <tfoot>
        	<tr style="text-align:center">
        		<td colspan="5"><button class="btn-sm" type="button" onclick="insertSalGrade()">추가하기</button>
        		<button class="btn-sm" type="button" onclick="$('#salGrade').remove()">취소하기</button></td>
        	</tr>
        </tfoot>
        </table>


    </div>

</div> 
                        </div>
                  
  </form>                   
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


<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	var deptArr = new Array();
	var jobArr = new Array();
	var salGradeArr = new Array();
	var deptDelArr = new Array();
	var jobDelArr = new Array();
	var salGradeDelArr = new Array();
	var inputDeptArr = new Array();
	var inputJobArr = new Array();
	var inputSalGradeArr = new Array();
	function insertDept() {
		$deptHtml = "<tr id='dept'><td><input type='text' class='deptId validation' name='deptId' placeholder='부서코드' required></td><td><input type='text' class='deptName validation' name='codeName' placeholder='부서명' required></td></tr>";
		$("#dept_table tbody").last().append($deptHtml);
	}
	function insertJob() {
		$jobHtml = "<tr id='job'><td><input type='text' class='jobId validation' name='jobId' placeholder='직급코드' required></td><td><input type='text' class='jobName validation' name='jobName' placeholder='직급명' required></td></tr>";
		$("#job_table tbody").last().append($jobHtml);
	}
	function insertSalGrade() {
		$salGradeHtml = "<tr id='salGrade'><td><input type='text' class='salGradeId validation' name='salGradeId' placeholder='급여등급코드' required></td><td><input type='text' class='salGradeName validation' name='salGradeName' placeholder='급여등급라벨' required></td><td><input type='number' class='minSal' name='minSal' placeholder='해당등급최소급여' required></td><td><input type='number' class='maxSal' name='maxSal' placeholder='해당등급최대급여' required></td></tr>";
		$("#salGrade_table tbody").last().append($salGradeHtml);
	}
	function saveData() {
		var flag = true;
		$(".validation").each(function(index) {
			if($(this).val() == '') {
				 flag= false;
			}
		})
		if(flag == false) {
			alert("내용을 입력하세요");
			return;
			}
		if($(".deptId").length > 0) {
			for(var i = 0; i < $(".deptId").length; i++) {
				deptArr.push({codeId:$(".deptId").eq(i).val(),codeName:$(".deptName").eq(i).val()});
			}
		}
		if($(".jobId").length > 0) {
			for(var i = 0; i <$(".jobId").length; i++) {
				jobArr.push({codeId:$(".jobId").eq(i).val(),codeName:$(".jobName").eq(i).val()});
			}
		}
		if($(".salGradeId").length > 0) {
			for(var i = 0; i < $(".salGradeId").length; i++) {
				salGradeArr.push({codeId:$(".salGradeId").eq(i).val(),codeName:$(".salGradeName").eq(i).val(),minSal:$(".minSal").eq(i).val(),maxSal:$(".maxSal").eq(i).val()});
			}
		}

		$("#dept_table :checked").each(function() {
			deptDelArr.push($(this).parent().parent().children().eq(0).text());			
		})
		$("#job_table :checked").each(function() {
			jobDelArr.push($(this).parent().parent().children().eq(0).text());
		})
		$("#salGrade_table :checked").each(function() {
			salGradeDelArr.push($(this).parent().parent().children().eq(0).text());
		})
		<c:forEach items="${selectDeptList}" var="inputDept" varStatus="status">
			if("${inputDept.codeName}"  != $(".inputDept")['${status.index}'].value) {
				inputDeptArr.push({codeId:'${inputDept.codeId}',codeName:$(".inputDept")['${status.index}'].value});
			}
		</c:forEach>
		<c:forEach items="${selectJobList}" var="inputJob" varStatus="status">
			if("${inputJob.codeName}" != $(".inputJob")['${status.index}'].value) {
				inputJobArr.push({codeId:'${inputJob.codeId}',codeName:$(".inputJob")['${status.index}'].value});
			}
		</c:forEach>
		<c:forEach items="${selectSalGradeList}" var="inputSalGrade" varStatus="status">
			if("${inputSalGrade.codeName}" != $(".inputSalGradeName")['${status.index}'].value || "${inputSalGrade.minSal}" != $(".inputSalGradeMinSal")['${status.index}'].value || "${inputSalGrade.maxSal}" != $(".inputSalGradeMaxSal")['${status.index}'].value) {
				inputSalGradeArr.push({codeId:'${inputSalGrade.codeId}',codeName:$(".inputSalGradeName")['${status.index}'].value, minSal:$(".inputSalGradeMinSal")['${status.index}'].value, maxSal:$(".inputSalGradeMaxSal")['${status.index}'].value});
			}
		</c:forEach>

 		const options = [deptArr,jobArr,salGradeArr]; 
		const delList = [deptDelArr,jobDelArr,salGradeDelArr];
		const updateList = [inputDeptArr,inputJobArr,inputSalGradeArr];

		if(confirm("저장하시겠습니까")) {
			$.ajax({
				url:"insertEmployeeOptions.do",
				method:"post",
				dataType:"json",
				data:{options:JSON.stringify(options),
					  delList:JSON.stringify(delList),
					  updateList:JSON.stringify(updateList)
				},
				complete:function() {
					deptArr = new Array();
					jobArr = new Array();
					salGradeArr = new Array();
					deptDelArr = new Array();
					jobDelArr = new Array();
					salGradeDelArr = new Array();
					inputDeptArr = new Array();
					inputJobArr = new Array();
					inputSalGradeArr = new Array();
				},		
				success:function(msg) {
					alert(msg);
					location.href="employeeInfo.do";
				},
				error:function() {
					alert("변경사항이 없습니다 중복된 코드는 없는지 확인해 주세요");
				}
			}) 
		}
	}
	
</script>

</body>

</html>