<%@ page contentType="text/html; charset=utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>스터디메이트(StudyMate)-스터디모임을 등록해보세요</title>

<link rel="stylesheet" type="text/css" href="assets/css/addGroup.css" />

<script src="assets/js/addGroup.js"></script>
</head>

<body>




	<!-- //내용(모임 등록)-->
<c:if test="${ memId == null }">
	<script>
		alert("모임을 등록하려면 로그인 해 주세요.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${ memId != null }">
	<div class="add-container" style="margin-top: 80px;">
		<form class="form-horizontal" method="post" action="./addGroupPro.do" name="groupinput" onSubmit="return checkAdd()">
			<input type="hidden" name="id" value="${ memId }" />
			<ul class="add-list">
			<li style="list-style-type: none">
					<div class="input-header">
						<span style="color: red">* </span>모임 이름
					</div>
					<input type="text" class="form-control" id="groupName"
						name="groupName" placeholder="나만의 스터디모임의 이름을 정해주세요.">



					<div class="input-header">
						<span style="color: red">* </span>모임인원
					</div>


					<select class="form-control" id="maxMember" name="maxMember">
						<option selected="" disabled="">인원선택</option>

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


					<div class="input-header">
						<span style="color: red">* </span>모집기간
					</div>

					<select class="form-control" id="limitDate" name="limitDate">
						<option selected disabled>모집 기간을 선택해주세요.</option>

						<option value="1">1주</option>

						<option value="2">2주</option>

						<option value="3">3주</option>

						<option value="4">4주</option>

					</select>


					<div class="input-header">
						<span style="color: red">* </span>모임 스케줄
					</div>


					<label class="dayLabel" for="mon"> <input type="checkbox"
						name="meetingCount" id="mon" value="mon">월
					</label>


					<label class="dayLabel" for="tue"> <input type="checkbox"
						name="meetingCount" id="tue" value="tue">화
					</label>

					<label class="dayLabel" for="wed"> <input type="checkbox"
						name="meetingCount" id="wed" value="wed">수
					</label>

					<label class="dayLabel" for="thu"> <input type="checkbox"
						name="meetingCount" id="thu" value="thu">목
					</label>

					<label class="dayLabel" for="fri"> <input type="checkbox"
						name="meetingCount" id="fri" value="fri">금
					</label>

					<label class="dayLabel" for="sat"> <input type="checkbox"
						name="meetingCount" id="sat" value="sat">토
					</label>

					<label class="dayLabel" for="sun"> <input type="checkbox"
						name="possibleDay" id="sun" value="sun">일
					</label>




					<div class="input-header">대표 연락처</div>

					<input type="text" class="form-control" id="tel" name="tel"
						placeholder="대표 연락처를 입력해주세요.">


					<div class="input-header">
						<span style="color: red">* </span>모임 카테고리
					</div>

					<select name="bcategorycode" onChange="sub_change1()" class="form-control">
						<option selected>대분류</option>

						<option value="1">영어</option>

						<option value="2">외국어</option>

						<option value="3">취업</option>

						<option value="4">공무원/국가고시</option>

						<option value="5">기타</option>

					</select>
					<select name="scategorycode" onChange="sub_change2()" class="form-control">
						<option value=" " selected>소분류</option>
					</select>


					<div class="input-header">
						<span style="color: red">* </span>모임 목표
					</div>

					<select class="form-control" id="groupGoal" name="groupGoal">
						<option selected disabled>선택없음</option>

						<option value="자기개발">자기개발</option>

						<option value="업무스킬UP">업무스킬UP</option>

						<option value="자격증준비">자격증준비</option>

						<option value="기타">기타</option>

					</select>


					<div class="input-header">모집 대상</div>

					<label class="checkbox-inline"> <input type="checkbox"
						id="inlineCheckbox1" name="target" value="대학생">대학생
					</label>
					<label class="checkbox-inline"> <input type="checkbox"
						id="inlineCheckbox2" name="target" value="취업준비생">취업준비생
					</label>
					<label class="checkbox-inline"> <input type="checkbox"
						id="inlineCheckbox3" name="target" value="직장인">직장인
					</label>
					<label class="checkbox-inline"> <input type="checkbox"
						id="inlineCheckbox4" name="target" value="일반인">일반인
					</label>


					<div class="input-header">이미지 선택</div>
					<form id="imgForm">
						<input type="file" name="groupImage" id="groupImage"
							onchange="fileCheck(this)"
							accept="image/gif, image/jpeg, image/png" />
						<p id="text" class="help-block">모임을 대표할 사진을 선택해주세요.</p>
						<img id="preImg" src="#" alt="미리보기"
							style="width: 300px; , height: 120px;" />
					</form>

					<!-- 모달 실행시킬 버튼 CSS미적용-->
					<div class="input-header">
						<span style="color: red">* </span>모임 장소
					</div>
					<a href="#" data-toggle="modal" data-target="#inputPlace_modal">
						<button class="btn btn-default">장소등록</button>
					</a>
					<span class="adrText1"></span>
					<span class="adrText2"></span>
					<div id="map_p"></div>


					<div class="input-header">모임 소개</div>

					<textarea class="form-control" rows="8" name="introduce"
						placeholder="나만의 모임을 자유롭게 소개해주세요."></textarea>



					<div class="divisionBox"></div>




					<div class="pull-right">
						<input type="submit" name="confirm" value="스터디 등록하기" />
					</div>

				</li>
			</ul>
		</form>

	</div>

	<!-- Modal -->
	<div id="inputPlace_modal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-xs">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">장소 등록하기</h4>
				</div>
				<div class="modal-body">
					<!-- 다음 지도 API 시작 -->
					<div class="map_wrap">
						<!-- 검색창과 검색버튼 -->
						<div class="option">
							<div class="search">
								<form id="frm">
									<input type="text" value="강남구 카페" id="keyword"
										class="keywordInput" size="15">
									<button type="submit" class="btn btn-default btn-sm">
										검색</button>
								</form>
							</div>
						</div>
						<!-- 지도표시 부분 -->
						<div id="map" style="position: relative; overflow: hidden;"></div>
						<!-- 검색결과 목록 부분 -->
						<div id="menu_wrap" class="bg_white">
							<hr>
							<ul id="placesList"></ul>
							<!-- 페이지 번호 -->
							<div id="pagination"></div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" id="btnSave" class="btn btn-default">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>
	<!-- //Modal -->
	<script type="text/javascript" src="assets/js/addGroup.js"></script>
	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=0a21aad3c63779ac6768c5485927150c&libraries=services"></script>
</c:if>
</body>
</html>