<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>StudyMate :: 공지사항 게시판</title>
</head>
<body class="non_background">
	<div class="container">
		<form method="post" name="writeform" action="./updatePro.do?pageNum=${ pageNum }" onsubmit="return writeSave()">
			<input type="hidden" name="noticeNum" value="${ article.noticeNum }">
			<table class="table notice_content_table">
				<tr>
					<th>이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
					<td>
						<input class="form-control" type="text" size="10" maxlength="10" name="writer" value="${ article.writer }" />
					</td>
				</tr>
				<tr>
					<th>제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
					<td>
						<input class="form-control" type="text" size="40" maxlength="50" name="noticeTitle" value="${ article.noticeTitle }" />
					</td>
				</tr>
				<tr>
					<th>내&nbsp;&nbsp;&nbsp;&nbsp;용</th>
					<td>
						<textarea class="form-control" name="content" rows="13" cols="40">${ article.content }</textarea>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input class="form-control" type="password" name="passwd" value="" />
					</td>
				</tr>
			</table>
			<div class="row text-right btns">
				<input class="btn btn-info" type="submit" value="글수정" />
				<input class="btn btn-default" type="reset" value="다시작성" />
				<input class="btn btn-default" type="button" value="목록보기" onclick="document.location.href='./list.do?pageNum=${ pageNum }'" />
			</div>
		</form>
	</div>
</body>
</html>