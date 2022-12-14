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

<h2>?????? ?????? ??????</h2>
<p>?????? ????????? ???????????? ???????????????<br>???????????? ????????? ??? ????????????<br> ????????????????????? ????????? ???????????????</p>
<div class="row">
  <div class="col-75">
    <div class="container">

	   <form action="updateMember.do" method="post">
        <div class="row">
          
          <div class="col-50">
 
            <h3>????????????</h3>
            
            <label for="id"><i class="fa fa-user"></i>?????????</label> 
            <input type="text" name="id" value = "${loginUser.id }" readonly>
            <label for="name"><i class="fa fa-user"></i>??????</label>
            <input type="text" name ="name" value = "${loginUser.name }" >
            <%-- <label for="name"><i class="fa fa-user"></i>??????????????????</label>
            <input type="text" name="no" value = "${loginUser.no }" readonly> --%>
            <label for="email"><i class="fa fa-envelope"></i> ?????????</label>
            <input type="text" name="email" value="${loginUser.email }">
            <label for="phone"><i class="fa fa-address-card-o"></i> ????????????</label>
            <input type="text" name="phone" value ="${loginUser.phone }" >
            <label for="phone"><i class="fa fa-address-card-o"></i> ??????</label>
            <input type="text" name="address" value ="${loginUser.address }" >
            <div style="display:inline-block" align="center">
            	<input type="submit" value="????????????" class="btn" onclick="return convert()">
		        <input type="reset" value="?????????" class="btn">
		        <input type="button" value="????????????" class="btn" onclick="location.href='home.do';">
		        <button type="button" class="btn" data-toggle="modal" data-target="#myModal">????????????????????????</button>
            </div>
		
</form>

          </div>
          

          <!-- Trigger the modal with a button -->

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">??????????????????</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
        	<form action="changePassword.do" method="post">
                                   
                                        
                                    
                                    <input type="hidden" name="id" value="${loginUser.id }">
                                        <input type="password" class="form-control form-control-user" name="password"
                                            id="exampleInputPassword" placeholder="????????? ??????????????? ??????????????????" >
                                   
                                    
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleRepeatPassword" placeholder="???????????? ????????? ??????????????? ??????????????????">
                             
                                </div>
      </div>
      <div class="modal-footer">
        <button type="submit" onclick="return submitFn()" class="btn btn-default" >????????????</button>
             </form>
      </div>
    </div>

  </div>
</div>
          
        </div>

        

       
            
        </div>

    </div>
  </div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		if("${msg}" != '') {
			alert('${msg}');
			$("#myModal").attr("data-dismiss","modal");
		}
	})
	function submitFn() {
		if($("#exampleInputPassword").val() != $("#exampleRepeatPassword").val()) {
			alert("??????????????? ???????????? ????????????");
			$("#exampleRepeatPassword").focus();
			return false;
		}
	}
</script>

</body>
</html>
