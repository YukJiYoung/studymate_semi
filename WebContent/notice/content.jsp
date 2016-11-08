<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>StudyMate :: 공지사항 게시판</title>
</head>
<body>
	<div class="container">
		<form>
			<table class="table table-responsive notice_content_table">
				<tr>
					<th>글번호</th>
					<td>${ article.noticeNum }</td>
					<th>조회수</th>
					<td>${ article.ncount }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${ article.writer }</td>
					<th>작성일</th>
					<td>${ article.noticeDate }</td>
				</tr>
				<tr>
					<th>제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
					<td colspan="3">${ article.noticeTitle }</td>
				</tr>
				<tr>
					<th>내&nbsp;&nbsp;&nbsp;&nbsp;용</th>
					<td colspan="3"><pre>${ article.content }</pre></td>
				</tr>
			</table>
			<div class="row text-right btns">
				<c:if test="${ memId eq 'admin' }">
					<input class="btn btn-default" type="button" value="글수정" onclick="document.location.href='./updateForm.do?noticeNum=${ article.noticeNum }&pageNum=${ pageNum }'" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="btn btn-default" type="button" value="글삭제" onclick="document.location.href='./deleteForm.do?noticeNum=${ article.noticeNum }&pageNum=${ pageNum }'" />&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
				<input class="btn btn-default" type="button" value="글목록" onclick="document.location.href='./list.do?pageNum=${ pageNum }'" />
			</div>
		</form>
	</div>
</body>
</html>