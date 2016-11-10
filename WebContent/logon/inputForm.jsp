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
			<div class="formTitle"><span style="color:red">* </span>아이디</div> 
				<input type="text" class="form-control col-xs-9 formform marginForm" id="id" name="id" placeholder="아이디를입력하세요" autofocus> 
				<input type="button" name="confirm_id" class="btn btn-default formform" value="ID중복확인" OnClick="openConfirmid(this.form)" />
			</div>
			
			<div class="formTitle"><span style="color:red">* </span>비밀번호</div>
			<input type="password" class="form-control formform " id="passwd" name="passwd" placeholder="비밀번호를 입력하세요"> 
			<input type="password" class="form-control formform marginForm " id="passwd2" name="passwd2" placeholder="비밀번호를 확인하세요">
			<!--  이름 입력 -->
			<div class="formTitle"><span style="color:red">* </span>이름</div>
			<input type="text" class="form-control formform marginForm" name="name" placeholder="이름을 입력하세요"	maxlength="8">
			<!--  성별 입력 -->
			<div class="row marginForm">
				<div class="formTitle"><span style="color:red">* </span>성별</div>
				<div class="col-xs-10 formform">
					<label class="checkbox-inline checkMan"> 
						<input id="inlineCheckbox10" type="radio" name="gender" value="남자">
						남자
					</label> 
					<label class="checkbox-inline"> 
					<input id="inlineCheckbox10" type="radio" name="gender" value="여자">
						여자
					</label>
				</div>
			</div> 
			
			<div class="form-group row">
  				<div class="formTitle"><span style="color:red">* </span>생년월일</div>
  				<div class="formform" style="width: 100%;">
   					 <input class="form-control dateFrm marginForm" type="date" name="birthday" value="연도-월-일" id="dateInput" min="1900-01-01" max="2016-11-06">
  				</div>
  			</div> 
			  
			<div class="formTitle"><span style="color:red">* </span>전화번호</div>	 
			<input type="text" class="form-control formform marginForm" name="tel" placeholder="숫자만 입력하세요" maxlength="11">
			<div class="formTitle">이메일</div>
			<input type="text" class="form-control formform marginForm" name="email" placeholder="Email을 입력하세요">
			<div class="formTitle">희망장소</div>
			<input type="text" class="form-control formform marginForm" name="location" placeholder="희망장소를 입력하세요 예) 서울 강남구">
		
			<div class="formTitle">선호 카테고리</div> 
			
			<div class="row categoryFrm">
				<label class="control-label col-xs-2" for="영어">영어</label>
				<div class="col-xs-10">
					<label class="checkbox-inline"><input type="checkbox" 
						value="토익">토익 </label> <label class="checkbox-inline"> <input
						type="checkbox" value="오픽">오픽
					</label> <label class="checkbox-inline"> <input type="checkbox"
						value="토익스피킹">토익스피킹
					</label> <label class="checkbox-inline"> <input type="checkbox"
						value="회화">회화
					</label>
				</div>
			</div>

			<div class="row categoryFrm">
				<label class="control-label col-xs-2" for="외국어">외국어</label>
				<div class="col-xs-10">
					<label class="checkbox-inline"> <input type="checkbox" name="scategorycode"
						value="일본어">일본어
					</label><label class="checkbox-inline"> <input type="checkbox"
						value="중국어">중국어
					</label><label class="checkbox-inline"> <input type="checkbox"
						value="프랑스어">프랑스어
					</label>
				</div>
			</div>
			
			<div class="row categoryFrm">
				<label class="control-label col-xs-2" for="취업">취업</label>
				<div class="col-xs-10">
					<label class="checkbox-inline"> <input type="checkbox"
						value="인적성">인적성
					</label><label class="checkbox-inline"> <input type="checkbox"
						value="면접">면접
					</label><label class="checkbox-inline"> <input type="checkbox"
						value="자소서">자소서
					</label><label class="checkbox-inline"> <input type="checkbox"
						value="기타">기타
					</label>
				</div>
			</div>
			
			<div class="row categoryFrm">
				<label class="control-label col-xs-2" for="국가고시/공무원" style="padding-right:0;">국가고시/공무원</label>
				<div class="col-xs-10">
					<label class="checkbox-inline"> <input type="checkbox"
						value="공무원">공무원
					</label><label class="checkbox-inline"> <input type="checkbox"
						value="국가고시">국가고시
					</label><label class="checkbox-inline"> <input type="checkbox"
						value="기타">기타
					</label>
				</div>
			</div>
		</div>
		
		<div class="loginbtns">
		
			<input type="submit" name="confirm" class="btn btn-default" value="회원가입" /> 
			<input type="reset" name="reset" class="btn btn-default" value="다시작성" /> 
			<input type="button" class="btn btn-default" name="cancel" value="가입안함"
				onclick="javascript:window.location='/semi/logon/main.do'">
	
		</div>
		<input type="hidden" name="checkId" value="n" />
	</form>

</body>
</html>