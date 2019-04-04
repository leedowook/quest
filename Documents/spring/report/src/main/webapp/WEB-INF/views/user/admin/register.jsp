<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html >

<head>
 <meta charset="utf-8">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Register</title>
  <!-- Custom fonts for this template-->
  <link href="/pro/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="/pro/resources/css/sb-admin.css" rel="stylesheet">
  
</head>

<body class="bg-white">
	<jsp:include page="../../include/nav.jsp" flush="true"/>
	<div id="wrapper">
	<jsp:include page="../../include/sidebar.jsp" flush="true"/>
	<div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Overview</li>
        </ol>
	
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">회원정보 등록</div>
      <div class="card-body">
        <form id="register_frm" action="/pro/User/registeraction" method="post">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" name="user_name" id="user_name" class="form-control" placeholder="user_name" required="required" autofocus="autofocus">
                  <label for="user_name">이름</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" name="user_id" id="user_id" class="form-control" placeholder="user_id" required="required">
                  <label for="user_id">ID</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" name="user_pw" id="user_pw" class="form-control" placeholder="user_pw" required="required">
                  <label for="user_pw">비밀번호</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password"   id="confirmpwd" class="form-control" placeholder="confirmpwd" required="required">
                  <label for="confirmpwd">비밀번호 확인</label>
                </div>
              </div>
            </div>
          </div>
           <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" name="user_phone" id="user_phone" class="form-control" placeholder="user_phone" required="required">
                  <label for="user_phone">연락처</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="date" name="user_crdate" id="user_crdate" class="form-control" placeholder="user_crdate" required="required" value="" >
                  <label for="user_crdate">작성일</label>
                </div>
              </div>
            </div>
          </div>
          <a class="btn btn-primary btn-block" onclick="document.getElementById('register_frm').submit();">생성</a>
        </form>
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

   <!-- Bootstrap core JavaScript-->
  <script src="/pro/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/pro/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/pro/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<script type="text/javascript" src="/pro/resources/js/function.js"></script>
</body>

</html>
