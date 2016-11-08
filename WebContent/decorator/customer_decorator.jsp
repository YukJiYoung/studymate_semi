<%@ page contentType="text/html; charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>StudyMate :: 고객지원 게시판</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../assets/ico/favicon.png" />
<link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-144-precomposed.png" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css" />

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="../assets/css/nanumfont.css" />

<!-- 반응형 웹을 지원하지 않을 경우 -->
<!-- <link rel="stylesheet" href="../assets/css/non-responsive.css" /> -->

<!-- IE8 이하 버전 지원 -->
<!--[if lt IE 9]>
	<script type="text/javascript" src="../assets/js/html5shiv.js"></script>
	<script type="text/javascript" src="../assets/js/respond.min.js"></script>
<![endif]-->

<!-- IE10 반응형 웹 버그 보완 -->
<!--[if gt IE 9]>
	<link rel="stylesheet" type="text/css" href="../assets/css/ie10.css" />
	<script type="text/javascript" src="../assets/js/ie10.js"></script>
<![endif]-->

<!-- css link  -->
	<link rel="stylesheet" type="text/css" href="../assets/css/layout.css" />
	<link rel="stylesheet" type="text/css" href="../assets/css/notice.css" />
	<decorator:head /> 
<!-- //css link  -->

<!-- Javascript -->
<script src="../assets/js/jquery-3.1.1.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="script.js"></script>

<style type="text/css">
	/** 메뉴바 배경색 */
.non_background .navbar-wrapper {
	background-color:#4db8bd;
}
</style>

</head>

<body class="notice non_background">
	<header class="navbar-wrapper">
		<div class="container">
			<!-- 메뉴바 -->
			<div class="navbar navbar-static-top" role="navigation">
				<!-- 로고 영역 -->
				<div class="navbar-header">
					<!-- 반응형 메뉴 버튼 -->
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
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
						<li class="active"><a href="<c:url value="/searchGroup.do" />">스터디그룹</a></li>
						<li><a href="<c:url value="/addGroup.jsp" />">그룹등록</a></li>
						<!-- Trigger the modal with a button -->
						<li><a href="<c:url value="/" />" data-toggle="modal" data-target="#login_modal">로그인</a></li>
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
							<div class="form-group"><input type="text" placeholder="ID" class="form-control"></div>
							<div class="form-group"><input type="password" placeholder="Password" class="form-control"></div>
							<div class="row modal_login_btns">
								<button type="submit" class="col-sm-6 btn btn-default">Login</button>
								<button type="button" class="col-sm-6 btn btn-info">Join</button>
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
		
	</header>

	<!-- 내용영역 -->
	<div class="container" style="margin-top:100px; min-height:600px;">
		<ul class="nav nav-tabs">
			<li><a data-toggle="tab" href="#answer">자주 묻는 질문</a></li>
			<li class="active"><a data-toggle="tab" href="#qnalist">문의/답변 목록</a></li>
			<li><a data-toggle="tab" href="#question">문의하기</a></li>
		</ul>

		<div class="tab-content">
			<!-- 자주 묻는 질문 -->
			<div id="answer" class="tab-pane fade">
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapse1"> 자주 묻는 질문 1</a>
							</h4>
						</div>
						<div id="collapse1" class="panel-collapse collapse">
							<div class="panel-body">내용1</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapse2"> 자주 묻는 질문 2</a>
							</h4>
						</div>
						<div id="collapse2" class="panel-collapse collapse">
							<div class="panel-body">내용2</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapse3"> 자주 묻는 질문 3</a>
							</h4>
						</div>
						<div id="collapse3" class="panel-collapse collapse">
							<div class="panel-body">내용3</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapse4"> 자주 묻는 질문 4</a>
							</h4>
						</div>
						<div id="collapse4" class="panel-collapse collapse">
							<div class="panel-body">내용4</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapse5"> 자주 묻는 질문 5</a>
							</h4>
						</div>
						<div id="collapse5" class="panel-collapse collapse">
							<div class="panel-body">내용5</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapse6"> 자주 묻는 질문 6</a>
							</h4>
						</div>
						<div id="collapse6" class="panel-collapse collapse">
							<div class="panel-body">내용6</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapse7"> 자주 묻는 질문 7</a>
							</h4>
						</div>
						<div id="collapse7" class="panel-collapse collapse">
							<div class="panel-body">내용7</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapse8"> 자주 묻는 질문 8</a>
							</h4>
						</div>
						<div id="collapse8" class="panel-collapse collapse">
							<div class="panel-body">내용8</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapse9"> 자주 묻는 질문 9</a>
							</h4>
						</div>
						<div id="collapse9" class="panel-collapse collapse">
							<div class="panel-body">내용9</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //자주 묻는 질문 -->
			
			<!-- qna -->
			<div id="qnalist" class="tab-pane fade in active">
				
				<decorator:body />
				
			</div>
			<!-- //qna -->
			
			<!-- 문의하기 -->
			<div id="question" class="tab-pane fade">

				<form action="./writePro.do" method="post" name="">
					<div class="form-group">
						<label for="name">이름:</label> <input type="text"
							class="form-control" id="name" style="width: 30%">
					</div>
					<div class="form-group">
						<label for="tel">연락처:</label> <input type="tel"
							class="form-control" id="tel" style="width: 30%">
					</div>
					<div class="form-group">
						<label for="email">이메일:</label> <input type="email"
							class="form-control" id="email" style="width: 30%">
					</div>

					<div class="form-group">
						<label for="comment">문의하기:</label>
						<textarea class="form-control" rows="5" id="comment"
							style="width: 50%"></textarea>
					</div>

					<button type="submit" class="btn btn-default">등록</button>
				</form>

			</div>
			<!-- //문의하기 -->
		</div>
	</div>
	<!--// 내용영역 -->

	<!-- 푸터 -->
	<footer class="footer-wrapper" >
		<div class="container">
			<div class="row">
				<div class="col-sm-4 text-center">
					<h1><a href="<c:url value="/" />">StudyMate</a></h1>
				</div>
				<div class="col-sm-8 footer_content text-center">
					<ul class="nav navbar-nav footer_menu text-center">
						<li><a href="<c:url value="/costmer.do" />">고객지원</a></li>
						<li><a href="<c:url value="/" />">이용안내</a></li>
						<li><a href="<c:url value="/" />">개인정보 취급방침</a></li>
						<!-- Trigger the modal with a button -->
						<li><a href="#" data-toggle="modal" data-target="#leave_modal">탈퇴하기</a></li>
					</ul>
					<br />
					<address>
						<p><span class="address">주소 : 서울특별시 강남구 역삼동</span><span class="tel">Tel 	: 1234-5678</span></p>
						<p>Copyright&copy;2016. <a href="<c:url value="/" />">studymate.co.kr</a>. All rights resurved</p>
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
							<div class="form-group"><input type="password" placeholder="Password" class="form-control"></div>
							<div class="form-group"><input type="password" placeholder="Password 확인" class="form-control"></div>
							
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