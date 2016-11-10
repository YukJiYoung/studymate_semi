//필수입력항목 alert창
function checkAdd(){
		var groupinput = eval("document.groupinput"); //문자열을 수식으로 변환(eval()사용)
		
		if(!groupinput.groupName.value){
			alert("모임 이름을 입력하세요.");
			groupinput.groupName.focus();
			return false;
		}
		if(!groupinput.maxMember.selectedIndex ){
			alert("모임 인원을 선택하세요.");
			groupinput.maxMember.focus();
			return false;
		} 
		
		if(!groupinput.limitDate.selectedIndex){
			alert("모집 기간을 선택하세요.");
			groupinput.limitDate.focus();
			return false;
		}
		
		if(!groupinput.bc.selectedIndex){
			alert("스터디 카테고리를 선택하세요.");
			groupinput.bc.focus();
			return false;
		}
		
		if(!groupinput.sc.selectedIndex){
			alert("스터디 카테고리를 선택하세요.");
			groupinput.sc.focus();
			return false;
		}
		
		if(!groupinput.groupGoal.selectedIndex){
			alert("모임 목표를 선택하세요.");
			groupinput.groupGoal.focus();
			return false;
		}
	
		
		
		
		return true;		
	}

//카테고리 selectbox
function sub_change1() {
	vn_mnu1 = groupinput.bcategorycode.selectedIndex;
	if (vn_mnu1 == 1) {
		groupinput.scategorycode.length = 4;
		groupinput.scategorycode.options[0].text = '토익';
		groupinput.scategorycode.options[1].text = '오픽';
		groupinput.scategorycode.options[2].text = '토익스피킹';
		groupinput.scategorycode.options[3].text = '영어회화';
	}
	if (vn_mnu1 == 2) {
		groupinput.scategorycode.length = 4;
		groupinput.scategorycode.options[0].text = '일본어';
		groupinput.scategorycode.options[1].text = '중국어';
		groupinput.scategorycode.options[2].text = '프랑스어';
		groupinput.scategorycode.options[3].text = '기타 언어';

	}
	if (vn_mnu1 == 3) {
		groupinput.scategorycode.length = 4;
		groupinput.scategorycode.options[0].text = '인적성';
		groupinput.scategorycode.options[1].text = '면접';
		groupinput.scategorycode.options[2].text = '자기소개서';
		groupinput.scategorycode.options[3].text = '기타';

	}
	if (vn_mnu1 == 4) {
		groupinput.scategorycode.length = 3;
		groupinput.scategorycode.options[0].text = '공무원';
		groupinput.scategorycode.options[1].text = '국가고시';
		groupinput.scategorycode.options[2].text = '기타';

	}
}



//input file 이미지만 받게하는 코드
function fileCheck(obj) {
	var textnode = document.createTextNode("이미지 파일이 아닐경우 등록버튼이 비활성화 됩니다.");
	var font = document.createElement("font");
	font.style.cssText='color:#F00;';
	var oriText = document.getElementById("text");
    pathpoint = obj.value.lastIndexOf('.');
    filepoint = obj.value.substring(pathpoint+1,obj.length);
    filetype = filepoint.toLowerCase();
    if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp' || filetype=='') {
        // 정상적인 이미지 확장자 파일일 경우 ...  	
    	$('input[type="submit"]').prop('disabled', false);
    } else {
        alert('이미지 파일만 선택할 수 있습니다.');
        $('input[type="submit"]').prop('disabled', true);
        oriText.replaceNode(font.textnode,oriText.val());
        return false;
    }
    if(filetype=='bmp') {
        upload = confirm('BMP 파일은 웹상에서 사용하기엔 적절한 이미지 포맷이 아닙니다.\n그래도 계속 하시겠습니까?');
        if(!upload) return false;
    }
}
//이미지 미리보기 코드 

function readURL(input) {
	 
    if (input.files && input.files[0]) {
        var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
        reader.onload = function (e) {
        //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            $('#preImg').attr('src', e.target.result);
            //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
            //(아래 코드에서 읽어들인 dataURL형식)
        }       
        reader.readAsDataURL(input.files[0]);
        //File내용을 읽어 dataURL형식의 문자열로 저장
    
		}
	}//readURL()--

	//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
	$("#groupImage").change(function(){
		//alert(this.value); //선택한 이미지 경로 표시
		readURL(this);
	
});



// HTML속성을 모달안에서 실행하기 위한 코드
		$('#inputPlace_modal').on('shown.bs.modal', function() {
					
			// 모달 실행 시 input창에 커서가 맨 마지막에 위치시키기 위한 코드
			var v = $('#keyword').val()
			$('#keyword').focus().val('').val(v)
							
			// 모달 내 검색버튼을 자바스크립트에서 구현
			$('#frm').submit(function() {
			searchPlaces();
			return false;
			})

			// 마커를 담을 배열입니다
			var markers = [];

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 3 // 지도의 확대 레벨
						};
			//지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption);

			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places();

			// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
			var infowindow = new daum.maps.InfoWindow({
			zIndex : 1
			});

			//키워드로 장소를 검색합니다
			searchPlaces();

			// 키워드 검색을 요청하는 함수입니다
			function searchPlaces() {

				var keyword = document.getElementById('keyword').value;

				if (!keyword.replace(/^\s+|\s+$/g, '')) {
					alert('키워드를 입력해주세요!');
					return false;
				}

				// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
				ps.keywordSearch(keyword, placesSearchCB);
			}

			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(status, data, pagination) {
				if (status === daum.maps.services.Status.OK) {

					// 정상적으로 검색이 완료됐으면 검색 목록과 마커를 표출합니다			
					displayPlaces(data.places);

					// 페이지 번호를 표출합니다
					displayPagination(pagination);

				} else if (status == daum.maps.services.Status.ZERO_RESULT) {

					alert('검색 결과가 존재하지 않습니다.');
					return;

				} else if (status == daum.maps.services.Status.ERROR) {

					alert('검색 결과 중 오류가 발생했습니다.');
					return;

				}
			}

			// 검색 결과 목록과 마커를 표출하는 함수입니다
			function displayPlaces(places) {
				var placeAdr = "";
					placeTitle = "";
					listEl = document.getElementById('placesList'), 
					menuEl = document.getElementById('menu_wrap'), 
					fragment = document.createDocumentFragment(), 
					bounds = new daum.maps.LatLngBounds(), 
					listStr = '';

				// 검색 결과 목록에 추가된 항목들을 제거합니다
				removeAllChildNods(listEl);

				// 지도에 표시되고 있는 마커를 제거합니다
				removeMarker();
				
				for (var i = 0; i < places.length; i++) {

					// 마커를 생성하고 지도에 표시합니다
					var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude), 
						marker = addMarker(placePosition, i), 
						itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다
					
																	
						// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						// LatLngBounds 객체에 좌표를 추가합니다
						bounds.extend(placePosition);

						// 마커와 검색결과 항목에 mouseover 했을때
						// 해당 장소에 인포윈도우에 장소명을 표시합니다
						// mouseout 했을 때는 인포윈도우를 닫습니다
						// onclick 했을 때 주소를 DB에 저장하는 페이지로 이동합니다
						(function(marker, title, address) {
							
							daum.maps.event.addListener(marker,	'mouseover', function() {								
								displayInfowindow(marker, title);
							});

							daum.maps.event.addListener(marker,	'mouseout', function() {								
								infowindow.close();
							});

						 	/*itemEl.onmouseover = function() {
								displayInfowindow(marker, title);
							};
						
							itemEl.onmouseout = function() {
								infowindow.close();
							}; */
							
							// 목록 클릭 시 선택한 마커를 중심좌표로 이동하고 배경화면 색상 넣기
							itemEl.onclick = function() {
								displayInfowindow(marker, title);					
								map.setCenter(marker.getPosition());
								$('.item').css('background-color','#F3F2F2');
								$(this).css('background-color','#C5E4E6');
								placeTitle = title;
								placeAdr = address;		
								$('#text3').html(title);
							};
							// modal 창 내 등록버튼 클릭 시 상호명과 주소 가져오기 
							$('#btnSave').click(function() {
								$('.adrText1').html(placeTitle);					    					   
							    $('.adrText2').html(placeAdr);
							    $('#inputPlace_modal').modal('hide');
							     	    
							  });

 
							
						})
						
						(marker, places[i].title,	places[i].address);

						fragment.appendChild(itemEl);
				}

				// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
				listEl.appendChild(fragment);
				menuEl.scrollTop = 0;

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}

							// 검색결과 항목을 Element로 반환하는 함수입니다
			function getListItem(index, places) {

				var el = document.createElement('li'), 
					itemStr = '<span class="markerbg marker_'
										+ (index + 1)
										+ '"></span>'
										+ '<div class="info">'
										+ '   <h5>'
										+ places.title + '</h5>';

				if (places.newAddress) {
					itemStr += '    <span>' + places.newAddress
											+ '</span>'
											+ '   <span class="jibun gray">'
											+ places.address + '</span>';
				} else {
					itemStr += '    <span>' + places.address
											+ '</span>';
				}

					itemStr += '  <span class="tel">'
							+ places.phone + '</span>'+"</div>";


					el.innerHTML = itemStr;
					el.className = 'item';

					return el;
			}

			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, idx, title) {
				var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
					imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
					imgOptions = {
						spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
						spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
						offset : new daum.maps.Point(13, 37)
						// 마커 좌표에 일치시킬 이미지 내에서의 좌표
					}, 
					markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions), 
					marker = new daum.maps.Marker({					
						position : position, // 마커의 위치							
						image : markerImage
					});

						marker.setMap(map); // 지도 위에 마커를 표출합니다
						markers.push(marker); // 배열에 생성된 마커를 추가합니다

						return marker;
			}

			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
				for (var i = 0; i < markers.length; i++) {
					markers[i].setMap(null);
				}
				markers = [];
			}

			// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
			function displayPagination(pagination) {
				var paginationEl = document.getElementById('pagination'), 
					fragment = document.createDocumentFragment(), i;

				// 기존에 추가된 페이지번호를 삭제합니다
				while (paginationEl.hasChildNodes()) {
					paginationEl.removeChild(paginationEl.lastChild);
				}

				for (i = 1; i <= pagination.last; i++) {
					var el = document.createElement('a');
						el.href = "#";
						el.innerHTML = i;

					if (i === pagination.current) {
						el.className = 'on';
					} else {
						el.onclick = (function(i) {
							return function() {
								pagination.gotoPage(i);
							}
						})(i);
					}

					fragment.appendChild(el);
				}
				paginationEl.appendChild(fragment);
			}

			// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
			// 인포윈도우에 장소명을 표시합니다
			function displayInfowindow(marker, title) {
				var content = '<div style="padding:5px;z-index:1;">'
							+ title + '</div>';

				infowindow.setContent(content);
				infowindow.open(map, marker);
			}

			// 검색결과 목록의 자식 Element를 제거하는 함수입니다
			function removeAllChildNods(el) {
				while (el.hasChildNodes()) {
					el.removeChild(el.lastChild);
				}
			}
			
})
 
$('#inputPlace_modal').on('hidden.bs.modal', function() {
	
		$('#map_p').css("width", 500).css("height", 450);
			/************ 	modal폼에서 선택했을 때 신청 페이지에 지도를 표시하는 코드   *************/	
			var infowindow_p = new daum.maps.InfoWindow({zIndex:1});

		var mapContainer_p = document.getElementById('map_p'), // 지도를 표시할 div 
		    mapOption_p = {
		        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

		// 지도를 생성합니다     
		var map_p = new daum.maps.Map(mapContainer_p, mapOption_p); 

		// 장소 검색 객체를 생성합니다
		var ps_p = new daum.maps.services.Places(); 

		// 키워드로 장소를 검색합니다
		var inputKeyword = $('.adrText1').html()+$('.adrText2').html();
		ps_p.keywordSearch(inputKeyword, placesSearchCB_p); 
		
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다    
		function placesSearchCB_p (status, data, pagination) {
		    if (status === daum.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds_p = new daum.maps.LatLngBounds();

		        for (var i=0; i<data.places.length; i++) {
		            displayMarker_p(data.places[i]);    
		            bounds_p.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map_p.setBounds(bounds_p);
		    } 
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker_p(place) {
		    
		    // 마커를 생성하고 지도에 표시합니다
		    var marker_p = new daum.maps.Marker({
		        map: map_p, 
		        position: new daum.maps.LatLng(place.latitude, place.longitude) 
		    });

		    // 마커에 클릭이벤트를 등록합니다
		    daum.maps.event.addListener(marker_p, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow_p.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
		        infowindow_p.open(map_p, marker_p);
		    });
		}	
		
})

