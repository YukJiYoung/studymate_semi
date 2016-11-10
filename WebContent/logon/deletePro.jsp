<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="logon.LogonDBBean" %>
<!DOCTYPE html>
<html>
<head>
<title>회원탈퇴</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body >
	<div class="logon_container">
		<c:if test="${ check == 1 }">
			<font size="+1"><b>회원정보가 삭제되었습니다.</b></font>
			3초 후 메인페이지로 이동합니다.
			<meta http-equiv="Refresh" content="3;url=./main.do" />
		</c:if>
		<c:if test="${ check == 0 }">
			<script>
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
		</c:if>
	</div>
</body>
</html>