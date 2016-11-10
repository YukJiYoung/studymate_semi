
var userinput = eval("document.userinput");
function checkIt(userinput) {
	

	if (!userinput.email.value) {
		alert("Email을 입력하세요.");
		userinput.email.focus();
		return false;
	}
	

	if (!userinput.name.value) {
		alert("사용자 이름을 입력하세요.");
		userinput.name.focus();
		return false;
	}
	if(userinput.name.value && userinput.email.value) {
		openSearchid(userinput);
	}
} //end checkIt()

function openSearchid(userinput) {
	
		//url과 사용자 입력 id 조합
		url = "/semi/logon/searchId.do?email=" + userinput.email.value
				+ "&name=" + userinput.name.value;
		//새로운 창 열기
		open(
				
				url,
				"confirm",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	} //end openConfirmid()



function checkId(){
	if (window.opener && !window.opener.closed)
	window.opener.location = "/semi/index.jsp";
	self.close();
	}
