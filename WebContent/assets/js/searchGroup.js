$(document).ready(function(){
	
	/* 상세선택 버튼 추가&삭제 */
	$("#detail_search_collapse label").click(function(event){
		event.preventDefault();
		var name = $(this).text();
		var checkbox = $(this).find('input');
		var check = checkbox.prop('checked');
		var span = $("#select_detail>span");
		var addspan = "";
		if(!check){
			checkbox.prop('checked',true);
			addspan += "<span class='btn btn-default'>" + name + "</span>";
			$("#select_detail").append(addspan);
			return false;
		}else{
			checkbox.prop('checked',false);
			span.each(function(){
				var spanText = $(this).text();
				var i = $(this).index();
				if(spanText.match(name)){
					span.eq(i).remove();
				}
			});
			return false;
		}
	});
	
});
//span 클릭하면 삭제,check도 해제
$(document).on('click','#select_detail>span',function(event){
	var name = $(this).text();
	var i = $(this).index();
	
	$("#detail_search_collapse label").each(function(){
		var inputText = $(this).text();
//		console.log(inputText);
		if(inputText.match(name)){
			$(this).find('input').prop('checked',false);
			$("#select_detail>span").eq(i).remove();
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
	return false;
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