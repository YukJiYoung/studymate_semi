<%@ page contentType="text/html; charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>StudyMate :: 문의/답변 게시판</title>

</head>

<body class="notice non_background">
	<!-- 내용영역 -->
	<div class="container" style="margin-top:100px; min-height:600px;">
		<ul class="nav nav-tabs" style="padding-top: 80px;">
			<li class="active"><a data-toggle="tab" href="#answer">자주 묻는 질문</a></li>
			<li><a data-toggle="tab" href="#qnalist">문의/답변 목록</a></li>
			<li><a data-toggle="tab" href="#question">문의하기</a></li>
		</ul>
 
		<div class="tab-content">
			<!-- 자주 묻는 질문 -->
			<div id="answer" class="tab-pane fade in active">
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
				<div id="qnalist" class="tab-pane fade">
					<div class="container">
						<div class="row text-right">
							<a href="/semi/notice/writeForm.do" class="btn btn-info btn-lg">글쓰기</a>
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
											<td width="50"><c:out value="${ number }" /> <c:set
													var="number" value="${ number-1 }" /></td>
											<td width="250"><c:if test="${ article.re_level > 0 }">
													<img src="images/level.gif" width="${ 5*article.re_level }"
														height="16" />
													<img src="images/re.gif" />
												</c:if> <c:if test="${ article.re_level == 0 }">
													<img src="images/level.gif" width="${ 5*article.re_level }"
														height="16" />
												</c:if> <a
												href="/semi/customer/content.do?num=${ article.num }&pageNum=${ currentPage }">${ article.subject }</a>
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
							<c:set var="pageCount"
								value="${ count / pageSize + (count%pageSize==0 ? 0 : 1) }" />
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
									<a href="/semi/customer/list.do?pageNum=${ start - 10 }">[이전]</a>
								</c:if>
								<ul class="pagination">
									<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
										<li><a href="/semi/customer/list.do?pageNum=${ i }">${ i }</a></li>
									</c:forEach>
								</ul>
								<c:if test="${ endPage < pageCount }">
									<a href="/semi/customer/list.do?pageNum=${ start + 10 }">[이후]</a>
								</c:if>
							</div>
						</c:if>
					</div>
				</div>
				<!-- //qna -->
			
			<!-- 문의하기 -->
			<div id="question" class="tab-pane fade">

				<form>
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
</body>
</html>