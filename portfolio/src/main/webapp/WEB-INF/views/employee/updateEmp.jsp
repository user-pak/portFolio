<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

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

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<h2>사원정보조회및 수정하기</h2>
<div class ="row">
<div class="col-50">
<br><br>
<p>기본정보는 사원이 등록/수정한 내용을 조회한 것이며 관리자는 수정할 수 없습니다</p>
</div>
<div class="col-50">
<p>부서와 직급은 '개인정보관리/사원등록옵션'에서 미리 등록해 두어야 수정할 수 있습니다<br>사원등록 후 부서를 선택하면 해당직원보다 직급이 높은 직원을 관리자로 선택할 수 있게 됩니다<br>
<br>급여를 수정하면 등록해 둔 급여등급이 자동으로 부여됩니다</p>
</div>
</div>
<div class="row">
  <div class="col-75">
    <div class="container">

	   <form action="updateEmp.do" method="post">
        <div class="row">
          
          <div class="col-50">
 
            <h3>기본정보</h3>
            
            <label for="id"><i class="fa fa-user"></i>사원아이디</label> 
            <input type="text" id="id" name="id" value = "${employee.id }" readonly>
            <label for="name"><i class="fa fa-user"></i>사원이름</label>
            <input type="text" id="name" value = "${employee.name }" readonly>
            <label for="email"><i class="fa fa-envelope"></i> 이메일</label>
            <input type="text" id="email" value="${employee.email }" disabled>
            <label for="phone"><i class="fa fa-address-card-o"></i> 전화번호</label>
            <input type="text" id="phone" value ="${employee.phone }"  disabled>


          </div>

          <div class="col-50">
            <h3>사원정보</h3>
            <input type="hidden" name="empNo" value="${employee.empNo }">
            <label for="cname">부서</label>
				<div class="form-group">
				  <select class="form-control" id="sel1" name="deptCode">
				  <option value="">부서선택</option>
				  <c:forEach items="${deptList }" var="dept">
				  	<option value="${dept.codeId }">${dept.codeName }</option>
				  </c:forEach>
				  <%-- <c:choose>
				  	<c:when test="${employee.deptCode eq 'D1'}">
				  		<c:set var="d1selected" value="selected"/>
				  	</c:when>
				  	<c:when test="${employee.deptCode eq 'D2'}">
				  		<c:set var="d2selected" value="selected"/>
				  	</c:when>
				  	<c:when test="${employee.deptCode eq 'D3'}">
				  		<c:set var="d3selected" value="selected"/>
				  	</c:when>
				  	<c:when test="${employee.deptCode eq 'D9'}">
				  		<c:set var="d9selected" value="selected"/>
				  	</c:when>
				  </c:choose>
				  	
				    <option value="D1" ${d1selected}>인사관리부</option>
				    <option value="D2" ${d2selected}>회계관리부</option>
				    <option value="D3" ${d3selected}>마케팅부</option>
				    <option value="D9" ${d9selected}>총무부</option> --%>
				  </select>
				</div>	
				<label for="manager">관리자</label><br>
            	<div class="form-group">
				  <select class="form-control" id="sel3" name="managerId">
				  <option value=''>관리자없음</option>
				  <c:forEach items="${managerList }" var="manager" varStatus="status">
				  	 <c:if test="${manager.MEMBER_ID eq fn:substringBefore(employee.managerId, ',')}">
				  		<c:set var="selected" value="${status.index }"/>
				  	 </c:if>
				  	<option id="${status.index }" value="${manager.MEMBER_ID }">${manager.NAME_JOB}</option>
				  </c:forEach>
				  </select>
				</div>
            <label for="ccnum">직급</label>
            	<div class="form-group">
				  <select class="form-control" id="sel2" name="jobCode">
				  <option value="">직급선택</option>
				  <c:forEach items="${jobList }" var="job">
				  	<option value="${job.codeId }">${job.codeName }</option>
				  </c:forEach>
				 <%--  <c:choose>
				  	<c:when test="${employee.jobCode eq 'J1' }">
				  		<c:set var="j1" value="selected"/>
				  	</c:when>
				  	<c:when test="${employee.jobCode eq 'J2' }">
				  		<c:set var="j2" value="selected"/>
				  	</c:when>
				  	<c:when test="${employee.jobCode eq 'J3' }">
				  		<c:set var="j3" value="selected"/>
				  	</c:when>
				  	<c:when test="${employee.jobCode eq 'J4' }">
				  		<c:set var="j4" value="selected"/>
				  	</c:when>
				  	<c:when test="${employee.jobCode eq 'J5' }">
				  		<c:set var="j5" value="selected"/>
				  	</c:when>
				  	<c:when test="${employee.jobCode eq 'J6' }">
				  		<c:set var="j6" value="selected"/>
				  	</c:when>
				  	<c:when test="${employee.jobCode eq 'J7' }">
				  		<c:set var="j7" value="selected"/>
				  	</c:when>
				  </c:choose>
				  	
				    <option value="J1" ${j1 }>대표</option>
				    <option value="J2" ${j2 }>부사장</option>
				    <option value="J3" ${j3 }>부장</option>
				    <option value="J4" ${j4 }>차장</option>
				    <option value="J5" ${j5 }>과장</option>
				    <option value="J6" ${j6 }>대리</option>
				    <option value="J7" ${j7 }>사원</option>
				     --%>
				  </select>
				</div>
            <label for="expmonth">급여</label><br>
            <input type="number" id="expmonth" name="salary" value="${employee.salary }" placeholder=""><br>
            <label for="expyear">보너스</label><br>
            <input type="number" id="expyear" name="bonus" value="${employee.bonus }" placeholder=""><br>

            <label for="expyear">입사일</label><br>
            <input type="date" id="expyear" name="hireDate" value="${employee.hireDate }"><br>
          </div>
          
        </div>

        <input type="submit" value="수정하기" class="btn">
        <input type="reset" value="초기화" class="btn" onclick="location.href='updateEmpJsp.do?empNo=${employee.empNo}';">
        <input type="button" value="취소하기" class="btn" onclick="history.back()">
        <input type="button" value="삭제하기" class="btn" onclick="return deleteEmp()">

              </form>
            
        </div>

    </div>
  </div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function deleteEmp() {
		if(confirm("삭제하시겠습니까")) {
			location.href="deleteEmp.do?empNo="+${employee.empNo };
		}
	}

	$(function() {
		if("${employee.deptCode}" != null) {
			$("#sel1 option[value='${employee.deptCode}']").prop("selected", true);
		}
		if("${employee.jobCode}" != null) {
			$("#sel2 option[value='${employee.jobCode}']").prop("selected", true);
		}
		if("${selected}" != '') {
			$("#sel3").children().eq("${selected}").prop("selected", true);
		}

		$("#sel1").on("change, click", function(){
			$.ajax({
				url:"selectManager.do",
				method:"post",
				dataType:"json",
				data: {deptCode: $("#sel1").val(),
					empNo:"${employee.empNo}"},
				success:function(managerList) {
					$select = $("#sel3");
					$select.html('');
					$select.append("<option value=''>관리자없음</option>");
					var managerarr = $.makeArray(managerList);			
					$.map(managerarr, function(element,index) {
						$optHtml = "<option value=" +element.MEMBER_ID +">"+element.NAME_JOB+"</option>";						
						$select.append($optHtml);
					})
					
				},
				error: function() {
					alert("error");
				}
			})
		})
	})
</script>

</body>
</html>
