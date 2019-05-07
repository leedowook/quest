function sustr(id){
	var userpart=id.substr(0,2)
	var numberpart=id.substr(id.length-6);
	for(var i=1;i<7;i){
		lastnubmer=numberpart.substr(1)
		
	}
	
	
}

function numbering(number){
	
	if(number<9){
		number*=1;
		number+=1;
		number+="";
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