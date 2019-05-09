$.fn.serializeObject = function() {
    var obj = null;
    try {
        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
            var arr = this.serializeArray();
            if (arr) {
                obj = {};
                $.each(arr, function() {
                    obj[this.name] = this.value;
                });
            }
        }
    } catch (e) {
        alert(e.message);
    } finally {
    }
 
    return obj;
};





function sustr(id){
	if(id==null){
		return "000000"
	}
	var ramnumber="",resultnumber="",returnnumber=""
	
	var userpart=id.substr(0,3) //emp , cus부분
	var numberpart=id.substr(id.length-6);//6은 바뀌는 범위
	console.log("넘버파트"+numberpart)
	for(var i=1;i<7;i++){//7은 바뀌는범위 +1
		ramnumber=numberpart.substr(numberpart.length-i,1)//맨끝숫자 , 한자리넘어가면 다음숫자
		console.log("램넘버1"+ramnumber)
		console.log("현제"+i) 
		ramnumber=numbering(ramnumber)//넘버링 함수돌림
		console.log("램넘버2"+ramnumber)
		resultnumber=ramnumber+resultnumber//결과넘버에 추가
		console.log("리설트넘버"+resultnumber)
		if(ramnumber!=0){
			returnnumber=numberpart.substr(0,numberpart.length-i)+resultnumber
			console.log("if문의 리설트넘버"+returnnumber)
			break;
		}
	}
	userpart+=returnnumber
	return userpart;
	
}

function numbering(number){
	
	if(number<9){
		number*=1;//문자를 숫자화
		number+=1;
		number+="";//숫자를 문자화
	}			
	else if(number==9){
		number="a";
	}
			else{		
				if(number=="a"){
				 		number="b";	
				 }
				 else if(number=="b"){
				 		number="c"	;
				 }
				 else if(number=="c"){
				 		number="d"	;
				 }
				 else  if(number=="d"){
				 		number="e"	;
				 }
				 else  if(number=="e"){
				 		number="f"	;
				 }
				 else  if(number=="f"){
				 		number="g"	;
				 }
				 else if(number=="g"){
				 		number="h"	;
				 }
				 else if(number=="h"){
				 		number="i"	;
				 }
				 else  if(number=="i"){
				 		number="j"	;
				 }
				 else  if(number=="j"){
				 		number="k"	;
				 }
				 else if(number=="k"){
				 		number="l"	;
				 }
				 else if(number=="l"){
				 		number="n"	;
				 }
				 else  if(number=="n"){
				 		number="m"	;
				 }
				 else  if(number=="m"){
				 		number="o"	;
				 }
				 else  if(number=="o"){
				 		number="p"	;
				 }
				 else  if(number=="p"){
				 		number="q"	;
				 }
				 else  if(number=="q"){
				 		number="r"	;
				 }
				 else if(number=="r"){
				 		number="s"	;
				 }
				 else  if(number=="s"){
				 		number="t"	;
				 }
				 else if(number=="t"){
				 		number="u"	;
				 }
				 else if(number=="u"){
				 		number="v"	;
				 }
				 else  if(number=="v"){
				 		number="w"	;
				 }
				 else  if(number=="w"){
				 		number="x"	;
				 }
				 else if(number=="x"){
				 		number="y"	;
				 }
				 else if(number=="y"){
				 		number="z"	;
				 }
				else if(number="z"){
					number="0";
				}
	};
	return number;
}