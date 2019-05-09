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
		"id":"cus000000",
		"name":"김아무개",
		"birth":"2020-11-11",
		"phone":"010-4244-4444",
		"sns":"안함",
		"visit":"4",
		"early":"알레르기/김모한",
		"grade":"브론즈",
		"address":"인천광역시 연수구 벚꽃로 341-3",
		"date":new Date('2019','5','8','14'),
		"path":"일반"
	},
	{
		"id":"cus00000z",
		"name":"이아무개",
		"birth":"2020-12-11",
		"phone":"010-4242-4444",
		"sns":"안함",
		"visit":"6",
		"early":"알레르기/미미미",
		"grade":"실버",
		"address":"인천광역시 연수구 벚꽃로 341-3",
		"date":new Date('2019','5','8','14'),
		"path":"광고"

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
  		var newData=$("#register_frm").serializeObject();
  		var date=new Date()
  		console.log(newData);
  		newData.id=sustr(example[example.length-1].id)
  		newData.visit = "0";
  		newData.early = "진료기록없음";
  		newData.grade = "브론즈";
  		newData.date=new Date(date.getFullYear(),date.getMonth(),date.getDate(),date.getHours())
  		example.push(newData);
  		//이부분에서 서버단 추가
  		
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
	function viewAttribute(id){
		var num
		for(var i; i<example.length;i++){
  			if(example[i].id==id){
  				num=i
  			}
  		} 
		$('#customerDetailModal ').modal("toggle");
		appendInformation(num)
  	}

  	function appendInformation(num){
  		$('#viewId').append(example[num].id)
		$('#viewName').append(example[num].name)
		$('#viewBirth').append(example[num].birth)
		$('#viewPhone').append(example[num].phone)
		$('#viewSns').append(example[num].sns)
		$('#viewVisit').append(example[num].visit)
		$('#viewEarly').append(example[num].early)
		$('#viewGrade').append(example[num].grade)
		$('#viewAddress').append(example[num].address)
		$('#viewDate').append(example[num].date)
		$('#viewPath').append(example[num].path)
  		
  	}
  	function updateAttribute(id){
  		
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
            <h1 class="h3 mb-0 text-gray-800">고객관리</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div>
          <!-- 메인 -->
          	<div class="col-xl-1 col-md-3">
          	   <a class="btn btn-primary btn-block"  data-toggle="modal" data-target="#customerAddModal">생성</a>
          	</div>
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
          <h5 class="modal-title" id="customerAddModallable">고객입력</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
		       <form id="register_frm" name="register_frm" >
		          <div class="form-group">
		            <div class="form-row">
		       		 <div class="col-md-12">
		                  <input type="text" name="name" id="name" class="form-control" placeholder="이름" required="required" autofocus="autofocus">
		              </div>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="date" name="birth" id="birth" class="form-control"  required="required" >
		              </div>
		            </div>
		          </div>
		           <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="text" name="phone" id="phone" class="form-control" placeholder="핸드폰번호" required="required">
		              </div>
		              <div class="col-md-3">
		                  <input type="radio" name="sns" id="sns" class="form-control"  required="required" value="안함" >
		              </div>
		              <div class="col-md-3">
		                  <input type="radio" name="sns" id="sns" class="form-control"  required="required" value="함" checked="" >
		              </div>
		            </div>
		          </div>
		         
		          <input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">
		       
		        </form>
		    
	       	 <div class="modal-footer">
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	          <a class="btn btn-primary" onclick="addAttribute()">입력</a>
	        </div>
        </div>
       
      </div>
  </div>
 </div>
 
  <div class="modal fade" id="customerDetailModal" tabindex="-1" role="dialog" aria-labelledby="customerDetailModallable" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="customerDetailModallable">고객 상세정보</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
		       <form id="register_frm" name="register_frm" >
		          <div class="form-group">
		            <div class="form-row">
		       		 <div class="col-md-12">
		                  <input type="text" name="name" id="name" class="form-control" placeholder="이름" required="required" autofocus="autofocus">
		              </div>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="date" name="birth" id="birth" class="form-control"  required="required" >
		              </div>
		            </div>
		          </div>
		           <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="text" name="phone" id="phone" class="form-control" placeholder="핸드폰번호" required="required">
		              </div>
		              <div class="col-md-3">
		                  <input type="radio" name="sns" id="sns" class="form-control"  required="required" value="안함" >
		              </div>
		              <div class="col-md-3">
		                  <input type="radio" name="sns" id="sns" class="form-control"  required="required" value="함" checked="" >
		              </div>
		            </div>
		          </div>
		         
		          <input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">
		       
		        </form>
		    
	       	 <div class="modal-footer">
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	          <a class="btn btn-primary" onclick="addAttribute()">입력</a>
	        </div>
        </div>
       
      </div>
  </div>
 </div>
 
 <div class="modal fade" id="customerViewModal" tabindex="-1" role="dialog" aria-labelledby="customerViewModallable" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="customerViewModallable">고객상세보기</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
		       <form id="register_frm" name="register_frm" >
		          <div class="form-group">
		            <div class="form-row">
		       		 <div class="col-md-12">
		                  <input type="text" name="name" id="name" class="form-control" placeholder="이름" required="required" autofocus="autofocus">
		              </div>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="date" name="birth" id="birth" class="form-control"  required="required" >
		              </div>
		            </div>
		          </div>
		           <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="text" name="phone" id="phone" class="form-control" placeholder="핸드폰번호" required="required">
		              </div>
		              <div class="col-md-3">
		                  <input type="radio" name="sns" id="sns" class="form-control"  required="required" value="안함" >
		              </div>
		              <div class="col-md-3">
		                  <input type="radio" name="sns" id="sns" class="form-control"  required="required" value="함" checked="" >
		              </div>
		            </div>
		          </div>
		         
		          <input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">
		       
		        </form>
		    
	       	 <div class="modal-footer">
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	          <a class="btn btn-primary" onclick="addAttribute()">변경</a>
	        </div>
        </div>
       
      </div>
  </div>
 </div>
 
  <div class="modal fade" id="customerUpdateModal" tabindex="-1" role="dialog" aria-labelledby="customerAddModallable" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="customerUpdateModallable">고객입력</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
		       <form id="register_frm" name="register_frm" >
		          <div class="form-group">
		            <div class="form-row">
		       		 <div class="col-md-12">
		                  <input type="text" name="name" id="name" class="form-control" placeholder="이름" required="required" autofocus="autofocus">
		              </div>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="date" name="birth" id="birth" class="form-control"  required="required" >
		              </div>
		            </div>
		          </div>
		           <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="text" name="phone" id="phone" class="form-control" placeholder="핸드폰번호" required="required">
		              </div>
		              <div class="col-md-3">
		                  <input type="radio" name="sns" id="sns" class="form-control"  required="required" value="안함" >
		              </div>
		              <div class="col-md-3">
		                  <input type="radio" name="sns" id="sns" class="form-control"  required="required" value="함" checked="" >
		              </div>
		            </div>
		          </div>
		         
		          <input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">
		       
		        </form>
		    
	       	 <div class="modal-footer">
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	          <a class="btn btn-primary" onclick="addAttribute()">입력</a>
	        </div>
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
  <script src='js/util.js' type="text/javascript"></script>

</body>

</html>
