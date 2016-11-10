<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>

<!-- 
<link href="/assets/css/groupDetail.css" type="text/css" rel="stylesheet" />
<link href="/assets/css/font-awesome.min.css" type="text/css" rel="stylesheet" /> -->
<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="../assets/css/nanumfont.css" />
<link rel="stylesheet" type="text/css" href="../assets/css/inputForm.css" />
<script src="../assets/js/changePw.js"></script>

</head>
<body class="non_background">
<div class="logon_container">
  <form name="userinput">
		<div class="row loginform">
			<div class="formTitle col-sm-3"><span>* </span>아이디</div>
			<div class="col-sm-9"><input type="text" class="form-control col-xs-9" id="id" name="id" placeholder="아이디를입력하세요" autofocus></div>
		</div>
		<div class="row loginform">
			<div class="formTitle col-sm-3"><span>* </span>Email</div>
			<div class="col-sm-9"><input type="text" class="form-control" id="email" name="email" placeholder="Email을 입력하세요"></div>
		</div>
		<div class="row loginform">	
			<div class="formTitle col-sm-3"><span>* </span>이름</div>
			<div class="col-sm-9"><input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요"	maxlength="8"></div>
		</div>
		<div class="loginbtns">
		
			<input type="button" name="confirm" class="btn btn-info" value="확인" onclick="checkIt(this.form)" /> 
			<input type="button" class="btn btn-default" name="cancel" value="취소" onclick="javascript:window.location='./main.do'">
	
		</div>
	</form>
</div>
</body>
</html>