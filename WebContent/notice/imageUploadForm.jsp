<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>이미지사이즈 체크</title>

</head>
<body>
	<form name='board'> 
		<div class="imgout">
			<img id="preview" src="" width="300" alt="로컬에 있는 이미지가 보여지는 영역">
		</div>
		<input type="file" id="getfile" accept="image/*">
		
	</form>
	<script>
		var file = document.querySelector('#getfile');
		
		file.onchange = function () {
		    var fileList = file.files ;
		
		    // 읽기
		    var reader = new FileReader();
		    reader.readAsDataURL(fileList [0]);
		
		    //로드 한 후
		    reader.onload = function  () {
		        document.querySelector('#preview').src = reader.result ;
		    };
		};
	</script>
</body>

</html>