<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>  
<html>
<head>
<title>게시판</title>
<script>
	function deleteSave(){
		if(document.delForm.passwd.value == ""){
			alert("비밀번호를 입력하십시요.");
			document.delForm.passwd.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h5>글삭제</h5>
		<form method="post" name="delForm" action="/semi/notice/deletePro.do?pageNum=${ pageNum }" onsubmit="return deleteSave()">
			<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
				<tr>
					<td><h5>비밀번호를 입력해 주세요.</h5></td>
				</tr>
				<tr>
					<td>비밀번호 : <input type="password" name="passwd" size="8" maxlength="12" />
						<input type="hidden" name="num" value="${ num }" />
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="글삭제" />
						<input type="button" value="글목록" onclick="document.location.href='/semi/notice/list.do?pageNum=${ pageNum }'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>