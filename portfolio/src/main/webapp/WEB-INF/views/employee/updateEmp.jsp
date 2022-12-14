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

<h2>????????????????????? ????????????</h2>
<div class ="row">
<div class="col-50">
<br><br>
<p>??????????????? ????????? ??????/????????? ????????? ????????? ????????? ???????????? ????????? ??? ????????????</p>
</div>
<div class="col-50">
<p>????????? ????????? '??????????????????/??????????????????'?????? ?????? ????????? ????????? ????????? ??? ????????????<br>???????????? ??? ????????? ???????????? ?????????????????? ????????? ?????? ????????? ???????????? ????????? ??? ?????? ?????????<br>
<br>????????? ???????????? ????????? ??? ??????????????? ???????????? ???????????????</p>
</div>
</div>
<div class="row">
  <div class="col-75">
    <div class="container">

	   <form action="updateEmp.do" method="post">
        <div class="row">
          
          <div class="col-50">
 
            <h3>????????????</h3>
            
            <label for="id"><i class="fa fa-user"></i>???????????????</label> 
            <input type="text" id="id" name="id" value = "${employee.id }" readonly>
            <label for="name"><i class="fa fa-user"></i>????????????</label>
            <input type="text" id="name" value = "${employee.name }" readonly>
            <label for="email"><i class="fa fa-envelope"></i> ?????????</label>
            <input type="text" id="email" value="${employee.email }" disabled>
            <label for="phone"><i class="fa fa-address-card-o"></i> ????????????</label>
            <input type="text" id="phone" value ="${employee.phone }"  disabled>


          </div>

          <div class="col-50">
            <h3>????????????</h3>
            <input type="hidden" name="empNo" value="${employee.empNo }">
            <label for="cname">??????</label>
				<div class="form-group">
				  <select class="form-control" id="sel1" name="deptCode">
				  <option value="">????????????</option>
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
				  	
				    <option value="D1" ${d1selected}>???????????????</option>
				    <option value="D2" ${d2selected}>???????????????</option>
				    <option value="D3" ${d3selected}>????????????</option>
				    <option value="D9" ${d9selected}>?????????</option> --%>
				  </select>
				</div>	
				<label for="manager">?????????</label><br>
            	<div class="form-group">
				  <select class="form-control" id="sel3" name="managerId">
				  <option value=''>???????????????</option>
				  <c:forEach items="${managerList }" var="manager" varStatus="status">
				  	 <c:if test="${manager.MEMBER_ID eq fn:substringBefore(employee.managerId, ',')}">
				  		<c:set var="selected" value="${status.index }"/>
				  	 </c:if>
				  	<option id="${status.index }" value="${manager.MEMBER_ID }">${manager.NAME_JOB}</option>
				  </c:forEach>
				  </select>
				</div>
            <label for="ccnum">??????</label>
            	<div class="form-group">
				  <select class="form-control" id="sel2" name="jobCode">
				  <option value="">????????????</option>
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
				  	
				    <option value="J1" ${j1 }>??????</option>
				    <option value="J2" ${j2 }>?????????</option>
				    <option value="J3" ${j3 }>??????</option>
				    <option value="J4" ${j4 }>??????</option>
				    <option value="J5" ${j5 }>??????</option>
				    <option value="J6" ${j6 }>??????</option>
				    <option value="J7" ${j7 }>??????</option>
				     --%>
				  </select>
				</div>
            <label for="expmonth">??????</label><br>
            <input type="number" id="expmonth" name="salary" value="${employee.salary }" placeholder=""><br>
            <label for="expyear">?????????</label><br>
            <input type="number" id="expyear" name="bonus" value="${employee.bonus }" placeholder=""><br>

            <label for="expyear">?????????</label><br>
            <input type="date" id="expyear" name="hireDate" value="${employee.hireDate }"><br>
          </div>
          
        </div>

        <input type="submit" value="????????????" class="btn">
        <input type="reset" value="?????????" class="btn" onclick="location.href='updateEmpJsp.do?empNo=${employee.empNo}';">
        <input type="button" value="????????????" class="btn" onclick="history.back()">
        <input type="button" value="????????????" class="btn" onclick="return deleteEmp()">

              </form>
            
        </div>

    </div>
  </div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function deleteEmp() {
		if(confirm("????????????????????????")) {
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
					$select.append("<option value=''>???????????????</option>");
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
