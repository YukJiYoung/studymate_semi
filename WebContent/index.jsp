<%@ page contentType="text/html; charset=utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>StudyMate :: 맞춤형 스터디 솔루션. 스터디메이트에 오신것을 환영합니다.</title>
	
	<link rel="stylesheet" type="text/css" href="assets/css/searchGroup.css" />
</head>

<body>
	<!-- index 내용영역 -->
	
	<!-- 캐러셀 영역 구성 -->
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		<!-- 현재 위치 표시 -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		</ol>

		<!-- 내용 영역 -->
		<div class="carousel-inner">
			<!-- 항목 (1) -->
			<div class="item active">
				<a href="<c:url value="/notice.jsp" />"><img src="images/index-slide-1.png" alt="[스터디메이트] - 처음 오셨나요?"></a>
			</div>

			<!-- 항목 (2) -->
			<div class="item">
				<a href="<c:url value="/notice.jsp" />"><img src="images/index-slide-2.png" alt="[스터디룸 할인이벤트] - 스터디메이트 회원이라면 제휴 스터디룸  50% 특별할인!!"></a>
			</div>

		</div>
		<!-- // 내용영역 구성 -->

		<!-- 이동 버튼 -->
		<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"> <span class="icon-prev"></span></a>
		<a class="right carousel-control" href="#carousel-example-generic" data-slide="next"> <span class="icon-next"></span></a>
	</div>
	<!-- 캐러셀 영역 끝 -->
	
	<div class="container">
		<div class="row featurette">
			<form id="main_search_form" name="main_search_form" action="" method="post">
				<div class="row search">
					<div class="col-xs-10"><input type="text" class="form-control input-lg" /></div>
					<div class="col-xs-2"><button type="submit" class="btn btn-info submit">검색</button></div>
				</div>
			</form>
		</div>
		
		<hr class="featurette-divider"><!-- 구분선 -->
		
		<div class="row featurette big_category">
			<ul class="nav navbar-nav">
				<li><button type="button" class="active btn btn-info">영 어</button></li>
				<li><button type="button" class="btn btn-info">외국어</button></li>
				<li><button type="button" class="btn btn-info">취 업</button></li>
				<li><button type="button" class="btn btn-info">국가고시<br>공무원</button></li>
				<li><button type="button" class="btn btn-info">기 타</button></li>
			</ul>
		</div>

		<hr class="featurette-divider"><!-- 구분선 -->

		<div class="row featurette">
			<div class="result_item_wrapper">
				<ul class="list result_item_list">
					<%-- 검색결과가 없을 때 --%>
					<li class="result_item no_result text-center"><h4>검색 결과가 없습니다.</h4></li>
					<hr class="featurette-divider"><!-- 구분선 -->
					<%-- 검색결과가 있을 때 --%>
					<!-- item -->
					<li class="result_item">
						<a href="<c:url value="/groupPage.jsp" />" class="item">
							<figure>
								<span class="item_category">영어 > 영어회화</span>
								<img src="images/item_sample_01.jpg" />
								<figcaption class="item_description">
									<p>
										<span class="item_title">영어 회화 스터디</span>
										<span class="item_status label label-primary">모집중</span>
										<span class="item_label label label-danger">HOT</span>
										<span class="item_introduce"> - 해외 이민을 목표로 영어회화 스터디 하실 분 모십니다~~! </span>
									</p>
									<p>
										<span class="item_host">최순실</span> | <span class="item_date">2016.10.17</span>
									</p>
								</figcaption>
								<div class="item_entry">
									<span class="entry_number">2</span> / <span class="entry_total">4</span> 명
								</div>
							</figure>
						</a>
					</li>
					<!-- //item -->
					<!-- item -->
					<li class="result_item">
						<a href="<c:url value="/groupPage.jsp" />" class="item">
							<figure>
								<span class="item_category">영어 > 영어회화</span>
								<img src="images/item_sample_02.jpg" />
								<figcaption class="item_description">
									<p>
									<span class="item_title">영어 회화 스터디</span>
									<span class="item_status label label-primary">모집중</span>
									<span class="item_introduce"> - 해외 이민을 목표로 영어회화 스터디 하실 분 모십니다~~! </span>
									</p>
									<p>
									<span class="item_host">최순실</span> | <span class="item_date">2016.10.17</span>
									</p>
								</figcaption>
								<div class="item_entry">
									<span class="entry_number">2</span> / <span class="entry_total">4</span> 명
								</div>
							</figure>
						</a>
					</li>
					<!-- //item -->
					<!-- item -->
					<li class="result_item">
						<a href="<c:url value="/groupPage.jsp" />" class="item">
							<figure>
								<span class="item_category">영어 > 영어회화</span>
								<img src="images/item_sample_01.jpg" />
								<figcaption class="item_description">
									<p>
									<span class="item_title">영어 회화 스터디</span>
									<span class="item_status label label-primary">모집중</span>
									<span class="item_label label label-danger">HOT</span>
									<span class="item_introduce"> - 해외 이민을 목표로 영어회화 스터디 하실 분 모십니다~~! </span>
									</p>
									<p>
									<span class="item_host">최순실</span> | <span class="item_date">2016.10.17</span>
									</p>
								</figcaption>
								<div class="item_entry">
									<span class="entry_number">2</span> / <span class="entry_total">4</span> 명
								</div>
							</figure>
						</a>
					</li>
					<!-- //item -->
					<!-- item -->
					<li class="result_item">
						<a href="<c:url value="/groupPage.jsp" />" class="item">
							<figure>
								<span class="item_category">영어 > 영어회화</span>
								<img src="images/item_sample_02.jpg" />
								<figcaption class="item_description">
									<p>
									<span class="item_title">영어 회화 스터디</span>
									<span class="item_status label label-primary">모집중</span>
									<span class="item_introduce"> - 해외 이민을 목표로 영어회화 스터디 하실 분 모십니다~~! </span>
									</p>
									<p>
									<span class="item_host">최순실</span> | <span class="item_date">2016.10.17</span>
									</p>
								</figcaption>
								<div class="item_entry">
									<span class="entry_number">2</span> / <span class="entry_total">4</span> 명
								</div>
							</figure>
						</a>
					</li>
					<!-- //item -->
					<!-- item -->
					<li class="result_item">
						<a href="<c:url value="/groupPage.jsp" />" class="item">
							<figure>
								<span class="item_category">영어 > 영어회화</span>
								<img src="images/item_sample_01.jpg" />
								<figcaption class="item_description">
									<p>
										<span class="item_title">영어 회화 스터디</span>
										<span class="item_status label label-primary">모집중</span>
										<span class="item_introduce"> - 해외 이민을 목표로 영어회화 스터디 하실 분 모십니다~~! </span>
									</p>
									<p>
									<span class="item_host">최순실</span> | <span class="item_date">2016.10.17</span>
									</p>
								</figcaption>
								<div class="item_entry">
									<span class="entry_number">2</span> / <span class="entry_total">4</span> 명
								</div>
							</figure>
						</a>
					</li>
					<!-- //item -->
				</ul>
			</div>
		</div>
		
		<div class="result_more text-center">
			<a href="<c:url value="/searchGroup.jsp" />">+ 더보기</a>
		</div>
		
	</div>
	<!--// index 내용영역 -->
</body>
</html>