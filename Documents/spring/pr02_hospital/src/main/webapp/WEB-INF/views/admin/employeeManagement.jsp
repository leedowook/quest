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
  <script src="js/date.js"></script>
  <script>
  var example=[{
		"id":"emp000000",
		"name":"김뭐뭐",
		"birth":"2020-11-11",
		"position":"전문의",
		"department":"피부과",
		"date":new Date('2019','05','11','14'),
		"password":"1234",
		"address":"인천광역시 연수구 벚꽃로 341-3",
		"phone":"010-4244-4444"

	},
	{
		"id":"emp000001",
		"name":"김땡땡",
		"birth":"2020-11-11",
		"position":"간호사",
		"department":"치과",
		"date":new Date('2019','05','11','14'),
		"password":"1234",
		"address":"인천광역시 연수구 벚꽃로 341-3",
		"phone":"010-4244-4444"

	}

	]

  
	$(document).ready(function () {
	 $('#empTable').DataTable({
		data: example,
		 columns: [
			 {className: "onclickArea id","data": 'id'},
	    	 {"data": 'name'},
	      	 {"data": 'birth'}, 
	         {"data": 'position'}, 
	         {"data": 'department'}, 
	         {className: "checkbox", "defaultContent": "<input type='checkbox' class='checkoption' >"}
	   	 ],
		 columnDefs: [ 
	  		   		{ className: "onclickArea", targets: "_all" },
	  		   	]
	  		});
		});
    
  	function reloadTable(){
  		$('#empTable').dataTable().fnClearTable(); 
  		$('#empTable').dataTable().fnAddData(example);
  		updatefunction()
  	}
  	

  	
  	//추가
  	function addAttribute(){
  		var newData=$("#register_frm").serializeObject();
  		var date=new Date()
  		console.log(newData);
  		newData.id=sustr(example[example.length-1].id)
  		newData.date=new Date(date.getFullYear(),date.getMonth(),date.getDate(),date.getHours())
  		example.push(newData);
  		reloadTable();
  		//form 데이터 가져옴 , 받음 , 실행, form 초기화 
  	}
  	
  
  	//체크박스 전체 선택 해제
  		function allCheck(){
  	     if( $(".checkboxmaster").is(':checked') ){
  	        $("input[class=checkoption]").prop("checked", true);
  	      }else{
  	        $("input[class=checkoption]").prop("checked", false);
  	      }
  		 
  	}
  	//정보 업데이트
  	function updatefunction(){
  		 $('#empTable tbody tr').on('click', '.onclickArea', function () {
			 console.log('변경')  
			 viewdata = $(this).parent();
		        console.log($(this).parent())
		        viewAttribute(viewdata.children().eq(0).text());
		
		    });
  		
  	}
  	 $(function(){
  		updatefunction()
		
		 $('.modal').on('hidden.bs.modal', function () {
	  			console.log('닫기')
	 		    $(this).find('form').trigger('reset');
	 		});
 	 });
  	
  	function updateAttribute(){
  		var newData=$("#update_frm").serializeObject();
  		console.log(newData);
  		var num=newData.viewNum
  		delete newData.viewNum;
  		newData.date=example[num].date
  		newData.id=example[num].id
  		example[num]=newData
  		$('#employeeViewModal ').modal("toggle");
  		reloadTable()
  	}
  	function changePasswordModal(){
  		$('#changePasswordModal').modal("toggle");
  		
  	}
  	function changePassword(){
  		var num=$("#update_frm [id='viewNum']").val();
  		example[num].password=$("#changePassword_frm [id='viewPassword']").val();
  	}
  	
  	//정보 상세보기 입력
  	
  	
  	function viewAttribute(id){
		var num=""
		for(var i=0; i<example.length;i++){
  			if(example[i].id==id){
  				num=i
  				console.log(num)
  			}
  		} 
		$('#employeeViewModal').modal("toggle");
		appendInformation(num)
  	}
  	
  	function appendInformation(num){
  		console.log(num)
  		$('#viewId').append(example[num].id)
		$('#viewName').append(example[num].name)
		$('#viewPhone').append(example[num].phone)
		$('#viewAddress').append(example[num].address)
		$('#viewPosition').val(example[num].position)
		$('#viewDepartment').val(example[num].department)
		
		$('#viewId').attr('value',example[num].id)
		$('#viewName').attr('value',example[num].name)
		$('#viewBirth').attr('value',example[num].birth)
		$('#viewPhone').attr('value',example[num].phone)
		$('#viewAddress').attr('value',example[num].address)
		$('#viewDate').attr('value',example[num].date.getFullYear()+"-0"+example[num].date.getMonth()+"-0"+example[num].date.getDay()+" "+example[num].date.getHours()+":00:00")
		$('#viewPath').attr('value',example[num].path)
		$('#viewNum').attr('value',num)
  		
  	}
  	
  	//삭제 
	function delAttribute(){
  		
  		if($("input:checkbox[class='checkoption']:checked").length>0){
		var checkbox=$(".checkoption:checked")
		for(var i=0;i<checkbox.length;i++){
  		console.log(checkbox[i].offsetParent.parentElement.getElementsByClassName("id")[0].innerText)
  		delaction(checkbox[i].offsetParent.parentElement.getElementsByClassName("id")[0].innerText)
  		}
  		reloadTable();
  		}
  	}
  	
  	function delaction(id){
  		console.log("길이"+example.length)
  		for(var i=0; i<example.length;i++){
  			console.log(i+" "+example[i].id+" id:"+id)
  			if(example[i].id==id){
  				console.log(i)
  				example.splice(i,1);
  			}
  		} 
  		
  		
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
          <div class="row">
          	<div class="col-xl-1 col-md-3">
          	   <a class="btn btn-primary btn-block"  data-toggle="modal" data-target="#employeeAddModal">생성</a>
          	</div>
          	<div class="col-xl-1 col-md-3">
          	   <a class="btn btn-primary btn-block"  onclick="delAttribute()">삭제</a>
          	</div>
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
			                      <th><input class="checkboxmaster" type="checkbox" onclick="allCheck()"></th>
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
		                  <input type="text" name="name" id="name" class="form-control" placeholder="이름" required="required" autofocus="autofocus">
		              </div>
		              <div class="col-md-6">
		              	  <input type="password" name="password" id="password" class="form-control" placeholder="페스워드" required="required"> 
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
		              	<select name="position">
							<option value="원장">원장</option>
							<option value="전문의" selected>전문의</option>
							<option value="보조의사">보조의사</option>
							<option value="간호사">간호사</option>
							<option value="간호조무사">간호조무사</option>
							<option value="알바">알바</option>
							<option value="인턴">인턴</option> 
		              	</select>
		              </div>
		              <div class="col-md-3">
		              	<select name="department">
							<option value="내과">내과</option>
							<option value="피부과">피부과</option>
							<option value="소아과" selected>소아과</option>
							<option value="신경과">신경과</option>
							<option value="외과">외과</option>
							<option value="이비인후과">이비인후과</option>
							<option value="치과">치과</option>
							<option value="호흡기과">호흡기과</option>
							<option value="기타">기타</option>
		              	</select>
		              </div>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="form-row">
		            	<div class="col-md-12">
		            		<input type="text" name="address" class="form-control" required="required" placeholder="주소"></input>
		            	</div>
		            </div>
		          </div>
		         
		          <input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">
		        </form>
		      </div>
		    </div>
	       	 <div class="modal-footer">
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	          <a class="btn btn-primary" onclick="addAttribute()">입력</a>
	        </div>
        </div>
       
      </div>
  </div>
  <!-- 수정 -->
  <div class="modal fade" id="employeeViewModal" tabindex="-1" role="dialog" aria-labelledby="employeeViewModallable" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="employeeViewModallable">직원상세보기</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
       
        <div class="modal-body">
         <form id="update_frm" name="update_frm" >
		          <div class="form-group">
		            <div class="form-row">
		             <div class="col-md-1"></div>
		              <div class="col-md-5">
		              <label for="viewId">고유번호</label>
		                 <input name="id" id='viewId' value="" disabled="" type="text"></input>
		              </div>
		              <div class="col-md-5">
		              <label for="viewName">이름</label>
		                 <input name="name" id='viewName' value="" type="text"></input>
		              </div>
		              <div class="col-md-1"></div>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="form-row">
		            <div class="col-md-1"></div>
		              <div class="col-md-5">
		                 <label for="viewBirth">생년월일</label>
		                 <input name="birth" id='viewBirth' type="date" value=""></input>
		               </div>
		               <div class="col-md-5">
		                 <label  for="viewPassword">비밀번호</label>
		                 <input name="password" id='viewPassword' type="button" value="비밀번호 변경" onclick="changePasswordModal()"></input>
		              </div>
		              <div class="col-md-1"></div>
		              </div>
		            </div>
		       
		           <div class="form-group">
		            <div class="form-row">
		             <div class="col-md-1"></div>
		             <div class="col-md-5">
		             <label  for="viewPosition">직급</label>
		              	<select name="position" id="viewPosition">
							<option value="원장">원장</option>
							<option value="전문의" selected>전문의</option>
							<option value="보조의사">보조의사</option>
							<option value="간호사">간호사</option>
							<option value="간호조무사">간호조무사</option>
							<option value="알바">알바</option>
							<option value="인턴">인턴</option> 
		              	</select>
		              </div>
		              <div class="col-md-5">
		              <label  for="viewDepartment">진료과</label>
		              	<select name="department" id="viewDepartment">
							<option value="내과">내과</option>
							<option value="피부과">피부과</option>
							<option value="소아과" selected>소아과</option>
							<option value="신경과">신경과</option>
							<option value="외과">외과</option>
							<option value="이비인후과">이비인후과</option>
							<option value="치과">치과</option>
							<option value="호흡기과">호흡기과</option>
							<option value="기타">기타</option>
		              	</select>
		              </div>
		              <div class="col-md-1"></div>
		            </div>
		          </div>
		           <div class="form-group">
		            <div class="form-row">
		            <div class="col-md-1"></div>
		                <div class="col-md-5">
		                   <label for="viewPhone">전화번호</label>
		                 <input name="phone" id='viewPhone' type="text" value=""></input>
		              </div>
		              <div class="col-md-1"></div>
		            </div>
		          </div>
		           <div class="form-group">
		            <div class="form-row">
		            <div class="col-md-1"></div>
		            
		              <div class=" col-md-10">
		                
		                 <label  for="viewAddress">주소</label>
		                 <input name="address" class="col-md-12" id='viewAddress' type="text" value=""></input>
		              </div>
		             
		            </div>
		          </div>
		           <div class="form-group">
		            <div class="form-row">
		            <div class="col-md-1"></div>
		              <div class="col-md-5">
		                 <label for="viewPath">방문경로</label>
		                 <input name="path" id='viewPath' type="text" value=""></input>
		              </div>
		              <div class="col-md-5">
		                 <label  for="viewDate">데이터 수정날짜</label>
		                 <input  name="date" id='viewDate' type="text" disabled="" value=""></input>
		              </div>
		              <div class="col-md-1"></div>
		            </div>
		          </div>
		      
		          <input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">
		          <input type="hidden" id="viewNum" value="" name="viewNum">
		     
		         </form>
		          </div>
		        
		    
	       	 <div class="modal-footer">
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	          <a class="btn btn-primary" onclick="updateAttribute()">변경</a>
	        </div>
        </div>
       
      </div>
  </div>
  
  <!-- 패스워드 Modal -->
  <div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog" aria-labelledby="changePasswordModallable" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="changePasswordModallable">비밀번호변경</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
         <form id="changePassword_frm" name="changePassword_frm" >
		          <div class="form-group">
		            <div class="form-row">
		             <div class="col-md-1"></div>
		              <div class="col-md-10">
		              <label for="viewId">비밀번호</label>
		                 <input name="password" id='viewPassword'  type="password"></input>
		              </div>
		              <div class="col-md-1"></div>
		            </div>
		          </div>
		          <input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">
		          <input type="hidden" id="viewNum" value="" name="viewNum">		     
		         </form>
		          </div>
		        
		    
	       	 <div class="modal-footer">
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	          <a class="btn btn-primary" onclick="changePassword()">비밀번호 변경</a>
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
  <script src='js/util.js' type="text/javascript"></script>
  <!-- Page level custom scripts -->


</body>

</html>
