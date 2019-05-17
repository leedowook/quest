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
<script src="js/util.js" type="text/javascript"></script>
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
         	  id:'19050101001',
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
         	 id:'19050101002',
         	 className:"divEventSchedule",
             title: '출장',
             start: '2019-05-07 14:00',
             end: '2019-06-10',
             empName:'장의사',
             eventKind:'4',
             cusName:null,
             department:null
            
           },
           {
             id: '19050101003',
            className:'divEventReservation',
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
    	$("#reserstartdate").attr('value',moment(eventStart).format())
    	$("#schstartdate").attr('value',moment(eventStart).format())
    	$("#enddate").attr('value',moment(eventEnd).format())
    	$("#addEventModal").modal("toggle");
         $('#calendar').fullCalendar('unselect');
      },
      eventClick: function(event, element) {
    	console.log(event)
    	eventSelect=event
    	
    	$("#updateEventModal").modal("toggle");
    	updateAction()
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
 		   displayoffDiv()
 		   
 		});
		
    });
  });
	//변경 갱신
	function reloadCalendar(){
		$('#calendar').fullCalendar('updateEvent', eventSelect);
		
	}
	function mkindnumber(kind,eventkind){
		var i
		if(kind=="reser"){
			i=0
			
		}else{
			i=1
		}
		var j=date.format('yyMMdd')+i+eventkind
		console.log(eventid(j))
		return date.format('yyMMdd')+i+eventkind
	}
	//추가 일정
	function addEvent(){
 		var kind   
 		var eventData={}
		var newData=$("#addEvent_frm").serializeObject();
 		console.log(newData)
		if($("input[name='addeventKind']:checked").val()=='reserDiv'){
		
			kind='reser'
 				console.log("확인 if문 접근"+kind)
 			var kindnumber=mkindnumber(kind,newData.reserKind)	
 			console.log(kindnumber)
 			console.log(eventid(kindnumber)+""+newData.title+""+newData.reserstartdate+"T"+newData.reserstarthour+":00")
			eventData={
					id:eventid(kindnumber),
					title:newData.title,//제목
					start:newData.reserstartdate+"T"+newData.reserstarthour+":00",//시작날,예약일
					end:null,//끝나는 날
					allDay:null,//매일 일정
					className:'divEventReservation',//클래스 이름 부여
					cusName:newData.cusName,//고객이름
					department:newData.reserDepart,//진료과
					empName:newData.reserempName,//담당자,일정해당자
					eventKind:newData.reserKind,//일정상태,예약상태 0~3 , 직원 개인 일정 4,단체 일정 5 
					condition:newData.condition//상태	
			}
			
		}else{
			   kind='sch'
			   console.log(kindnumber)
			   var i,q
			   if($("#group").prop("checked")){
					i=4   
				   }else{i=5}
				var kindnumber=mkindnumber(kind,i)	
				console.log(kindnumber)
				var endval,startval
				if($("#allDay").prop("checked")){
					q=true
					endval=newData.enddate
					startval=newData.schstartdate
					
				}else{
					q=false
					startval=newData.schstartdate+"T"+newData.schstarthour+":00"
					endval=newData.enddate+"T"+newData.endhour+":00"
				}
				
				
			   eventData={
						id:eventid(kindnumber),
						title:newData.title,//제목
						start:startval,//시작날,예약일
						end:endval,//끝나는 날
						allDay:q,//매일 일정
						className:'divEventSchedule',//클래스 이름 부여
						cusName:null,//고객이름
						department:null,//진료과
						empName:newData.schempName,//담당자,일정해당자
						eventKind:i,//일정상태,예약상태 0~3 , 직원 개인 일정 4,단체 일정 5 
						condition:newData.details//상태
				}
			   console.log("입력할 데이터"+eventData)
		}
		eventsInfo.push(eventData)
		
		
		$('#calendar').fullCalendar('renderEvent', eventData, true);	
		reloadTable()
	}
	
	
	function updateAction(){
		var target
		$.each(eventsInfo,function(i,eve){
			if(eventselect.id==eve.id){
				target=i;
				return;
			}
		});
		
		$('.updateEvent_frm #title').append(eventsInfo[target].title)
		$('.updateEvent_frm #empName').append(eventsInfo[target].empName)
		$('.updateEvent_frm #eventKind').append(eventsInfo[target].eventKind)
		$('.updateEvent_frm #condition').append(eventsInfo[target].condition)
		//start 나누기 시간 , 분
		
		$('.updateEvent_frm #title').attr('value',eventsInfo[target].title)
		$('.updateEvent_frm #empName').attr('value',eventsInfo[target].empName)
		$('.updateEvent_frm #eventKind').attr('value',eventsInfo[target].eventKind)
		$('.updateEvent_frm #condition').attr('value',eventsInfo[target].condition)
		if(eventInfo[target].empName=="divEventSchedule"){
			//end 나누기 
			if(eventsInfo[target].eventKind=='4'){
				$(".updateEvent_frm #group").removeAttr("checked")
			}else{
				$('.updateEvent_frm #group').attr('checked','')
			}
			if(eventsInfo[target].allDay){
				$("..updateEvent_frm #allDay").removeAttr("checked")	
			}else{
				$('.updateEvent_frm #allDay').attr('checked','')
			}
			$('#selectoption').append("세부사항")
		}else{
			$('.updateEvent_frm #eventKind').append(eventsInfo[target].eventKind)
			$('.updateEvent_frm #eventKind').attr('value',eventsInfo[target].eventKind)
			
			$('.updateEvent_frm #cusName').append(eventsInfo[target].cusName)
			$('.updateEvent_frm #department').append(eventsInfo[target].department)
			$('.updateEvent_frm #cusName').attr('value',eventsInfo[target].cusName)
			$('.updateEvent_frm #department').attr('value',eventsInfo[target].department)
			$('#selectoption').append("증상")
		}
	}
	function updateEvent(){
		eventselect.title = title;
		eventselect.empName = empName;
		eventselect.eventKind = eventKind;
		eventselect.condition = condition;
		 	
		
         calendar.fullCalendar('updateEvent',eventselect);
         
		
	} 
	
	function eventid(kindnumber){
		var j,k=null
		$.each(eventsInfo,function(i,eve){
			console.log("data"+kindnumber+"     eve"+eve.id.substr(0,8))
			if(eve.id.substr(0,8)==kindnumber){
				if(j==null){
				j=eve.id.substr(eve.id.length-3,3)}
				else{
					if(eve.id.substr(eve.id.length-3,3)>j){
						j=eve.id.substr(eve.id.length-3,3)
						
					}
					
					
				}
				console.log("eventid"+j)
			    
			}
			console.log(eve.id.substr(0,8))
			console.log(i)
			});
		if(j==null){
			j=kindnumber+'000'
		}else{
			j=sustr(j,3,kindnumber)
			
		}
		console.log(j)
		return j
	}
//캘린더 끝
	</script>
	
	<script >
	//리스트 시작
	function getTable(){
		var tableData=[]
		$.each(eventsInfo,function(i,eve){
			if(eve.className=='divEventReservation'){
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
  		$('#schTable').dataTable().fnClearTable(); 
  		$('#schTable').dataTable().fnAddData(getTable());
  	}
	function displayoffDiv(){
		$(".reserDiv").css('display', 'none');	
		$(".schDiv").css('display', 'none');
		$(".eventbutton").css('display','none');
		$(".radiosel").removeClass('active focus');
	}
	function displayonDiv(){
		var target=$("input[name='addeventKind']:checked").val()
		$("."+target).css('display', 'block');
		$(".eventbutton").css('display','block');
		if(target=="reserDiv"){
			$(".schDiv").css('display', 'none');
			
		}else{
			
			$(".reserDiv").css('display', 'none');		
		}
	}
	function alldaycheck(){
		if($("#allDay").prop("checked")){
			$("#endhour").removeAttr("disabled")
			$("#schstarthour").removeAttr("disabled")
			
			
		}else{
			$("#endhour").attr("disabled","")
			$("#schstarthour").attr("disabled","")
			
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

            <div class="col-xl-5 col-lg-12 col-sm-12 col-md-12" >

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
          
            <div class="col-xl-7 col-lg-12 col-sm-12 col-md-12 ">
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
         <div class="modal-body">
        	<form id="updateEvent_frm" name="updateEvent_frm">
                <div class="row">
                  <div class="col-md-1"></div>
                  <div class="col-md-5">
                <label for="title">일정 주제</label>
		             <input class="form-control" id="title" name="title" type="text" placeholder="일정 제목">
                 </div>
                 <div class="col-md-5">
                 <label for="">담당자명</label>
                  <input class="form-control" name="empName" id="empName" type="text" >
                  </div>
		             <div class="col-md-1"></div>
                    <div class="col-md-1"></div>
                     <div class="col-md-5">
                       <label for="">시작 일자</label>
                       <input class="form-control" id="startdate" name="schstartdate" type="date" value=""><!-- 예약선택시 입력 -->
                     </div >
                     <div class="col-md-5">
                       <label for="">시작 시간</label>
                       <input class="form-control" name="starthour" id="schstarthour" type="time" value="00:00">
                     </div>
                     <div class="col-md-1"></div>
		             <div class="col-md-1"></div>
                	 <div class="col-md-10">
                      <label id="selectoption" for="condition"></label>
 		              	  <textarea class="form-control" rows="3" id="condition"></textarea>
                  	</div>
                    <div class="col-md-1"></div>
		              </div>
		              
		              <!-- 변경(예약부분) -->
		              	<div class="row" id="reserDivoption">
							<div class="col-md-5">
  								<label for="eventKind">예약종류</label>
  									<select class="form-control" name="reserKind" id="reserKind" >
									    <option value="1" >일반예약</option>
									    <option value="2" >긴급 진료</option>
									    <option value="3" >일반 진료</option>
 									 </select>
							</div>
						<div class="col-md-5">
  							<label for="department">진료과목</label>
  							<select class="form-control" name="reserDepart" id="reserDepart">
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
						<div class="col-md-5" style="display:none">
						  <label for="cusName">예약자명</label>
						  <input class="form-control" name="cusName" id="cusName" type="text"  >
						</div>
					  </div>
		              <!-- 변경(일정부분) -->
		              <div class="row" id="schDivoption">
						<div class="col-md-1"></div>
						<div class="col-md-5">
  							<label for="">끝나는 일자</label>
  							<input class="form-control" id="enddate" name="enddate" type="date" value=""><!-- 예약선택시 입력 -->
						</div>
						<div class="col-md-5">
  							<label for="">종료 시간</label>
  							<input class="form-control" name="endhour" id="endhour" type="time" value="00:00">
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-10"> 
							<div class="col-md-6">	
  								<label for="">단체여부</label>
  								<input class="form-control"  type="checkbox" id="group" name="group" value="true" ><!-- 예약선택시 입력 -->
							</div>
							<div class="col-md-6">
  								<label for="">출타여부</label>
  								<input class="form-control" onchange="alldaycheck()" type="checkbox" id="allDay" name="allDay" value="true" checked>
							</div>
						</div>
						<div class="col-md-1"></div>
					</div>
		        </form>
        </div>
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
    <div class="modal-dialog " role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="addEventModallable">일정추가</h5>
             <div class="btn-group btn-group-toggle choEvent" data-toggle="buttons" style="margin-left:150px">
						<label class="btn btn-danger radiosel">
							<input type="radio" class="form-control" name="addeventKind" id="addeventKind" value="reserDiv"  onChange="displayonDiv()"> 환자예약 
						</label>
						<label class="btn btn-danger radiosel">
							<input type="radio" class="form-control" name="addeventKind" id="addeventKind" value="schDiv"  onChange="displayonDiv()"> 일정추가
						</label>
			</div>			
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
          
        </div>
        <div class="modal-body">
      
		          <div class="form-group">
		            <div class="form-row">
					  <div class="col-md-1"></div>
		              <div class="col-md-10">
		              
				       </div>
		              </div>
		             <form id="addEvent_frm" name="addEvent_frm">
		             <label for="title">일정 주제</label>
		             <input class="form-control" id="title" name="title" type="text" placeholder="일정 제목" >
		             <!-- 환자예약 -->
		              <div class="reserDiv col-md-10" style='display:none;margin:auto'>
		               <div class="row">
		               <div class="col-md-1"></div>
		                <div class="col-md-5">
		              		<label for="reserKind">예약종류</label>
		              		<select class="form-control" name="reserKind" id="reserKind">
								<option value="1" selected>일반예약</option>
								<option value="2" >긴급 진료</option>
								<option value="3" >일반 진료</option>
		              		</select>
		              	</div>
		              	<div class="col-md-5">
		              		<label for="reserDepart">진료과목</label>
		              		<select class="form-control" name="reserDepart" id="reserDepart" >
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
		              		<label for="reserName">예약자명</label>
		              		<input class="form-control" name="cusName" id="cusName" type="text" >
		              		
		              	</div>
		              	<div class="col-md-5">
		              		<label for="">담당자명</label>
		              		<input class="form-control" name="reserempName" id="reserempName" type="text" >
		              	</div>
		              	<div class="col-md-1"></div>
		              	<div class="col-md-1"></div>
		              	<div>
		              		<label for="reserstartdate">일정 일자</label>
		              		<input class="form-control" id="reserstartdate" name="reserstartdate" type="date" value=""><!-- 예약선택시 입력 -->
		              	</div>
		              	<div>
		              		<label for="reserstarthour">일정 시간</label>
		              		<input class="form-control" id="reserstarthour" name="reserstarthour" type="time" value="00:00">
		              	</div>
		              	<div class="col-md-1"></div>
		              	<div class="col-md-1"></div>
		              	 <label for="comment">증상:</label>
		              	 <textarea class="form-control" rows="3" id="condition"></textarea>
		              	<div class="col-md-1"></div>
		        	   </div>
		        	   
		              </div>
		              <!-- 일정추가 -->
		              <div class="schDiv col-md-10" style='display:none;margin:auto'>
		              <div class="row">
		              <div class="col-md-1"></div>
		              <div class="col-md-5">
		              		<label for="">담당자명</label>
		              		<input class="form-control" name="reserempName" id="reserempName" type="text" >
		              	</div>
		              	<div class="row">
		              	<div class="col-md-6">
		              		<label for="">단체여부</label>
		              		<input class="form-control"  type="checkbox" id="group" name="group" value="true" ><!-- 예약선택시 입력 -->
		              	</div>
		              	<div class="col-md-6">
		              		<label for="">출타여부</label>
		              		<input class="form-control" onchange="alldaycheck()" type="checkbox" id="allDay" name="allDay" value="true" checked>
		              	</div>
		              	</div>
		              	<div class="col-md-1"></div>
		               <div class="col-md-1"></div>
		              	<div class="col-md-5">
		              		<label for="">시작 일자</label>
		              		<input class="form-control" id="schstartdate" name="schstartdate" type="date" value=""><!-- 예약선택시 입력 -->
		              	</div >
		              	<div class="col-md-5">
		              		<label for="">시작 시간</label>
		              		<input class="form-control" name="schstarthour" id="schstarthour" type="time" value="00:00">
		              	</div>
		              	<div class="col-md-1"></div>
		              	<div class="col-md-1"></div>
		              	<div class="col-md-5">
		              		<label for="">끝나는 일자</label>
		              		<input class="form-control" id="enddate" name="enddate" type="date" value=""><!-- 예약선택시 입력 -->
		              	</div>
		              	<div class="col-md-5">
		              		<label for="">종료 시간</label>
		              		<input class="form-control" name="endhour" id="endhour" type="time" value="00:00">
		              	</div>
		              	<div class="col-md-1"></div>
		              	<div class="col-md-1"></div>
		              	<div class="col-md-10">
		              		<label for="">세부사항</label>
		              		<textarea class="form-control" rows="3" id="details" name="details"></textarea>
		              	</div>
		              	<div class="col-md-1"></div>
		              	 
		              </div>
		              </div>
		               </form>
		            </div>
		          </div>
		          <input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">
		        		     
		      
		          
		        
		    
	       	 <div class="modal-footer">
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	          <a class="btn btn-primary eventbutton" style="display:none" onclick="addEvent()">일정추가</a>
	        </div>
        </div>
       
      </div>
  </div>

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->

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
