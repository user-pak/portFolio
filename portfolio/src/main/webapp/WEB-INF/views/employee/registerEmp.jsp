<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<h2>???????????? ????????????</h2>
<div class ="row">
<div class="col-50">
<p>??????????????? ????????? ??????/????????? ???????????? ???????????? ????????? ???????????????</p>
</div>
<div class="col-50">
<p>????????? ????????? '??????????????????/??????????????????'?????? ?????? ????????? ????????? ????????? ??? ????????????<br>????????? ???????????? ??????????????? ??? ????????? ?????????????????? ?????????<br>????????? ???????????? ???????????? ???????????????  ???????????????<br>??????????????? ???????????? ???????????? ??????????????? ???????????????</p>
</div>
</div>

<div class="row">
  <div class="col-75">
    <div class="container">

	   <form action="registerEmp.do" method="post">
        <div class="row">
          
          <div class="col-50">
 
            <h3>????????????</h3>
            
            <label for="id"><i class="fa fa-user"></i>???????????????</label> 
            <input type="text" id="id" name="id" value="${member.id }" readonly>
            <label for="name"><i class="fa fa-user"></i>????????????</label>
            <input type="text" id="name" value="${member.name }" readonly>
            <label for="email"><i class="fa fa-envelope"></i> ?????????</label>
            <input type="text" id="email" value="${member.email }" disabled>
            <label for="phone"><i class="fa fa-address-card-o"></i> ????????????</label>
            <input type="text" id="phone" value="${member.phone }" disabled>


          </div>

          <div class="col-50">
            <h3>????????????</h3>
            <label for="cname">??????</label>
				<div class="form-group">
				  <select class="form-control" id="sel1" name="deptCode">
				  	<option value="">????????????</option>
				  	<c:forEach items="${deptList }" var="dept">
				  		<option value="${dept.codeId }">${dept.codeName }</option>
				  	</c:forEach>
				  </select>
				</div>	
 			<label for="manager">?????????</label><br>
            	<div class="form-group">
				  <select class="form-control" id="sel3" name="managerId">			    
				  </select>
				</div> 
            <label for="ccnum">??????</label>
            	<div class="form-group">
				  <select class="form-control" id="sel2" name="jobCode">
				  	<option value="">????????????</option>
				  	<c:forEach items="${jobList }" var="job">
				  		<option value="${job.codeId }">${job.codeName }</option>
				  	</c:forEach>
				  </select>
				</div>

            <label for="expmonth">??????</label><br>
            <input type="number" id="salary" name="salary"  placeholder=""><br>
            <label for="expyear">?????????</label><br>
            <input type="number" id="bonus" name="bonus"  placeholder=""><br>
            <label for="expyear">?????????</label><br>
            <input type="date" id="hireDate" name="hireDate" placeholder=""><br>

          </div>
          
        </div>

        <input type="submit" value="????????????" class="btn">
        <input type="button" value="????????????" class="btn" onclick="history.back()" >
              </form>
        </div>

    </div>
  </div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#sel1").on("change, click", function(){
			$.ajax({
				url:"selectManager.do",
				method:"post",
				dataType:"json",
				data: {deptCode: $("#sel1").val()},		
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
