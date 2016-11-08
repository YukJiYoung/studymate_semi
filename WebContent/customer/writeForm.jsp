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
		<form method="post" name="writeform" action="/semi/customer/writePro.do" onsubmit="return writeSave()">
			<input type="hidden" name="num" value="${ num }" />
			<input type="hidden" name="ref" value="${ ref }" />
			<input type="hidden" name="re_step" value="${ re_step }" />
			<input type="hidden" name="re_level" value="${ re_level }" />
			
			<table class="table table-responsive notice_content_table">
				<tr>
					<th>이    름</th>
					<td><input class="form-control" type="text" name="writer" /></td>
				</tr>
				<tr>
					<th>제    목</th>
					<td>
						<c:if test="${ num == 0 }">
							<input class="form-control" type="text" name="subject" />
						</c:if>
						<c:if test="${ num != 0 }">
							<input class="form-control" type="text" name="subject" value="[답변]" />
						</c:if>
					</td>
				</tr>
				<tr>
					<th>Email</th>
					<td><input class="form-control" type="text" name="email" /></td>
				</tr>
				<tr>
					<th>내    용</th>
					<td><textarea class="form-control" name="content"></textarea></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input class="form-control" type="password" name="passwd" /></td>
				</tr>
			</table>
			<div class="row text-right btns">
				<input class="btn btn-info" type="submit" value="글쓰기" />
				<input class="btn btn-default" type="reset" value="다시작성" />
				<input class="btn btn-default" type="button" value="목록보기" onclick="document.location.href='/semi/customer/list.do'" />
			</div>
		</form>
	</div>
</body>
</html>