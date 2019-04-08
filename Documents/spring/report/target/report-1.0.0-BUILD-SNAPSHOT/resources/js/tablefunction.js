var page=0
table()



function paging(){
	
}

function table(){
	
	for(var i=0;i<userList.length;i++){
	if(userList[i].enable!='1'){
		userList[i].enable="허용";
	}else{userList[i].enable="차단"}
	var modify="modifyPage('"+userList[i].user_id+"')";
	var deleteuser="deleteuser('"+userList[i].user_id+"')";
	$("#userTbody").append("<tr>"+
			"<td><a class='btn'  onclick="+modify+">"+userList[i].user_id+"</a></td>" +
			"<td>"+userList[i].user_name+"</td>"+
			"<td>"+userList[i].user_phone+"</td>"+
			"<td>"+userList[i].user_crdate+"</td>"+
			"<td>"+userList[i].enable+"</td>"+
			"<td><a class='btn btn-primary btn-block' onclick="+deleteuser+">회원삭제</a></td>"+
			"</tr>");}
	
	
}
function deleteuser(id){
	alert("삭제확인용"+id);
	document.getElementById("id_modify").value=id;

	document.getElementById("Modify").method="post";
	document.getElementById("Modify").action="/pro/User/userdelete";
	document.getElementById("Modify").submit();
}
function modifyPage(id){
	
	
	document.getElementById("id_modify").value=id;
	
	alert(id);
	document.getElementById("Modify").method="get";
	document.getElementById("Modify").action="/pro/User/registerModify";
	document.getElementById("Modify").submit();
}