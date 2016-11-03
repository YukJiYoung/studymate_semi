<%@ page contentType="text/html; charset=utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>StudyMate :: 맞춤형 스터디 솔루션. 스터디메이트에 오신것을 환영합니다.</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="assets/ico/favicon.png" />
<link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-144-precomposed.png" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="assets/css/nanumfont.css" />

<!-- 반응형 웹을 지원하지 않을 경우 -->
<!-- <link rel="stylesheet" href="assets/css/non-responsive.css" /> -->

<!-- IE8 이하 버전 지원 -->
<!--[if lt IE 9]>
	<script type="text/javascript" src="assets/js/html5shiv.js"></script>
	<script type="text/javascript" src="assets/js/respond.min.js"></script>
<![endif]-->

<!-- IE10 반응형 웹 버그 보완 -->
<!--[if gt IE 9]>
	<link rel="stylesheet" type="text/css" href="assets/css/ie10.css" />
	<script type="text/javascript" src="assets/js/ie10.js"></script>
<![endif]-->

<!-- css link  -->
<link rel="stylesheet" type="text/css" href="assets/css/layout.css" />
<decorator:head />
<!-- //css link  -->

<!-- Javascript -->
<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<style type="text/css">
/** 메뉴바 배경색 */
.non_background .navbar-wrapper {
	background-color: #4db8bd;
}
</style>

</head>

<body <decorator:getProperty property="body.class" writeEntireProperty="true" />>
	<!-- 헤더 -->
	<header class="navbar-wrapper">
		<div class="container">
			<!-- 메뉴바 -->
			<div class="navbar navbar-static-top" role="navigation">
				<!-- 로고 영역 -->
				<div class="navbar-header">
					<!-- 반응형 메뉴 버튼 -->
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<!--// 반응형 메뉴 버튼 -->
					<!-- 로고 -->
					<a class="navbar-brand" href="<c:url value="/" />">StudyMate</a>
					<!--// 로고 -->
				</div>
				<!--// 로고 영역 -->
				<!-- 메뉴 영역 -->
				<div class="navbar-collapse collapse">
					<!-- 메인메뉴 -->
					<ul class="nav navbar-nav navbar-right">
						<li><a href="<c:url value="/" />">Home</a></li>
						<li class="active"><a href="<c:url value="/searchGroup.jsp" />">스터디그룹</a></li>
						<li><a href="<c:url value="/addGroup.jsp" />">그룹등록</a></li>
						<!-- Trigger the modal with a button -->
						<li><a href="#" data-toggle="modal" data-target="#login_modal">로그인</a></li>
						<li><a href="<c:url value="/" />">마이페이지</a></li>
					</ul>
					<!--// 메인메뉴 -->
				</div>
				<!--// 메뉴 영역 -->
			</div>
			<!--// 메뉴바 -->
		</div>

		<!-- Modal -->
		<div id="login_modal" class="modal fade" role="dialog">
			<div class="modal-dialog modal-sm">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">로그인</h4>
					</div>
					<div class="modal-body text-center">
						<form id="login_form" action="" name="login_form" method="post">
							<div class="form-group">
								<input type="text" placeholder="ID" class="form-control">
							</div>
							<div class="form-group">
								<input type="password" placeholder="Password" class="form-control">
							</div>
							<div class="row modal_login_btns">
								<button type="submit" class="col-sm-6 btn btn-default">Login</button>
								<!-- Trigger the modal with a button -->
								<button type="button" class="btn btn-default " id="joinUserButton" data-toggle="modal" data-target='#myModal2'>Join</button>
							</div>
							<div class="row modal_login_btns">
								<button type="button" class="col-sm-6 btn btn-default">ID찾기</button>
								<button type="button" class="col-sm-6 btn btn-default">Password찾기</button>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!-- //Modal -->
		<!-- Modal -->
		<div class="modal fade" id="myModal2" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<form id="Join-Form">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							
							<h4 class="modal-title">회원가입</h4>
						</div>
						<div class="modal-body Loginbody">
							<div class="row loginform">
								<input type="text" class="form-control col-xs-9" name="userId" placeholder="아이디를입력하세요">
								<button type="button" class="btn btn-default col-xs-2">중복확인</button>
							</div>
							<input type="password" class="form-control" name="userPw" placeholder="비밀번호를입력하세요">
							<input type="password" class="form-control" name="userPw2" placeholder="비밀번호를확인하세요">

							<div class="row">
								<label class="control-label col-xs-2" for="성별">성별</label>
								<div class="col-xs-10">
									<label class="checkbox-inline"><input id="inlineCheckbox10" type="radio" name="gender" value="0"><span class="fa fa-check">남자</span></label>
									<label class="checkbox-inline"><input id="inlineCheckbox10" type="radio" name="gender" value="1"><span class="fa fa-check">여자</span></label>
								</div>
							</div>
							<input type="text" class="form-control" name="생년월일" placeholder="생년월일 : ex)20161101" maxlength="8">
							<input type="text" class="form-control" name="이름" placeholder="사용자 이름" maxlength="8">
							<input type="text" class="form-control" name="전화번호" placeholder="전화번호: ex)01012345678" maxlength="11">
							<input type="text" class="form-control" name="이메일" placeholder="Email을 입력해주세요">

							<div class="row">
								<label class="control-label col-xs-2" for="영어">영어</label>
								<div class="col-xs-10">
									<label class="checkbox-inline"><input type="checkbox" value="토익">토익 </label>
									<label class="checkbox-inline"> <input type="checkbox" value="오픽">오픽 </label>
									<label class="checkbox-inline"> <input type="checkbox" value="토익스피킹">토익스피킹 </label>
									<label class="checkbox-inline"> <input type="checkbox" value="회화">회화</label>
								</div>
							</div>

							<div class="row">
								<label class="control-label col-xs-2" for="외국어">외국어</label>
								<div class="col-xs-10">
									<label class="checkbox-inline"> <input type="checkbox" value="일본어">일본어</label>
									<label class="checkbox-inline"> <input type="checkbox" value="중국어">중국어</label>
									<label class="checkbox-inline"> <input type="checkbox" value="프랑스어">프랑스어</label>
								</div>
							</div>
							<div class="row">
								<label class="control-label col-xs-2" for="취업">취업</label>
								<div class="col-xs-10">
									<label class="checkbox-inline"> <input type="checkbox" value="인적성">인적성</label>
									<label class="checkbox-inline"> <input type="checkbox" value="면접">면접</label>
									<label class="checkbox-inline"> <input type="checkbox" value="자소서">자소서</label>
									<label class="checkbox-inline"> <input type="checkbox" value="기타">기타</label>
								</div>
							</div>
							<div class="row">
								<label class="control-label col-xs-2" for="국가고시/공무원">국가고시/공무원</label>
								<div class="col-xs-10">
									<label class="checkbox-inline"> <input type="checkbox" value="공무원">공무원</label>
									<label class="checkbox-inline"> <input type="checkbox" value="국가고시">국가고시</label>
									<label class="checkbox-inline"> <input type="checkbox" value="기타">기타</label>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">회원가입</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
		<!-- //Modal -->
	</header>
	<!-- //헤더 -->

	<!-- 내용영역 -->
	<decorator:body />
	<!--// 내용영역 -->

	<!-- 푸터 -->
	<footer class="footer-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-sm-4 text-center">
					<h1>
						<a href="<c:url value="/" />">StudyMate</a>
					</h1>
				</div>
				<div class="col-sm-8 footer_content text-center">
					<ul class="nav navbar-nav footer_menu text-center">
						<li><a href="<c:url value="/costmer.jsp" />">고객지원</a></li>
						<li><a href="<c:url value="/" />">이용안내</a></li>
						<li><a href="<c:url value="/" />">개인정보 취급방침</a></li>
						<!-- Trigger the modal with a button -->
						<li><a href="#" data-toggle="modal" data-target="#leave_modal">탈퇴하기</a></li>
					</ul>
					<br />
					<address>
						<p><span class="address">주소 : 서울특별시 강남구 역삼동</span><span class="tel">Tel : 1234-5678</span></p>
						<p>Copyright&copy;2016. <a href="<c:url value="/" />">studymate.co.kr</a>.All rights resurved</p>
					</address>
				</div>

			</div>
		</div>

		<!-- Modal -->
		<div id="leave_modal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">탈퇴하기</h4>
					</div>
					<div class="modal-body text-center">
						<form id="leave_form" action="" name="leave_form" method="post">
							<div class="form-group">
								<input type="password" placeholder="Password" class="form-control">
							</div>
							<div class="form-group">
								<input type="password" placeholder="Password 확인" class="form-control">
							</div>

							<p class="row">탈퇴하시면 고객님의 모든 정보가 삭제됩니다.<br />탈퇴하시겠습니까?</p>

							<div class="row modal_leave_btns">
								<button type="button" class="col-sm-6 btn btn-warning">취소</button>
								<button type="submit" class="col-sm-6 btn btn-danger">확인</button>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!-- //Modal -->

	</footer>
	<!--// 푸터 -->
</body>
</html>