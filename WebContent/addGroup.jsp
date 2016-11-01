<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>스터디 모임 등록창</title>

<link rel="stylesheet" type="text/css" href="assets/css/layout.css" />
<link rel="stylesheet" type="text/css" href="assets/css/addGroup.css" />

<style type="text/css">
</style>


</head>

<body>




	<!-- //내용(모임 등록)-->
	
	<div class="add-container" style="margin-top: 80px;">
	<ul class="add-list">

		<form class="form-horizontal">


			<div class="input-header">모임 이름</div>
			<input type="text" class="form-control" id="groupName"
				placeholder="나만의 스터디모임의 이름을 정해주세요.">



			<div class="input-header">모임인원</div>


			<select class="form-control" id="maxMember">
				<option selected disabled>모임 인원을 선택해주세요.</option>

				<option value="1">1명</option>

				<option value="2">2명</option>

				<option value="3">3명</option>

				<option value="4">4명</option>

				<option value="5">5명</option>

				<option value="6">6명</option>

				<option value="7">7명</option>

				<option value="8">8명</option>

				<option value="9">9명</option>

				<option value="10">10명</option>

				<option value="11">11명</option>

				<option value="12">12명</option>

				<option value="13">13명</option>

				<option value="14">14명</option>

				<option value="15">15명</option>

				<option value="16">16명</option>

				<option value="17">17명</option>

				<option value="18">18명</option>

				<option value="19">19명</option>

				<option value="20">20명</option>

				<option value="21">21명</option>

				<option value="22">22명</option>

				<option value="23">23명</option>

				<option value="24">24명</option>

				<option value="25">25명</option>

				<option value="26">26명</option>

				<option value="27">27명</option>

				<option value="28">28명</option>

				<option value="29">29명</option>

				<option value="30">30명</option>


			</select>





			<div class="input-header">회비</div>
			<div class="input-inner-text-wrap">

				<div class="input-inner-text-container">
					<span class="noselect">월</span> <input id="money" type="text"
						name="money" value="0"> <span class="noselect">원</span>
				</div>
			</div>


			<div class="input-header">모집기간</div>

			<select class="form-control" id="limitDate">
				<option selected disabled>모집 기간을 선택해주세요.</option>

				<option value="1">1주</option>

				<option value="2">2주</option>

				<option value="3">3주</option>

				<option value="4">4주</option>

			</select>



			<div class="input-header">모임 스케줄</div>

			<table class="table table-striped table-bordered table-hover">
				<caption>원하는 요일, 시간을 선택하세요.</caption>
				<thead>
					<tr>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th>토</th>
						<th>일</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>
						
						<select class="form-group lessonTime start-time"
							name="mon" name="mon">
								<option disabled selected>시작</option>
								<option value="0">무관</option>

								<option value="1">1시</option>

								<option value="2">2시</option>

								<option value="3">3시</option>

								<option value="4">4시</option>

								<option value="5">5시</option>

								<option value="6">6시</option>

								<option value="7">7시</option>

								<option value="8">8시</option>

								<option value="9">9시</option>

								<option value="10">10시</option>

								<option value="11">11시</option>

								<option value="12">12시</option>

								<option value="13">13시</option>

								<option value="14">14시</option>

								<option value="15">15시</option>

								<option value="16">16시</option>

								<option value="17">17시</option>

								<option value="18">18시</option>

								<option value="19">19시</option>

								<option value="20">20시</option>

								<option value="21">21시</option>

								<option value="22">22시</option>

								<option value="23">23시</option>

						</select> 
						
						<select
							class="form-group lessonTime end-time" name="mon">
								<option disabled selected>종료</option>
								<option value="0">무관</option>
						</select>
						</td>
						
						
						<td><select class="form-group lessonTime start-time"
							name="mon" name="mon">
								<option disabled selected>시작</option>
								<option value="0">무관</option>

								<option value="1">1시</option>

								<option value="2">2시</option>

								<option value="3">3시</option>

								<option value="4">4시</option>

								<option value="5">5시</option>

								<option value="6">6시</option>

								<option value="7">7시</option>

								<option value="8">8시</option>

								<option value="9">9시</option>

								<option value="10">10시</option>

								<option value="11">11시</option>

								<option value="12">12시</option>

								<option value="13">13시</option>

								<option value="14">14시</option>

								<option value="15">15시</option>

								<option value="16">16시</option>

								<option value="17">17시</option>

								<option value="18">18시</option>

								<option value="19">19시</option>

								<option value="20">20시</option>

								<option value="21">21시</option>

								<option value="22">22시</option>

								<option value="23">23시</option>

						</select> <span class="divisionLine">~</span> <select
							class="form-group lessonTime end-time" name="mon">
								<option disabled selected>종료</option>
								<option value="0">무관</option>
						</select></td>
						<td><select class="form-group lessonTime start-time"
							name="mon" name="mon">
								<option disabled selected>시작</option>
								<option value="0">무관</option>

								<option value="1">1시</option>

								<option value="2">2시</option>

								<option value="3">3시</option>

								<option value="4">4시</option>

								<option value="5">5시</option>

								<option value="6">6시</option>

								<option value="7">7시</option>

								<option value="8">8시</option>

								<option value="9">9시</option>

								<option value="10">10시</option>

								<option value="11">11시</option>

								<option value="12">12시</option>

								<option value="13">13시</option>

								<option value="14">14시</option>

								<option value="15">15시</option>

								<option value="16">16시</option>

								<option value="17">17시</option>

								<option value="18">18시</option>

								<option value="19">19시</option>

								<option value="20">20시</option>

								<option value="21">21시</option>

								<option value="22">22시</option>

								<option value="23">23시</option>

						</select> <span class="divisionLine">~</span> <select
							class="form-group lessonTime end-time" name="mon">
								<option disabled selected>종료</option>
								<option value="0">무관</option>
						</select></td>
						<td><select class="form-group lessonTime start-time"
							name="mon" name="mon">
								<option disabled selected>시작</option>
								<option value="0">무관</option>

								<option value="1">1시</option>

								<option value="2">2시</option>

								<option value="3">3시</option>

								<option value="4">4시</option>

								<option value="5">5시</option>

								<option value="6">6시</option>

								<option value="7">7시</option>

								<option value="8">8시</option>

								<option value="9">9시</option>

								<option value="10">10시</option>

								<option value="11">11시</option>

								<option value="12">12시</option>

								<option value="13">13시</option>

								<option value="14">14시</option>

								<option value="15">15시</option>

								<option value="16">16시</option>

								<option value="17">17시</option>

								<option value="18">18시</option>

								<option value="19">19시</option>

								<option value="20">20시</option>

								<option value="21">21시</option>

								<option value="22">22시</option>

								<option value="23">23시</option>

						</select> <span class="divisionLine">~</span> <select
							class="form-group lessonTime end-time" name="mon">
								<option disabled selected>종료</option>
								<option value="0">무관</option>
						</select></td>
						<td><select class="form-group lessonTime start-time"
							name="mon" name="mon">
								<option disabled selected>시작</option>
								<option value="0">무관</option>

								<option value="1">1시</option>

								<option value="2">2시</option>

								<option value="3">3시</option>

								<option value="4">4시</option>

								<option value="5">5시</option>

								<option value="6">6시</option>

								<option value="7">7시</option>

								<option value="8">8시</option>

								<option value="9">9시</option>

								<option value="10">10시</option>

								<option value="11">11시</option>

								<option value="12">12시</option>

								<option value="13">13시</option>

								<option value="14">14시</option>

								<option value="15">15시</option>

								<option value="16">16시</option>

								<option value="17">17시</option>

								<option value="18">18시</option>

								<option value="19">19시</option>

								<option value="20">20시</option>

								<option value="21">21시</option>

								<option value="22">22시</option>

								<option value="23">23시</option>

						</select> <span class="divisionLine">~</span> <select
							class="form-group lessonTime end-time" name="mon">
								<option disabled selected>종료</option>
								<option value="0">무관</option>
						</select></td>
						<td><select class="form-group lessonTime start-time"
							name="mon" name="mon">
								<option disabled selected>시작</option>
								<option value="0">무관</option>

								<option value="1">1시</option>

								<option value="2">2시</option>

								<option value="3">3시</option>

								<option value="4">4시</option>

								<option value="5">5시</option>

								<option value="6">6시</option>

								<option value="7">7시</option>

								<option value="8">8시</option>

								<option value="9">9시</option>

								<option value="10">10시</option>

								<option value="11">11시</option>

								<option value="12">12시</option>

								<option value="13">13시</option>

								<option value="14">14시</option>

								<option value="15">15시</option>

								<option value="16">16시</option>

								<option value="17">17시</option>

								<option value="18">18시</option>

								<option value="19">19시</option>

								<option value="20">20시</option>

								<option value="21">21시</option>

								<option value="22">22시</option>

								<option value="23">23시</option>

						</select> <span class="divisionLine">~</span> <select
							class="form-group lessonTime end-time" name="mon">
								<option disabled selected>종료</option>
								<option value="0">무관</option>
						</select></td>
						<td><select class="form-group lessonTime start-time"
							name="mon" name="mon">
								<option disabled selected>시작</option>
								<option value="0">무관</option>

								<option value="1">1시</option>

								<option value="2">2시</option>

								<option value="3">3시</option>

								<option value="4">4시</option>

								<option value="5">5시</option>

								<option value="6">6시</option>

								<option value="7">7시</option>

								<option value="8">8시</option>

								<option value="9">9시</option>

								<option value="10">10시</option>

								<option value="11">11시</option>

								<option value="12">12시</option>

								<option value="13">13시</option>

								<option value="14">14시</option>

								<option value="15">15시</option>

								<option value="16">16시</option>

								<option value="17">17시</option>

								<option value="18">18시</option>

								<option value="19">19시</option>

								<option value="20">20시</option>

								<option value="21">21시</option>

								<option value="22">22시</option>

								<option value="23">23시</option>

						</select> <span class="divisionLine">~</span> <select
							class="form-group lessonTime end-time" name="mon">
								<option disabled selected>종료</option>
								<option value="0">무관</option>
						</select></td>
					</tr>

				</tbody>
			</table>




			<div class="input-header">대표 연락처</div>

			<input type="tel" class="form-control" id="tel"
				placeholder="대표 연락처를 입력해주세요.">


			<div class="input-header">모임 카테고리</div>

			<div class="checkbox-container">
				<label class="checkbox-inline"> <input type="checkbox"
					id="toeic" value="toeic">토익
				</label> <label class="checkbox-inline"> <input type="checkbox"
					id="opic" value="opic">오픽
				</label> <label class="checkbox-inline"> <input type="checkbox"
					id="toeicSpeaking" value="toeicSpeaking">토익스피킹
				</label> <label class="checkbox-inline"> <input type="checkbox"
					id="conversation" value="conversation">영어회화
				</label>
			</div>

			<div class="checkbox-container">
				<label class="checkbox-inline"> <input type="checkbox"
					id="japanese" value="japanese">일본어
				</label> <label class="checkbox-inline"> <input type="checkbox"
					id="chinese" value="chinese">중국어
				</label> <label class="checkbox-inline"> <input type="checkbox"
					id="french" value="french">프랑스어
				</label> <label class="checkbox-inline"> <input type="checkbox"
					id="otherLanguage" value="otherLanguage">기타 언어
				</label>
			</div>

			<div class="checkbox-container">
				<label class="checkbox-inline"> <input type="checkbox"
					id="inlineCheckbox1" value="option1">인적성
				</label> <label class="checkbox-inline"> <input type="checkbox"
					id="inlineCheckbox2" value="option2">면접
				</label> <label class="checkbox-inline"> <input type="checkbox"
					id="inlineCheckbox3" value="option3">자기소개서
				</label> <label class="checkbox-inline"> <input type="checkbox"
					id="inlineCheckbox4" value="option4">기타
				</label>
			</div>


			<div class="checkbox-container">
				<label class="checkbox-inline"> <input type="checkbox"
					id="inlineCheckbox1" value="option1">공무원
				</label> <label class="checkbox-inline"> <input type="checkbox"
					id="inlineCheckbox2" value="option2">국가고시
				</label> <label class="checkbox-inline"> <input type="checkbox"
					id="inlineCheckbox3" value="option3">기타
				</label>
			</div>



			<div class="input-header">모임 가입 질문</div>
			<input type="text" class="form-control" id="question"
				placeholder="회원들에게 묻고싶은 질문을 입력하세요.">



			<div class="input-header">모임 목표</div>

			<select class="form-control" id="groupGoal">
				<option selected disabled>선택없음</option>

				<option value="LG00">자기개발</option>

				<option value="LG01">업무스킬UP</option>

				<option value="LG02">자격증준비</option>

				<option value="LG03">기타</option>

			</select>


			<div class="input-header">모집 대상</div>

			<label class="checkbox-inline"> <input type="checkbox"
				id="inlineCheckbox1" value="option1">대학생
			</label> <label class="checkbox-inline"> <input type="checkbox"
				id="inlineCheckbox2" value="option2">취업준비생
			</label> <label class="checkbox-inline"> <input type="checkbox"
				id="inlineCheckbox3" value="option3">직장인
			</label> <label class="checkbox-inline"> <input type="checkbox"
				id="inlineCheckbox4" value="option4">일반인
			</label>


			<div class="input-header">이미지 선택</div>

			<input type="file" id="groupImage">
			<p class="help-block">모임을 대표할 사진을 선택해주세요.</p>


			<div class="input-header">모임 소개</div>

			<textarea class="form-control" rows="8"
				placeholder="나만의 모임을 자유롭게 소개해주세요."></textarea>








			<div class="pull-right">
				<button type="button" class="btn next-btn last-step" value="800">스터디
					등록하기</button>
			</div>




		</form>
</ul>


	</div>

</body>
</html>