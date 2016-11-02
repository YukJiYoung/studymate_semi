<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>StudyMate :: 공지사항 게시판</title>
</head>
<body>
	<div class="container">
		<h5>글내용 보기</h5>
		<form>
			<table class="table table-responsive">
				<tr>
					<td>글번호</td>
					<td>${ article.num }</td>
					<td>조회수</td>
					<td>${ article.readcount }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${ article.writer }</td>
					<td>작성일</td>
					<td>${ article.reg_date }</td>
				</tr>
				<tr>
					<td>글제목</td>
					<td colspan="3">${ article.subject }</td>
				</tr>
				<tr>
					<td>글내용</td>
					<td colspan="3"><pre>${ article.content }</pre></td>
				</tr>
				<tr>
					<td align="right">
						<input class="btn btn-default" type="button" value="글수정" onclick="document.location.href='/semi/notice/updateForm.do?num=${ article.num }&pageNum=${ pageNum }'" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="btn btn-default" type="button" value="글삭제" onclick="document.location.href='/semi/notice/deleteForm.do?num=${ article.num }&pageNum=${ pageNum }'" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="btn btn-default" type="button" value="답글쓰기" onclick="document.location.href='/semi/notice/writeForm.do?num=${ article.num }&re_step=${ article.re_step }&re_level=${ article.re_level }'" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="btn btn-default" type="button" value="글목록" onclick="document.location.href='/semi/notice/list.do?pageNum=${ pageNum }'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>