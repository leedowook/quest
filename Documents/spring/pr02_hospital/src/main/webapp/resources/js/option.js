function addOption(){
	if(!$("#selectOptionList option:selected").hasClass("added")){
	var optionName=$("#selectOptionList option:selected").val();
	var subOptionName="sub"+optionName;
	$("#selectOption").append("<div class='suboption' id='"+subOptionName+"'>"+subOptionName+" <select class='subSelect SubOption' id='"+subOptionName+"select1'>" +
			"</select><select  class='subSelect subOption' id='"+subOptionName+"select2'></select></div>");
	
	for(var i=1;i<3;i++){
		$("#"+subOptionName+"select"+i).append("<option value='suboption'"+i+">선택옵션"+i+"</option>");	
		for(var j=2;j<5;j++){
			$("#"+subOptionName+"select"+i).append("<option value='suboption"+j+"'>선택옵션"+j+"</option>");			
		}
	}
	$("#selectOptionList option:selected").addClass("added");
	}
}
function delOption(){
	var subOptioNname=$("").val();
	
}
$(function(){
	$("#selectOption").on('click', '.suboption', function(){
		console.log($(this).attr('id'));
		if(!$(this).hasClass("selected")){
			$(this).addClass("selected");
			$(this).css("border-color", "green");}
		else{
		$(this).removeClass("selected");
		$(this).css("border-color", "");
	}});
	$("#selectOption").on('mouseover','.suboption',function(){
		console.log($(this).attr('id'));
		if(!$(this).hasClass("selected")){
		$(this).css("border-color", "#858796");}


	});
	$("#selectOption").on('mouseout','.suboption',function(){
		if(!$(this).hasClass("selected")){
			$(this).css("border-color","");}
	});
})



function clickSubOption(){
	console.log(id);
	if(!$("#this").hasClass("selected")){
		$("#"+id).addClass("selected");
		$("#"+id).css("color", "green");}
	else{
	$("#"+id).removeClass("selected");
	$("#"+id).css("color", "");
	}
	
}
function overSubOption(id){
	console.log(id);
	$("#"+id).css("color", "gray");
}