function inputCheck(){
	if(document.regFrm.id.value==""){
		alert("아이디를 입력해주세요");
		document.regFrm.id.focus();
		return;
	}
	if(document.regFrm.userPwd.value==""){
		alert("비밀번호를 입력해주세요");
		document.regFrm.userPwd.focus();
		return;
	}
	if(document.regFrm.userPwdCheck.value==""){
		alert("비밀번호 확인을 입력해주세요");
		document.regFrm.userPwdCheck.focus();
		return;
	}
	if(document.regFrm.userPwd.value!=document.regFrm.userPwdCheck.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.regFrm.userPwdCheck.value="";
		document.regFrm.userPwdCheck.focus();
		return;
	}
	if(document.regFrm.name.value==""){
		alert("이름을 입력해주세요");
		document.regFrm.name.focus();
		return;
	}
	if(document.regFrm.birth.value==""){
		alert("생일을 입력해 주세요");
		document.regFrm.birth.focus();
		return;
	}
	if(document.regFrm.email.value==""){
		alert("이메일을 입력해주세요");
		document.regFrm.email.focus();
		return;
	}
	let str=document.regFrm.email.value;
	let atPos=str.indexOf('@');
	let atLastPos=str.lastIndexOf('@');
	let dotPos=str.indexOf('.');
	let spacePos=str.indexOf(' ');
	let commaPos= str.indexOf(',');
	let eMailSize=str.length;
	if(atPos>1 && atPos ==atLastPos &&
		dotPos>3 && spacePos==-1 &&commaPos==-1
		&& atPos+1<dotPos &&dotPos+1<eMailSize);
    else {
          alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
	      document.regFrm.email.focus( );
		  return;
    } 
    if(document.regFrm.zipcode.value==""){
    	alert('우편번호를 검색해주세요');
    	return;
	}
	if(document.regFrm.findPwdQuest.value=="0"){
		alert("비밀번호 찾기 질문을 선택해주세요");
		document.regFrm.findPwdQuest.focus();
		return;
	}
	if(document.regFrm.findPwdAnswer.value==""){
		alert("비밀번호 찾기 답변을 입력해주세요");
		document.regFrm.findPwdAnswer.focus();
		return;
	}
	
	document.regFrm.submit();
}
function reserCheck(){
	if(document.reserFrm.id.value==""){
		alert("아이디를 입력해주세요");
		document.reserFrm.id.focus();
		return;
	}
	if(document.reserFrm.name.value==""){
		alert("이름을 입력해주세요");
		document.reserFrm.name.focus();
		return;
	}
	if(document.reserFrm.point_addr.value=="0"){
		alert("픽업지점를 입력해 주세요");
		document.reserFrm.point_addr.focus();
		return;
	}
	if(document.reserFrm.pickUp.value==""){
		alert("픽업여부를 선택해주세요");
		document.reserFrm.pickUp.focus();
		return;
	}
    if(document.reserFrm.dateStart.value==""){
    	alert('여행이 시작하는 날짜를 입력해주세요');
    	document.reserFrm.dateStart.focus();
    	return;
	}
	if(document.reserFrm.dateEnd.value==" "){
		alert("여행이 끝나는 날짜를 선택해주세요");
		document.reserFrm.findPwdQuest.focus();
		return;
	}
	if(document.reserFrm.package.value==""){
		alert("여행패키지를 선택해주세요");
		document.reserFrm.package.focus();
		return;
	}
	if(document.reserFrm.dogSize.value==""){
		alert("견종크기를 선택해주세요");
		document.reserFrm.dogSize.focus();
		return;
	}
	
	document.reserFrm.submit();
}


function win_close(){
	self.close();
}
