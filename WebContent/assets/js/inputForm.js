	function checkIt() {
		var userinput = eval("document.userinput"); //문자열을 수식으로 변환(eval()사용)
		if (!userinput.id.value) {
			alert("ID를 입력하세요.");
			return false;
		}
		if (userinput.checkId.value != "y") {
			alert("ID를 체크하세요.");
			return false;
		}
		if (!document.checkForm.recheckId.value) {
			alert("ID를 입력하세요.");
			return false;
		}
		

		if (!userinput.passwd.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (userinput.passwd.value != userinput.passwd2.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}

		if (!userinput.name.value) {
			alert("사용자 이름을 입력하세요.");
			return false;
		}

		return true;
	} //end checkIt()

	/* 아이디 중복 여부 판단 */
	function openConfirmid(userinput) {
		//아이디 입력했는지 검사
		if (userinput.id.value == "") {
			alert("아이디를 입력하세요.");
			return;
		}

		//url과 사용자 입력 id 조합
		url = "./confirmId.do?id=" + userinput.id.value + "&checkId=" + userinput.checkId.value;
		//새로운 창 열기
		open(url,"confirm","toolbar=no, location=non, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	} //end openConfirmid()

	function zipCheck() {
		url = "./zipCheck.do?check=y"; //처음 실행 시 넘어간 값이 없는 없는데 자동 검색되버리면 nullPointerException 발생하므로 처음실행이라는 상태값 'check'를 넘겨준다.
		window.open(url,"post","toolbar=no, width=500, height=300, directories=no, status=yes, scrollbars=yes, menubar=no");
	} //end zipCheck()
	
