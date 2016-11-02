function writeSave(){
	if(document.writeform.writer.value == ""){
		alert("작성자를 입력하십시요.");
		document.writeform.writer.focus();
		return false;
	}
	if(document.writeform.subject.value == ""){
		alert("제목를 입력하십시요.");
		document.writeform.writer.focus();
		return false;
	}
	if(document.writeform.content.value == ""){
		alert("내용를 입력하십시요.");
		document.writeform.writer.focus();
		return false;
	}
	if(document.writeform.passwd.value == ""){
		alert("비밀번호를 입력하십시요.");
		document.writeform.writer.focus();
		return false;
	}
}