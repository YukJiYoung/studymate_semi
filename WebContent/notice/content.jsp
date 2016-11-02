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
					<td>${ article.num }</td>
					<th>조회수</th>
					<td>${ article.readcount }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${ article.writer }</td>
					<th>작성일</th>
					<td>${ article.reg_date }</td>
				</tr>
				<tr>
					<th>글제목</th>
					<td colspan="3">${ article.subject }</td>
				</tr>
				<tr>
					<th>글내용</th>
					<td colspan="3"><pre>${ article.content }</pre></td>
				</tr>
			</table>
			<div class="row text-right btns">
				<input class="btn btn-default" type="button" value="글수정" onclick="document.location.href='/semi/notice/updateForm.do?num=${ article.num }&pageNum=${ pageNum }'" />&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn btn-default" type="button" value="글삭제" onclick="document.location.href='/semi/notice/deleteForm.do?num=${ article.num }&pageNum=${ pageNum }'" />&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn btn-info" type="button" value="답글쓰기" onclick="document.location.href='/semi/notice/writeForm.do?num=${ article.num }&re_step=${ article.re_step }&re_level=${ article.re_level }'" />&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn btn-default" type="button" value="글목록" onclick="document.location.href='/semi/notice/list.do?pageNum=${ pageNum }'" />
			</div>
		</form>
	</div>
</body>
</html>