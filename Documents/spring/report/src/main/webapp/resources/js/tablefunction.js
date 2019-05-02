var page=0
var select="all"
var userName=new Array
var userPhone=new Array
var userCrdate=new Array

table()



function paging(){
	
}

function table(){
	for(var i=0;i<userList.length;i++){
	console.log(userList[i].enabled)
	if(userList[i].enabled!='0'){
		userList[i].enabled="허용";
	}else {
		userList[i].enabled="차단";
		}
	var modify="modifyPage('"+userList[i].user_id+"')";
	var deleteuser="deleteuser('"+userList[i].user_id+"')";
	//userTbody 정보입력부분
	$("#userTbody").append("<tr id='"+userList[i].user_id+"'>"+
			"<td><a class='btn'  onclick="+modify+">"+userList[i].user_id+"</a></td>" +
			"<td>"+userList[i].user_name+"</td>"+
			"<td>"+userList[i].user_phone+"</td>"+
			"<td>"+userList[i].user_crdate+"</td>"+
			"<td>"+userList[i].enabled+"</td>"+
			"<td><a class='btn btn-primary btn-block' onclick="+deleteuser+">회원삭제</a></td>"+
			"</tr>");
	//select에 id
	
	
	
	}
}

function selectSubmit(){
	var select=$("#tableSelect").serializeArray();
	console.log(select)
	$.ajax({
		async: true,
		type:"get",
		dataType:"json",
		data: select,
		contentType:"Application/text;charset=UTF-8",
		url:"/pro/User/selectUserTable", 
        success:function(ajaxdata){
			 if(ajaxdata.isExist){
				 console.log("불러오기 실패사용불가");
			 }else{
				test=ajaxdata
				console.log(test.userList)
				userList=test.userList
				console.log(test.userCount)
				userCount=test.userCount
				$('#userTbody').empty();
				table()
					
				
				
				 
			 }},
        error: function (textStatus, errorThrown)
        {
               alert(errorThrown + " " + textStatus);
        }
		});
/*	$.ajax({
		url:"/pro/User/selectUserTable",
		type:"get",
		data:select,         
		success:function(){
			alert("asdfasdf")
		}, 
		error: function(){
			alert("에러")
		}
	})*/
	
}

function deleteuser(id){
	document.getElementById("id_del").value=id;
	var modify=$("#Del").serializeArray();
	console.log(modify)
	console.log(id)
	$.ajax({
		type:"post",
		dataType:"json",
		data: modify,
		url:"/pro/User/userdelete", 
		
        success:function(ajaxdata){
			 if(ajaxdata.isExist){
				 console.log("불러오기 실패사용불가");
			 }else{
				test=ajaxdata
				if(test.data>0){
				alert("정상 삭제되었습니다");
				$("#"+id).empty();
				
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
function modifyPage(id){
	
	
	document.getElementById("id_modify").value=id;
	
	alert(id);
	document.getElementById("Modify").method="get";
	document.getElementById("Modify").action="/pro/User/registerModify";
	document.getElementById("Modify").submit();
}