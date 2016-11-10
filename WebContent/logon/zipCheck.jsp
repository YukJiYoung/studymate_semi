<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, logon.*" %>
<!DOCTYPE html>
<html>
<head>
<title>우편번호검색</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script>
	function dongCheck(){
		if(document.zipForm.area4.value == ""){
			alert("동이름을 입력하세요.");
			document.zipForm.area4.focus();
			return;
		}
		document.zipForm.submit();
	}
	function sendAddress(zipcode, area1, area2, area3, area4){
		var address = area1 + " " + area2 + "" + area3 + " " + area4;
		opener.document.userinput.zipcode.value = zipcode;
		opener.document.userinput.address.value = address;
		self.close();
	}
</script>
</head>0
<body bgcolor="#ffffcc">
	<center>
		<b>우편번호 찾기</b>
		<table>
		<form name="zipForm" method="post" action="/studymate/logon/zipCheck.do">
			<tr>
				<td>
					 <br />
					도로명 주소 입력 : <input type="text" name="area4" />
					<input type="button" value="검색" onclick="dongCheck()" />
				</td>
			</tr>
			<input type="hidden" name="check" value="n" />
		</form>
			<c:if test="${ check eq 'n' }">
				<c:if test="${ totalList == 0 }">
		
					<tr><td align="center"><br>검색된 결과가 없습니다.</td></tr>
		
				</c:if>
				<c:if test="${ totalList > 0 }">
					<tr><td align="center"><br>※ 검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td></tr>
				
					<c:forEach var="zipBean" items="${ zipcodeList }">
						
						<c:set var="tempZipcode" value="${ zipBean.zipcode }" />
						<c:set var="tempArea1" value="${ zipBean.area1 }" />
						<c:set var="tempArea2" value="${ zipBean.area2 }" />
						<c:set var="tempArea3">
							<c:if test="${ zipBean.area3 != null}">&nbsp;${ zipBean.area3 }</c:if>
						</c:set>
						<c:set var="tempArea4" value="${ zipBean.area4 }" />
		
						<tr><td><a href="javascript:sendAddress('${ tempZipcode }','${ tempArea1 }','${ tempArea2 }','${ tempArea3 }','${ tempArea4 }')">
						${ tempZipcode }&nbsp;${ tempArea1 }&nbsp;${ tempArea2 }${ tempArea3 }&nbsp;${ tempArea4 }</a><br /></td></tr>
		
					</c:forEach>
		 		</c:if>
			</c:if>
					<tr><td align="center"><br /><a href="javascript:this.close();">닫기</a></td></tr>
		</table>
	</center>
</body>
</html>