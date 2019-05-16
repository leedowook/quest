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
<link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">
 
  <!-- Calendar -->

<link href='css/fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='css/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<link href='css/fullcalendar/fullcalendar2.css' rel='stylesheet'/>
<script src='js/fullcalendar/jquery.min.js' type="text/javascript"></script>
<script src='js/fullcalendar/jquery-ui.min.js' type="text/javascript"></script>
<script src='js/fullcalendar/moment.min.js' type="text/javascript"></script>
<script src='js/fullcalendar/fullcalendar.min.js' type="text/javascript"></script>
<script src="js/date.js" type="text/javascript"></script>
<script src="js/dataTables.hideEmptyColumns.js" type="text/javascript"></script>
<script src="js/dataTables.hideEmptyColumns.min.js" type="text/javascript"></script>
  <!-- Calendar end -->
  	<!--시간 관련내용-->
  	<script src="js/date.js" type="text/javascript"></script>
      <script>
      var today=new Date()
      var todayD=today.toLocaleDateString();
      var todayT=today.toLocaleTimeString();
      
      </script>
     
      
      <!-- Calendar 관련 내용 -->
	  <script>
	  
	var date=new Date()
	var eventSelect,eventStart,eventEnd
	 var eventsInfo=[ 
         {
         	  id:'1	',
         	  className:'divEventReservation',
             title: '예약190501011',
             start: '2019-05-01T13:00:00',
             cusName:'김나라',
             department:'피부과',
             empName:'김의사',
             eventKind:'0',
             condition:'피부 아픔'
           },
           {
         	 id:'sch0000001',
         	 className:"divEventSchedule",
             title: '출장',
             start: '2019-05-07',
             end: '2019-06-10',
             empName:'장의사',
             eventKind:'4',
             cusName:null,
             department:null
            
           },
           {
             id: 'sch0000002',
//              className:'divEventReservation',
             title: 'Repeating Event',
             start: '2019-01-09T16:00:00',
             cusName:'김나라',
             department:'정형외과',
             empName:'박의사',
             eventKind:'2',
             condition:'골절'
           }
         ]  
	 var event
	function modalpage(i){
		if(i==1){
			$('#Modal1').modal("toggle");
			 $('#Modal2').modal("toggle");
			


		}
		else if(i==2){
			$('#Modal2').modal("toggle");	
			$('#Modal3').modal("toggle");	
		}
	}

	//캘린더
	  $(document).ready(function() {
    var initialLocaleCode = 'ko';

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listMonth'
      },
      defaultDate: date.format("yyyy-MM-dd"),
      locale: initialLocaleCode,
      buttonIcons: true, // show the prev/next text
      weekNumbers: true,
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true,
      selectable: true,
      selectHelper: true,
      select: function(start, end) {
    	eventStart=start
    	eventEnd=end
    	$("#addEventModal").modal("toggle");
         $('#calendar').fullCalendar('unselect');
      },
      eventClick: function(event, element) {
    	console.log(event)
    	eventSelect=event
    	$("#updateEventModal").modal("toggle");

  	  },
      events: eventsInfo,
      eventRender: function(event, eventElement) {
    	    if (event.classname == "divEventSchedule") {
    	    	
    	      eventElement.find("a.fc-content").css('background-color', 'green');
    	    }
    	  }
    });
 

    // build the locale selector's options
    $.each($.fullCalendar.locales, function(localeCode) {
      $('#locale-selector').append(
        $('<option/>')
          .attr('value', localeCode)
          .prop('selected', localeCode == initialLocaleCode)
          .text(localeCode)
      );
    });

    // when the selected option changes, dynamically change the calendar option
    $('#locale-selector').on('change', function() {
      if (this.value) {
        $('#calendar').fullCalendar('option', 'locale', this.value);
      }
    });
    //modal값 초기화
    $(function(){
 		$('.modal').on('hidden.bs.modal', function () {
 		    $(this).find('form').trigger('reset');
 		   
 		});
		
    });
  });
	//변경 갱신
	function reloadCalendar(){
		$('#calendar').fullCalendar('updateEvent', eventSelect);
		
	}
	//추가 일정
	function addEvent(){
		var kind
		if($("#addeventKind").val()=='reserDiv'){
			kind=1
			
		}else{ kind=0}
		var newData=$("#addEvent_frm").serializeObject();
		var kindnumber=date.format('yyMMdd')+kind+newData.eventkind
		var eventData={
				id:eventid(kindnumber),
				title:'',//제목
				start:'',//시작날,예약일
				end:'',//끝나는 날
				alllDay:'',//매일 일정
				className:'',//클래스 이름 부여
				
				cusName:'',//고객이름
				department:'',//진료과
				empname:'',//담당자,일정해당자
				eventKind:'',//일정상태,예약상태 0~3 , 직원 개인 일정 4,단체 일정 5 
				condition:''//상태	
		}
		$('#calendar').fullCalendar('renderEvent', eventData, true);	
	}
	function eventid(kindnumber){
		var j
		$.each(eventsInfo,function(i,eve){
			if(eve.id.substr(8)==date.format('yyMMdd')+kindnumber){
				j=eve.id.substr(eve.id.length-3,3)	
			}
			});
		if(j==null){
			j=000
		}else{
			j=sustr(j,3,date.format('yyMMdd')+kindnumber)
			
		}
		return j
	}
//캘린더 끝
	</script>
	
	<script >
	//리스트 시작
	function getTable(){
		var tableData=[]
		$.each(eventsInfo,function(i,eve){
			if(eve.className=='reservation'){
				tableData.push(eve)	
			}
			});
		console.log(tableData);
		return tableData;
	}
	$(document).ready(function () {
		
			
		 $('#schTable').DataTable({
			data: getTable(),
			 columns: [
				 {"data": 'cusName'},
		    	 {"data": 'start'},
		      	 {"data": 'department'}, 
		         {"data": 'empName'}, 
		         {"data": 'eventKind'}, 
		         {className: "checkbox", "defaultContent": "<input type='checkbox' class='checkoption' >"}
		   	 ],
			 columnDefs: [ 
		  		 { className: "onclickArea", targets: "_all" }
		  		   	]
		  		});
		 
			});
	
	function reloadTable(){
  		$('#empTable').dataTable().fnClearTable(); 
  		$('#empTable').dataTable().fnAddData(example);
  		updatefunction()
  		
  	}
	function displayonDiv(){
		var target=$("input[name='addeventKind']:checked").val()
		$("."+target).css('display', 'block');
		if(target=="reserDiv"){
			alert("test1"+target)
			$(".schDiv").css('display', 'none');
			
		}else{
			alert("test2"+target)
			$(".reserDiv").css('display', 'none');
			
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
        <div class="row">
        <div class="container-fluid">
		
          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">예약 관리</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div>
          <!-- 메인 -->
          <div class="row">

            <div class="col-xl-5 col-lg-5 col-sm-12 col-md-12" >

              <!-- Area Chart -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">상세검색</h6>
                </div>
                <div class="card-body">
               		<form id="selectInfo">
               		<div class="row">
                 	<div class="form-group col-xl-4">
    						<label class="control-label" for="patientName">환자명</label>
    						<input class="form-control col-xl-12" id="patientName" type="text" placeholder="환자명" >
    						
    						<label class="control-label" for="doctorName">담당자명</label>
    						<input class="form-control col-xl-12" id="doctorName" type="text" placeholder="담당자명" >
    						<label for="exampleSelect1">중요도</label>
      						<select multiple="" class="form-control col-xl-12" id="exampleSelect1">
        						<option>긴급</option>
        						<option>예약</option>
        						<option>진료완료</option>
        						<option>취소</option>
      						</select>
   					 </div>
   					 <div class="row col xl-8">
   					 <div class="form-group col-xl-6">
    						<label class="control-label" for="medicalDepartment">진료과</label>
    						<select  class="form-control col-xl-10" id="medicalDepartment">
        						<option>내과</option>
        						<option>피부과</option>
        						<option>외과</option>
        						<option>소아과</option>
      						</select>
      						
    						<label class="control-label" for="selectOption1">선택옵션1</label>
    						<select  class="form-control col-xl-10" id="selectOption1">
        						<option>선택1</option>
        						<option>선택2</option>
        						<option>선택3</option>
        						<option>선택4</option>
      						</select>
   					 </div>
   					 <div class="form-group col-xl-6">
   					 		<label class="control-label" for="dateStart">날짜 범위검색 </label>
    						<input type="date"  class="form-control col-xl-12" id="dateStart">
    						<label class="control-label text-center" for="dateEnd">~</label>
    						<input type="date"  class="form-control col-xl-12" id="dateEnd">
   					 </div>
   					 <div class="form-group col-xl-12">
   						<label class="control-label" for="patientName">검색옵션명</label>
    					<input class="form-control col-xl-11" id="patientName" type="text" placeholder="환자명" >
    					<label class="control-label centered" for="doctorName" font>담당자명</label>
    					<input class="form-control col-xl-11" id="doctorName" type="text" placeholder="담당자명" >
   					 </div>
   					 </div>
   					 </div>
  					</form>
  					</div>
                </div>
            

              <!-- Bar Chart -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">일정 리스트</h6>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                <table class="table table-bordered" id="schTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>고객명</th>
                      <th>예약일</th>
                      <th>진료과</th>
                      <th>담당자</th>
                      <th>일정상태</th>
                        <th><input class="checkboxmaster" type="checkbox" onclick="allCheck()"></th>
                    </tr>
                  </thead>
                  
                  <tbody>
            
                  
                  </tbody>
                </table>
              </div>
                </div>
              </div>

			</div>
			
		
            <!-- Donut Chart -->
          
            <div class="col-xl-7 col-lg-8 ">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">캘린더</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div id='calendar' class="col-xl-12 col-lg-12 "></div>

					<div style='clear:both'></div>
                </div>
              </div>
            </div>
            </div>
            </div>
            </div>
          
          
          
              
              
         
			 
    
    		<!-- 메인끝 -->
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
  </div>
  <!-- 변경 이벤트 -->
  <div class="modal fade" id="updateEventModal" tabindex="-1" role="dialog" aria-labelledby="updateEventModallable" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="updateEventModallable">일정 변경</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
         <form id="updateEvent_frm" name="updateEvent_frm" >
		      <div class="form-group">
		        <div class="form-row">
		         <div class="col-md-1"></div>
		          <div class="col-md-10">
		           
		           
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
	       <a class="btn btn-primary" onclick="changePassword()">변경</a>
	     </div>
       </div>
      </div>
  </div>
  
  <!-- 추가 이벤트 -->
  <div class="modal fade" id="addEventModal" tabindex="-1" role="dialog" aria-labelledby="addEventModallable" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="addEventModallable">일정 추가 </h5>
          <button class="close form-control"   type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
		          <div class="form-group">
		            <div class="form-row">
		             <div class="col-md-1"></div>
		              <div class="col-md-10">
		               <div class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-danger">
							<input type="radio" class="form-control" name="addeventKind" id="addeventKind" value="reserDiv"  onChange="displayonDiv()"> 환자예약 
						</label>
						<label class="btn btn-danger">
							<input type="radio" class="form-control" name="addeventKind" id="addeventKind" value="schDiv"  onChange="displayonDiv()"> 일정추가
						</label>
				       </div>
		              </div>
		             <form id="addEvent_frm" name="addEvent_frm" >
		             <!-- 환자예약 -->
		              <div class="reserDiv col-md-10" style='display:none;margin:auto'>
		               <div class="row">
		               <div class="col-md-1"></div>
		                <div class="col-md-5">
		              		<label for="">예약종류</label>
		              		<select class="form-control" name="reserKind">
								<option value="1" selected>일반예약</option>
								<option value="2" >긴급 진료</option>
								<option value="3" >일반 진료</option>
		              		</select>
		              	</div>
		              	<div class="col-md-5">
		              		<label for="">진료과목</label>
		              		<select class="form-control" name="reserDepart" >
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
		              	<div class="col-md-1"></div>
		              	<div class="col-md-5">
		              		<label for="">예약자명</label>
		              		<input class="form-control" name="reserName" id="reserName" type="text" >
		              		
		              	</div>
		              	<div class="col-md-5">
		              		<label for="">예약자명</label>
		              		<input class="form-control" name="reserName" id="reserName" type="text" >
		              	</div>
		              	<div class="col-md-1"></div>
		              	<div class="col-md-1"></div>
		              	<div>
		              		<label for="">일정 일자</label>
		              		<input class="form-control" id="date" name="date" type="date" value=""><!-- 예약선택시 입력 -->
		              	</div>
		              	<div>
		              		<label for="">일정 시간</label>
		              		<input class="form-control" id="hour" name="hour" type="time" value="">
		              	</div>
		              	
		        	   </div>
		        	   
		              </div>
		              <!-- 일정추가 -->
		              <div class="schDiv col-md-10" style='display:none;margin:auto'>
		              <div class="row">
		                <div class="col-md-5">
		                	
		                </div>
		                <div class="col-md-5">
		                </div>
		              </div>
		              	<div>
		              		<label for="">일정 일자</label>
		              		<input id="date" class="form-control" name="date" type="date" value=""><!-- 예약선택시 입력 -->
		              	</div>
		              	<div>
		              		<label for="">일정 시간</label>
		              		<input id="hour" class="form-control" name="hour" type="date" value="">
		              	</div>
		              </div>
		              
		              
		                
		              
		               </form>
		            </div>
		          </div>
		          <input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">
		          <input type="hidden" id="eventNum" value="" name="eventNum">		     
		      
		          </div>
		        
		    
	       	 <div class="modal-footer">
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	          <a class="btn btn-primary" onclick="addEvent()">일정추가</a>
	        </div>
        </div>
       
      </div>
  </div>

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>
  </div>

  <!-- Bootstrap core JavaScript-->

  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

   <!-- Page level plugins -->
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/datatables-demo.js"></script>
</body>

</html>
