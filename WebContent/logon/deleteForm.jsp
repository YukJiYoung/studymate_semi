<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="color.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>회원탈퇴</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script>
	function begin(){
		document.myform.passwd.focus();
	}
	function checkIt(){
		if(!document.myform.passwd.value){
			alert("비밀번호를 입력하지 않으셨습니다.");
			document.myform.passwd.focus();
			return false;
		}
	}
</script>
</head>
<body onload="begin()" bgcolor="${ bodyback_c }">
	<form name="myform" action="./deletePro.do" method="post" onSubmit="return checkIt()">
		<table border="1" cellspacing="0" cellpadding="0" width="260" align="center">
			<tr height="30">
				<td colspan="2" align="middle" bgcolor="${ title_c }"><font size="+1"><b>회원탈퇴</b></font></td>
			</tr>
			<tr height="30">
				<td width="110" bgcolor="${ title_c }" align="center">비밀번호</td>
				<td width="150" bgcolor="${ value_c }" align="center"><input type="password" name="passwd" size="15" maxlength="12" /></td>
			</tr>
			<tr height="30">
				<td colspan="2" align="middle" bgcolor="${ title_c }">
					<input type="submit" value="회원탈퇴" />
					<input type="button" value="취      소" onclick="javascript:window.location='./main.do'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>