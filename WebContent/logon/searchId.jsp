<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="logon.LogonDBBean" %>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="../assets/js/searchId.js"></script>
</head>

<body class="non_background">
<div class="logon_container">
	<c:if test="${ !id.equals('') }">
	
			회원님의 아이디는 ${ id } 입니다.	
			<input type="button" value="확인" class="btn btn-default" onclick="checkId()">
	
			
			
	</c:if>
	<c:if test="${ id.equals('') }">
		입력하신 정보와 일치하는 아이디가 없습니다.
		<input type="button" value="확인" class="btn btn-default" onclick="javascript:self.close()">
	</c:if>
</div>
</body>
</html>