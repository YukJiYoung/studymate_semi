<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="customerboard.BoardDBBean"%>
<%@ page import="customerboard.BoardDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>


<html>
<head>
<title>게시판</title>

</head>


<body class="non_background">
	<!-- customer -->
	<%!/* 게시판시작 */
		int pageSize = 10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>
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
			%> 
					<img class="customerimg" src="images/level.gif" width="<%=wid%>" height="16">
					<img class="customerimg" src="images/re.gif"> 
			<%
						} else {
			%> 
					<img class="customerimg" src="images/level.gif" width="<%=wid%>" height="16">
			<%
						} //end if
			%> 
					<a href="./content.do?qNum=<%=article.getqNum()%>&pageNum=<%=currentPage%>"><%=article.getqTitle()%></a>
		 	<%
					 	if (article.getReadcount() >= 20) {
		 	%> 
		 			<img class="customerimg" src="images/hot.gif" border="0" height="16"> 
		 	<%
		 				}
		 	%>
				</td>
				<td align="center" width="100"><a href="mailto:<%=article.getEmail()%>"><%=article.getqWriter()%></a></td>
				<td align="center" width="150"><%=sdf.format(article.getqDate())%></td>
				<td align="center" width="50"><%=article.getReadcount()%></td>
				<td align="center" width="100"><%=article.getIp()%></td>
			</tr>
			<%
				} //end for
			%>
		</table>
	<%
		} //end if
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
	<a href="./list.jsp?pageNum=<%=startPage - 5%>">[이전]</a>
	<%
			}
			for (int i = startPage; i <= endPage; i++) {
	%>
	<a href="./list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
	<%
			} //end for
			if (endPage < pageCount) {
	%>
	<a href="./list.jsp?pageNum=<%=startPage + 5%>">[다음]</a>
	<%
			}
		} //end if
	%>

	<form action="boardList.action" name="search" method="post">

		<select name="keyField" size="1">
			<option value="name"
				<c:if test="${'name' eq keyField }"> selected</c:if>>이름</option>
			<option value="title"
				<c:if test="${'title' eq keyField }"> selected</c:if>>제목</option>
			<option value="content"
				<c:if test="${'content'eq keyField }"> selected</c:if>>내용</option>
		</select> <input type="text" size="16" name="keyWord" value="${keyWord }">
		<input type="button" value="검색" onClick="check()"> <input type="hidden" name="page" value="0">
	</form>
	<br>
	</div>

</body>
</html>