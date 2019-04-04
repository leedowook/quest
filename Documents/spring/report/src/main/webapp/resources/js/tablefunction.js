var page=0
table()



function paging(){
	
}
function getTableInfo(){
	$.ajax({
		type:"post",
		dataType:"text",
		data:page,
		url:"user.getTablInfo",
		contentType:"Application/json;charset=UTF-8",
			success:function(data){
				 if(data.isExist){
					 console.log("불러오기 실패사용불가");
				 }else{
					 
				 }}});
	
}
function table(){
	alert("체크"+userList.length);
	for(var i=0;i<userList.length;i++){
	if(userList[i].enable!='1'){
		userList[i].enable="허용";
	}else{userList[i].enable="차단"}
	alert("작동중"+i);
	$("#userTbody").append("<tr>"+
			"<td>"+userList[i].user_id+"</td>" +
			"<td>"+userList[i].user_name+"</td>"+
			"<td>"+userList[i].user_phone+"</td>"+
			"<td>"+userList[i].user_crdate+"</td>"+
			"<td>"+userList[i].enable+"</td>"+
			"</tr>");}
	
	
}