<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="customerboard.BoardDBBean"%>
<%@ page import="customerboard.BoardDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String url = String.valueOf(request.getRequestURL()); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>StudyMate :: 고객지원 게시판</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../../../assets/ico/favicon.png" />
<link rel="apple-touch-icon-precomposed" href="../../../assets/ico/apple-touch-icon-144-precomposed.png" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="../../../assets/css/bootstrap.min.css" />

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="../../../assets/css/nanumfont.css" />

<!-- 반응형 웹을 지원하지 않을 경우 -->
<!-- <link rel="stylesheet" href="../../../assets/css/non-responsive.css" /> -->

<!-- IE8 이하 버전 지원 -->
<!--[if lt IE 9]>
	<script type="text/javascript" src="../../../assets/js/html5shiv.js"></script>
	<script type="text/javascript" src="../../../assets/js/respond.min.js"></script>
<![endif]-->

<!-- IE10 반응형 웹 버그 보완 -->
<!--[if gt IE 9]>
	<link rel="stylesheet" type="text/css" href="../../../assets/css/ie10.css" />
	<script type="text/javascript" src="../../../assets/js/ie10.js"></script>
<![endif]-->

<!-- css link  -->
	<link rel="stylesheet" type="text/css" href="../../../assets/css/layout.css" />
	<link rel="stylesheet" type="text/css" href="../../../assets/css/notice.css" />
	<decorator:head /> 
<!-- //css link  -->

<!-- Javascript -->
<script src="../../../assets/js/jquery-3.1.1.min.js"></script>
<script src="../../../assets/js/bootstrap.min.js"></script>

<style type="text/css">
	/** 메뉴바 배경색 */
.non_background .navbar-wrapper {
	background-color:#4db8bd;
}
</style>

</head>
<c:set var="memId" value="${ memId }" />
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
					<a class="navbar-brand" href="<c:url value="/index.do" />">StudyMate</a>
					<!--// 로고 -->
				</div>
				<!--// 로고 영역 -->
				<!-- 메뉴 영역 -->
				<div class="navbar-collapse collapse">
					<!-- 메인메뉴 -->
					<ul class="nav navbar-nav navbar-right">
						<li><a href="<c:url value="/index.do" />">Home</a></li>
						<li class="active"><a href="<c:url value="/searchGroup.do" />">스터디그룹</a></li>
						<li><a href="<c:url value="/addGroup.do" />">그룹등록</a></li>
						<!-- Trigger the modal with a button -->
						<c:if test="${ memId == null }">
							<li><a href="#" data-toggle="modal" data-target="#login_modal">로그인</a></li>
						</c:if>
						<c:if test="${ memId != null }">
							<li><a href="#" data-toggle="modal" data-target="#logout_modal">로그아웃</a></li>
							<li><a href="#">마이페이지</a></li>
						</c:if>
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
						<form id="login_form" action="<c:url value="/logon/loginPro.do" />" name="login_form" method="post">
							<input type="hidden" name="url" value="<%= url %>" /> 
							<div class="form-group">
								<input type="text" name="id" placeholder="ID" class="form-control">
							</div>
							<div class="form-group">
								<input type="password" name="passwd" placeholder="Password" class="form-control">
							</div>
							<div class="row modal_login_btns">
								<button type="submit" class="col-sm-6 btn btn-info">로그인</button>
								<button type="button" class="btn btn-default" onclick="window.location.href='../../../logon/inputForm.do'">회원가입</button>
							</div>
							<div class="row modal_login_btns">
								<button type="button" class="col-sm-6 btn btn-default" onclick="window.location.href='../../../logon/searchIdForm.do'">ID찾기</button>
								<button type="button" class="col-sm-6 btn btn-default" onclick="window.location.href='../../../logon/changePwForm.do'">Password찾기</button>
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
		
		<!-- Modal -->
		<div id="logout_modal" class="modal fade" role="dialog">
			<div class="modal-dialog modal-sm">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">로그아웃</h4>
					</div>
					<div class="modal-body text-center">
						<form id="logout_form" action="<c:url value="/logon/logout.do" />" name="logout_form" method="post">
							<input type="hidden" name="url" value="<%= url %>" />
							<div class="text-center">
								${ memId } 님<br />
								로그아웃 하시겠습니까?<br /><br /><br />
							</div>
							<div class="row modal_login_btns">
								<button type="submit" class="col-sm-6 btn btn-danger">로그아웃</button>
								<button type="button" class="col-sm-6 btn btn-default" data-dismiss="modal">취소하기</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
		<!-- //Modal -->
		
	</header>





	<div class="container" style="margin-top:100px; min-height:600px;">
		<ul class="nav nav-tabs">
			<li><a data-toggle="tab" href="#answer">자주 묻는 질문</a></li>
			<li><a data-toggle="tab" href="#qnalist">문의/답변 목록</a></li>
<!-- 			<li class="active"><a data-toggle="tab" href="#question">문의하기</a></li> -->
			<li class="active"><a data-toggle="tab" href="#question" onclick="window.location.href='./writeForm.do';">문의하기</a></li>
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
			<div id="qnalist" class="tab-pane fade">
				
			<!-- customer -->
			<div class="container">
			
			<%!/* 게시판시작 */
					int pageSize = 10;
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
				<%
					String pageNum = request.getParameter("pageNum");
					if (pageNum == null) {
						pageNum = "1";
					}

					int currentPage = Integer.parseInt(pageNum);
					//System.out.println(currentPage);
					int startRow = (currentPage * 10) - 9;
					int endRow = currentPage * pageSize;
					int count = 0;
					int number = 0;

					List articleList = null;
					BoardDBBean dbPro = BoardDBBean.getInstance();
					count = dbPro.getArticleCount();
					if (count > 0) {
						articleList = dbPro.getArticles(startRow, endRow);
					}

					number = count - (currentPage - 1) * pageSize;
					// 11 -(2-1)*3 =8
				%>


<div class="container">
  <h1>글 목록(전체 글:<%=count%>)</h1>

</div>
					


					<%
						if (count == 0) {
					%>

<div class="container">
  <h1>게시판에 저장된 글이 없습니다.</h1>

</div>
						

					<%
						} else {
					%>


<div class="container">
  <table class="table">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
        <th>IP</th>
      </tr>
        <%
							for (int i = 0; i < articleList.size(); i++) {
									BoardDataBean article = (BoardDataBean) articleList.get(i);
				%>
<tr height="30">
							<td align="center" width="50"><%=number--%></td>
							<td width="250">
								<%
									int wid = 0;
											if (article.getRefLevel() > 0) { //답변글이라면...
												wid = 5 * (article.getRefLevel());
								%> <img class="customerimg" src="../images/level.gif" width="<%=wid%>" height="16">
								<img class="customerimg" src="../images/re.gif"> <%
 	} else {
 %> <img class="customerimg" src="../images/level.gif" width="<%=wid%>" height="16">
								<%
									}
								%> <a
								href="../content.do?qNum=<%=article.getqNum()%>&pageNum=<%=currentPage%>">
									<%=article.getqTitle()%></a> <%
 	if (article.getReadcount() >= 20) {
 %> <img class="customerimg" src="../images/hot.gif" border="0" height="16"> <%
 	}
 %>
							</td>
							<td align="center" width="100"><a href="mailto:<%=article.getEmail()%>"><%=article.getqWriter()%></a></td>
							<td align="center" width="150"><%=sdf.format(article.getqDate())%></td>
							<td align="center" width="50"><%=article.getReadcount()%></td>
							<td align="center" width="100"><%=article.getIp()%></td>
</tr>
						<%
							}
						%>
					</table>
					<%
						}
					%>
					
					<%
						if (count > 0) {
							//전체 페이지의 수를 연산
							int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

							int startPage = (int) (currentPage / 5) * 5 + 1;
							int pageBlock = 5;
							int endPage = startPage + pageBlock - 1;
							if (endPage > pageCount)
								endPage = pageCount;

							if (startPage > 5) {
					%>
					<a href="../list.jsp?pageNum=<%=startPage - 5%>">[이전]</a>
					<%
						}
							for (int i = startPage; i <= endPage; i++) {
					%>
					<a href="../list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
					<%
						}
							if (endPage < pageCount) {
					%>
					<a href="../list.jsp?pageNum=<%=startPage + 5%>">[다음]</a>
					<%
						}
						}
					%>

					<form action="boardList.action" name="search" method="post">

						<select name="keyField" size="1">
							<option value="name"
								<c:if test="${'name'==keyField }"> selected</c:if>>이름</option>
							<option value="title"
								<c:if test="${'title'==keyField }"> selected</c:if>>제목</option>
							<option value="content"
								<c:if test="${'content'==keyField }"> selected</c:if>>
								내용</option>
						</select> <input type="text" size="16" name="keyWord" value="${keyWord }">
						<input type="button" value="검색" onClick="check()"> <input
							type="hidden" name="page" value="0">
						
					</form>
				<br>
			</div>
				
			</div>
			<!-- //qna -->
			
			<!-- 문의하기 -->
			<div id="question" class="tab-pane fade in active">

				<decorator:body/>
			
			</div>
			<!-- //문의하기 -->
	</div>
</div>
</div>
	<!-- 푸터 -->
	<footer class="footer-wrapper" >
		<div class="container">
			<div class="row">
				<div class="col-sm-4 text-center">
					<h1><a href="<c:url value="/" />">StudyMate</a></h1>
				</div>
				<div class="col-sm-8 footer_content text-center">
					<ul class="nav navbar-nav footer_menu text-center">
						<li><a href="<c:url value="/customer.do" />">고객지원</a></li>
						<li><a href="<c:url value="/index.do" />">이용안내</a></li>
						<li><a href="<c:url value="/index.do" />">개인정보 취급방침</a></li>
						<!-- Trigger the modal with a button -->
						<li><a href="#" data-toggle="modal" data-target="#leave_modal">탈퇴하기</a></li>
					</ul>
					<br />
					<address>
						<p><span class="address">주소 : 서울특별시 강남구 역삼동</span><span class="tel">Tel 	: 1234-5678</span></p>
						<p>Copyright&copy;2016. <a href="<c:url value="/index.do" />">studymate.co.kr</a>. All rights resurved</p>
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
						<form id="leave_form" action="<c:url value="/logon/deletePro.do" />" name="leave_form" method="post">
							<div class="form-group">
								<input type="password" placeholder="Password" class="form-control">
							</div>
							<div class="form-group">
								<input type="password" placeholder="Password 확인" class="form-control">
							</div>

							<p class="row">탈퇴하시면 고객님의 모든 정보가 삭제됩니다.<br />탈퇴하시겠습니까?</p>

							<div class="row modal_leave_btns">
								<button type="button" class="col-sm-6 btn btn-warning" data-dismiss="modal">취소</button>
								<button type="submit" class="col-sm-6 btn btn-danger">확인</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
		<!-- //Modal -->
		
	</footer>
	<!--// 푸터 -->


</body>
</html>