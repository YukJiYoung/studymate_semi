$(document).ready(function() {
	$(document).on('click', '.control nav a', function(event) {
		var url = event.target.href;
		// 다른 페이지로 이동하지 않으면서도 url이 바뀌고, 방문했던 history에 'test.html'을 넣어주기 때문에
		// <-화살표로 페이지 이동해도 이전 페이지로 이동이 잘 된다.
		history.pushState(null, null, url); // 페이지의 상태를 history객체에 넣어줌. push라면 젤 끝에 넣어주는것.
		$('article').load(url + ' article>.content'); //내용 변경하기
	});
	
	//<-버튼으로 이전페이지로 이동할때 그 페이지의 내용을 로드
	$(window).on('popstate', function(event){
//		console.log(event);
		$('article').load(location.href + ' article>.content'); //내용 변경하기
	});
	
});