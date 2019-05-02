date();
var check=[0,0];
var test="";
var csrf_token = $('input[name=_csrf]').val();
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(function() {
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});
function date(){
document.getElementById('user_crdate').value= new Date().toISOString().slice(0, 10);
}

function pwdCheck(i){
	var pw=$("#user_pw").val();
	var pwcheck=$("#confirmpw").val();
	pw=pw.replace(/\s/gi,"");
	pwcheck=pwcheck.replace(/\s/gi,"");
	if(i==1){
	
	if(pw===pwcheck){
		$("#confirmpw").removeClass(" is-invalid");
		$("#confirmpw").addClass(" is-valid");
		check[1]=1;
	}else if(pw!==pwcheck){
		$("#confirmpw").removeClass(" is-valid");
		$("#confirmpw").addClass(" is-invalid");
		check[1]=0;
	}}else if(i===0){
		if(pwcheck!==null){
			if(pw===pwcheck){
				$("#confirmpw").removeClass(" is-invalid");
				$("#confirmpw").addClass(" is-valid");
				check[1]=1;
			}else if(pw!==pwcheck){
				$("#confirmpw").removeClass(" is-valid");
				$("#confirmpw").addClass(" is-invalid");
				check[1]=0;
			}
		}
		
	}
	
}

function idOverlap(){
	var id=$("#user_id").val();
	id=id.replace(/\s/gi,"");
	if(id!=null&&id!=""){
	$.ajax({
		type:"get",
		dataType:"text",
		data: {"id":id},
		url:"/pro/User/idOverlap",
		contentType:"Application/text;charset=UTF-8",
        success:function(data){
			 if(data.isExist){
				 console.log("불러오기 실패사용불가");
			 }else{
				 if(data>0){
					 console.log("곂침"+data);
					 $("#user_id").removeClass(" is-valid");
					 $("#user_id").addClass(" is-invalid");
					 check[0]=0;
				 }else{
					 console.log("안곂침"+data);
					 $("#user_id").removeClass(" is-invalid");
					 $("#user_id").addClass(" is-valid");
					 check[0]=1;
				 }
			 }},
        error: function (textStatus, errorThrown)
        {
               alert(errorThrown + " " + textStatus);
        }
		});}else{
			 $("#user_id").removeClass(" is-invalid");
			 $("#user_id").addClass(" is-invalid");
			 check[0]=0;
		}
	
	
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
//document.getElementById('register_frm').submit();
	var formdata=$("#register_frm").serializeArray();
	console.log(formdata);
	$.ajax({
		type:"post",
		dataType:"json",
		data: formdata,
		url:"/pro/User/registeraction",
		
        success:function(ajaxdata){
			 if(ajaxdata.isExist){
				 console.log("불러오기 실패사용불가");
			 }else{
				test=ajaxdata
				if(test.data>0){
				alert("정상 입력되었습니다");
				$("#register_frm")[0].reset();
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
}else if(check[0]===0&&check[1]===1){
	alert("아이디가 중복되었는지 확인을 해주세요");
}else if(check[0]===1&&check[1]===0){
	alert("패스워드가 일치하지 않습니다. 확인을 해주세요");
}else{
	alert("아이디 중복확인 미실시와 패스워드가 일치하지 않습니다. 확인을 해주세요");
}}
}