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
  <!-- Calendar end -->
	  <script>
	var date=new Date()
	var eventSelect
	var eventsInfo=[
        {
            title: 'All Day Event',
            start: '2019-01-01',
            aaa:''
          },
          {
            title: 'Long Event',
            start: '2019-01-07',
            end: '2019-01-10'
          },
          {
            id: 999,
            title: 'Repeating Event',
            start: '2019-01-09T16:00:00'
          },
          {
            id: 999,
            title: 'Repeating Event',
            start: '2019-01-16T16:00:00'
          },
          {
            title: 'Conference',
            start: '2019-01-11',
            end: '2019-01-13'
          },
          {
            title: 'Meeting',
            start: '2019-01-12T10:30:00',
            end: '2019-01-12T12:30:00'
          },
          {
            title: 'Lunch',
            start: '2019-01-12T12:00:00'
          },
          {
            title: 'Meeting',
            start: '2019-01-12T14:30:00'
          },
          {
            title: 'Happy Hour',
            start: '2019-01-12T17:30:00'
          },
          {
            title: 'Dinner',
            start: '2019-01-12T20:00:00'
          },
          {
            title: 'Birthday Party',
            start: '2019-01-13T07:00:00'
          },
          {
            title: 'Click for Google',
            url: 'http://google.com/',
            start: '2019-01-28'
          }
        ]  
	 
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
        var title = prompt('Event Title:');
        var eventData;
        if (title) {
          eventData = {
            title: title,
            start: start,
            end: end
          };
          $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
        }
        $('#calendar').fullCalendar('unselect');
      },
      eventClick: function(event, element) {
    	console.log(event)
    	eventSelect=event
    	$("#addEventModal").modal("toggle");

  	  },
      events: eventsInfo
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
  });
	
	function reloadCalendar(){
		$('#calendar').fullCalendar('updateEvent', eventSelect);//초기화하는거
		
	}
	function addEvent(){
		var newData=$("#addEvent_frm").serializeObject();
		$('#calendar').fullCalendar('updateEvent', event);
		$("#addEventModal").modal("toggle");
		
	}
	
//캘린더 끝
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

            <div class="col-xl-5 col-lg-5 col-sm-5 col-md-5" >

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
    						<input class="form-control col-xl-10" id="patientName" type="text" placeholder="환자명" >
    						
    						<label class="control-label" for="doctorName">담당자명</label>
    						<input class="form-control col-xl-10" id="doctorName" type="text" placeholder="담당자명" >
    						<label for="exampleSelect1">중요도</label>
      						<select multiple="" class="form-control col-xl-11" id="exampleSelect1">
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
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>고객명</th>
                      <th>예약일</th>
                      <th>진료과</th>
                      <th>담당자</th>
                      <th>일정상태</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                    <tr>
            <td class="column1 style2 s">김나라</td>
            <td class="column3 style5 n">12/13/2019</td>
            <td class="column6 style6 s">피부과/여드름</td>
            <td class="column8 style6 n">김땡땡</td>
            <td class="column9 style2 n">5</td>
                    </tr>
                    <tr>
            <td class="column1 style2 s">김사랑</td>
            <td class="column3 style5 n">12/13/2019</td>
            <td class="column6 style2 s">수신</td>
            <td class="column8 style6 n">피부과/여드름</td>
            <td class="column9 style2 n">1</td>
                    </tr>
                    <tr>
                     <td class="column1 style2 s">이주</td>

            <td class="column3 style5 n">12/14/2019</td>
            <td class="column6 style2 s">수신</td>
            <td class="column8 style2 s">신경과/편두통</td>
            <td class="column9 style2 n">2</td>
                    </tr>
                    <tr>
            <td class="column1 style2 s">이야기</td>
            <td class="column3 style5 n">12/15/2019</td>
            <td class="column6 style2 s">수신</td>
            <td class="column8 style2 s">외과/타박상</td>
            <td class="column9 style2 n">2</td>
                    </tr>
                    <tr>
            <td class="column1 style2 s">장경청</td>
            <td class="column3 style5 n">12/16/2019</td>
            <td class="column6 style2 s">거부</td>
            <td class="column8 style2 s">신경과/편두통</td>
            <td class="column9 style2 n">5</td>
                    </tr>
                    <tr>
                     
            <td class="column1 style2 s">조몬</td>
            <td class="column3 style5 n">12/17/2019</td>
            <td class="column6 style2 s">수신</td>
            <td class="column8 style2 s">외과/타박상</td>
            <td class="column9 style2 n">3</td>
                    </tr>
                    <tr>
            <td class="column1 style2 s">최기마</td>
            <td class="column3 style5 n">12/18/2019</td>
            <td class="column6 style2 s">수신</td>
            <td class="column8 style2 m">이비인후과/알레르기</td>
            <td class="column9 style2 n">4</td>
                    </tr>
                    <tr>
                    <td class="column1 style2 s">지배성</td>
            <td class="column3 style5 n">12/19/2019</td>
            <td class="column6 style2 s">수신</td>
            <td class="column8 style2 s">이비인후과/감기</td>
            <td class="column9 style2 n">4</td>
                    </tr>
                    <tr>
                       <td class="column1 style2 s">크리스</td>
            <td class="column3 style5 n">12/20/2019</td>
            <td class="column6 style2 s">수신</td>
            <td class="column8 style2 s">외과/타박상</td>
            <td class="column9 style2 n">3</td>
                    </tr>
                    <tr>
                    <td class="column1 style2 s">스눅리</td>
            <td class="column3 style5 n">12/22/2019</td>
            <td class="column6 style2 s">수신</td>
            <td class="column8 style2 s">이비인후과/알레르기</td>
            <td class="column9 style2 n">3</td>
                    </tr>
                  
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
                  <div id='calendar'></div>

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
          <h5 class="modal-title" id="updateEventModallable">비밀번호변경</h5>
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
		           <label for="viewId">비밀번호</label>
		           <input type="radio"><
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
          <h5 class="modal-title" id="addEventModallable">비밀번호변경</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
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
							<input type="radio" name="eventKind" id="eventKind" value="reservation"  onChange=""> 환자예약 
						</label>
						<label class="btn btn-danger">
							<input type="radio" name="eventKind" id="eventKind" value="schedule"  onChange=""> 일정추가
						</label>
				       </div>
		              </div>
		             <form id="addEvent_frm" name="addEvent_frm" >
		             <!-- 환자예약 -->
		              <div class="hide col-md-10">
		              	<label for="">예약 상태</label>
		              	<select name="">
							<option value="원장"></option>
							<option value="전문의" selected>전문의</option>
							<option value="보조의사">보조의사</option>
							<option value="간호사">간호사</option>
							<option value="간호조무사">간호조무사</option>
							<option value="알바">알바</option>
							<option value="인턴">인턴</option> 
		              	</select>
		              	
		              </div>
		              <!-- 일정추가 -->
		              <div class="hide col-md-10">
		              
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
<script src='js/fullcalendar/local-all.js' ></script>
</body>

</html>
