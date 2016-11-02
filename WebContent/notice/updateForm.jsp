<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<script src="script.js"></script>
</head>
<body class="non_background">
	<div class="container">
		<b>글수정</b><br />
		<form method="post" name="writeform" action="/semi/notice/updatePro.do?pageNum=${ pageNum }" onsubmit="return writeSave()">
			<table class="table table-hover">
				<tr>
					<td width="70" align="center">이    름</td>
					<td width="330" align="left">
						<input type="text" size="10" maxlength="10" name="writer" value="${ article.writer }" />
						<input type="hidden" name="num" value="${ article.num }">
					</td>
				</tr>
				<tr>
					<td width="70" align="center">제    목</td>
					<td width="330" align="left">
						<input type="text" size="40" maxlength="50" name="subject" value="${ article.subject }" />
					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="${ value_c }" align="center">Email</td>
					<td width="330" align="left">
						<input type="text" size="40" maxlength="30" name="email" value="${ article.email }" />
					</td>
				</tr>
				<tr>
					<td width="70" align="center">내    용</td>
					<td width="330" align="left">
						<textarea name="content" rows="13" cols="40">${ article.content }</textarea>
					</td>
				</tr>
				<tr>
					<td width="70" align="center">비밀번호</td>
					<td width="330" align="left">
						<input type="password" size="8" maxlength="12" name="passwd" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글수정" />
						<input type="reset" value="다시작성" />
						<input type="button" value="목록보기" onclick="document.location.href='/semi/notice/list.do?pageNum=${ pageNum }'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>