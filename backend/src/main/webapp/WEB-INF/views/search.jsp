<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Happy House</title>


    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/search.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto:wght@100&display=swap"
        rel="stylesheet">

    <script src="https://kit.fontawesome.com/b65e009655.js" crossorigin="anonymous"></script>

    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
</head>

<body>
    <header>
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a href="${pageContext.request.contextPath }" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                    <i class="text-primary fa-solid fa-apartment" style="font-size: 30px;"> <span
                            style="font-size: 20px;">happy house</span> </i>

                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03"
                    aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarColor03">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">공지 사항
                                <span class="visually-hidden">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">오늘의 뉴스</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">주변 탐방</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">관심 지역 설정</a>
                        </li>
                    </ul>
                <c:if test="${empty loginInfo}">
                <div id="login-banner">
                    <a href="<%=request.getContextPath()%>/member/login" class="btn btn-primary">로그인</a>
                    <a href="<%=request.getContextPath()%>/member/regist" class="btn btn-secondary">회원가입</a>
                </div>
				</c:if>
				<c:if test="${!empty loginInfo}">
                <div id="logout-banner">
                    <a href="<%=request.getContextPath()%>/member/logout" class="btn btn-primary" id="logout">로그아웃</a>
                    
                    <a href="<%=request.getContextPath()%>/member/memberinfo" class="btn btn-secondary">회원정보</a>
                </div>
                </c:if>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <div class="search-bar d-flex">
            <div class="input-box">
                <input id="search-text" type="text" placeholder="아파트 이름" class="form-control">
                <div id="search" class="btn btn-primary"><i class="fa-solid fa-search"></i></div>
            </div>
            <div class="select-box d-flex">
                <select name="sido" id="sido" class="form-select"></select>
                <select name="gugun" id="gugun" class="form-select">
                    <option value="">구군선택</option>
                </select>
                <select name="dong" id="dong" class="form-select">
                    <option value="">동선택</option>
                </select>
<!--                 <select name="dong" id="dong" class="form-select"> -->
<!--                     <option value="">2022</option> -->
<!--                 </select> -->
<!--                 <select name="dong" id="dong" class="form-select"> -->
<!--                     <option value="">02</option> -->
<!--                 </select> -->
            </div>
        </div>
        <div class="d-flex h-100">
            <aside class="side-menu">
                <div class="title fw-bold fs-5 pt-2 pb-2">거래 정보
	 				<button style="float: right; margin-right: 10px;" id ="changeArc" class="btn btn-outline-primary btn-sm ">평수로 전환</button>
	 				 <button style="float: right; margin-right: 10px; display:none;" id ="returnArc" class="btn btn-outline-primary btn-sm ">제곱미터로 전환</button>
	                <button style="float: right; margin-right: 10px;" id = "priceSort" class="btn btn-outline-primary btn-sm ">가격순</button>
	                <button style="float: right; margin-right: 10px;" id = "areaSort" class="btn btn-outline-primary btn-sm ">면적순</button>
                </div>
                <div class="item-list">
                </div>

            </aside>
            <div class="map-box bg-light h-100 w-100 min-width:1200px">
                <div id="map" style="width: 100%; min-width: 1200px; height:100%"></div>
                <div class="control-box">
                    <div class="custom_typecontrol radius_border d-flex">
                        <div id="btnRoadmap" class="btn btn-sm btn-primary" onclick="setMapType('roadmap')">지도</div>
                        <div id="btnSkyview" class="btn btn-sm btn-light" onclick="setMapType('skyview')">스카이뷰</div>
                    </div>
                    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
                    <div class="custom_zoomcontrol radius_border"> 
                        <span onclick="zoomIn()"><i class="fa-solid fa-plus"></i></span>  
                        <span onclick="zoomOut()"><i class="fa-solid fa-minus"></i></span>
                    </div>
                </div>
            </div>

        </div>

    </main>



    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f7f5fde63f4485e2da2ec94ca2c656b"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(37.56690080111218, 126.97872864067423), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
        kakao.maps.event.addListener(map, 'bounds_changed', function () {
            // 지도 영역정보를 얻어옵니다 
            var bounds = map.getBounds();
            // 영역정보의 남서쪽 정보를 얻어옵니다 
            var swLatlng = bounds.getSouthWest();
            // 영역정보의 북동쪽 정보를 얻어옵니다 
            var neLatlng = bounds.getNorthEast();
            var message = '영역좌표는 남서쪽 위도, 경도는  ' + swLatlng.toString() + '이고';
            message += '북동쪽 위도, 경도는  ' + neLatlng.toString() + '입니다 ';
            // console.log(message);
        });

        // 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
        function setMapType(maptype) {
            var roadmapControl = document.getElementById('btnRoadmap');
            var skyviewControl = document.getElementById('btnSkyview');
            if (maptype === 'roadmap') {
                map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);
                roadmapControl.className = 'btn btn-sm btn-primary';
                skyviewControl.className = 'btn btn-sm btn-light';
            } else {
                map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
                skyviewControl.className = 'btn btn-sm btn-primary';
                roadmapControl.className = 'btn btn-sm btn-light';
            }
        }

        // 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
        function zoomIn() {
            map.setLevel(map.getLevel() - 1);
        }

        // 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
        function zoomOut() {
            map.setLevel(map.getLevel() + 1);
        }

    </script>
    <script>
    var searchTarget = [];

    $(document).ready(function() {
    	$.ajax({
    		type:'get',
    		url:"<%=request.getContextPath()%>/transaction",
    		data: {
    			"gugun":"11110",
    			"year":"2022",
    			"month":"02"
    		},
    		contentType: 'application/json; charset=UTF-8',
    		success: function(result) {
    		
    			let r = JSON.parse(result);		
    			
    			setTransactionList(r['response']['body']['items']['item']);
    			
    				
	
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
    		console.log(sido, gugun);
    		getTransactionList(gugun.substring(0,5)); 
    	  
    })
    function getSearchList(name) {
    	let result = [];
    	for(let i=0;i<this.searchTarget.length;i++) {
    		if(searchTarget[i]['아파트'].includes(name) || searchTarget[i]['아파트'] == name) {
    			result.push(searchTarget[i]);
    		}
    	}
    	setTransactionList(result);	
    }

    function getSearchListByDongName(dongName) {
    	let result = [];
    	for(let i=0;i<this.searchTarget.length;i++) {
    		if(searchTarget[i]['법정동'] == dongName) {
    			result.push(searchTarget[i]);
    		}			
    	}
    	setTransactionList(result);
    }

    function getTransactionList(gugun) {
    	$.ajax({
    		type:'get',
    		url:'<%=request.getContextPath()%>/transaction',
    		data: {
    			'gugun':gugun,
    			'year':'2022',
    			'month':'02'
    		},		
    		contentType: 'application/json; charset=UTF-8',
    		success: function(result) {
    			let r = JSON.parse(result);		
    			setTransactionList(r['response']['body']['items']['item']);
    			
    		},
    		error: function(a,b,c) {
    			console.log(a+b+c);
    		}
    	
    	})
    } 

    
    function setTransactionList(jsonData) {
    	result = '';
    	
    	sortJson = jsonData;
    	searchTarget = jsonData;
        console.log(searchTarget);
    		
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
                  \${name}
              </div>
              <div class="item-info">
                  <div class="price">거래금액 : \${price}만원</div>
                  <div class="area">면적 : \${area}m²</div>
              </div>
              <div class="date">
                  <i class="fa-regular fa-calendar-days"></i>
                  \${yearMonth.slice(0, 4)}.\${yearMonth.slice(4, 6)}.\${day}
              </div>
              <div class="item-road" style="display: none">
                  \${roadName}
              </div>
              <div class="item-dong" style="display: none">
                  \${dongName}
              </div>                                                
          </div>`;

          result += text;
        }

        $('.item-list').html(result);
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
      fetch('data/latlngjson.json')
        .then((response) => {
          return response.json();
        })
        .then((jsonData) => {
      //console.log(jsonData)
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

   	var sortJson;
    var reverse = 0;
    $("#priceSort").click(function() {
		result = '';
    	
		if(reverse == 0){
	        console.log(sortJson);
	        sortJson.sort(function(a,b){
	    		return parseFloat(a.거래금액) - parseFloat(b.거래금액)
	    	});
	        reverse++;
		}else{
	        console.log(sortJson);
	    	sortJson.sort(function(a,b){
	    		return parseFloat(b.거래금액) - parseFloat(a.거래금액)
	    	});
	    	reverse--;
		}
        
        for (var i = 0; i < sortJson.length; i++) {
          var yearMonth = String(sortJson[i]['년']) + String(sortJson[i]['월']);
          var day = sortJson[i]['일'];
          var name = sortJson[i]['아파트'];
          var area = sortJson[i]['전용면적'];
          var price = sortJson[i]['거래금액'];
          var roadName = sortJson[i]['도로명'];
          var dongName = sortJson[i]['법정동'];

        
          var text = `
          <div class="item">
              <div class="item-name">
                  \${name}
              </div>
              <div class="item-info">
                  <div class="price">거래금액 : \${price}만원</div>
                  <div class="area">면적 : \${area}m²</div>
              </div>
              <div class="date">
                  <i class="fa-regular fa-calendar-days"></i>
                  \${yearMonth.slice(0, 4)}.\${yearMonth.slice(4, 6)}.\${day}
              </div>
              <div class="item-road" style="display: none">
                  \${roadName}
              </div>
              <div class="item-dong" style="display: none">
                  \${dongName}
              </div>                                                
          </div>`;

          result += text;
        }

        $('.item-list').html(result);
    })		
    
    ////// 면적 정렬
   	var sortJson;
    var reverse = 0;
    $("#areaSort").click(function() {
		result = '';
    	
		if(reverse == 0){
	        console.log(sortJson);
	        sortJson.sort(function(a,b){
	    		return parseFloat(a.전용면적) - parseFloat(b.전용면적)
	    	});
	        reverse++;
		}else{
	        console.log(sortJson);
	    	sortJson.sort(function(a,b){
	    		return parseFloat(b.전용면적) - parseFloat(a.전용면적)
	    	});
	    	reverse--;
		}
        
        for (var i = 0; i < sortJson.length; i++) {
          var yearMonth = String(sortJson[i]['년']) + String(sortJson[i]['월']);
          var day = sortJson[i]['일'];
          var name = sortJson[i]['아파트'];
          var area = sortJson[i]['전용면적'];
          var price = sortJson[i]['거래금액'];
          var roadName = sortJson[i]['도로명'];
          var dongName = sortJson[i]['법정동'];

        
          var text = `
          <div class="item">
              <div class="item-name">
                  \${name}
              </div>
              <div class="item-info">
                  <div class="price">거래금액 : \${price}만원</div>
                  <div class="area">면적 : \${area}m²</div>
              </div>
              <div class="date">
                  <i class="fa-regular fa-calendar-days"></i>
                  \${yearMonth.slice(0, 4)}.\${yearMonth.slice(4, 6)}.\${day}
              </div>
              <div class="item-road" style="display: none">
                  \${roadName}
              </div>
              <div class="item-dong" style="display: none">
                  \${dongName}
              </div>                                                
          </div>`;

          result += text;
        }

        $('.item-list').html(result);
    })		
    </script>
    <script>
    var searchTarget = [];

	$(document).ready(function(){					
		$.get("<%=request.getContextPath()%>/map/sido"
			,function(data, status){
				$.each(data, function(index, vo) {
					$("#sido").append("<option value='"+vo.sidoCode+"'>"+vo.sidoName+"</option>");
				});
			}
			, "json"
		);
	});

    $(document).on('click', '#search', function (e) {
      let name = $('input[id="search-text"]').val();
      getSearchList(name);
    });


				$(document).on("change", "#sido", function() {
					$.get("<%=request.getContextPath()%>/map/gugun"
							,{sido: $("#sido").val()}
							,function(data, status){
								$("#gugun").empty();
								$("#gugun").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#gugun").append("<option value='"+vo.gugunCode+"'>"+vo.gugunName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#gugun", function() {
					$.get("<%=request.getContextPath()%>/map/dong"
							,{gugun: $("#gugun").val()}
							,function(data, status){
								$("#dong").empty();
								$("#dong").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#dong").append("<option value='"+vo.dongCode+"'>"+vo.dongName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#dong", function() {
					$.get("<%=request.getContextPath()%>/map/apt"
							,{dong: $("#dong").val()}
							,function(data, status){
								$("tbody").empty();
								$.each(data, function(index, vo) {
									let str = `
										<tr class="${colorArr[index%3]}">
										<td>${vo.aptCode}</td>
										<td>${vo.aptName}</td>
										<td>${vo.sidoName} ${vo.gugunName} ${vo.dongName} ${vo.jibun}</td>
										<td>${vo.buildYear}</td>
										<td>${vo.recentPrice}</td>
									`;
									$("tbody").append(str);
								});
								
							}
							, "json"
					);
				});

				
    </script>

<script>
    const changeArcBtn = document.querySelector("#changeArc");
    const returnArcBtn = document.querySelector("#returnArc");
    const areas = document.getElementsByClassName("area");

    changeArcBtn.addEventListener('click',(e)=>{

        for (area of areas){

            let areaBefore = area.innerHTML;
            area.value = areaBefore;

            areaBefore=areaBefore.slice(5,-2);

            let areaAfter = Math.round(areaBefore*0.3025*100)/100;

            area.innerHTML = `평수 : \${areaAfter} 평`;
        }

        returnArcBtn.style.display="";
        changeArcBtn.style.display="none";
    })

    returnArcBtn.addEventListener('click',(e)=>{

        for (area of areas){

            let areaBefore = area.innerHTML;
            area.value = areaBefore;

            areaBefore=areaBefore.slice(5,-1);

            let areaAfter = Math.round(areaBefore * 3.305785 * 100)/100;

            area.innerHTML = `면적 : \${areaAfter}m²`;


        }

        changeArcBtn.style.display="";
        returnArcBtn.style.display="none";
    })

    </script>
    

</body>

</html>