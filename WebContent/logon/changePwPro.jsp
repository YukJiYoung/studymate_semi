<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="logon.LogonDBBean" %>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="../assets/js/changePw.js"></script>
</head>

<body class="non_background">
<div class="logon_container">
<c:if test="${ !cpasswd.equals('') }">

		새로운 비밀번호는 ${ cpasswd } 입니다.	
		<input type="button" value="확인" class="btn btn-default" onclick="checkId()">

		
		
</c:if>
<c:if test="${ cpasswd.equals('') }">
	입력하신 정보가 일치하지 않습니다.
	<input type="button" value="확인" class="btn btn-default" onclick="javascript:self.close()">
</c:if>
</div>
</body>
</html>