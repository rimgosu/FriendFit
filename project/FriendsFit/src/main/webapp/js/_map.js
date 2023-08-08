/**
 * 
 */

 

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(33.450936, 126.569477), // 지도의 중심좌표
		level: 3, // 지도의 확대 레벨
		mapTypeId: kakao.maps.MapTypeId.ROADMAP
		// 지도종류
	};

// 지도를 생성한다 
var map = new kakao.maps.Map(mapContainer, mapOption);

// 전역 변수 positions 정의
var positions = [];

// 위도와 경도를 받아 positions에 추가하는 함수
function addPosition(content, latitude, longitude) {
    positions.push({
        content: `<div>${content}</div>`,
        latlng: new kakao.maps.LatLng(latitude, longitude)
    });
}

// 예제 사용법
addPosition('카카오', 37.5096, 127.0000);
addPosition('생태연못', 33.450936, 126.569477);
addPosition('텃밭', 33.450879, 126.569940);
addPosition('근린공원', 33.451393, 126.570738);
addPosition('근린공원', 34.451393, 127.570738);

for (var i = 0; i < positions.length; i++) {
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		map: map, // 마커를 표시할 지도
		position: positions[i].latlng
		// 마커의 위치
	});
	attachClickEvent(marker);


	// 마커에 표시할 인포윈도우를 생성합니다 
	var infowindow = new kakao.maps.InfoWindow({
		content: positions[i].content
		// 인포윈도우에 표시할 내용
	});

	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	// 이벤트 리스너로는 클로저를 만들어 등록합니다 
	// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(
		map, marker, infowindow));
	kakao.maps.event.addListener(marker, 'mouseout',
		makeOutListener(infowindow));
	// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
	// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
	kakao.maps.event.addListener(marker, 'click', function() {
		
	});

}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
	return function() {
		infowindow.open(map, marker);
	};
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
	return function() {
		infowindow.close();
	};
}

function attachClickEvent(marker) {
	kakao.maps.event.addListener(marker, 'click', function() {
		sendDataToServlet(marker.getPosition().toString());
		console.log(marker.getPosition().toString());
	});
}

kakao.maps.event.addListener(marker, 'click', function() {
	// mapv2 area
	
});

function sendDataToServlet(data) {
	var url = "mapClickService?data=" + encodeURIComponent(data);
	window.location.href = url; // 페이지를 해당 URL로 이동시킵니다.
}