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
		<form class="notice_delete_form" method="post" id="delForm" name="delForm" action="/semi/notice/deletePro.do?pageNum=${ pageNum }" onsubmit="return deleteSave()">
			<div class="row text-center">
				<h4>글을 삭제하려면<br> 비밀번호를 입력해 주세요.</h4>
			</div>
			<div class="row">
				<label class="col-sm-3 sr-only">비밀번호 : </label>
				<input class="col-sm-9 form-control" type="password" name="passwd" placeholder="Password" />
			</div>
			<input type="hidden" name="num" value="${ num }" />
			<div class="row btns">
				<button class="btn btn-danger btn-block" type="submit">글삭제</button>
				<button class="btn btn-default btn-block" onclick="document.location.href='/semi/notice/list.do?pageNum=${ pageNum }'">글목록</button>
			</div>
		</form>
	</div>
</body>
</html>