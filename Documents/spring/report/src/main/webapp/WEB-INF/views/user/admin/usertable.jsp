<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Tables</title>

  <!-- Custom fonts for this template-->
  <link href="/pro/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="/pro/resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/pro/resources/css/sb-admin.css" rel="stylesheet">
  <!-- 유저 정보 -->
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script  type="text/javascript">
  		var userList=new Array();
  		<c:forEach items="${userList}" var="list">
			var user=new Object();
			user.user_id="${list.user_id}";
			user.user_pw="${list.user_pw}";
			user.user_name="${list.user_id}";
			user.user_phone="${list.user_phone}";
			user.user_crdate="${list.user_crdate}";
			user.enable="${list.enable}";
			userList.push(user);
		</c:forEach>
		var userCount =<c:out value="${userCount}"/>
		
		console.log(userList);
		console.log(userCount);
  </script>
  
  
</head>
<body id="page-top">
<jsp:include page="../../include/nav.jsp" flush="true"/>
	<div id="wrapper">
	<jsp:include page="../../include/sidebar.jsp" flush="true"/>
	<div id="content-wrapper">

      <div class="container-fluid">
      <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Tables</li>
        </ol>
      
    <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Data Table Example</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>작성일</th>
                    <th>차단여부</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>PhoneNumber</th>
                    <th>Create Date</th>
                    <th>Blocking</th>
                  </tr>
                </tfoot>
                <tbody id="userTbody">
      
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
          <p class="small text-center text-muted my-5">
          <em>More table examples coming soon...</em>
        </p>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

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
    <script src="/pro/resources/js/tablefunction.js"></script>

  <!-- Bootstrap core JavaScript-->
  <script src="/pro/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/pro/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/pro/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="/pro/resources/vendor/datatables/jquery.dataTables.js"></script>
  <script src="/pro/resources/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/pro/resources/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
	  <script src="/pro/resources/js/demo/datatables-demo.js"></script>

</body>
</html>