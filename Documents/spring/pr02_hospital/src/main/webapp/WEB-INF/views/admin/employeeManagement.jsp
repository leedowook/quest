<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">
  <script src='//code.jquery.com/jquery.js'></script>
  <script>
  var example=[{
		"id":"emp000000",
		"name":"김뭐뭐",
		"birth":"2020/11/11",
		"position":"전문의",
		"department":"피부과",
		"updateDate":"2037/11/11"

	},
	{
		"id":"empaa0000",
		"name":"김땡땡",
		"birth":"2020/11/11",
		"position":"간호사",
		"department":"치과",
		"updateDate":"2037/11/11"


	}

	]

  
	$(document).ready(function () {
	 $('#empTable').DataTable({
		data: example,
		 columns: [
		     {"data": 'id'},
	    	 {"data": 'name'},
	      	 {"data": 'birth'}, 
	         {"data": 'position'}, 
	         {"data": 'department'}, 
	       	 {"data": 'updateDate'}
	   	 ]
		});
	});
  	function reloadTable(){
  		$('#empTable').dataTable().fnClearTable(); 
  		$('#empTable').dataTable().fnAddData(example);
  	}
  	function addAttribute(){
  		var newData=$("#register_frm").serializeArray();
  		example.push(newData);
  		reloadTable();
  		//form 데이터 가져옴 , 받음 , 실행, form 초기화 
  	}
  	function delAttribute(id){
  		for(var i; i<example.length;i++){
  			if(example[i].id==id){
  				example.splice(i,1);
  			}
  		} 
  		reloadTable();
  		
  	}
</script>

	

</head>

<body id="page-top">
	
  <!-- Page Wrapper -->
  <div id="wrapper">

	<!-- sidebar -->
	<jsp:include page="../include/sidebar.jsp" flush="true"/>
	<!-- sidebarend -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

       <!-- topbar -->
       <jsp:include page="../include/topbar.jsp" flush="true"/>
       <!-- topbarend -->

        <!-- Begin Page Content -->
        <div class="container-fluid">
		
          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">직원 관리</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div>
          <div>
          <button type="button" data-toggle="modal" data-target="#employeeAddModal">직원추가</button>
          </div>
          <!-- 메인 -->
			<div class="table-responsive">
			                <table class="table table-bordered" id="empTable" width="100%" cellspacing="0">
			                  <thead>
			                    <tr>
			                      <th>직원번호</th>
			                      <th>이름</th>
			                      <th>생년월일</th>
			                      <th>직급</th>     
			                      <th>진료과</th>
			                      <th>데이터 수정 일자</th>
			                    </tr>
			                  </thead>
			                  
			                  <tbody>
			                  </tbody>
			                </table>
			              </div>
			  
    		</div>
    		<!-- 메인끝 -->
    <!-- End of Content Wrapper -->
	</div>
  </div>
  <!-- End of Page Wrapper -->
</div>
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- 추가 Modal-->
  <div class="modal fade" id="employeeAddModal" tabindex="-1" role="dialog" aria-labelledby="employeeAddModallable" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="employeeAddModallable">직원입력</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
        	<div class="card-header">직원정보 입력</div>
		      <div class="card-body">
		       <form id="register_frm" name="register_frm" action="/pro/User/registeraction" method="post">
		          <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">         
		                  <input type="text" name="id" id="id" class="form-control" placeholder="이름" required="required" autofocus="autofocus">  
		              </div>
		               <div class="col-md-6">
		                  <input type="text" name="user_phone" id="user_phone" class="form-control" placeholder="전화번호" required="required">
		              </div>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="password" name="pw" id="user_pw" class="form-control" placeholder="비밀번호입력" required="required" onchange="pwdCheck(0)">
		              </div>
		              <div class="col-md-6"  id="confirmpwd">
		                  <input type="password" name="confirmpw" id="confirmpw" class="form-control" placeholder="비밀번호 확인" required="required" onchange="pwdCheck(1)">
		              </div>
		            </div>
		          </div>
		           <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="text" name="address" id="user_adress" class="form-control" placeholder="주소" required="required">
		              </div>
		              <div class="col-md-6">
		                  <input type="date" name="date" id="user_crdate" class="form-control" placeholder="user_crdate" required="required" value="" >
		              </div>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="text" name="position" id="user_adress" class="form-control" placeholder="직급" required="required">
		              </div>
		              <div class="col-md-6">
		                  <input type="text" name="department" id="user_crdate" class="form-control" placeholder="진료과" required="required" value="" >
		              </div>
		            </div>
		          </div>
		          <input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">
		          <a class="btn btn-primary btn-block" onclick="joinSubmit()">생성</a>
		        </form>
		      </div>
		    </div>
	       	 <div class="modal-footer">
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	          <a class="btn btn-primary" href="login.html">입력</a>
	        </div>
        </div>
       
      </div>
  </div>
  <!-- 수정 -->
    <div class="modal fade" id="employeeModModal" tabindex="-1" role="dialog" aria-labelledby="employeeModModallable" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="employeeModModallable">직원변경</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
        	<div class="card-header">직원정보 변경</div>
		      <div class="card-body">
		        <form id="register_frm" name="register_frm" action="/pro/User/registeraction" method="post">
		          <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <input type="text" name="user_name" id="user_name" class="form-control" placeholder="user_name" required="required" autofocus="autofocus">
		                  <label for="user_name">이름</label>
		                </div>
		              </div>
		              <div class="col-md-6" id="userIdDiv">
		                <div class="form-label-group">
		                  <input type="text" name="user_id" id="user_id" class="form-control" placeholder="user_id" required="required" onChange="idOverlap()">
		                  <label for="user_id">ID</label>
		                </div>
		              </div>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <input type="password" name="user_pw" id="user_pw" class="form-control" placeholder="user_pw" required="required" onchange="pwdCheck(0)">
		                  <label for="user_pw">비밀번호</label>
		                </div>
		              </div>
		              <div class="col-md-6" id="confirmpwd">
		                <div class="form-label-group">
		                  <input type="password" name="confirmpw" id="confirmpw" class="form-control" placeholder="confirmpw" required="required" onchange="pwdCheck(1)">
		                  <label for="confirmpw">비밀번호 확인</label>
		                </div>
		              </div>
		            </div>
		          </div>
		           <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <input type="text" name="user_phone" id="user_phone" class="form-control" placeholder="user_phone" required="required">
		                  <label for="user_phone">연락처</label>
		                </div>
		              </div>
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <input type="date" name="user_crdate" id="user_crdate" class="form-control" placeholder="user_crdate" required="required" value="" >
		                  <label for="user_crdate">작성일</label>
		                </div>
		              </div>
		            </div>
		          </div>
		          <input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">
		          <a class="btn btn-primary btn-block" onclick="joinSubmit()">생성</a>
		        </form>
		      </div>
		    </div>
	        <div class="modal-footer">
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	          <a class="btn btn-primary" href="login.html">Logout</a>
	        </div>
        </div>
      </div>
  </div>
  


  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>
     <!-- Page level plugins -->
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
  
  <!-- Page level custom scripts -->


</body>

</html>
