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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">
  <script src='//code.jquery.com/jquery.js'></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
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
	<style>
	@media screen and (min-width: 1100px) {

	.title{
		color:white;
	}
	.row{
        background-image: url( "img/loginBackground.png" );
        background-size:100% 100%;
        height: 100%;
	width: 100%;
		}
	 .mb-4 {
    margin-bottom: 0.0rem !important;
		}
	*{
    	overflow:hidden;
    }
    
    }
    input#loginId, #loginPassword {
    margin-bottom: 7px;
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
        <!-- 배경 -->
        <div class="row" align="right" >
        <div class="container-fluid">
		
          <!-- Page Heading -->
          <!-- 로그인 배경 -->
          <div  id="loginBackground"></div>
          <!-- 메인 -->
          
          
				<div class="col-xl-3 col-lg-3 col-md-12  login" id="loginDiv"align="center" >
					<h4 class="title">관리자 로그인</h4>
					<form id="loginform" >
						 <div class="input-group" >
						    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						    <input id="loginId" type="text" class="form-control" name="loginId" placeholder="Id">
						  </div>
						  <div class="input-group">
						    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						    <input id="loginPassword" type="password" class="form-control" name="LoginPassword" placeholder="Password">
						  </div>
						<div class="form-group">
							<input type="button" class="btn btn-primary btn-block btn-lg" onclick="testLogin()" value="Login">
						</div>
					</form>
				</div>
            
            </div>
           </div>
          

          
              
              
      
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
 <script type="text/javascript" src="js/login.js"></script>
   <!-- Page level plugins -->
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/datatables-demo.js"></script>

</body>

</html>
