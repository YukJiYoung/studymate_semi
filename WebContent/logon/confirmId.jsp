<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="logon.LogonDBBean"%>
<!DOCTYPE html>
<html>
<head>
<title>ID 중복확인</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="../assets/js/inputForm.js"></script>
</head>
<body>
	<div class="logon_container">
	<c:if test="${ check == 1 }">
		<div class="row" align="center">
			
			<div class="">
				<h2> ${ id } 이미사용중인 아이디입니다.</h2>
			</div>

		</div>
		<form name="checkForm" method="post" action="./confirmId.do" onSubmit='return checkIt();'>
			<%-- 현재 페이지가 계속 refresh --%>
			<div class="row" align="center">
				<h3>다른 아이디를 선택하세요.</h3>

				<input type="text" class="recheckId" size="20" maxlength="12" name="id" />
				<input type="submit" value="ID중복확인" />

			</div>
		</form>
	</c:if>
	<c:if test="${ check != 1 }">
		<div class="row"></div>


		<div class="row" align="center">
			<div class="">

				<h3>입력하신 ${ id } 는 <br /> 사용하실 수 있는 ID입니다.</h3>
			</div>
			<div class="">
				<input type="button" class="btn btn-default" value="확인" onclick="setid()" />
			</div>


		</div>
	</c:if>
	</div>
 <script>

function setid() {
	opener.document.userinput.id.value = "${id}";
	opener.document.userinput.checkId.value = "y";
	self.close();
}

</script> 
</body>
</html>
