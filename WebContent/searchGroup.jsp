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
	<script src="./assets/js/searchGroup.js"></script>
	<!-- searchGroup 내용영역 -->
	<div class="container" style="margin-top: 80px; min-height:600px;">
		<div class="row featurette">
			<form name="searchGroup" action="./searchGroup.do" method="post">
				<input type="hidden" name="searchCheck" value="y" />
				<div class="row search">
					<div class="col-xs-10">
						<c:if test="${ searchInput != null }">
							<input type="text" class="form-control input-lg" value="${ searchInput }" />
						</c:if>
						<c:if test="${ searchInput == null }">
							<input type="text" class="form-control input-lg" placeholder="검색어를 입력해 주세요." />
						</c:if>
					</div>
					<div class="col-xs-2"><button type="submit" class="btn btn-info submit">검색</button></div>
				</div>

				<hr class="featurette-divider"><!-- 구분선 -->

				<div class="row panel-group search-detail">
					<div class="panel panel-default">
						<div class="panel-heading">
							<span id="select_detail" class="select_detail"><span class="btn btn-default">토익</span><span class="btn btn-default">토익스피킹</span></span>
							<a data-toggle="collapse" href="#detail_search_collapse"><button type="button" class="btn btn-info">상세검색</button></a>
						</div>
						
						<div id="detail_search_collapse" class="panel-collapse collapse">
							<ul class="list-group">
								<li class="row list-group-item">
									<span class="col-sm-2 big_category_detail"><strong>영   어</strong></span>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" name="category" value="1">토익</label>
										<label class="checkbox-inline"><input type="checkbox" name="category" value="2">토익스피킹</label>
										<label class="checkbox-inline"><input type="checkbox" name="category" value="3">오픽</label>
										<label class="checkbox-inline"><input type="checkbox" name="category" value="4">회화</label>
									</div>
								</li>
								<li class="row list-group-item">
									<span class="col-sm-2 big_category_detail"><strong>외국어</strong></span>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" name="category" value="5">일본어</label>
										<label class="checkbox-inline"><input type="checkbox" name="category" value="6">중국어</label>
										<label class="checkbox-inline"><input type="checkbox" name="category" value="7">프랑스어</label>
										<label class="checkbox-inline"><input type="checkbox" name="category" value="8">외국어-기타</label>
									</div>
								</li>
								<li class="row list-group-item">
									<span class="col-sm-2 big_category_detail"><strong>취    업</strong></span>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" name="category" value="9">인적성</label>
										<label class="checkbox-inline"><input type="checkbox" name="category" value="10">면접</label>
										<label class="checkbox-inline"><input type="checkbox" name="category" value="11">자소서</label>
										<label class="checkbox-inline"><input type="checkbox" name="category" value="12">취업-기타</label>
									</div>
								</li>
								<li class="row list-group-item">
									<span class="col-sm-2 big_category_detail"><strong>국가고시/공무원</strong></span>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" name="category" value="13">국가고시</label>
										<label class="checkbox-inline"><input type="checkbox" name="category" value="14">공무원</label>
										<label class="checkbox-inline"><input type="checkbox" name="category" value="15">고시-기타</label>
									</div>
								</li>
								<li class="row list-group-item">
									<span class="col-sm-2 big_category_detail"><strong>기   타</strong></span>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" name="category" value="16">기타-기타</label>
									</div>
								</li>
								
								<li class="row list-group-item">
									<span class="col-sm-2 big_category_detail"><strong>인원수</strong></span>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" name="members" value="3">3명</label>
										<label class="checkbox-inline"><input type="checkbox" name="members" value="4">4명</label>
										<label class="checkbox-inline"><input type="checkbox" name="members" value="5">5명</label>
										<label class="checkbox-inline"><input type="checkbox" name="members" value="6">6명 이상</label>
									</div>
								</li>
								<li class="row list-group-item">
									<span class="col-sm-2 big_category_detail"><strong>모임횟수</strong></span>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" name="meetcount" value="1">1회/주</label>
										<label class="checkbox-inline"><input type="checkbox" name="meetcount" value="2">2회/주</label>
										<label class="checkbox-inline"><input type="checkbox" name="meetcount" value="3">3회/주</label>
										<label class="checkbox-inline"><input type="checkbox" name="meetcount" value="4">4회 이상/주</label>
									</div>
								</li>
								<li class="row list-group-item">
									<span class="col-sm-2 big_category_detail"><strong>등록일</strong></span>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" name="regdate" value="1">오늘</label>
										<label class="checkbox-inline"><input type="checkbox" name="regdate" value="3">3일이내</label>
										<label class="checkbox-inline"><input type="checkbox" name="regdate" value="4">5일이내</label>
										<label class="checkbox-inline"><input type="checkbox" name="regdate" value="7">1주일이내</label>
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
				<li><button class="active btn btn-info" onclick="loadNextPage(1,1,this)">영 어</button></li>
				<li><button class="btn btn-info" onclick="loadNextPage(1,2,this)">외국어</button></li>
				<li><button class="btn btn-info" onclick="loadNextPage(1,3,this)">취 업</button></li>
				<li><button class="btn btn-info" onclick="loadNextPage(1,4,this)">국가고시<br>공무원</button></li>
				<li><button class="btn btn-info" onclick="loadNextPage(1,5,this)">기 타</button></li>
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
							<c:when test = "${ article.bcategorycode == 1 }">
								<c:set var="bcategoryKR" value="영어" />
							</c:when>
							<c:when test = "${ article.bcategorycode == 2 }">
								<c:set var="bcategoryKR" value="외국어" />
							</c:when>
							<c:when test = "${ article.bcategorycode == 3 }">
								<c:set var="bcategoryKR" value="취업" />
							</c:when>
							<c:when test = "${ article.bcategorycode == 4 }">
								<c:set var="bcategoryKR" value="국가고시&공무원" />
							</c:when>
							<c:when test = "${ article.bcategorycode == 5 }">
								<c:set var="bcategoryKR" value="기타" />
							</c:when>
						</c:choose>
					<!-- item -->
					<li class="result_item">
						<a href="./groupPage.do?groupNum=${ article.groupNum }&pageNum=${ currentPage }" class="item">
							<figure>
								<span class="item_category">${ bcategoryKR }&lt;${ article.scategorycode }</span>
								<img src="./${ article.imagePath }" />
								<figcaption class="item_description">
									<p>
										<span class="item_title">${ article.groupName }</span>
										<c:if test="${ (article.maxMember - article.nowMember) > 0 }">
											<span class="item_status label label-primary">모집중</span>
										</c:if>
										<c:if test="${ (article.maxMember - article.nowMember) <= 0 }">
											<span class="item_status label label-default">모집완료</span>
										</c:if>
										<c:if test="${ article.zzimCount >= 20 }">
											<span class="item_label label label-danger">HOT</span>
										</c:if>
										<span class="item_introduce"> - ${ article.introduce } </span>
									</p>
									<p>
										<span class="item_host">${ article.id }</span> | <span class="item_date">${ article.createDate }</span>
									</p>
								</figcaption>
								<div class="item_entry">
									<span class="entry_number">${ article.nowMember }</span> / <span class="entry_total">${ article.maxMember }</span> 명
								</div>
							</figure>
						</a>
					</li>
					<!-- //item -->
					</c:forEach>
					</c:if>
				</ul>
				
				<!-- page -->
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
							<a href="./searchGroup.do?pageNum=${ start - 5 }&bcategory=${ bcategoryNum }" onclick="loadNextPage(${start - 5},${bcategoryNum},this)">[이전]</a>
						</c:if>
						<ul class="pagination">
							<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
								<li><a href="./searchGroup.do?pageNum=${ i }&bcategory=${ bcategoryNum }" onclick="loadNextPage(${i},${bcategoryNum},this)">${ i }</a></li>
							</c:forEach>
						</ul>
						<c:if test="${ endPage < pageCount }">
							<a href="./searchGroup.do?pageNum=${ start + 5 }&bcategory=${ bcategoryNum }" onclick="loadNextPage(${start + 5},${ bcategoryNum },this)">[이후]</a>
						</c:if>
					</div>
				</c:if>
				</div>
				<!-- //page -->
			</div>
		</div>
		
		
	</div>
	<!--// searchGroup 내용영역 -->
	
</body>
</html>