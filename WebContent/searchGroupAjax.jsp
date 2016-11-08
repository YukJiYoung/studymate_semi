<%@ page contentType="text/html; charset=utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<a href="./searchGroup.do?pageNum=${ start - 5 }&bcategory=${ bcategoryNum }" onclick="loadNextPage(${start - 5},${bcategoryNum})">[이전]</a>
				</c:if>
				<ul class="pagination">
					<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
						<li><a href="./searchGroup.do?pageNum=${ i }&bcategory=${ bcategoryNum }" onclick="loadNextPage(${i},${bcategoryNum})">${ i }</a></li>
					</c:forEach>
				</ul>
				<c:if test="${ endPage < pageCount }">
					<a href="./searchGroup.do?pageNum=${ start + 5 }&bcategory=${ bcategoryNum }" onclick="loadNextPage(${start + 5},${bcategoryNum})">[이후]</a>
				</c:if>
			</div>
		</c:if>
		</div>
		<!-- //page -->