<%@ page contentType="text/html; charset=utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>StudyMate :: 맞춤형 스터디 솔루션. 스터디메이트에 오신것을 환영합니다.</title>
	
	<link rel="stylesheet" type="text/css" href="assets/css/searchGroup.css" />
	
	
</head>

<body class="non_background">

	<!-- searchGroup 내용영역 -->
	<div class="container" style="margin-top: 80px; min-height:600px;">
		<div class="row featurette">
			<form name="" action="" method="post">
				<div class="row search">
					<div class="col-xs-10"><input type="text" class="form-control input-lg" /></div>
					<div class="col-xs-2"><button type="submit" class="btn btn-info submit">검색</button></div>
				</div>

				<hr class="featurette-divider"><!-- 구분선 -->

				<div class="row panel-group search-detail">
					<div class="panel panel-default">
						<div class="panel-heading">
							<span class="select_detail"><span class="btn btn-default">토익</span><span class="btn btn-default">토익스피킹</span></span>
							<a data-toggle="collapse" href="#detail_search_collapse"><button type="button" class="btn btn-info">상세검색</button></a>
						</div>
						
						<div id="detail_search_collapse" class="panel-collapse collapse">
							<ul class="list-group">
								<li class="row list-group-item">
									<span class="col-sm-2 big_category_detail"><strong>영   어</strong></span>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" value="">토익</label>
										<label class="checkbox-inline"><input type="checkbox" value="">토익스피킹</label>
										<label class="checkbox-inline"><input type="checkbox" value="">오픽</label>
										<label class="checkbox-inline"><input type="checkbox" value="">기타</label>
									</div>
								</li>
								<li class="row list-group-item">
									<span class="col-sm-2 big_category_detail"><strong>외국어</strong></span>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" value="">토익</label>
										<label class="checkbox-inline"><input type="checkbox" value="">토익스피킹</label>
										<label class="checkbox-inline"><input type="checkbox" value="">오픽</label>
										<label class="checkbox-inline"><input type="checkbox" value="">기타</label>
									</div>
								</li>
								<li class="row list-group-item">
									<span class="col-sm-2 big_category_detail"><strong>국가고시/공무원</strong></span>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" value="">토익</label>
										<label class="checkbox-inline"><input type="checkbox" value="">토익스피킹</label>
										<label class="checkbox-inline"><input type="checkbox" value="">오픽</label>
										<label class="checkbox-inline"><input type="checkbox" value="">기타</label>
									</div>
								</li>
								<li class="row list-group-item">
									<span class="col-sm-2 big_category_detail"><strong>기   타</strong></span>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" value="">기타</label>
									</div>
								</li>
								
								<li class="row list-group-item">
									<span class="col-sm-2 big_category_detail"><strong>인원수</strong></span>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" value="">3명</label>
										<label class="checkbox-inline"><input type="checkbox" value="">4명</label>
										<label class="checkbox-inline"><input type="checkbox" value="">5명</label>
										<label class="checkbox-inline"><input type="checkbox" value="">6명 이상</label>
									</div>
								</li>
								<li class="row list-group-item">
									<span class="col-sm-2 big_category_detail"><strong>모임횟수</strong></span>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" value="">1회/주</label>
										<label class="checkbox-inline"><input type="checkbox" value="">2회/주</label>
										<label class="checkbox-inline"><input type="checkbox" value="">3회/주</label>
										<label class="checkbox-inline"><input type="checkbox" value="">4회 이상/주</label>
									</div>
								</li>
								<li class="row list-group-item">
									<span class="col-sm-2 big_category_detail"><strong>등록일</strong></span>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" value="">오늘</label>
										<label class="checkbox-inline"><input type="checkbox" value="">3일이내</label>
										<label class="checkbox-inline"><input type="checkbox" value="">5일이내</label>
										<label class="checkbox-inline"><input type="checkbox" value="">1주일이내</label>
									</div>
								</li>
							</ul>
						</div>
						
					</div>
				</div>
			</form>
		</div>
		
		<hr class="featurette-divider"><!-- 구분선 -->
		
		<div class="row featurette big_category">
			<ul class="nav navbar-nav">
				<li><a href="/semi/searchGroup.do?pageNum=${ currentPage }&bcategory=1" class="active btn btn-info">영 어</a></li>
				<li><a href="/semi/searchGroup.do?pageNum=${ currentPage }&bcategory=2" class="btn btn-info">외국어</a></li>
				<li><a href="/semi/searchGroup.do?pageNum=${ currentPage }&bcategory=3" class="btn btn-info">취 업</a></li>
				<li><a href="/semi/searchGroup.do?pageNum=${ currentPage }&bcategory=4" class="btn btn-info">국가고시<br>공무원</a></li>
				<li><a href="/semi/searchGroup.do?pageNum=${ currentPage }&bcategory=5" class="btn btn-info">기 타</a></li>
			</ul>
		</div>
		
		<hr class="featurette-divider"><!-- 구분선 -->


							<div><c:out value="${ number }" />
								<c:set var="number" value="${ number-1 }" /></div>
								

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
						<a href="./groupPage.do?num=${ article.num }&pageNum=${ currentPage }" class="item">
							<figure>
								<span class="item_category">${ bcategoryKR }&lt;${ article.scategory }</span>
								<img src="./${ article.imgpath }" />
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
		
		<div class="page text-center">
		<c:if test="${ count > 0 }">
			<c:set var="pageCount" value="${ count / pageSize + (count%pageSize==0 ? 0 : 1) }" />
			<c:set var="pageBlock" value="${ 5 }" />
			<fmt:parseNumber var="result" value="${ currentPage / 5 }" integerOnly="true" />
			<%-- result에 페이지 나눈값 저장. 정수만 입력. --%>
			<c:set var="startPage" value="${ result * 5 + 1 }" />
			<c:set var="endPage" value="${ startPage + pageBlock - 1 }" />
			<c:if test="${ endPage > pageCount }">
				<c:set var="endPage" value="${ pageCount }" />
			</c:if>
			<div class="page text-center">
				<c:if test="${ startPage > 5 }">
					<a href="/semi/searchGroup.do?pageNum=${ start - 5 }">[이전]</a>
				</c:if>
				<ul class="pagination">
					<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
						<li><a href="/semi/searchGroup.do?pageNum=${ i }">${ i }</a></li>
					</c:forEach>
				</ul>
				<c:if test="${ endPage < pageCount }">
					<a href="/semi/searchGroup.do?pageNum=${ start + 5 }">[이후]</a>
				</c:if>
			</div>
		</c:if>
		</div>
	</div>
	<!--// searchGroup 내용영역 -->
	<script>
		$(document).ready(function(){
			var big_category = $(".big_category>ul>li>a");
			var big_index = '${bcategoryNum}';
			$(".big_category>ul>li>a").removeClass("active");
			big_category.eq(big_index-1).addClass("active");
			big_category.click(function(e){
				e.preventDefault();
				var tg = $(this);
				var index = tg.index();
				var url = tg.attr("href");
				window.location.href = url;
			});
		});
	</script>
</body>
</html>