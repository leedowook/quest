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
  var viewdata
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
		"date":new Date('2019','05','11','14'),
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
		"date":new Date('2019','05','11','14'),
		"path":"광고"

	}

	]

  
	$(document).ready(function() {
	 $('#cusTable').DataTable({
		data: example,
		 columns: [
			
		     {className: "onclickArea id","data": 'id'},
	    	 {"data": 'name'},
	      	 {"data": 'birth'}, 
	         {"data": 'phone'}, 
	         {"data": 'sns'}, 
	       	 {"data": 'visit'}, 
	       	 {"data": 'early'}, 
	       	 {"data": 'grade'},
	       	 
	       	 {className: "checkbox", "defaultContent": "<input type='checkbox' class='checkoption' >"}
	   	 ],
	   	 columnDefs: [ 
	   		{ className: "onclickArea", targets: "_all" },
	   	    ]
		});
	});
 	 $(function(){
		 $('#cusTable tbody tr').on('click', '.onclickArea ', function () {
		        viewdata = $(this).parent();
		        console.log($(this).parent())
		        viewAttribute(viewdata.children().eq(0).text());
		
		    } ); 
	  
	  
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
  	function delAttribute(){
  		
  		if($("input:checkbox[class='checkoption']:checked").length>0){

		var checkbox=$(".checkoption:checked")
		for(var i=0;i<checkbox.length;i++){
  		console.log(checkbox[i].offsetParent.parentElement.getElementsByClassName("id")[0].innerText)
  		
  		
  		delaction(checkbox[i].offsetParent.parentElement.getElementsByClassName("id")[0].innerText)
  		
  		}
  		reloadTable();}
  	}
  	
  	function delaction(id){

  		for(var i=1; i<example.length;i++){
  			console.log(i+" "+example[i].id+" id:"+id)
  			if(example[i].id==id){
  				console.log(i)
  				example.splice(i,1);
  			}
  		} 
  		
  		
  	}
	function viewAttribute(id){
		var num
		for(var i=0; i<example.length;i++){
  			if(example[i].id==id){
  				num=i
  				console.log(num)
  			}
  		} 
		$('#customerViewModal ').modal("toggle");
		appendInformation(num)
  	}
	
  	function appendInformation(num){
  		console.log(num)
  		$('#viewId').append(example[num].id)
		$('#viewName').append(example[num].name)
		$('#viewPhone').append(example[num].phone)
		$('#viewSns').append(example[num].sns)
		$('#viewVisit').append(example[num].visit)
		$('#viewEarly').append(example[num].early)
		$('#viewGrade').append(example[num].grade)
		$('#viewAddress').append(example[num].address)
		$('#viewPath').append(example[num].path)
		
		$('#viewId').attr('value',example[num].id)
		$('#viewName').attr('value',example[num].name)
		$('#viewBirth').attr('value',example[num].birth)
		$('#viewPhone').attr('value',example[num].phone)
		$('#viewSns').attr('value',example[num].sns)
		$('#viewVisit').attr('value',example[num].visit)
		$('#viewEarly').attr('value',example[num].early)
		$('#viewGrade').attr('value',example[num].grade)
		$('#viewAddress').attr('value',example[num].address)
		$('#viewDate').attr('value',example[num].date.getFullYear()+"-0"+example[num].date.getMonth()+"-0"+example[num].date.getDay()+" "+example[num].date.getHours()+":00:00")
		$('#viewPath').attr('value',example[num].path)
		$('#viewNum').attr('value',num)
  		
  	}
  	function allCheck(){
  	     if( $(".checkboxmaster").is(':checked') ){
  	        $("input[class=checkoption]").prop("checked", true);
  	      }else{
  	        $("input[class=checkoption]").prop("checked", false);
  	      }
  		
  	}
  	
  	function updateAttribute(){
  		var newData=$("#update_frm").serializeObject();
  		console.log(newData);
  		var num=newData.viewNum
  		delete newData.viewNum;
  		newData.date=example[num].date
  		newData.id=example[num].id
  		newData.early=example[num].early
  		newData.visit=example[num].visit
  		example[num]=newData
  		$('#customerViewModal ').modal("toggle");
  		reloadTable()
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
          <div class="row">
          	<div class="col-xl-1 col-md-3">
          	   <a class="btn btn-primary btn-block"  data-toggle="modal" data-target="#customerAddModal">생성</a>
          	</div>
          	<div class="col-xl-1 col-md-3">
          	   <a class="btn btn-primary btn-block"  onclick="delAttribute()">삭제</a>
          	</div>
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
		                 <label for="viewPhone">전화번호</label>
		                 <input name="phone" id='viewPhone' type="text" value=""></input>
		              </div>
		              <div class="col-md-1"></div>
		              </div>
		            </div>
		       
		           <div class="form-group">
		            <div class="form-row">
		            <div class="col-md-1"></div>
		              <div class="col-md-5">
		                  <label for="viewSns">sns수신여부</label>
		                 <input name="sns" id='viewSns' type="text" value=""></input>
		              </div>
		              <div class="col-md-5">
		                 <label for="viewVisit">방문횟수</label>
		                 <input name="visit" id='viewVisit' type="text" disabled="" value=""></input>
		              </div>
		              <div class="col-md-1"></div>
		            </div>
		          </div>
		           <div class="form-group">
		            <div class="form-row">
		            <div class="col-md-1"></div>
		              <div class=" col-md-5">
		                  <label  for="viewEarly">최근방문기록</label>
		                 <input  name="early" id='viewEarly' type="text" disabled="" value=""></input>
		              </div>
		                <div class="col-md-5">
		                 <label  for="viewGrade">등급</label>
		                 <input name="grade" id='viewGrade' type="text" value=""></input>
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
		                  <label for="viewDate">작성날짜</label>
		                 <input name="date" id='viewDate' type="text"  disabled="" value=""></input>
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
