<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="logon.LogonDBBean" %>
<%@ include file="color.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body bgcolor="${ bodyback_c }">
<c:if test="${ !check.equals('') }">
	<form method="post" action="./main.do" name="userinput">
		<table width="320" border="0" cellspacing="0" cellpadding="5" align="center">
			<tr bgcolor="${ title_c }">
				<td height="39" align="center">회원님의 아이디는 "<b>${ check }</b>" 입니다.</td>
			</tr>
			<tr bgcolor="${ title_c }">
				<td align="center">
					<input type="button" value="메인으로" onclick="window.location='./main.do'" />
					<input type="button" value="비밀번호 변경" onclick="window.location='./changePwPro.do'" />
				</td>
			</tr>
		</table>
	</form>
</c:if>
<c:if test="${ check.equals('') }">
	<script>
		alert("등록되지 않은 이름과 주민번호입니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>