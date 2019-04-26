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
  <script src='//code.jquery.com/jquery.js'></script>
	  <script>
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
	function refreshDiv(){
		gulzae=document.getElementById("gulzae").val;
		document.getElementById("userInfo").innerHTML = "";
		document.getElementById("userInfo").innerHTML = "<p>이름:<input type='text' name='name'></p>"+
		"<p>휴대폰:<input type='text' name='phone'></p>"+
		"<p>이메일:<input type='text' name='email'></p>"+
		"<p>개인<input  type='radio' name='user' value='user'> 기업<input type='radio' name='user' value='Enterprise'></p>"+
		"<p>단과선택:<input type='text' name='dangua'></p>"+
		"<p>패키지선택:<input type='text' name='packcage'></p>"+
		"<p>금액:<input type='text' name='gold' value='"+gulzae+"'></p>"

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
                  
                </div>
              </div>
            </div>
            </div>
            </div>
            </div>
          
          
          
              
              
          <input type="text" value="10000" id="gulzae">원
				<button type="button" class="btn btn-primary" onclick="refreshDiv()" data-toggle="modal" data-target="#Modal1" style="margin:15px; padding:15px;">
			  결제버튼
			</button>
			
			<div class="modal fade" id="Modal1" tabindex="-1" role="dialog" aria-labelledby="ModalLabel1">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel"> </h4>
				      </div>
				      <div class="modal-body">
				        	<div class="intro-bg" style="background-imge:https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiK3b_v5MThAhXkyosBHQ9qBNQQjRx6BAgBEAU&url=https%3A%2F%2Fblog.fotolia.com%2Fkr%2F2017%2F03%2F29%2F%25EB%2593%259C%25EB%25A1%25A0-%25EC%2582%25AC%25EC%25A7%2584-%25EC%25B4%25AC%25EC%2598%2581-%25ED%258C%2581%2F&psig=AOvVaw14rRXvHTQ2FH88k53oQkpc&ust=1554960350074597">
				        	</div>
				        	<div class="intro-content">
				        	<p>결제를 진행하기 위해</p>
			 				<p>몇가지 질문에 답해주세요</p>
			 				</div> 
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" onclick="modalpage(1)">다음페이지</button>
				      </div>
				    </div>
				  </div>
			  </div>
			  
			  <div class="modal fade" id="Modal2" tabindex="-1" role="dialog" aria-labelledby="ModalLabel2">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel"> </h4>
				      </div>
				      <div class="modal-body">
				        	<div class="intro-bg" style="background-imge:https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiK3b_v5MThAhXkyosBHQ9qBNQQjRx6BAgBEAU&url=https%3A%2F%2Fblog.fotolia.com%2Fkr%2F2017%2F03%2F29%2F%25EB%2593%259C%25EB%25A1%25A0-%25EC%2582%25AC%25EC%25A7%2584-%25EC%25B4%25AC%25EC%2598%2581-%25ED%258C%2581%2F&psig=AOvVaw14rRXvHTQ2FH88k53oQkpc&ust=1554960350074597">
				        	</div>
				        	<div class="intro-content" id="userInfo">
				        	<p>이름:<input type="text" name="name"></p>
			 				<p>휴대폰:<input type="text" name="phone"></p>
			 				<p>이메일:<input type="text" name="email"></p>
			 				<p>개인<input  type="radio" name="user" value="user"> 기업<input type="radio" name="user" value="Enterprise"></p>
			 				<p>단과선택:<input type="text" name="dangua"></p>
			 				<p>패키지선택:<input type="text" name="packcage"></p>
			 				<p>금액:<input type="text" name="gold" value="100000000"></p>
			 				</div> 
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" onclick="modalpage(1)">이전페이지</button>
				        <button type="button" class="btn btn-default" onclick="modalpage(2)">다음페이지</button>
				      </div>
				    </div>
				  </div>
			  </div>
			  <div class="modal fade" id="Modal3" tabindex="-1" role="dialog" aria-labelledby="ModalLabel2">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel"> </h4>
				      </div>
				      <div class="modal-body">
				        	<div class="intro-bg" style="background-imge:https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiK3b_v5MThAhXkyosBHQ9qBNQQjRx6BAgBEAU&url=https%3A%2F%2Fblog.fotolia.com%2Fkr%2F2017%2F03%2F29%2F%25EB%2593%259C%25EB%25A1%25A0-%25EC%2582%25AC%25EC%25A7%2584-%25EC%25B4%25AC%25EC%2598%2581-%25ED%258C%2581%2F&psig=AOvVaw14rRXvHTQ2FH88k53oQkpc&ust=1554960350074597">
				        	</div>
				        	<div class="intro-content">
				        	<!-- 결제 입력란 -->결제 API
			 				</div> 
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" onclick="modalpage(2)">이전페이지</button>
				        <button type="button" class="btn btn-default" onclick="submit()">결제완료</button>
				      
				      </div>
				    </div>
				  </div>
			  </div>
			 
    		</div>
    
    		<!-- 메인끝 -->
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

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
  <script src="js/demo/datatables-demo.js"></script>

</body>

</html>
