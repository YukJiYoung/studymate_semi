
/* 상세선택 버튼 추가&삭제 */
$("#detail_search_collapse label").click(function(){
		var name = $(this).text();
		console.log(name);
		var addspan = "";
		addspan += "<span class='btn btn-default'>" + name + "</span>";
		$("#select_detail").append(addspan);
});
$(document).on('click','#select_detail>span',function(event){
	var name = $(this).text();
//	console.log(name);
//	$(event).remove();
	$("#detail_search_collapse label").each(function(){
		var inputText = $(this).text();
		if(inputText.match(name)){
			$(this).find('input').prop('checked',false);
		}
	});
	
});

/* bcategory ajax */
function loadNextPage(pageNum,bcategoryNum,event) {
	var big_category = $(".big_category>ul>li>button");
	big_category.removeClass("active"); 
	$(event).addClass("active");
	
	var param = "pageNum=" + pageNum + "&bcategory=" + bcategoryNum;
	var url = "searchGroup.do?" + param;
	history.pushState(null, null, url); // 페이지의 상태를 history객체에 넣어줌. push라면 젤 끝에 넣어주는것.
	$('.result_item_wrapper').load("searchGroupAjax.do?" + param);
}
//<-버튼으로 이전페이지로 이동할때 그 페이지의 내용을 로드
$(window).on('popstate', function(event){
	var big_category = $(".big_category>ul>li>button");
	big_category.removeClass("active");
	big_category.blur();
	//var big_index = parseInt('${bcategoryNum}');
	//console.log(big_index);
	//big_category.eq(big_index).addClass("active");
	$('.result_item_wrapper').load(location.href + ' .result_item_wrapper');
});
