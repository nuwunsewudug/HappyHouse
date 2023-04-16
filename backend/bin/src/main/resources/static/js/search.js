var searchTarget = [];



$(document).ready(function() {
	$.ajax({
		type:'get',
		url:'http://127.0.0.1:1010/happyhouse/transaction',
		data: {
			"gugun":"11110",
			"year":"2022",
			"month":"02"
		},
		contentType: 'application/json; charset=UTF-8',
		success: function(result) {
			setTransactionList(result['response']['body']['items']['item']);
		},
		error: function(a,b,c) {
			console.log(a+b+c);
		}
	
	})
})

$(document).on('keyup', 'input[id="search-text"]', function (e) {
  let name = $(e.target).val();
  if (e.keyCode == 13) {
	  getSearchList(name);
  }
});

$(document).on('click', '#search', function (e) {
  let name = $('input[id="search-text"]').val();
  getSearchList(name);
});

$(document).on('click', '.item', function(e) {
// console.log(e.target.parentNode)
	  let aptName = $(e.target).parents('.item').children('.item-name').text().trim();
	  
	  getSearchList(aptName);
})

$(document).on('change', '#dong', function () {
	  var sido = $('#sido option:checked').text();
	  var gugun = $('#gugun option:checked').text();
	  var dong = $('#dong option:checked').text();
	  console.log(sido, gugun, dong);
	  
	  getSearchListByDongName(dong);	  
	  
	});

$(document).on('change', '#gugun', function() {
		var sido = $('#sido option:checked').val();
		var gugun = $('#gugun option:checked').val();
		
		getTransactionList(gugun.substring(0,5)); 
	  
})
function getSearchList(name) {
	let result = [];
	for(let i=0;i<searchTarget.length;i++) {
		if(searchTarget[i]['아파트'].includes(name) || searchTarget[i]['아파트'] == name) {
			result.push(searchTarget[i]);
		}
	}
	setTransactionList(result);	
}

function getSearchListByDongName(dongName) {
	let result = [];
	for(let i=0;i<searchTarget.length;i++) {
		if(searchTarget[i]['법정동'] == dongName) {
			result.push(searchTarget[i]);
		}			
	}
	setTransactionList(result);
}

function getTransactionList(gugun) {
	$.ajax({
		type:'get',
		url:'http://127.0.0.1:1010/happyhouse/transaction',
		data: {
			'gugun':gugun,
			'year':'2022',
			'month':'02'
		},		
		contentType: 'application/json; charset=UTF-8',
		success: function(result) {
			setTransactionList(result['response']['body']['items']['item']);
		},
		error: function(a,b,c) {
			console.log(a+b+c);
		}
	
	})
} 

function setTransactionList(jsonData) {
	result = '';
	
	searchTarget = jsonData;
// console.log(searchTarget)
		
    for (var i = 0; i < jsonData.length; i++) {
      // console.log(jsonData[i]);
      var yearMonth = String(jsonData[i]['년']) + String(jsonData[i]['월']);
      var day = jsonData[i]['일'];
      var name = jsonData[i]['아파트'];
      var area = jsonData[i]['전용면적'];
      var price = jsonData[i]['거래금액'];
      var roadName = jsonData[i]['도로명'];
      var dongName = jsonData[i]['법정동'];


      var text = `
      <div class="item">
          <div class="item-name">
              ${name}
          </div>
          <div class="item-info">
              <div class="price">거래금액 : ${price}만원</div>
              <div class="area">면적 : ${area}m²</div>
          </div>
          <div class="date">
              <i class="fa-regular fa-calendar-days"></i>
              ${yearMonth.slice(0, 4)}.${yearMonth.slice(4, 6)}.${day}
          </div>
          <div class="item-road" style="display: none">
              ${roadName}
          </div>
          <div class="item-dong" style="display: none">
              ${dongName}
          </div>                                                
      </div>`;

      result += text;
    }

    $('.item-list').html(result);
}




// 로그인 상태를 체크하는 함수
function loginOutCheck() {
  // 로그인 여부 체크
  let log = localStorage.getItem('login');
  log = JSON.parse(log);

  if (log) {
    // 로그인 한 상태라면
    console.log('login');
    $('#login-banner').css('display', 'none');
    $('#logout-banner').css('display', '');
  } else {
    console.log('logout');
    $('#login-banner').css('display', '');
    $('#logout-banner').css('display', 'none');
  }
}

//
// 거래정보를 클릭 시 지도에 뿌려주기
$(document).on('click', '.item', function (e) {
  // console.log(e.target.parentNode)
  var aptName = $(e.target).parents('.item').children('.item-name').text();
  var aptLoad = $(e.target).parents('.item').children('.item-road').text();
  aptLoad = $.trim(aptLoad);
// console.log(aptLoad)

  // #1. fetch latlngjson.json
  fetch('./static/data/latlngjson.json')
    .then((response) => {
      return response.json();
    })
    .then((jsonData) => {
// console.log(jsonData)
      var result = '';
      for (var i = 0; i < 25000; i++) {
        // #2. 도로명(loadName)이랑 일치하는 위도, 경도 구하기
        var loadAddress = String(jsonData[i]['도로명주소']);

        if (loadAddress.includes(aptLoad)) {
          var lat = String(jsonData[i]['위도']) * 1;
          var long = String(jsonData[i]['경도']) * 1;
// console.log(lat);
// console.log(long);
          // #3. 해당위치 지도 띄우고 마크찍기
          var container = document.getElementById('map'); // 지도를 담을 영역의 DOM
															// 레퍼런스
          var options = {
            // 지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(lat, long), // 지도의 중심좌표.
            level: 1, // 지도의 레벨(확대, 축소 정도)
          };

          var map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴

          // 마커가 표시될 위치입니다
          var markerPosition = new kakao.maps.LatLng(lat, long);

          // 마커를 생성합니다
          var marker = new kakao.maps.Marker({
            position: markerPosition,
          });

          // 마커가 지도 위에 표시되도록 설정합니다
          marker.setMap(map);

          // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
          var iwContent = `<div style="padding:5px;">${aptName}</div>`; // 인포윈도우에
																		// 표출될
																		// 내용으로
																		// HTML
																		// 문자열이나
																		// document
																		// element가
																		// 가능합니다

          // 인포윈도우를 생성합니다
          var infowindow = new kakao.maps.InfoWindow({
            content: iwContent,
          });

          // 마커에 마우스오버 이벤트를 등록합니다
          kakao.maps.event.addListener(marker, 'mouseover', function () {
            // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
            infowindow.open(map, marker);
          });

          // 마커에 마우스아웃 이벤트를 등록합니다
          kakao.maps.event.addListener(marker, 'mouseout', function () {
            // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
            infowindow.close();
          });

          break;
        }
      }
    });
});

let url = 'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes';
let regcode = '*00000000';
// 전국 특별/광역시, 도
// https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000
$.ajax({
  url: url,
  type: 'GET',
  data: {
    regcode_pattern: regcode,
  },
  dataType: 'json',
  success: function (response) {
    let code = ``;
    $.each(response.regcodes, function (i, regcode) {
      code += `
            <option value="${regcode.code}">${regcode.name}</option>
            `;
    });
    $('#sido')
      .empty()
      .append('<option value="">시도선택</option>')
      .append(code);
  },
  error: function (xhr, status, msg) {
    console.log('상태값 : ' + status + ' Http에러메시지 : ' + msg);
  },
});

$(document).on('change', '#sido', function () {
  regcode = $(this).val().substr(0, 2) + '*00000';
  $.ajax({
    url: url,
    type: 'GET',
    data: {
      regcode_pattern: regcode,
      is_ignore_zero: true,
    },
    dataType: 'json',
    success: function (response) {
      let code = ``;
      $.each(response.regcodes, function (i, regcode) {
        code += `
            <option value="${regcode.code}">${
          regcode.name.split(' ')[1]
        }</option>
            `;
      });
      $('#gugun')
        .empty()
        .append('<option value="">구군선택</option>')
        .append(code);
    },
    error: function (xhr, status, msg) {
      console.log('상태값 : ' + status + ' Http에러메시지 : ' + msg);
    },
  });
});

$(document).on('change', '#gugun', function () {
  regcode = $(this).val().substr(0, 4) + '*';
  $.ajax({
    url: url,
    type: 'GET',
    data: {
      regcode_pattern: regcode,
      is_ignore_zero: true,
    },
    dataType: 'json',
    success: function (response) {
      let code = ``;
      $.each(response.regcodes, function (i, regcode) {
        code += `
            <option value="${regcode.code}">${
          regcode.name.split(' ')[2]
        }</option>
            `;
      });
      $('#dong')
        .empty()
        .append('<option value="">동선택</option>')
        .append(code);
    },
    error: function (xhr, status, msg) {
      console.log('상태값 : ' + status + ' Http에러메시지 : ' + msg);
    },
  });
});
