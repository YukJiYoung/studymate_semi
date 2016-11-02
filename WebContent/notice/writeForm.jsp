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
		<b>글쓰기</b><br />
		<form method="post" name="writeform" action="/semi/notice/writePro.do" onsubmit="return writeSave()">
			<input type="hidden" name="num" value="${ num }" />
			<input type="hidden" name="ref" value="${ ref }" />
			<input type="hidden" name="re_step" value="${ re_step }" />
			<input type="hidden" name="re_level" value="${ re_level }" />
			
			<table class="table table-hover">
				<tr>
					<td align="right" colspan="2">
						<a href="/semi/notice/list.do">글목록</a>
					</td>
				</tr>
				<tr>
					<td width="70" align="center">이      름</td>
					<td width="330"><input type="text" size="10" maxlength="10" name="writer"></td>
				</tr>
				<tr>
					<td width="70" align="center">제      목</td>
					<td width="330">
						<c:if test="${ num == 0 }">
						<input type="text" size="40" maxlength="50" name="subject" />
						</c:if>
						<c:if test="${ num != 0 }">
						<input type="text" size="40" maxlength="50" name="subject" value="[답변]" />
						</c:if>
					</td>
				</tr>
				<tr>
					<td width="70" align="center">Email</td>
					<td width="330"><input type="text" size="40" maxlength="30" name="email"></td>
				</tr>
				<tr>
					<td width="70" align="center">내      용</td>
					<td width="330"><textarea name="content" rows="13" cols="40"></textarea></td>
				</tr>
				<tr>
					<td width="70" align="center">비밀번호</td>
					<td width="330"><input type="password" size="8" maxlength="12" name="passwd"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글쓰기" />
						<input type="reset" value="다시작성" />
						<input type="button" value="목록보기" onclick="window.location='/semi/notice/list.do'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>