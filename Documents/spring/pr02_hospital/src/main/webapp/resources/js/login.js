var id;
function testLogin(){

	userPage()
}


function loginpage(){
	
	
	
}
function logout(){
	var id;
	document.getElementById("loginDiv").innerHTML = "";
	 document.getElementById("loginDiv").innerHTML ="<h4 class='title'>관리자 로그인</h4>"+
					"<form id='loginform' method='post'>"+
						 "<div class='input-group' >"+
						    "<span class='input-group-addon'><i class='glyphicon glyphicon-user'></i></span>"+
						    "<input id='loginId' type='text' class='form-control' name='loginId' placeholder='Id'></div>"+
						  "<div class='input-group'>"+
						    "<span class='input-group-addon'><i class='glyphicon glyphicon-lock'></i></span>"+
						    "<input id='loginPassword' type='password' class='form-control' name='LoginPassword' placeholder='Password'>"+
						  "</div>"+
						"<div class='form-group'>"+
							"<input type='button' class='btn btn-primary btn-block btn-lg' onclick='login()' value='Login'>"+
						"</div>"+
					"</form>";
	
}
function userPage(){
	var authority="all";//권한  후엔 바꿔야함
	id=$("input[name=loginId]").val();
	 document.getElementById("loginDiv").innerHTML = "";
	 document.getElementById("loginDiv").innerHTML ="<h4 class='title'>"+id+"님 환영합니다.</h4><div><button type='button' onclick='logout()'>로그아웃</button></div>";
	
	
}