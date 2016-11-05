$(function() {
		
		/* 파일 확장자 가져오기 */
		function getFileExtension(filePath) {
			var lastIndex = -1;
			lastIndex = filePath.lastIndexOf('.');
			var extension = "";

			if (lastIndex != -1) {
				extension = filePath.substring(lastIndex + 1, filePath.len);
			} else {
				extension = "";
			}
			return extension;
		}
		
		/* 파일 확장자 체크하기 */
		function fnImg_Check(value) {
			var fileType = getFileExtension(value).toLowerCase();

			if (!((fileType == "gif") || (fileType == "jpg") || (fileType == "jpeg") || (fileType =="png") || (fileType =="bmp"))) {
				alert('이미지 파일만 선택할 수 있습니다.');
				return;
			}
			
			if(fileType == "bmp"){
				var upload = confirm("bmp 파일은 웹상에서 사용하기엔 적절한 이미지 포맷이 아닙니다.\n그래도 계속 하시겠습니까?");
				if(!upload) return false;
			}
			
			LoadImg(value);
		}
		
		/*  */
		function LoadImg(value) {
			var imgInfo = new Image();
			imgInfo.onload = img_Load;
			imgInfo.src = value;
		}
		
		/*  */
		function img_Load() {
			var imgWidth, imgHeight, imgFileSize;
			var maxFileSize = 5000; // 이미지사이즈 제한(5MB)

			imgWidth = this.width;
			imgHeight = this.height;
			imgFileSize = Math.round(this.fileSize / 1024);

			if (imgFileSize > maxFileSize) {
				alert("등록하실 첨부파일 이미지가 용량을 초과하였습니다.");
				return;
			}

			// 이미지 사이즈 저장
			document.all.imgWidth.value = imgWidth;
			document.all.imgHeight.value = imgHeight;

			var imgName = document.board.fileName.value;
			var imgType = getFileExtension(imgName);

			$("#IMG_SIZE_W").innerText = imgWidth;
			$("#IMG_SIZE_H").innerText = imgHeight;
			$("#IMG_SIZE").innerText = imgFileSize;
			document.board.myImg.src = imgName
			document.board.myImg.style.visibility = 'visible';

			var ary = imgName.split('\\');
			$("#IMG_NAME").innerText = ary[ary.length - 1].split('.')[0] + "." + imgType;

		}
	}); // end ready

function writeSave() {
	if (document.writeform.writer.value == "") {
		alert("작성자를 입력하십시요.");
		document.writeform.writer.focus();
		return false;
	}
	if (document.writeform.subject.value == "") {
		alert("제목를 입력하십시요.");
		document.writeform.writer.focus();
		return false;
	}
	if (document.writeform.content.value == "") {
		alert("내용를 입력하십시요.");
		document.writeform.writer.focus();
		return false;
	}
	if (document.writeform.passwd.value == "") {
		alert("비밀번호를 입력하십시요.");
		document.writeform.writer.focus();
		return false;
	}
}