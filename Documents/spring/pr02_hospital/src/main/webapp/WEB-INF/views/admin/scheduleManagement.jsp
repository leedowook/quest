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
        	 allDay: null,
        	 className: "divEventReservation",
        	 condition: null,
        	 cusName: "정건수",
        	 department: "소아과",
        	 empName: "김한솔",
        	 end: "2019-05-01T00:00:00",
        	 eventKind: "1",
        	 id: "19052001000",
        	 start: "2019-05-01T00:00:00",
        	 title: "[일반예약]정건수님 소아과 김한솔"
           },   
           {
        	   allDay: null,
        	   className: "divEventReservation",
        	   condition: null,
        	   cusName: "이주형",
        	   department: "이비인후과",
        	   empName: "이도욱",
        	   end: "2019-05-02T03:00:00",
        	   eventKind: "1",
        	   id: "19052001003",
        	   start: "2019-05-02T02:00:00",
        	   title: "[일반예약]이주형님 이비인후과 이도욱"
            
           },
           {
        	   allDay: true,
        	   className: "divEventSchedule",
        	   condition: "vway 출장",
        	   cusName: null,
        	   department: null,
        	   empName: "이도욱",
        	   end: "2019-10-21",
        	   eventKind: 5,
        	   id: "19052015000",
        	   start: "2019-05-21",
        	   title: "[공용]출장 이도욱"
           },
           {
        	   allDay: null,
        	   className: "divEventReservation",
        	   condition: undefined,
        	   cusName: "a",
        	   department: "이비인후과",
        	   empName: "b",
        	   end: "2019-05-03T14:00:00",
        	   eventKind: "3",
        	   id: "19052003000",
        	   start: "2019-05-03T13:00:00",
        	   title: "[일반진료]a님 이비인후과 b"
        	   
           },
           {
        	   allDay: null,
        	   className: "divEventReservation",
        	   condition: null,
        	   cusName: "이도욱",
        	   department: "신경과",
        	   empName: "정건수",
        	   end: "2019-05-04T15:00:00",
        	   eventKind: "1",
        	   id: "19052001004",
        	   start: "2019-05-04T13:00:00",
        	   title: "[일반예약]이도욱님 신경과 정건수"  
           },
           
         ]  

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
      locale: initialLocaleCode, // 사는 구역의 지역코드
      buttonIcons: true, // show the prev/next text
      weekNumbers: true, // 주마다 번호를 담
      navLinks: true, // can click day/week names to navigate views
      editable: true,// 수정가능함 
      eventLimit: true,// 하루에 표시가능한 일정개수 한계 두ㅇ기
      selectable: true,//일정을 선택을 할수 있음 
      selectHelper: true,// 인정 선택에대한 도움
      select: function(start, end) {// 일정 빈공간 클릭시 
    	eventStart=start//일정의 시작날짜를 담음
    	eventEnd=end//일정의 끝나는 날짜
    	
    	$(".add#startdate").attr('value',moment(eventStart).format("YYYY-MM-DD")) //일정의 추가할떄 
    	if(moment(eventStart).format().length==19){//시간까지 달렸을경우를 대비 
    		$(".add#starthour").attr('value',moment(eventStart).format("hh:mm"))//moment(일정형태).format("date타입 형태")
    	}else{
    		$(".add#starthour").attr('value',"00:00")
    		
    	}
    	$(".add#enddate").attr('value',moment(eventEnd).format("YYYY-MM-DD")) 
		if(moment(eventStart).format().length==19){
			$(".add#endhour").attr('value',moment(eventEnd).format("hh:mm"))
    	}else{
    		$(".add#endhour").attr('value',"00:00")
    		
    	}
    	$("#addEventModal").modal("toggle");// 추가 이벤트 시작
        
      },
      eventClick: function(event, element) {//일정을 클릭했을대
    	console.log(event)
    	eventSelect=event//선택된 일정을 담기 
    	
    	$("#updateEventModal").modal("toggle");//선택된 일정을 
    	updateAction()
  	  },
      events: eventsInfo,
      eventRender: function(event, eventElement) {//이벤트  선택 강조
    	    if (event.classname == "divEventSchedule") {
    	    	
    	      eventElement.find("a.fc-content").css('background-color', 'green');
    	    }
    	  },  
  		eventResize: function(event) {//이벤트 사이즈 변경시
  			for(i=0;i<eventsInfo.length;i++){
  				if(eventsInfo[i].id==event.id){
  					eventsInfo[i].start=event.start
  					eventsInfo[i].end=event.end
  				}
  				
  			}
  			$('#calendar').fullCalendar('updateEvent',event);
  		
  		},
  		eventDrop: function(event){//이벤트를 놨을때
  			for(i=0;i<eventsInfo.length;i++){
  				if(eventsInfo[i].id==event.id){
  					eventsInfo[i].start=event.start
  					eventsInfo[i].end=event.end
  				}
  				
  			}
  			$('#calendar').fullCalendar('updateEvent',event);
  			
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
 		   allDayreset()
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
 			var reserkindname
 			if(newData.reserKind==1){
 				reserkindname="일반예약"
 			}else if(newData.reserKind==2){
 				reserkindname="긴급진료"
 			}else if(newData.reserKind==3){
 				reserkindname="일반진료"
 			}
 			console.log(kindnumber)
 			console.log(eventid(kindnumber)+""+newData.startdate+"T"+newData.starthour+":00")
			eventData={
					id:eventid(kindnumber),
					title:"["+reserkindname+"]"+newData.cusName+"님 "+newData.reserDepart+" "+newData.reserempName,//제목
					start:newData.startdate+"T"+newData.starthour+":00",//시작날,예약일
					end:newData.enddate+"T"+newData.endhour+":00",//끝나는 날
					allDay:null,//매일 일정
					className:'divEventReservation',//클래스 이름 부여
					cusName:newData.cusName,//고객이름
					department:newData.reserDepart,//진료과
					empName:newData.reserempName,//담당자,일정해당자
					eventKind:newData.reserKind,//일정상태,예약상태 1~3 , 직원 개인 일정 4,단체 일정 5 
					condition:newData.condition//상태	
			} 
			
		}else{
			   kind='sch'
			   console.log(kindnumber)
			   var i,q
			   var groupname
			   if($("#group").prop("checked")){
					i=4
					groupname="상용"
				   }else{i=5
					   groupname="공용"}
				var kindnumber=mkindnumber(kind,i)	
				console.log(kindnumber)
				var endval,startval
				if($("#addallDay #allDay").prop("checked")){
					q=true
					endval=newData.enddate
					startval=newData.startdate
					
				}else{
					q=false
					startval=newData.startdate+"T"+newData.starthour+":00"
					endval=newData.enddate+"T"+newData.endhour+":00"
				}
				
				
			   eventData={
						id:eventid(kindnumber),
						title:"["+groupname+"]"+newData.title+" "+newData.schempName,//제목
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
		 $('#calendar').fullCalendar('unselect');
	}
	function searchChange(option,contents){
		var item=$("#calendar").fullCalendar( 'clientEvents', function (evt) {
			var searchData=$("#selectInfo").serializeObject();
		    return evt.empName==searchData.empName&&evt.cusName==searchData.cusName&&evt.department==searchData.department&&evt.eventKind==searchData.eventKind;
		})
		console.log(item)
	}
	
	function updateAction(){
		var target   
		$.each(eventsInfo,function(i,eve){
			if(eventSelect.id==eve.id){
				target=i;
				return;
			}
		});
		console.log(eventsInfo[target].title);
		var a=eventsInfo[target].title.split("]")
		var b=a[1].split(" ");

		$('.update#title').append(b[0])
		$('.update#empName').append(eventsInfo[target].empName)
		$('.update#eventKind').append(eventsInfo[target].eventKind)
		$('.update#condition').empty();  
		$('.update#condition').append(eventsInfo[target].condition)
		//start 나누기 시간 , 분
		
		$('.update#title').attr('value',b[0])
		$('.update#empName').attr('value',eventsInfo[target].empName)
		$('.update#eventKind').attr('value',eventsInfo[target].eventKind)
		$('.update#target').attr('value',target)
		if(eventsInfo[target].className=="divEventSchedule"){
			//end 나누기 
			
			$(".schDivoption").css('display', 'block');
			if(eventsInfo[target].eventKind=='4'){
				$(".update#group").removeAttr("checked")
			}else{
				$('.update#group').attr('checked','')
			}
			
			if(eventsInfo[target].allDay==false){
				console.log("allday는 거짓")
				$(".update#allDay").removeAttr("checked")	  
				
				var teststart=eventsInfo[target].start.split("T");
				$('.update#startdate').attr('value',teststart[0])
				$('.update#starthour').attr('value',teststart[1].substr(0,5))
				$(".update#starthour").removeAttr("disabled")
				
				$('#starthourlabel').empty();
				$('#starthourlabel').append("시작시간");
				
				var testend=eventsInfo[target].end.split("T");
				$('.update#enddate').attr('value',testend[0])
				$('.update#endhour').attr('value',testend[1].substr(0,5))
				$(".update#endhour").removeAttr("disabled")
				
			}else{
				console.log("allday는 참")
				$('.update#allDay').attr('checked','')
				$('.update#startdate').attr('value',eventsInfo[target].start)
				$('.update#enddate').attr('value',eventsInfo[target].end)
			}
			
			$('#selectoption').empty();
			$('#selectoption').append("세부사항")
			$('#startdatelabel').empty();
			$('#startdatelabel').append("시작일자");
		}else{
			$(".reserDivoption").css('display', 'block');
			$(".update#starthour").removeAttr("disabled")
			var teststart=eventsInfo[target].start.split("T");
			$('.update#startdate').attr('value',teststart[0])
			$('.update#starthour').attr('value',teststart[1].substr(0,5))
			var testend=eventsInfo[target].end.split("T");
			$('.update#enddate').attr('value',testend[0])
			$('.update#endhour').attr('value',testend[1].substr(0,5))
			$(".update#endhour").removeAttr("disabled")
		
			
			$('.update#eventKind').append(eventsInfo[target].eventKind)
			$('.update#eventKind').attr('value',eventsInfo[target].eventKind)
			
			
			$('.update#cusName').append(eventsInfo[target].cusName)
			$('.update#department').append(eventsInfo[target].department)
			$('.update#cusName').attr('value',eventsInfo[target].cusName)
			$('.update#department').attr('value',eventsInfo[target].department)
			$('#selectoption').empty();
			$('#selectoption').append("증상")
			
			$('#startdatelabel').empty();
			$('#startdatelabel').append("예약일자");
			$('#starthourlabel').empty();
			$('#starthourlabel').append("예약시간");
		} 
	}

	function updateEvent(){
		var newData=$("#updateEvent_frm").serializeObject();
		console.log("update 점검"+newData)
		
		eventSelect.empName = newData.empName;
		eventSelect.eventKind = newData.eventKind;
		eventSelect.condition = newData.condition;
		if(eventSelect.className=="divEventSchedule"){
			var groupname
			if($(".update#group").prop("checked")){
				eventSelect.eventKind='4'
					groupname="상용"
			}else{
				eventSelect.eventKind='5'
					groupname="공용"
			}
			if($(".update#allDay").prop("checked")){
				eventSelect.allDay=true
				eventSelect.end=newData.enddate
				eventSelect.start=newData.startdate
			}else{
				eventSelect.allDay=false
				eventSelect.start=newData.startdate+"T"+newData.starthour+":00"
				eventSelect.end=newData.enddate+"T"+newData.endhour+":00"
			}
			eventSelect.title = "["+groupname+"]"+newData.title+" "+newData.schempName;
		}
		else{
			var reserkindname
 			if(newData.reserKind==1){
 				reserkindname="일반예약"
 			}else if(newData.reserKind==2){
 				reserkindname="긴급진료"
 			}else if(newData.reserKind==3){
 				reserkindname="일반진료"
 			}
			eventSelect.eventKind=newData.eventKind
			eventSelect.cusName=newData.cusName
			eventSelect.department=newData.department
			eventSelect.start=newData.startdate+"T"+newData.starthour+":00"
			eventSelect.end=newData.enddate+"T"+newData.endhour+":00"
			eventSelect.title = "["+reserkindname+"]"+newData.cusName+"님 "+newData.reserDepart+" "+newData.reserempName;
		}
		console.log("update 점검"+eventSelect)
		 console.log("update 점검"+newData)
		 console.log("update 점검"+newData.target+" "+eventsInfo[newData.target])
		 eventsInfo[newData.target]=eventSelect
         $('#calendar').fullCalendar('updateEvent',eventSelect);
		 $('#calendar').fullCalendar('unselect');
		
	}
	function selectremoveEvent(){
		removeTable(eventSelect.id)
		removeCalendar(eventSelect.id)
		$("#updateEventModal").modal("toggle");
	}
	function removeTable(id){
		console.log("removeTable:"+id)
		for(i=0;i<eventsInfo.length;i++){
			if(eventsInfo[i].id==id){
				console.log("removeTable:"+eventsInfo[i].id)
				eventsInfo.splice(i,1);
			}
			
		}
		
		/* $.each(eventsInfo,function(i,eve){
			if(eve.id==id){
				console.log("removeTable:"+eve.id)
				eventsInfo.splice(i,1);
			}
		}); */
		reloadTable();
		
	}
	
	function removeCalendar(id){
		console.log("removeCalendar:"+id)
		$("#calendar").fullCalendar( "removeEvents",id)
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
		$(".schDivoption").css('display', 'none');
		$(".reserDivoption").css('display', 'none');
	}
	function allDayreset(){
		$(".form-control#schstarthour").attr('disabled',"");
		$(".form-control#starthour").attr('disabled',"");
		$(".form-control#endhour").attr('disabled',"");
		
		
	}
	function displayonDiv(){
		var target=$("input[name='addeventKind']:checked").val()
		$("."+target).css('display', 'block');
		$(".eventbutton").css('display','block');
		if(target=="reserDiv"){
			$(".schDiv").css('display', 'none');
			$(".form-control#endhour").removeAttr("disabled")
			$(".form-control#starthour").removeAttr("disabled")
			$(".add#enddate").attr('value',moment(eventStart).format("YYYY-MM-DD"))
	    	if(moment(eventStart).format().length==19){
	    		$(".add#endhour").attr('value',moment(eventStart).format("hh:mm"))
	    	}
			
		}else{
			
			$(".reserDiv").css('display', 'none');		
			$(".form-control#endhour").attr("disabled","")
			$(".form-control#starthour").attr("disabled","")
		}
	}
	function alldaycheck(checkbox){ 
		if($("#"+checkbox.parentElement.getAttribute("id")+" #allDay").prop("checked")){
			console.log("체크")
			$(".form-control#endhour").attr("disabled","")
			$(".form-control#starthour").attr("disabled","")
			
		}else{
			$(".form-control#endhour").removeAttr("disabled")
			$(".form-control#starthour").removeAttr("disabled")
		}
		
		
	} 

		

	</script>
	<style>
		label{
		     position: relative;
  			  top: 5px;
  			  
		}
		.btn.btn-primary{
			color:white!important
		}

	
	</style>

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
			<div class="form-group col-xl-12 col-lg-12 col-sm-12 col-md-12 ">
            <div class="col-xl-12 col-lg-12 col-sm-12 col-md-12"  style="display:none" >

              <!-- Area Chart -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">상세검색</h6>
                </div>
                <div class="card-body">  
               		<form id="selectInfo">
               		<div class="row">
                 	<div class="form-group col-xl-6">
    						<label class="control-label" for="patientName">환자명</label>
    						<input class="form-control col-xl-12 search" id="cusName" type="text"  placeholder="환자명" >
    						
    						<label class="control-label" for="doctorName">담당자명</label>
    						<input class="form-control col-xl-12 search" id="empName" type="text" placeholder="담당자명" >
    						<label for="exampleSelect1">중요도</label>
      						<select multiple="" class="form-control col-xl-12 search" id="eventKind">
        						<option value="1">긴급</option>
        						<option value="2">예약</option>
        						<option value="3">진료완료</option>
        						<option value="4">상용일정</option>
        						<option value="5">공용일정</option>
      						</select>
   					 </div>
   				
   					 <div class="form-group col-xl-6">
    						<label class="control-label" for="medicalDepartment">진료과</label>
    						<select  class="form-control col-xl-12 search" id="department">
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
      						
    						<label class="control-label" for="selectOption1">선택옵션1</label>
    						<select  class="form-control col-xl-12" id="selectOption1" disabled="">
        						<option>선택1</option>
        							<option>선택2</option>
        						<option>선택3</option>
        						<option>선택4</option>
      						</select>
      						 
      					<label class="control-label" for="patientName">검색옵션명</label>
    					<input class="form-control col-xl-12" id="patientName" type="text" placeholder="환자명" disabled="">
    					<label class="control-label centered" for="doctorName" >담당자명</label>
    					<input class="form-control col-xl-12" id="doctorName" type="text" placeholder="담당자명" disabled="">
   					 </div>
   				
   					 <div class="form-group col-xl-12">
   					 		<label class="control-label" for="dateStart">날짜 범위검색 </label>
    						<input type="date"  class="form-control col-xl-12 search" id="dateStart">
    						<label class="control-label text-center" for="dateEnd">~</label>
    						<input type="date"  class="form-control col-xl-12 search" id="dateEnd">
   					 </div>
   					 </div>
  					</form>
  					</div>
                </div>
            </div>  
             <!-- 일정 리스트-->
			<div class="col-xl-12 col-lg-12 col-sm-12 col-md-12" >
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
			</div>
			<div class="col-xl-12 col-lg-12 col-sm-12 col-md-12 ">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">캘린더</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div id='calendar' class="col-xl-12 col-lg-12 ">
                  </div>
					<div style='clear:both'>
					</div>
                </div>
              </div>
            </div>
            
			</div>
		
            <!-- Donut Chart -->
          
           
            </div>
            </div>
            
            <!-- 컨텐츠 끝 -->
            </div>
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
        	<form id="updateEvent_frm" name="updateEvent_frm">
        	 <div class="row">
                <div class="form-row col-xl-12">
                 
                 
                 <div class="col-md-6">
                 <label for="">담당자명</label>
                  <input class="form-control update" name="empName" id="empName" type="text" >
                  </div>

                     <div class="col-md-6">
                       <label for="startdate" id="startdatelabel">시작 일자</label>
                       <input class="form-control update" id="startdate" name="startdate" type="date" value=""><!-- 예약선택시 입력 -->
                     </div >
                     <div class="col-md-6">
                       <label for="starthour" id="starthourlabel">시작 시간</label>
                       <input class="form-control update" name="starthour" id="starthour" type="time" value="00:00">
                     </div>
					<div class="col-md-6" > 
  							<label for="">끝나는 일자</label>
  							<input class="form-control update" id="enddate" name="enddate" type="date" value=""><!-- 예약선택시 입력 -->
						</div>
						<div class="col-md-6" >
  							<label for="">종료 시간</label>
  							<input class="form-control update" name="endhour" id="endhour" type="time" value="00:00" >
						</div>
                	
		          
		              
		              <!-- 변경(예약부분) -->  
		              	
		              	
		              	
							<div class="col-md-6 reserDivoption" style="display:none">
  								<label for="eventKind">예약종류</label>
  									<select class="form-control update" name="reserKind" id="reserKind" >
									    <option value="1" >일반예약</option>
									    <option value="2" >긴급 진료</option>
									    <option value="3" >일반 진료</option>
 									 </select>
							</div>
						<div class="col-md-6 reserDivoption" style="display:none">
  							<label for="department">진료과목</label>
  							<select class="form-control update" name="reserDepart" id="reserDepart">
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
						<div class="col-md-6 reserDivoption" style="display:none">
						  <label for="cusName">예약자명</label>
						  <input class="form-control update" name="cusName" id="cusName" type="text"  >
						</div>
					
					
		              <!-- 변경(일정부분) -->
		                
		             
						
						
						
						<div class="col-xl-12 col-md-12 schDivoption" style="display:none">
							<div class="form-row">
							<div class="col-md-12 ">
		            	 		<label for="title">일정 주제</label>
		             			<input class="form-control update" id="title" name="title" type="text" value="">
		             		</div>
							<div class="col-xl-6 col-md-6">
  								<label for="">공용일정</label>
  								<input class="form-control update"  type="checkbox" id="group" name="group" value="true" ><!-- 예약선택시 입력 -->
							</div>
							<div class="col-xl-6 col-md-6" id="updateallDay">
  								<label for="">출타여부</label>
  								<input class="form-control update" onchange="alldaycheck(this)" type="checkbox" id="allDay" name="allDay" value="true" checked>
							</div>
							</div>
						</div>
						
						
					
						<input class="form-control update" type="hidden" id="target" name="target" value="">
					
					 <div class="col-md-12">
                      <label id="selectoption" for="condition"></label>
 		              	  <textarea class="form-control update" rows="3" id="condition" name="condition"></textarea>
                  	</div>
                  	</div>
				 </div>
		        </form>
		 </div>
	     <div class="modal-footer">
	       <a class="btn btn-primary" onclick="updateEvent()">변경</a>
	       <a class="btn btn-danger" onclick="selectremoveEvent()">삭제</a>
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
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

		            
		             <form id="addEvent_frm" name="addEvent_frm">
		              <div class="form-row">
		                
		             <div class="col-md-6">
		              		<label for="startdate">예약 일자</label>
		              		<input class="form-control add" id="startdate" name="startdate" type="date" value=""><!-- 예약선택시 입력 -->
		             </div>
		             <div class="col-md-6"> 
		              		<label for="starthour">예약 시간</label>
		              		<input class="form-control add" id="starthour" name="starthour" type="time" value="00:00">
		             </div>
		             <div class="col-md-6">
		              		<label for="">끝나는 일자</label>
		              		<input class="form-control add" id="enddate" name="enddate" type="date" value=""><!-- 예약선택시 입력 -->
		              	</div>
		              	<div class="col-md-6">
		              		<label for="">종료 시간</label>
		              		<input class="form-control add" name="endhour" id="endhour" type="time" value="00:00" >
		              	</div>
		             <!-- 환자예약 -->
		               
		              <div class="reserDiv row" style='display:none'>
		               <div class="form-row col-xl-12">
		                
		                <div class="col-md-6">
		              		<label for="reserKind">예약종류</label>
		              		<select class="form-control" name="reserKind" id="reserKind">
								<option value="1" selected>일반예약</option>
								<option value="2" >긴급 진료</option>
								<option value="3" >일반 진료</option>
		              		</select>
		              	</div>
		              	<div class="col-md-6">
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
		          
		               
		              	<div class="col-md-6">
		              		<label for="reserName">예약자명</label>
		              		<input class="form-control" name="cusName" id="cusName" type="text" >
		              		
		              	</div>
		              	<div class="col-md-6">
		              		<label for="">담당자명</label>
		              		<input class="form-control add" name="reserempName" id="reserempName" type="text" >
		              	</div>
		             
		              	
		              	 </div>
		              	 <label for="comment" >증상:</label>
		              	 <textarea class="form-control" rows="3" id="condition"></textarea>
		              
		        	  
		        	   
		              </div>
		              <!-- 일정추가 -->
		              <div class="schDiv row" style='display:none'>
		              <div class="form-row col-xl-12">
		              <div class="col-md-12">
		            	 <label for="title">일정 주제</label>
		             	<input class="form-control" id="title" name="title" type="text" placeholder="일정 제목" >
		             </div>
		              <div class="col-md-6">
		              		<label for="">담당자명</label>
		              		<input class="form-control add" name="schempName" id="schempName" type="text" >
		              	</div>
		              	
		              	<div class="col-md-6">
		              	 <div class="row">
		              	 <div class="col-md-6" >
		              		<label for="">공용일정</label>
		              		<input class="form-control"  type="checkbox" id="group" name="group" value="true" ><!-- 예약선택시 입력 -->
		              	</div>
		              	<div class="col-md-6" id="addallDay">
		              		<label for="">상시여부</label>
		              		<input class="form-control" onchange="alldaycheck(this)" type="checkbox" id="allDay" name="allDay" value="true" checked="checked">
		              	</div>
		              	</div>
		              	</div>
		              	<div class="col-md-12">
		              		<label for="" style="">세부사항</label>
		              		<textarea class="form-control" rows="3" id="details" name="details"></textarea>
		              	</div>
		              	
		              	 
		              </div>
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
