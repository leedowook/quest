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
  <script type="text/javascript">
  	$(function(){
  		if($("#user_pw").length>0){
  			$('#confirmpw').removeAttr('disabled');	
  			
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
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div>
          <!-- 메인 -->
			<div class="table-responsive">
			                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			                  <thead>
			                    <tr>
			                      <th>고객번호</th>
			                      <th>이름</th>
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
			              </div>+
			  
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
	 <div class="modal fade" id="customerAddModal" tabindex="-1" role="dialog" aria-labelledby="customerAddModallable" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="customerAddModallable">직원입력</h5>
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
		                  <input type="text" name="name" id="user_name" class="form-control" placeholder="이름" required="required" autofocus="autofocus">  
		              </div>
		               <div class="col-md-6">
		                  <input type="text" name="user_phone" id="user_phone" class="form-control" placeholder="전화번호" required="required">
		              </div>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="password" name="pw" id="user_pw" class="form-control" placeholder="비밀번호입력" required="required" onchange="pwdCheck(0)">
		              </div>
		              <div class="col-md-6"  id="confirmpwd">
		                  <input type="password" name="confirmpw"  disabled="" id="confirmpw" class="form-control" placeholder="비밀번호 확인" required="required" onchange="pwdCheck(1)">
		              </div>
		            </div>
		          </div>
		           <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="text" name="address" id="user_adress" class="form-control" placeholder="주소" required="required">
		              </div>
		              <div class="col-md-6">
		                  <input type="date" name="date" id="user_crdate" class="form-control" placeholder="user_crdate" required="required" value="" >
		              </div>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                  <input type="text" name="position" id="user_adress" class="form-control" placeholder="직급" required="required">
		              </div>
		              <div class="col-md-6">
		                  <input type="text" name="department" id="user_crdate" class="form-control" placeholder="진료과" required="required" value="" >
		              </div>
		            </div>
		          </div>
		          <input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">
		          <a class="btn btn-primary btn-block" onclick="joinSubmit()">생성</a>
		        </form>
		      </div>
		    </div>
	       	 <div class="modal-footer">
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	          <a class="btn btn-primary" href="login.html">입력</a>
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
  <script src="vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>
