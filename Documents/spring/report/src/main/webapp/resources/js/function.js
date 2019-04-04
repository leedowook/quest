date();
var check=[0,0];
var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
var csrfToken = $("meta[name='_csrf']").attr("content"); 
var csrfHeader = $("meta[name='_csrf_header']").attr("content");
data[csrfParameter] = csrfToken;
data["institutionId"] = option;
headers[csrfHeader] = csrfToken; 


function date(){
document.getElementById('user_crdate').value= new Date().toISOString().slice(0, 10);
}

function pwCheck(){
	var pw=$("#user_pw").val();
	var pwcheck=$("#confirmpwd").val();
	if(pw===pwcheck){
		$("#confirmpwd").removeClass(" is-invalid");
		$("#confirmpwd").addClass(" is-valid");
		check[1]=1;
	}else if(pw!==pwcheck){
		$("#confirmpwd").removeClass(" is-valid");
		$("#confirmpwd").addClass(" is-invalid");
		check[1]=0;
	}
	
}
function passwordChange(){
	var pw=prompt("입력");
	
}

function idOverlap(){
	var id=$("user_id").val();
	$.ajax({
		type:"post",
		dataType:"text",
		data:id,
		url:"/pro/User/idOverlap",
		contentType:"Application/text;charset=UTF-8",
			success:function(data){
				 if(data.isExist){
					 console.log("불러오기 실패사용불가");
				 }else{
					 if(data>0){
						 $("#user_id").removeClass(" is-valid");
						 $("#user_id").addClass(" is-invalid");
						 check[0]=0;
					 }else{
						 $("#user_id").removeClass(" is-invalid");
						 $("#user_id").addClass(" is-valid");
						 check[0]=1;
					 }
				 }}});
	
	
}

function joinSubmit(){
var id=$("user_id").val();
var pw=$("#user_pw").val();
var name=$("#user_name").val();
if(id===null){
	alert("아이디를 입력 해주세요");
}else if(pw===null){
	alert("비밀번호를 입력 해주세요");
}else if(name===null){
	alert("이름을 입력 해주세요");
}else{
if(check[0]===1&&check[1]===1){
document.getElementById('register_frm').submit();
}else if(check[0]===0&&check[1]===1){
	alert("아이디가 중복되었는지 확인을 해주세요");
}else if(check[0]===1&&check[1]===0){
	alert("패스워드가 일치하지 않습니다. 확인을 해주세요");
}else{
	alert("아이디 중복확인 미실시와 패스워드가 일치하지 않습니다. 확인을 해주세요");
}}
}