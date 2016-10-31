<%@ page contentType="text/html; charset=utf-8"%>
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

<link rel="stylesheet" type="text/css" href="assets/css/layout.css" />
<style type="text/css">
	
</style>

</head>

<body>
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
					<a class="navbar-brand" href="/">StudyMate</a>
					<!--// 로고 -->
				</div>
				<!--// 로고 영역 -->
				<!-- 메뉴 영역 -->
				<div class="navbar-collapse collapse">
					<!-- 메인메뉴 -->
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/semi/index.jsp">Home</a></li>
						<li class="active"><a href="/semi/searchGroup.jsp">스터디그룹</a></li>
						<li><a href="#">그룹등록</a></li>
						<!-- Trigger the modal with a button -->
						<li><a href="#" data-toggle="modal" data-target="#login_modal">로그인</a></li>
						<li><a href="#">마이페이지</a></li>
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
							<div class="form-group"><input type="text" placeholder="Email" class="form-control"></div>
							<div class="form-group"><input type="password" placeholder="Password" class="form-control"></div>
							<div class="row modal_login_btns">
								<button type="submit" class="col-sm-6 btn btn-default">Login</button>
								<button type="button" class="col-sm-6 btn btn-info">Join</button>
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

	<!-- 캐러셀 영역 구성 -->
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- 현재 위치 표시 -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		</ol>

		<!-- 내용 영역 -->
		<div class="carousel-inner">
			<!-- 항목 (1) -->
			<div class="item active">
				<img src="images/slide-1.jpg" alt="슬라이더(1)">
				<div class="container">
					<div class="carousel-caption">
						<h1>슬라이드 01</h1>
						<p>슬라이드 01 설명부분</p>
					</div>
				</div>
			</div>

			<!-- 항목 (2) -->
			<div class="item">
				<img src="images/slide-2.jpg" alt="슬라이더(2)">
				<div class="container">
					<div class="carousel-caption">
						<h1>슬라이드 02</h1>
						<p>슬라이드 02 설명부분</p>
					</div>
				</div>
			</div>

		</div>
		<!-- // 내용영역 구성 -->

		<!-- 이동 버튼 -->
		<a class="left carousel-control" href="#carousel-example-generic"
			data-slide="prev"> <span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</div>
	<!-- 캐러셀 영역 끝 -->

	<!-- 내용영역 -->
	<div class="container">
		<!-- 그리드 시스템 (데스크탑 가로3칸) -->
		<div class="row">
			<div class="col-md-4 text-center">
				<img src="images/html5.jpg" class="img-circle" width="240"
					height="240" />
				<h2>HTML5</h2>
				<p>웹 접근성과 시멘틱 웹, 그리고 XTHML1.0과 HTML5의 차이점에 대한 이해는 반응형 웹을 시작하는 첫
					단계 입니다. 그렇기 때문에 이 단원에서는 가장 우선적으로 HTML5의 변경된 웹 페이지 구성 방법과, 새롭게 추가된
					시멘틱 요소들 및 멀티미디어 제어 요소들을 소개하고 기본적인 활용 과정을 소개합니다.</p>
				<a class="btn btn-default" href="#" role="button">더 보기 &raquo;</a>
			</div>
			<div class="hidden-lg hidden-md">
				<br /> <br />
			</div>
			<div class="col-md-4 text-center">
				<img src="images/css3.jpg" class="img-circle" width="240"
					height="240" />
				<h2>CSS3</h2>
				<p>기존에 사용되던 CSS2와 함께 사용할 수 있는 다채로운 그래픽 효과에 대해서 소개합니다. CSS3의
					그림자,그라데이션 효과는 이미지 제작 없이 상당수의 웹 페이지들을 CSS만으로 제작 가능하게 해 주었습니다. CSS3는
					CSS2에 효과들이 추가되는 개념이기 때문에 웹 표준 기술(XHTML1.0+CSS2)에 대한 이해가 필요합니다.</p>
				<a class="btn btn-default" href="#" role="button">더 보기 &raquo;</a>
			</div>
			<div class="hidden-lg hidden-md">
				<br /> <br />
			</div>
			<div class="col-md-4 text-center">
				<img src="images/bs3.jpg" class="img-circle" width="240"
					height="240" />
				<h2>Bootstrap3</h2>
				<p>Bootstrap은 트위터에서 만든 반응형 웹 Framework로, 어려운 CSS3나 Javascript에
					대한 이해가 없이도 반응형 웹을 손쉽게 만들어 줄 수 있는 도구입니다. 기본적으로 제공하는 페이지의 형태 위에 사용자가
					직접 제작한 CSS를 추가하면 다채로운 반응형 웹 페이지를 제작할 수 있습니다.</p>
				<a class="btn btn-default" href="#" role="button">더 보기 &raquo;</a>
			</div>
		</div>
		<!--// 그리드 시스템 -->

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7">
				<h2 class="featurette-heading">
					첫 번째 예제를 확인하세요. <span class="text-muted">마음에 드실겁니다.</span>
				</h2>
				<p class="lead">가장 심플한 것이 가장 화려한 것이라는 말이 있습니다. 첫 번째 예제를 통해서
					심플하면서도 모던한 웹 퍼블리싱을 경험해 보신다면, Bootstrap3의 매력에 반하시게 될 것입니다.</p>
			</div>
			<div class="col-md-5">
				<img class="img-thumbnail img-responsive" src="images/img01.jpg"
					width="500" height="500" />
			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-5">
				<img class="img-thumbnail img-responsive" src="images/img02.jpg"
					width="500" height="500" />
			</div>
			<div class="col-md-7">
				<h2 class="featurette-heading">
					무척 쉽습니다. <span class="text-muted">직접 경험해 보세요.</span>
				</h2>
				<p class="lead">Twitter Bootstrap3를 사용하면 반응형 웹 페이지 제작이 매우 쉬워집니다.
					빠르게 메뉴를 제작하고, 어려운 자바스크립트의 사용 없이도 다이나믹한 컨텐츠의 제공이 가능해 집니다. 단지 HTML
					태그의 사용 방법만 알고 계시면 됩니다. CSS의 활용까지 가능하다면, 당신의 가능성은 무한대 입니다.</p>
			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7">
				<h2 class="featurette-heading">
					단순함이 모여서 화려함이 됩니다. <span class="text-muted">정말 멋집니다.</span>
				</h2>
				<p class="lead">지금 경험하시고 계신 페이지는 Bootstrap의 가장 대표적인 기능들을 모두 모아놓은
					페이지에 약간의 CSS 기능을 더한 것 입니다. 단순한 기능들이 모인 것 이지만, 결과물은 매우 화려합니다.</p>
			</div>
			<div class="col-md-5">
				<img class="img-thumbnail img-responsive" src="images/img03.jpg"
					width="500" height="500" />
			</div>
		</div>
	</div>
	<!--// 내용영역 -->
	
	<!-- 푸터 -->
	<footer class="footer-wrapper" >
		<div class="container">
			<div class="row">
				<div class="col-sm-4 article">
					<h1><a href="/">StudyMate</a></h1>
				</div>
				<div class="col-sm-8 article footer_content">
					<ul class="nav navbar-nav footer_menu">
						<li><a href="">고객지원</a></li>
						<li><a href="">이용안내</a></li>
						<li><a href="">개인정보 취급방침</a></li>
						<li><a href="">탈퇴하기</a></li>
					</ul>
					<br />
					<address>
						<p><span class="address">주소 : 서울특별시 강남구 역삼동</span><span class="tel">Tel 	: 1234-5678</span></p>
						<p>Copyright&copy;2016. <a href="/">studymate.co.kr</a>. All rights resurved</p>
					</address>
				</div>
				
			</div>
		</div>
	</footer>
	<!--// 푸터 -->

	<!-- Javascript -->
	<script src="assets/js/jquery-3.1.1.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>