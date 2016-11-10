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
<script src="../assets/js/inputForm.js"></script>

</head>
<body class="non_background">

  
	<form id="Join-Form" method="post" action="./inputPro.do" name="userinput" onSubmit="return checkIt()">


		<div class="Loginbody form-group">
		
			<div class="row loginform">
				<div class="formTitle col-sm-3"><span style="color:red">* </span>아이디</div>
				<div class="col-sm-9">
					<input type="text" class="form-control marginForm col-xs-9" id="id" name="id" placeholder="아이디를입력하세요" autofocus> 
					<input type="button" name="confirm_id" class="btn btn-default" value="ID중복확인" OnClick="openConfirmid(this.form)" />
				</div>
			</div>
			
			<div class="row loginform">
				<div class="formTitle col-sm-3"><span style="color:red">* </span>비밀번호</div>
				<div class="col-sm-9">
					<input type="password" class="form-control marginForm" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요">
				</div>
				<div class="formTitle col-sm-3">&nbsp;</div>
				<div class="col-sm-9">
					<input type="password" class="form-control marginForm" id="passwd2" name="passwd2" placeholder="비밀번호를 확인하세요">
				</div>
			</div>
			
			<!--  이름 입력 -->
			<div class="row loginform">
				<div class="formTitle col-sm-3"><span style="color:red">* </span>이름</div>
				<div class="col-sm-9">
					<input type="text" class="form-control marginForm" name="name" placeholder="이름을 입력하세요"	maxlength="8">
				</div>
			</div>
			
			<!--  성별 입력 -->
			<div class="row loginform">
				<div class="formTitle col-sm-3"><span style="color:red">* </span>성별</div>
				<div class="col-sm-9">
					<label class="checkbox-inline checkMan">
						<input id="inlineCheckbox10" type="radio" name="gender" value="남자"> 남자
					</label> 
					<label class="checkbox-inline"> 
						<input id="inlineCheckbox10" type="radio" name="gender" value="여자"> 여자
					</label>
				</div>
			</div> 
			
			<div class="row loginform">
 				<div class="formTitle col-sm-3"><span style="color:red">* </span>생년월일</div>
 				<div class="col-sm-9">
  				<input class="form-control dateFrm marginForm" type="date" name="birthday" value="연도-월-일" id="dateInput" min="1900-01-01" max="2016-11-06">
 				</div>
  		</div>
  		
			<div class="row loginform">
				<div class="formTitle col-sm-3"><span style="color:red">* </span>전화번호</div>
				<div class="col-sm-9">
					<input type="text" class="form-control marginForm" name="tel" placeholder="숫자만 입력하세요" maxlength="11">
				</div>
			</div>
			
			<div class="row loginform">
				<div class="formTitle col-sm-3">이메일</div>
				<div class="col-sm-9">
					<input type="text" class="form-control marginForm" name="email" placeholder="Email을 입력하세요">
				</div>
			</div>
			
			<div class="row loginform">
				<div class="formTitle col-sm-3">희망장소</div>
				<div class="col-sm-9">
					<input type="text" class="form-control marginForm" name="location" placeholder="희망장소를 입력하세요 예) 서울 강남구">
				</div>
			</div>
			
			<div class="row loginform">
				<div class="formTitle col-sm-3">선호 카테고리</div> 
				<div class="row	col-sm-9">
					<div>
						<span class="bigCategory">영어</span>
						<label class="checkbox-inline"><input type="checkbox" value="토익">토익</label>
						<label class="checkbox-inline"><input type="checkbox" value="오픽">오픽</label>
						<label class="checkbox-inline"><input type="checkbox" value="토익스피킹">토익스피킹</label>
						<label class="checkbox-inline"><input type="checkbox" value="회화">회화</label>
						<label class="checkbox-inline"><input type="checkbox" value="영어-기타">영어-기타</label>
					</div>
					
					<div>
						<span class="bigCategory">외국어</span>
						<label class="checkbox-inline"><input type="checkbox" name="scategorycode" value="일본어">일본어</label>
						<label class="checkbox-inline"><input type="checkbox" value="중국어">중국어</label>
						<label class="checkbox-inline"><input type="checkbox" value="프랑스어">프랑스어</label>
						<label class="checkbox-inline"><input type="checkbox" value="외국어-기타">외국어-기타</label>
					</div>
					
					<div>
						<span class="bigCategory">취업</span>
						<label class="checkbox-inline"><input type="checkbox" value="인적성">인적성</label>
						<label class="checkbox-inline"><input type="checkbox" value="면접">면접</label>
						<label class="checkbox-inline"><input type="checkbox" value="자소서">자소서</label>
						<label class="checkbox-inline"><input type="checkbox" value="취업-기타">취업-기타</label>
					</div>
					
					<div>
						<span class="bigCategory">국가고시/공무원</span>
						<label class="checkbox-inline"><input type="checkbox" value="공무원">공무원</label>
						<label class="checkbox-inline"><input type="checkbox" value="국가고시">국가고시</label>
						<label class="checkbox-inline"><input type="checkbox" value="고시-기타">고시-기타</label>
					</div>
				</div>
			</div>
			<div class="loginbtns">
			
				<input type="submit" name="confirm" class="btn btn-info" value="회원가입" /> 
				<input type="reset" name="reset" class="btn btn-default" value="다시작성" /> 
				<input type="button" class="btn btn-default" name="cancel" value="가입안함" onclick="javascript:window.location='./main.do'">
		
			</div>
			<input type="hidden" name="checkId" value="n" />
		</div>
	</form>

</body>
</html>