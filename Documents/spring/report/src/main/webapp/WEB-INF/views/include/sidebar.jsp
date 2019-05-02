<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
function closeModal(){
	$('#modallogin').modal("toggle");
	$('#loginsubmit')[0].reset();
}
function login(){
	var formdata=$("#loginsubmit").serializeArray();
	$.ajax({
		type:"post",
		dataType:"json",
		data: formdata,
		url:"/pro/User/login",
	success:function(ajaxdata){
		 if(ajaxdata.isExist){
			 console.log("불러오기 실패사용불가");
		 }else{
			test=ajaxdata
			if(test.data>0){
			closeModal()
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
}
</script>
</head>
<body>
  <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>공지관리</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">공지사항 관리 :</h6>
          <a class="dropdown-item" href="/pro/NB/list">공지사항</a>
          <a class="dropdown-item" href="/pro/NB/reg">공지사항 등록</a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>회원관리</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">로그인 관련:</h6>
          <a class="dropdown-item" data-toggle="modal" href="#modallogin">로그인</a>
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">관리 권한:</h6>
          <a class="dropdown-item" href="/pro/User/list">회원 리스트</a>
          <a class="dropdown-item" href="/pro/User/register">회원정보 입력</a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>선납권판매관리</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Login Screens:</h6>
          <a class="dropdown-item" href="login.html">Login</a>
          <a class="dropdown-item" href="register.html">Register</a>
          <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Other Pages:</h6>
          <a class="dropdown-item" href="404.html">404 Page</a>
          <a class="dropdown-item" href="blank.html">Blank Page</a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>결제목록</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Login Screens:</h6>
          <a class="dropdown-item" href="login.html">Login</a>
          <a class="dropdown-item" href="register.html">Register</a>
          <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Other Pages:</h6>
          <a class="dropdown-item" href="404.html">404 Page</a>
          <a class="dropdown-item" href="blank.html">Blank Page</a>
        </div>
      </li>
     
    </ul>
     <div class="modal fade" id="modallogin" tabindex="-1" role="dialog" aria-labelledby="ModalLabel2">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                 	로그인
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"> </h4>
                  </div>
                  <div class="modal-body">
                       <div class="intro-bg" style="background-imge:https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiK3b_v5MThAhXkyosBHQ9qBNQQjRx6BAgBEAU&url=https%3A%2F%2Fblog.fotolia.com%2Fkr%2F2017%2F03%2F29%2F%25EB%2593%259C%25EB%25A1%25A0-%25EC%2582%25AC%25EC%25A7%2584-%25EC%25B4%25AC%25EC%2598%2581-%25ED%258C%2581%2F&psig=AOvVaw14rRXvHTQ2FH88k53oQkpc&ust=1554960350074597">
                       </div>
                       <div class="intro-content">
						      <div class="card-body">
						        <form action="/pro/User/login" method="post" id="loginsubmit">
						          <div class="form-group">
						            <div class="form-label-group">
						              <input type="email" name="loginid" id="inputEmail" class="form-control" placeholder="Email address" required="required" autofocus="autofocus">
						              <label for="inputEmail">아이디</label>
						            </div>
						          </div>
						          <div class="form-group">
						            <div class="form-label-group">
						              <input type="password" name="loginpwd" id="inputPassword" class="form-control" placeholder="Password" required="required">
						              <label for="inputPassword">비밀번호</label>
						            </div>
						          </div>
						           <input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">
						          </form>
                      </div> 
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-primary"  onclick="login()">로그인</button>
                    <button type="button" class="btn btn-default" onclick="closeModal()">닫기</button>
                  </div>
             </div>
        </div>
    </div>
  </div>

    
</body>
</html>