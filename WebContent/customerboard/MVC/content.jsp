<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>StudyMate :: 공지사항 게시판</title>
</head>
<body>
	<div class="container" style= padding-top:80px>
	
			<table class="table table-responsive notice_content_table">
				<tr>
					<th>글번호</th>
					<td>${ article.qNum }</td>
					<th>조회수</th>
					<td>${ article.readcount }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${ article.qWriter }</td>
					<th>작성일</th>
					<td>${ article.qDate }</td>
				</tr>
				<tr>
					<th>글제목</th>
					<td colspan="3">${ article.qTitle }</td>
				</tr>
				<tr>
					<th>글내용</th>
					<td colspan="3"><pre>${ article.qContent }</pre></td>
				</tr>
			</table>
			
			<div class="row text-right btns">
				<input class="btn btn-default" type="button" value="글수정" onclick="./updateForm.do?qNum=${ article.qNum }&pageNum=${ pageNum }'" />&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn btn-default" type="button" value="글삭제" onclick="document.location.href='./deleteForm.do?qNum=${ article.qNum }&pageNum=${ pageNum }'" />&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn btn-info" type="button" value="답글쓰기" onclick="document.location.href='./question/writeForm.do?qNum=${ article.qNum }&refStep=${ article.refStep }&refLevel=${ article.refLevel }'" />&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn btn-default" type="button" value="글목록" onclick="document.location.href='./list.do?pageNum=${ pageNum }'" />
			</div>
			<br>
		</div>
	
</body>
</html>