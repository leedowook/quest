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
  <meta name="_csrf" content="${_csrf.token}"/>
  <meta name="_csrf_header" content="${_csrf.headerName}"/>
  <title>SB Admin - Register</title>
  <!-- Custom fonts for this template-->
 
  <link href="/pro/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="/pro/resources/css/sb-admin.css" rel="stylesheet">
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script type="text/javascript">
  function changePw(){
	  	var pwCheck;
		var pw=prompt("새로운 비밀번호를 입력해주세요","");
		pw=pw.replace(/\s/gi,"");
		if(pw!=null||pw!=""){
			pwCheck=prompt("한번 더 입력해주세요","");
			pwCheck=pwCheck.replace(/\s/gi,"");
			if(pwCheck!=null||pwCheck!=""){
				if(pwCheck===pw){
					$("user_pw").value=pw;
					alert("변경값이 입력되었습니다. 저장해주세요");
					
				}else{
					alert("두 값이 일치하지 않습니다.");
				}
			}
		}
  }
  function changeuser(){
	  var formdata=$("#register_frm").serializeArray();
		console.log(formdata);
		$.ajax({
			type:"post",
			dataType:"json",
			data: formdata,
			url:"/pro/User/registerModifyAction",
			
	        success:function(ajaxdata){
				 if(ajaxdata.isExist){
					 console.log("불러오기 실패사용불가");
				 }else{
					test=ajaxdata
					if(test.data>0){
					alert("정상 입력되었습니다");
					location.href="notice/userTable.jsp";
					}else{
						 console.log(test);
					alert("알수 없는 오류 잠시뒤에 시도하거나 개발팀에 문의하세요")
					}
					
					 
				 }},
	        error: function (textStatus, errorThrown)
	        {
	               alert(errorThrown + " " + textStatus);
	        }
			});
  }</script>
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
      <div class="card-header">회원정보 변경</div>
      <div class="card-body">
        <form id="register_frm" action="/pro/User/registerModifyAction" method="post">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" name="user_name" value="${user.user_name}" id="user_name" class="form-control" placeholder="user_name" required="required" autofocus="autofocus">
                  <label for="user_name">이름</label>
                </div>
              </div>
              <div class="col-md-6" id="userIdDiv">
                <div class="form-label-group">
	              <input type="text"name="user_id" value="${user.user_id}" id="user_id" class="form-control" required="required" readonly="readonly">
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <fieldset disabled="">
                  <input type="password" name="user_pw" id="user_pw" class="form-control" placeholder="user_pw" required="required" value=""  disable="" >
                  </fieldset>
                </div>
              </div>
              <div class="col-md-6" id="confirmpwd">
                <div class="form-label-group">
                  <a class="btn btn-primary btn-block" onclick="changePw()">비밀번호 변경</a>
                </div>
              </div>
            </div>
          </div>
           <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" name="user_phone" value="${user.user_phone}" id="user_phone" class="form-control" placeholder="user_phone" required="required">
                  <label for="user_phone">연락처</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="date" name="user_crdate" id="user_crdate" class="form-control" placeholder="user_crdate" required="required" value="${user.user_crdate}" >
                  <label for="user_crdate">작성일</label>
                </div>
              </div>
            </div>
          </div>
          <input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">
          <a class="btn btn-primary btn-block" onclick="document.getElementById('register_frm').submit();">변경</a>
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
