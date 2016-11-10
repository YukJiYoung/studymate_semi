<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<!--  	
		기존에 입력했던 정보를 받아오기 위해서 
		UpdateFormAction 파일로부터 
		pageNum과 article객체의 참조변수를 넘겨받아 다음의 DB값을 사용할 수 있다
		사용하는 파라미터 목록 
		pageNum
		article.writer
		article.num
		article.subject
		article.email
		article.content
 -->
<body class="non_background">
	<div class="container">
		<form method="post" name="writeform" action="./updatePro.do?pageNum=${ pageNum }" onsubmit="return writeSave()">
			<table class="table notice_content_table">
				<tr>
					<th>이    름</th>
					<td>
						<input class="form-control" type="text" size="10" maxlength="10" name="qWriter" value="${ article.qWriter }" />
						<input type="hidden" name="qNum" value="${ article.qNum }">
					</td>
				</tr>
				<tr>
					<th>제    목</th>
					<td>
						<input class="form-control" type="text" size="40" maxlength="50" name="qTitle" value="${ article.qTitle }" />
					</td>
				</tr>
				<tr>
					<th>Email</th>
					<td>
						<input class="form-control" type="text" size="40" maxlength="30" name="email" value="${ article.email }" />
					</td>
				</tr>
				<tr>
					<th>내    용</th>
					<td>
						<textarea class="form-control" name="qContent" rows="13" cols="40">${ article.qContent }</textarea>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input class="form-control" type="password" size="8" maxlength="12" name="passwd" />
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