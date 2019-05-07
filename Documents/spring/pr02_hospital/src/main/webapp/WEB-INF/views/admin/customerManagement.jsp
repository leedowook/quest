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
  <script type="text/javascript">
  	$(function(){
  		if($("#user_pw").length>0){
  			$('#confirmpw').removeAttr('disabled');	
  			
  		}
  	});
  </script>
  <script>
  var example=[{
		"id":"cusaa0000",
		"name":"김아무개",
		"birth":"2020/11/11",
		"phone":"010-4244-4444",
		"sns":"안함",
		"visit":"4",
		"early":"알레르기/김모한",
		"grade":"브론즈"
	},
	{
		"id":"cusaa0001",
		"name":"이아무개",
		"birth":"2020/12/11",
		"phone":"010-4242-4444",
		"sns":"안함",
		"visit":"6",
		"early":"알레르기/미미미",
		"grade":"실버"
		

	}

	]

  
	$(document).ready(function() {
	 $('#cusTable').DataTable({
		data: example,
		 columns: [
		     {"data": 'id'},
	    	 {"data": 'name'},
	      	 {"data": 'birth'}, 
	         {"data": 'phone'}, 
	         {"data": 'sns'}, 
	       	 {"data": 'visit'}, 
	       	 {"data": 'early'}, 
	       	 {"data": 'grade'}
	   	 ]
		});
	});
	function reloadTable(){
  		$('#cusTable').dataTable().fnClearTable(); 
  		$('#cusTable').dataTable().fnAddData(example);
  	}
  	function addAttribute(){
  		var newData=$("#register_frm").serializeArray();
  		if(example[example.length-1].id)
  		newData.visit = "0";
  		newData.early = "진료기록없음";
  		newData.grade = "bronze";
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
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div>
          <!-- 메인 -->
			<div class="table-responsive">
			                <table class="table table-bordered" id="cusTable" width="100%" cellspacing="0">
			                  <thead>
			                    <tr>
			                      <th>고객번호</th>
			                      <th>이름</th>
			                      <th>생년월일</th>
			                      <th>폰번호</th>     
			                      <th>수신동의</th>
			                      <th>내원횟수</th>
			                      <th>최근 진료</th>
			                      <th>등급</th>
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

  <!-- Logout Modal-->
	 <div class="modal fade" id="customerAddModal" tabindex="-1" role="dialog" aria-labelledby="customerAddModallable" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="customerAddModallable">직원입력</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
        	<div class="card-header">직원정보 입력</div>
		      <div class="card-body">
		       <form id="register_frm" name="register_frm" >
		          <div class="form-group">
		            <div class="form-row">
		       		 <div class="col-md-12">
		                  <input type="text" name="name" id="user_phone" class="form-control" placeholder="전화번호" required="required" autofocus="autofocus">
		              </div>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="date" name="birth" id="user_pw" class="form-control" placeholder="비밀번호입력" required="required" onchange="pwdCheck(0)">
		              </div>
		            </div>
		          </div>
		           <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="text" name="phone" id="user_adress" class="form-control" placeholder="주소" required="required">
		              </div>
		              <div class="col-md-6">
		                  <input type="date" name="sns" id="user_crdate" class="form-control" placeholder="user_crdate" required="required" value="" >
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

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>


</body>

</html>
