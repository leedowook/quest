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
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <script src="js/option.js" type="text/javascript"></script>
  <style>
  	.selectDiv{
  		border: 3px solid #cacaca;
    	border-radius: 10px;
    	background-color: white;
    	padding:10px
    }
    #selectOptionList{
    	margin-bottom: 17px;
    } 
    .subOption{
    	margin-left:10px;
    	
    }
  	.suboption{
  		border-color:#ffffff;
  	  	border: 3px solid ;
    	border-radius: 10px;}
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
        <div class="container-fluid">
		
          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">문자 관리</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div>
          <!-- 메인 -->
			<div class="row">
				<!-- 상세검색 -->
				     <div class="row col-xl-12 col-lg-12 col-sm-12 col-md-12" >
						<div class="col-xl-12 col-lg-12 col-sm-12 col-md-12" ><h4>상세검색</h4></div>
							<div class="selectDiv col-xl-3 col-lg-3 col-sm-3 col-md-3" id="selectOptionListDiv">
								<label for="selectOptionList">검색목록</label>
								<select multiple="" class="form-control col-xl-11"  id="selectOptionList">
									<option selected="selected" value="옵션1">1.옵션1</option>
									<option value="옵션2">2.옵션2</option>
									<option value="옵션3">3.옵션3</option>
									<option value="옵션4">4.옵션4</option>
									<option value="옵션5">5.옵션5</option>
									<option value="옵션6">6.옵션6</option>
									<option value="옵션7">7.옵션7</option>
									<option value="옵션8">8.옵션8</option>
									<option value="옵션9">9.옵션9</option>
									<option value="옵션10">10.옵션10</option>
									
								
								</select>
							</div>
							<div class="col-xl-1 col-lg-1 col-sm-1 col-md-1" align="center">
								<br><button type="button" class="btn btn-primary" onclick="addOption()">></button><br><br>
								<button type="button" class="btn btn-primary"><</button></div>
							<div class="selectDiv  col-xl-8 col-lg-8 col-sm-8 col-md-8" id="selectOption">
							</div>
					</div>
					</div>
			  <!-- 유저테이블 -->
			  <hr>
			  
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
    		<!-- 메인끝 -->
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
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
