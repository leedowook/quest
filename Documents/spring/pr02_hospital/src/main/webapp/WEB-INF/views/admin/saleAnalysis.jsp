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
  <!-- 차트 -->
  <link rel="stylesheet"href="css/chartist.min.css">
  <script src="js/chartist.min.js"></script>
  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">
  <script src='//code.jquery.com/jquery.js'></script>
	
	

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
            <h1 class="h3 mb-0 text-gray-800">매출 분석 통계</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div>
          <!-- 메인 -->
			<div>
				<div class="card-header py-3">
			              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
			            </div>
			            <div class="card-body ">
							<div class="ct-chart ct-golden-section" id="chart1"></div>
						</div>
				</div>
				<script>
 					 // Initialize a Line chart in the container with the ID chart1
 					new Chartist.Bar('#chart1', {
					  labels: ['Quarter 1', 'Quarter 2', 'Quarter 3', 'Quarter 4'],
					  series: [
					    [5, 4, 3, 7],
					    [3, 2, 9, 5],
					    [1, 5, 8, 4],
					    [2, 3, 4, 6],
					    [4, 1, 2, 1]
					  ]
					}, {
					  // Default mobile configuration
					  stackBars: true,
					  axisX: {
					    labelInterpolationFnc: function(value) {
					      return value.split(/\s+/).map(function(word) {
					        return word[0];
					      }).join('');
					    }
					  },
					  axisY: {
					    offset: 10
					  }
					}, [
					  // Options override for media > 400px
					  ['screen and (min-width: 400px)', {
					    reverseData: true,
					    horizontalBars: true,
					    axisX: {
					      labelInterpolationFnc: Chartist.noop
					    },
					    axisY: {
					      offset: 60
					    }
					  }],
					  // Options override for media > 800px
					  ['screen and (min-width: 800px)', {
					    stackBars: false,
					    seriesBarDistance: 10
					  }],
					  // Options override for media > 1000px
					  ['screen and (min-width: 1000px)', {
					    reverseData: false,
					    horizontalBars: false,
					    seriesBarDistance: 15
					  }]
					]);
				</script>
			<div>
				<div class="card shadow mb-4 ">
			            <div class="card-header py-3">
			              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
			            </div>
			            <div class="card-body ">
			              <div class="table-responsive">
			                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			                  <thead>
			                    <tr>
			                      <th>고객명</th>
			                      <th>성별</th>
			                      <th>생년월일</th>
			                      <th>내원횟수</th>     
			                      <th>휴대폰번호</th>
			                      <th>sns수신동의</th>
			                      <th>주소</th>
			                      <th>주 진료</th>
			                      <th>등급</th>
			                      <th>총 진료비</th>
			                    </tr>
			                  </thead>
			                  
			                  <tbody>
			                    <tr>
			                        <td class="column1 style2 s">김나라</td>
			            <td class="column2 style2 s">남</td>
			            <td class="column3 style5 n">12/13/2019</td>
			            <td class="column4 style2 null">3</td>
			            <td class="column5 style6 s">01012314232</td>
			            <td class="column6 style2 s">수신</td>
			            <td class="column7 style2 s">인천광역시 연수구 벚꽃로 341-2</td>
			            <td class="column8 style2 s">피부과/여드름</td>
			            <td class="column9 style2 n">5</td>
			            <td>60000</td>
			                    </tr>
			                    <tr>
			                       <td class="column1 style2 s">김사랑</td>
			            <td class="column2 style2 s">남</td>
			            <td class="column3 style5 n">12/13/2019</td>
			            <td class="column4 style2 null">2</td>
			            <td class="column5 style6 s">01012314233</td>
			            <td class="column6 style2 s">수신</td>
			            <td class="column7 style2 s">인천광역시 연수구 벚꽃로 341-3</td>
			            <td class="column8 style2 s">피부과/여드름</td>
			            <td class="column9 style2 n">1</td>
			              <td>130000</td>
			                    </tr>
			                    <tr>
			                     <td class="column1 style2 s">이주</td>
			            <td class="column2 style2 s">여</td>
			            <td class="column3 style5 n">12/14/2019</td>
			            <td class="column4 style2 null">4</td>
			            <td class="column5 style6 s">01012314234</td>
			            <td class="column6 style2 s">수신</td>
			            <td class="column7 style2 s">인천광역시 연수구 벚꽃로 341-4</td>
			            <td class="column8 style2 s">신경과/편두통</td>
			            <td class="column9 style2 n">2</td>
			             <td>140000</td>
			                    </tr>
			                    <tr>
			                       <td class="column1 style2 s">이야기</td>
			            <td class="column2 style2 s">여</td>
			            <td class="column3 style5 n">12/15/2019</td>
			            <td class="column4 style2 s">1</td>
			            <td class="column5 style6 s">01012314235</td>
			            <td class="column6 style2 s">수신</td>
			            <td class="column7 style2 s">인천광역시 연수구 벚꽃로 341-5</td>
			            <td class="column8 style2 s">외과/타박상</td>
			            <td class="column9 style2 n">2</td>
			             <td>40000</td>
			                    </tr>
			                    <tr>
			                    <td class="column1 style2 s">장경청</td>
			            <td class="column2 style2 s">남</td>
			            <td class="column3 style5 n">12/16/2019</td>
			            <td class="column4 style2 null">3</td>
			            <td class="column5 style6 s">01012314236</td>
			            <td class="column6 style2 s">거부</td>
			            <td class="column7 style2 s">인천광역시 연수구 벚꽃로 341-6</td>
			            <td class="column8 style2 s">신경과/편두통</td>
			            <td class="column9 style2 n">5</td>
			              <td>34000</td>
			                    </tr>
			                    <tr>
			                     
			                       <td class="column1 style2 s">조몬</td>
			            <td class="column2 style2 s">여</td>
			            <td class="column3 style5 n">12/17/2019</td>
			            <td class="column4 style2 null">5</td>
			            <td class="column5 style6 s">01012314237</td>
			            <td class="column6 style2 s">수신</td>
			            <td class="column7 style2 s">인천광역시 연수구 벚꽃로 341-7</td>
			            <td class="column8 style2 s">외과/타박상</td>
			            <td class="column9 style2 n">3</td>
			              <td>200000</td>
			                    </tr>
			                    <tr>
			                        <td class="column1 style2 s">최기마</td>
			            <td class="column2 style2 s">남</td>
			            <td class="column3 style5 n">12/18/2019</td>
			            <td class="column4 style2 null">6</td>
			            <td class="column5 style6 s">01012314238</td>
			            <td class="column6 style2 s">수신</td>
			            <td class="column7 style2 s">인천광역시 연수구 벚꽃로 341-8</td>
			            <td class="column8 style2 s">이비인후과/알레르기</td>
			            <td class="column9 style2 n">4</td>
			              <td>60000</td>
			                    </tr>
			                    <tr>
			                    <td class="column1 style2 s">지배성</td>
			            <td class="column2 style2 s">여</td>
			            <td class="column3 style5 n">12/19/2019</td>
			            <td class="column4 style2 null">1</td>
			            <td class="column5 style6 s">01012314239</td>
			            <td class="column6 style2 s">수신</td>
			            <td class="column7 style2 s">인천광역시 연수구 벚꽃로 341-9</td>
			            <td class="column8 style2 s">이비인후과/감기</td>
			            <td class="column9 style2 n">4</td>
			              <td>10000</td>
			                    </tr>
			                    <tr>
			                       <td class="column1 style2 s">크리스</td>
			            <td class="column2 style2 s">남</td>
			            <td class="column3 style5 n">12/20/2019</td>
			            <td class="column4 style2 null">3</td>
			            <td class="column5 style6 s">01012314240</td>
			            <td class="column6 style2 s">수신</td>
			            <td class="column7 style2 s">인천광역시 연수구 벚꽃로 341-10</td>
			            <td class="column8 style2 s">외과/타박상</td>
			            <td class="column9 style2 n">3</td>
			              <td>154000</td>
			                    </tr>
			                    <tr>
			                    <td class="column1 style2 s">스눅리</td>
			            <td class="column2 style2 s">여</td>
			            <td class="column3 style5 n">12/22/2019</td>
			            <td class="column4 style2 null">2</td>
			            <td class="column5 style6 s">01012314242</td>
			            <td class="column6 style2 s">수신</td>
			            <td class="column7 style2 s">인천광역시 연수구 벚꽃로 341-12</td>
			            <td class="column8 style2 s">이비인후과/알레르기</td>
			            <td class="column9 style2 n">3</td>
			              <td>40000</td>
			                    </tr>
			                  
			                  </tbody>
			                </table>
			              </div>
			            </div>
			        </div>
			  </div>
			
			
			</div>
			  
    		
    		<!-- 메인끝 -->
    	</div>
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

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>



</body>

</html>
