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

    <title>카테고리 등록및 수정 삭제 화면</title>

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
                    <h1 class="h3 mb-2 text-gray-800">카테고리 조정하기</h1>
                    <p class="mb-4">도서등록시 필요한 옵션인 카테고리를 설정합니다<br>메인카테고리마다 하위카테고리가 1개이상 있도록 정했습니다</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">'추가하기'를 클릭하여 새 카테고리를 입력하거나 네모안의 내용은 수정하고 삭제할 카테고리는 체크한 뒤 '저장하기'를 클릭합니다</h6>
                                     <a href="javascript:insertData()" class="btn btn-primary btn-icon-split btn-sm">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                        <span class="text">저장하기</span>
                                    </a> 
                                    <a href="insertCatJsp.do" class="btn btn-primary btn-icon-split btn-sm">
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

  <div class="container">
    <div class="row">

      <div class="col-sm-6">
      <h5><strong>전체 카테고리 조회</strong></h5>
      <ol>
    <c:forEach items="${catList }" var="mainCategory" varStatus="status">
	
	

          <li><input type="text" class="mainCatList" name="${mainCategory.catNo }" value="${mainCategory.catName }"><input class="mainCk" type="checkbox" name="" value="${mainCategory.catNo }"><button onclick="addSubCatList(this)">하위카테고리추가하기</button></li>
          


     


	         <ol>
	         	<c:forEach items="${mainCategory.subCategory }" var="subCategory" varStatus="subStatus">
				<li><input type="text" class="${mainCategory.catNo } subCatLi" name="${subCategory.catNo }" value="${subCategory.catName }"><input class="subCk" type="checkbox" name="catNo" value="${subCategory.catNo }"></li>
				</c:forEach>
			</ol>
	
	
       </c:forEach>

</ol>

    </div>
    
      <div class="col-sm-6"> 
      <h5><strong><button onclick="addOneMore()">메인카테고리추가하기</button></strong></h5>
		<ol class="mainInput">
<!-- 			<li><input type="text" class="mainCatInputs" placeholder="메인카테고리를 입력하세요">
			
			<ol>
				<li><input type="text" id="dd" placeholder="하위카테고리를 입력하세요"><button onclick="addOneMoreSub(this)">하나더추가</button></li>
			</ol>
			</li> -->
		</ol>


    </div>

</div> 
                        </div>
                  
                  
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
	$(function() {
		$(".mainCk:checkbox").on("change", function() {
			if(this.checked) {
				for(var i = 0; i < this.parentElement.nextElementSibling.childElementCount; i++) {
					this.parentElement.nextElementSibling.children[i].lastElementChild.checked = false;
					this.parentElement.nextElementSibling.children[i].lastElementChild.disabled = true;
				}
 				for(var i = this.parentElement.nextElementSibling.getElementsByClassName("subLi").length; i > 0; i--) {
					this.parentElement.nextElementSibling.getElementsByClassName("subLi")[i-1].remove();
				}
 				this.parentElement.lastElementChild.setAttribute("disabled", true);
			}else {
				for(var i = 0; i < this.parentElement.nextElementSibling.childElementCount; i++) {
					this.parentElement.nextElementSibling.children[i].lastElementChild.checked = false;
					this.parentElement.nextElementSibling.children[i].lastElementChild.disabled = false;
				}
				this.parentElement.lastElementChild.removeAttribute("disabled");
			}
		})
	})
	function addOneMore() {
		$mainInputHtml = "<li><input type='text' class='mainCatInputs' placeholder='메인카테고리를 입력하세요'><button onclick='cancelSub(this)'>취소하기</button><ol><li><input type='text' placeholder='하위카테고리를 입력하세요'><button onclick='addOneMoreSub(this)'>하나더추가</button></li></ol></li>";
		$(".mainInput").append($mainInputHtml);
	}
	function addOneMoreSub(element) {
		subInputHtml = "<li><input type='text' placeholder='하위카테고리를 입력하세요'><button onclick='cancelSub(this)'>취소하기</button></li>";
		element.parentElement.parentElement.insertAdjacentHTML("beforeend", subInputHtml);
	}
	function addSubCatList(element) {
		subInputHtml = "<li class='subLi'><input type='text' class='subCatMoreInputs' placeholder='하위카테고리를 입력하세요'><button onclick='cancelSub(this)'>취소하기</button></li>";
		element.parentElement.nextElementSibling.lastElementChild.insertAdjacentHTML("afterend", subInputHtml);
	}
	function cancelSub(element) {
		element.parentElement.remove();
	}
	function insertData() {
		for(var i = 0 ; i < document.querySelectorAll("input[type=text]").length; i++) {
			if(document.querySelectorAll("input[type=text]")[i].value == '') {
				alert("입력하지 않은 항목이 있습니다"); return;
			}
		}
		var mainInputs = new Array();
		var mainCatNos = new Array();
		var subInputs = new Array();
		<c:forEach items="${catList}" var="mainCat">
			mainCatNos.push("${mainCat.catNo}");
		</c:forEach>
		$(".mainCatInputs").each(function(index, element) {
			var mainRandom = "M" + Math.floor(Math.random() *100);
			for(var i = 0; i < mainCatNos.length; i++) {
				while(mainCatNos[i] == mainRandom) {
					mainRandom = "M" + Math.floor(Math.random() *10);	
				}
			}			
			mainCatNos.push(mainRandom);
			for(var i = 0 ; i <element.nextElementSibling.nextElementSibling.childElementCount; i++) {
				subInputs.push({catNo:mainRandom + "S"+ (i + 1), catName:element.nextElementSibling.nextElementSibling.children[i].firstChild.value});
			}
			
			mainInputs.push({catNo:mainRandom, catName:element.value});
		})

		var delMainCategories = new Array();
		$(".mainCk").each(function() {
			if(this.checked) {
				delMainCategories.push(this.value);
			}
		})

		var delSubCategories = new Array();
		var checkedSubList = document.querySelectorAll(".subCk:checked");
		for(var i = 0; i <checkedSubList.length; i++) {
			if(Boolean(checkedSubList[i].parentElement.parentElement.previousElementSibling.nextElementSibling.querySelectorAll(".subCk:checked").length == checkedSubList[i].parentElement.parentElement.previousElementSibling.nextElementSibling.childElementCount) && !(checkedSubList[i].parentElement.parentElement.previousElementSibling.querySelector(".mainCk").checked) ) {
				alert("메인카테고리에는 1개이상의 하위카테고리가 있어야합니다");
				return;
			}
			delSubCategories.push(checkedSubList[i].value);
		}

		$(".subCatMoreInputs").each(function(index,element) {
			var mainCatNo =	this.parentElement.parentElement.previousElementSibling.firstElementChild.name;
			var subSIdx = this.parentElement.parentElement.querySelectorAll(".subCatLi").item(this.parentElement.parentElement.querySelectorAll(".subCatLi").length-1).name.substring(this.parentElement.parentElement.querySelectorAll(".subCatLi").item(this.parentElement.parentElement.querySelectorAll(".subCatLi").length-1).name.indexOf("S")+1);
			var subIdx = parseInt(subSIdx)+1;
			subInputs.push({catNo:mainCatNo + "S" + subIdx, catName: element.value});
			this.classList.add("subCk");
			this.classList.add("subCatLi");
			this.setAttribute("name",mainCatNo + "S" + subIdx);
		})

		var updateMainList = new Array();
		var updateSubList = new Array();
		<c:forEach items="${catList}" var="mainCat" varStatus="mainStatus">
			var modValue = document.querySelectorAll(".mainCatList")["${mainStatus.index}"];			
 			if("${mainCat.catName}" != modValue.value) {
 				updateMainList.push({catNo:"${mainCat.catNo}", catName:modValue.value})
			}
 			<c:forEach items="${mainCat.subCategory}" var="subCat" varStatus="subStatus">
 				var modSubValue = document.querySelectorAll(".${mainCat.catNo}")["${subStatus.index}"];
  				if("${subCat.catName}" != modSubValue.value) {
 					updateSubList.push({catNo:"${subCat.catNo}",catName:modSubValue.value});
 				}
 			</c:forEach>
		</c:forEach>

		var setCategoryLists = new Array();
		setCategoryLists.push(mainInputs,subInputs,updateMainList,updateSubList);
 		if(confirm("저장하시겠습니까")) {
	  		$.ajax({
				url:"setCategories.do",
				method:"post",
				data:{setCategoryLists:JSON.stringify(setCategoryLists),
					delMainCategories:JSON.stringify(delMainCategories),
					delSubCategories:JSON.stringify(delSubCategories)},
				success:function(msg) {
					alert(msg);
					location.href="selectCatList.do";
				},
				error:function() {
					alert("통신에러입니다 처음부터 다시 시도해 주세요");
					location.href="insertCatJsp.do";
				}
			})
		} 
  
	}
	
</script>

</body>

</html>