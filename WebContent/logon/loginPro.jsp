<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ check == 1 }">
	  <meta http-equiv="Refresh" content="0; url=${url}"/>  

</c:if>
<c:if test="${ check == 0 }">
	<script>
		alert("비밀번호를 정확하게 입력하세요.");
		history.go(-1); 
	</script>
</c:if>
<c:if test="${ check == -1 }">
	<script>
		alert("등록된 ID가 없습니다.");
		history.go(-1);
	</script>
</c:if>