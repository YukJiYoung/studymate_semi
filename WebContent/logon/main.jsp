<%@ page contentType="text/html; charset=utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>StudyMate :: 맞춤형 스터디 솔루션. 스터디메이트에 오신것을 환영합니다.</title>
	
	<link rel="stylesheet" type="text/css" href="../assets/css/searchGroup.css" />
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
				<a href="../notice.jsp"><img src="../images/index-slide-1.png" alt="[스터디메이트] - 처음 오셨나요?"></a>
			</div>

			<!-- 항목 (2) -->
			<div class="item">
				<a href="../notice.jsp"><img src="../images/index-slide-2.png" alt="[스터디룸 할인이벤트] - 스터디메이트 회원이라면 제휴 스터디룸  50% 특별할인!!"></a>
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
			<form id="main_search_form" name="main_search_form" action="../searchGroup.do" method="post">
				<div class="row search">
					<div class="col-xs-2"><select id="typeList" name="typeList" class="form-control input-lg">
						<option value="1" selected>카테고리</option>
						<option value="2">스터디그룹명</option>
						<option value="3">지역</option>
					</select></div>
					<div class="col-xs-8"><input id="searchInput" name="searchInput" type="text" class="form-control input-lg" placeholder="카테고리로 검색하세요" /></div>
					<div class="col-xs-2"><button type="submit" class="btn btn-info submit">검색</button></div>
				</div>
			</form>
		</div>
		<script>
		 $('#typeList').change(function () {
        var text = $('#typeList option:selected').text();

        $('#searchInput').removeClass();
        switch(text) {
            case "카테고리":
                $('#searchInput').addClass('form-control input-lg searchCategory');
                $('#searchInput').attr("placeholder", "카테고리로 검색하세요");
                break;
            case "스터디그룹명":
                $('#searchInput').addClass('form-control input-lg searchTitle');
                $('#searchInput').attr("placeholder", "스터디그룹명으로 검색하세요");
                break;
            case "지역":
                $('#searchInput').addClass('form-control input-lg searchAddr'); //클래스명 변경
                $('#searchInput').attr("placeholder", "지역으로 검색하세요 (ex)서울 강남"); //placeholder 변경
                break;
        }
			});
		</script>
		<hr class="featurette-divider"><!-- 구분선 -->
		
		<div class="row featurette big_category">
			<ul class="nav navbar-nav">
				<li><button class="active btn btn-info" onclick="window.location.href='./main.do?bcategory=1'">영 어</a></li>
				<li><button class="btn btn-info" onclick="window.location.href='./main.do?bcategory=2'">외국어</a></li>
				<li><button class="btn btn-info" onclick="window.location.href='./main.do?bcategory=3'">취 업</a></li>
				<li><button class="btn btn-info" onclick="window.location.href='./main.do?bcategory=4'">국가고시<br>공무원</a></li>
				<li><button class="btn btn-info" onclick="window.location.href='./main.do?bcategory=5'">기 타</a></li>
			</ul>
		</div>

		<hr class="featurette-divider"><!-- 구분선 -->

		<div class="row featurette">
			<div class="result_item_wrapper">
				<ul class="list result_item_list">
					<c:if test="${ count == 0 }">
						<%-- 검색결과가 없을 때 --%>
						<li class="result_item no_result text-center"><h4>검색 결과가 없습니다.</h4></li>
						<hr class="featurette-divider"><!-- 구분선 -->
						<%-- 검색결과가 있을 때 --%>
					</c:if>
					
					<c:if test="${ count > 0 }">
					<c:forEach var="article" items="${ articleList }"> 
						<c:choose>
							<c:when test = "${ article.bcategory == 1 }">
								<c:set var="bcategoryKR" value="영어" />
							</c:when>
							<c:when test = "${ article.bcategory == 2 }">
								<c:set var="bcategoryKR" value="외국어" />
							</c:when>
							<c:when test = "${ article.bcategory == 3 }">
								<c:set var="bcategoryKR" value="취업" />
							</c:when>
							<c:when test = "${ article.bcategory == 4 }">
								<c:set var="bcategoryKR" value="국가고시&공무원" />
							</c:when>
							<c:when test = "${ article.bcategory == 5 }">
								<c:set var="bcategoryKR" value="기타" />
							</c:when>
						</c:choose>
					<!-- item -->
					<li class="result_item">
						<a href="../groupPage.do?num=${ article.num }&pageNum=${ currentPage }" class="item">
							<figure>
								<span class="item_category">${ bcategoryKR }&lt;${ article.scategory }</span>
								<img src="../${ article.imgpath }" />
								<figcaption class="item_description">
									<p>
										<span class="item_title">${ article.title }</span>
										<span class="item_status label label-primary">${ article.status }</span>
										<c:if test="${ article.recommendcount >= 20 }">
											<span class="item_label label label-danger">HOT</span>
										</c:if>
										<span class="item_introduce"> - ${ article.introduce } </span>
									</p>
									<p>
										<span class="item_host">${ article.host }</span> | <span class="item_date">${ article.duedate }</span>
									</p>
								</figcaption>
								<div class="item_entry">
									<span class="entry_number">${ article.currentnum }</span> / <span class="entry_total">${ article.total }</span> 명
								</div>
							</figure>
						</a>
					</li>
					<!-- //item -->
					</c:forEach>
					</c:if>
					
				</ul>
			</div>
		</div>
		
		<div class="result_more text-center">
			<a href="../searchGroup.do?pageNum=1&bcategory=${ bcategoryNum }">+ 더보기</a>
		</div>
		
	</div>
	<!--// index 내용영역 -->
	<script>
		$(document).ready(function(){
			var big_category = $(".big_category>ul>li>button");
			var big_index = '${bcategoryNum}';
			big_category.removeClass("active"); 
			big_category.eq(big_index-1).addClass("active");
		});
	</script>
</body>
</html>