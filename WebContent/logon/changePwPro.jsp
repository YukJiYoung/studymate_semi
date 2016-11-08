<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="color.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>

<c:if test="${!check.equals('')}">
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 변경</title>
</head>
<body bgcolor="${ bodyback_c }">
	<form method="post" action="./main.do" name="userinput">
		<table width="320" border="0" cellspacing="0" cellpadding="5" align="center">
			<tr bgcolor="${ title_c }">
				<td height="39" align="center">변경된 비밀번호는 "<b>${ check }</b>" 입니다.</td>
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
<c:if test="${check.equals('')}">
	<script>
		alert("입력정보가 맞지 않습니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>