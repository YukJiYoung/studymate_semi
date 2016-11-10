<%@ page contentType="text/html; charset=utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>StudyMate :: 맞춤형 스터디 솔루션. 스터디메이트에 오신것을 환영합니다.</title>

</head>

<body class="non_background">
	<!-- 공지사항 내용영역 -->
	<div class="container">
		<div class="row text-right">
			<a href="../writeForm.do" class="btn btn-info btn-lg">글쓰기</a>
		</div>
		<div class="table-responsive">
			<c:if test="${ count == 0 }">
				<table class="table text-center">
					<tr>
						<td><h4>게시판에 저장된 글이 없습니다.</h4></td>
					</tr>
				</table>
			</c:if>
			<c:if test="${ count > 0 }">
				<table class="table">
					<tr>
						<th width="50">#</th>
						<th width="250">제 목</th>
						<th width="100">작성자</th>
						<th width="150">작성일</th>
						<th width="50">조 회</th>
						<th width="100">IP</th>
					</tr>
					<c:forEach var="article" items="${ articleList }">
						<%-- 배열이나 구조체는 'items'로 사용 --%>
						<tr>
							<td width="50"><c:out value="${ number }" />
								<c:set var="number" value="${ number-1 }" /></td>
							<td width="250"><c:if test="${ article.re_level > 0 }">
									<img src="images/level.gif" width="${ 5*article.re_level }" height="16" />
									<img src="images/re.gif" />
								</c:if> <c:if test="${ article.re_level == 0 }">
									<img src="images/level.gif" width="${ 5*article.re_level }" height="16" />
								</c:if> <a href="./content.do?num=${ article.num }&pageNum=${ currentPage }">${ article.subject }</a>
								<c:if test="${ article.readcount >= 20 }">
									<span class="label label-danger">HOT</span>
								</c:if></td>
							<td width="100"><a href="mailto:${ article.email }">${ article.writer }</a></td>
							<td width="150">${ article.reg_date }</td>
							<td width="50">${ article.readcount }</td>
							<td width="100">${ article.ip }</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
		
		<c:if test="${ count > 0 }">
			<c:set var="pageCount" value="${ count / pageSize + (count%pageSize==0 ? 0 : 1) }" />
			<c:set var="pageBlock" value="${ 10 }" />
			<fmt:parseNumber var="result" value="${ currentPage / 10 }" integerOnly="true" />
			<%-- result에 페이지 나눈값 저장. 정수만 입력. --%>
			<c:set var="startPage" value="${ result * 10 + 1 }" />
			<c:set var="endPage" value="${ startPage + pageBlock - 1 }" />
			<c:if test="${ endPage > pageCount }">
				<c:set var="endPage" value="${ pageCount }" />
			</c:if>
			<div class="page text-center">
				<c:if test="${ startPage > 10 }">
					<a href=".r/list.do?pageNum=${ start - 10 }">[이전]</a>
				</c:if>
				<ul class="pagination">
					<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
						<li><a href="./list.do?pageNum=${ i }">${ i }</a></li>
					</c:forEach>
				</ul>
				<c:if test="${ endPage < pageCount }">
					<a href="./list.do?pageNum=${ start + 10 }">[이후]</a>
				</c:if>
			</div>
		</c:if>
	</div>
	<!-- //공지사항 내용영역 -->
</body>
</html>