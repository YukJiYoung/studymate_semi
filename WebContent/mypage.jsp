<%@ page contentType="text/html; charset=utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>StudyMate :: 맞춤형 스터디 솔루션. 스터디메이트에 오신것을 환영합니다.</title>
	
	<link rel="stylesheet" type="text/css" href="assets/css/mypage.css" />
	
</head>

<body class="non_background">
	<!-- mypage 내용영역 -->
	<div class="container" style="margin-top: 80px; min-height:600px;">
		<div class="row featurette">
			
		</div>
		
		<hr class="featurette-divider"><!-- 구분선 -->
			
		<div class="row featurette zzimList">
			<div class="table-responsive">
			<h2>찜목록</h2>
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
						<th width="100">카테고리</th>
						<th width="250">그룹명</th>
						<th width="50">그룹장</th>
						<th width="50">그룹멤버</th>
						<th width="100">모임횟수</th>
						<th width="100">장소</th>
						<th width="150">신청현황</th>
					</tr>
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
						<tr>
							<td width="50"><c:out value="${ number }" />
								<c:set var="number" value="${ number-1 }" /></td>
							<td width="100">${ bcategoryKR }&lt;${ article.scategorycode }</td>
							<td width="250"><a href="./groupPage.do?num=${ article.groupNum }">${ article.groupTitle }</a></td>
							<td width="50">${ article.id }</td>
							<td width="50">${ article.nowMember }/${ article.maxMember }</td>
							<td width="100">${ article.meetingCount }</td>
							<td width="100">${ article.location }</td>
							<td width="150">
								<button type="button" class="btn btn-info" onclick="">신청하기</button>
								<button type="button" class="btn btn-info" onclick="">찜삭제</button>
							</td>
						</tr>
						<!-- //item -->
					</c:forEach>
				</table>
			</c:if>
		</div>
		
		
		</div>
		
		<hr class="featurette-divider"><!-- 구분선 -->
			
		<div class="row featurette">
			
		</div>
		
		
	</div>
	<!--// mypage 내용영역 -->
	
</body>
</html>