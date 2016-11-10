<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html> 
<html>
<head>
<title>회원정보 수정 완료</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<table width="270" border="0" cellspacing="0" cepppadding="5" align="center">
		<tr bgcolor="${ title_c }">
			<td hegiht="39" align="center"><font size="+1"><b>회원정보가 수정되었습니다.</b></font></td>
		</tr>
		<tr>
			<td bgcolor="${ value_c }" align="center"><p>입력하신 내용대로 수정이 완료되었습니다.</p></td>
		</tr>
		<tr>
			<td bgcolor="${ value_c }" align="center">
			<form>
				<input type="button" value="메인으로" onclick="window.location='/studymate/logon/main.do'" />
			</form>
				5초후에 메인으로 이동합니다.<meta http-equiv="Refresh" content="5;url=/studymate/logon/main.do">
			</td>
		</tr>
	</table>
</body>
</html>