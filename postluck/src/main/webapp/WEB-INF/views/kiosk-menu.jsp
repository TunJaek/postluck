<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KIOSK - POS.TLUCK</title>
<link rel="icon" href="/resources/image/fabicon.png">
<link rel="stylesheet" href="/resources/css/mainBootstrap.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap"
	rel="stylesheet">
<script src="/resources/js/common.js"></script>
<link rel="stylesheet" href="/resources/css/kiosk.css">
</head>
<body>
	<div class="main">
		<div class="header">

			<i class="bi bi-arrow-left fs-3 mx-3" id="backspace"
				style="color: white; display: none;" onclick="kioskPage()"></i> <img
				src="/resources/image/mainLogo-dark.png" class="mx-3">

		</div>
		<div id="menuPage" class="w-100"
			style="display: block; position: absolute; height: 95%;">
			<div class="row" style="height: 100%;">
				<div class="mainContents border col-3">
					<div
						class="border menuListHeader fs-4 d-flex align-items-center justify-content-center"
						style="height: 7%;">
						<div id="storeName"></div>
					</div>
					<div class="text-center " style="overflow-y: auto; height: 93%;">
						<div class="menuList row row-cols-3" id="menuListZone">
							<div class="col p-4">
								<div class="card">
									<div
										class="position-absolute m-3 badge bg-success rounded-pill fs-6 mx-3 col-3">
										대표</div>
									<img src="\resources\image\hotdog2.jpg"
										class="card-img-top cardTop" alt="...">
									<div class="card-body">
										<div class="row p-1">
											<div class="col fs-4">핫도그</div>
										</div>
										<div class="fs-4">1,500원</div>

									</div>
								</div>
							</div>
							<div class="col p-4">
								<div class="card">
									<div
										class="position-absolute m-3 badge bg-success rounded-pill fs-6 mx-3 col-3">
										대표</div>
									<img src="\resources\image\hotdog2.jpg"
										class="card-img-top cardTop" alt="...">
									<div class="card-body">
										<div class="row p-1">
											<div class="col fs-4">핫도그</div>
										</div>
										<div class="fs-4">1,500원</div>

									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="subContents col">
					<div class="subContentsHeader fs-5 p-3 border-bottom"
						style="height: 7%;">목록</div>
					<div class="subContentsOrderList" style="height: 86%;">
						<div class="row text-center fs-5 border-bottom p-3"
							style="-bs-gutter-x: 0px;">
							<div class="menuName col-3 ">핫도그</div>
							<!-- 수량줄이는 -버튼 -->
							<div class="col">
								<i class="bi bi-dash-circle"></i>
							</div>
							<!-- 수량줄이는 -버튼 -->

							<!-- 수량표시 -->
							<div class="menuCount col-1">5</div>
							<!-- 수량표시 -->

							<!-- 수량 늘리는 + 버튼 -->
							<div class="col">
								<i class="bi bi-plus-circle"></i>
							</div>
							<!-- 수량 늘리는 + 버튼 -->

							<!-- 가격 -->
							<div class="orderPrice col-4">155,500원</div>
							<!-- 가격 -->

							<!-- 주문지우는 X 버튼 -->
							<div class="col">
								<i class="bi bi-x-lg"></i>
							</div>
							<!-- 주문지우는 X 버튼 -->
						</div>
						<div class="row text-center fs-5 border-bottom p-3"
							style="-bs-gutter-x: 0px;">
							<div class="menuName col-3 ">핫도그</div>
							<!-- 수량줄이는 -버튼 -->
							<div class="col">
								<i class="bi bi-dash-circle"></i>
							</div>
							<!-- 수량줄이는 -버튼 -->

							<!-- 수량표시 -->
							<div class="menuCount col-1">5</div>
							<!-- 수량표시 -->

							<!-- 수량 늘리는 + 버튼 -->
							<div class="col">
								<i class="bi bi-plus-circle"></i>
							</div>
							<!-- 수량 늘리는 + 버튼 -->

							<!-- 가격 -->
							<div class="orderPrice col-4">155,500원</div>
							<!-- 가격 -->

							<!-- 주문지우는 X 버튼 -->
							<div class="col">
								<i class="bi bi-x-lg"></i>
							</div>
							<!-- 주문지우는 X 버튼 -->
						</div>
					</div>
					<div class="subContentsBtnZone row" style="height: 7%;">
						<div
							class="cancleButton p-3 col h-100 d-flex justify-content-center align-items-center">주문취소</div>
						<div
							class="orderButton p-3 col h-100 d-flex justify-content-center align-items-center"
							onclick="kioskPage(0)">주문하기</div>
					</div>
				</div>
			</div>


			<!-- 결제방식 결정 -->
		</div>
		<div id="orderPage" class="w-100"
			style="display: none; overflow: hidden; height: 95%;">
			<!-- 주문내역확인 -->
			<div class="orderContents border-end h-100">
				<div class="orderZoneHeader border-bottom p-2" style="">
					<div class="menu row fs-3 "># 12</div>
				</div>
				<div class="orderZone border-bottom" style="position: relative;">
					<div style="height: 93%; overflow-y: auto; position: relative;">
						<div class="menu border-bottom p-3 row text-center fs-5 " style="">
							<div class="menuName col ">치킨햄버거</div>
							<div class="menuCount col-2">x2</div>
							<div class="menuPrice col">20,000원</div>
						</div>
					</div>
					<div class="menu border-top p-3 row w-100 text-center"
						style="position: absolute; bottom: 0;">
						<div class="allCount col-4 fs-5">총 4건</div>
						<div class="allPrice col fs-3">80,000원</div>
					</div>
				</div>

			</div>
			<!-- 주문내역확인 -->

			<!-- 결제방식 결정 -->
			<div class="payMentContens col" style="height: 100%;">
				<div class="menu p-5 payment" style="height: 50%;">
					<div class="row" style="align-items: baseline;">
						<div class="paymentText col fs-3" style="">결제금액</div>
						<div class="paymentPrice col" style="">80,000</div>
						<div class="paymentText text-start fs-3 col h-100">원</div>
					</div>


					<br> <span style="font-size: 30px;"> <br>주문 내역 확인
						후 결제 방법을 선택 해주세요.<br> 결제는 음식 수령과 함께 해주세요.
					</span>
				</div>
				<div class="paymentChoice row">
					<div class="card paymentMethod d-flex col m-5">
						<div class="menu p-3">
							<i class="bi bi-credit-card"></i> 카드결제 >
						</div>
					</div>
					<div class="card paymentMethod d-flex col m-5">
						<div class="menu p-3">
							<i class="bi bi-cash-coin"></i> 현금결제 >
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="messageModal"
		style="background-color: rgba(0, 0, 0, 0.2); z-index: 1080"></div>
</body>
<script>
	
	function kioskPage() {
		const menuPage = document.getElementById("menuPage");
		const orderPage = document.getElementById("orderPage");

		if (orderPage.style.display == "none") {
			document.getElementById("backspace").style.display = "block";
			orderPage.style.display = "block";
			menuPage.style.display = "none";

		} else if (orderPage.style.display == "block") {
			document.getElementById("backspace").style.display = "none";
			orderPage.style.display = "none";
			menuPage.style.display = "block";
		}

	}

	// 	var Target = document.getElementById("clock");
	// 	var Target_apm = document.getElementById("apm");
	// 	function clock() {
	// 		var time = new Date();
	// 		var hours = time.getHours();
	// 		var minutes = time.getMinutes();
	// 		var seconds = time.getSeconds();
	// 		var AmPm = "AM";
	// 		if (hours > 12) {
	// 			var AmPm = "PM";
	// 			hours %= 12;
	// 		}

	// 		Target.innerText = '::';

	// 		Target_apm.innerText = '';

	// 	}
	// 	clock();
	// 	setInterval(clock, 1000); // 1초마다 실행

	jsonString = '${store}'
	jsonData = JSON.parse(jsonString);
	document.getElementById("storeName").innerText = jsonData.storeName;
	if(jsonData.menuList.length>0){
		// 카드를 생성할 div 요소를 선택합니다.
		const menuListZone = document.querySelector('#menuListZone');
		const cardContent = ''; 
		menuList.forEach((menu) => {
			const card = document.createElement('div');
			card.classList.add('col', 'p-4');
			cardContent += "<div class=\"card\" value=\""+menu.menuCode+"\">"
			if(menu.isMain == 'Y'){
				cardContent+="<div class=\"position-absolute m-3 badge bg-success rounded-pill fs-6 mx-3 col-3\">대표</div>"
			}
			if (menu.menuImageLocation != ''){
				cardContent+="<img src=\"\resources\image\hotdog2.jpg\" class=\"card-img-top cardTop\">"
			}else{
				cardContent+="<img src=\"http://placehold.it/1000X600\" class=\"card-img-top cardTop\">"
			}
			cardContent += "<div class=\"card-body\"><div class=\"row p-1\"><div class=\"col fs-4\">";
			cardContent += menu.menuName;
			cardContent += "</div> </div> <div class=\"fs-4\">";
			cardContent += menu.menuPrice;       
			cardContent += "원</div>  </div>  </div>";
		});
		// 동적으로 카드를 생성합니다.
		
		card.innerHTML = cardContent;

		// 카드를 추가합니다.
		menuListZone.appendChild(card);
	}
	let sock;
	let storeCode
	if (JSON.parse(jsonString).storeCode) {
		storeCode = JSON.parse(jsonString).storeCode;
		sock = new WebSocket("ws://192.168.0.5:80/postluck/" + storeCode);
		// WebSocket 처리 코드
	} else {
		showModal("error:세션 오류:세션이 만료되었습니다. 다시 로그인해주세요.:moveIndex:")
	}

	sock.onopen = function(event) {
		showModal("plain:연결 성공!:서버와 연결되었습니다!::")
		sock.send(storeCode);
	};

	sock.onmessage = function(e) {
		showModal('plain:연결 성공!:동일한 아이디로 접속하여, 연결을 했습니다!::')
	};
	sock.onclose = function(event) {
		alert(event.code);
		if (event.wasClean) {
			showModal('plain:연결 종료:서버와의 연결이 정상적으로 종료되었습니다.::')
		} else {
			showModal('error:연결 오류:서버와의 연결이 비정상적으로 종료되었습니다.::')
		}
	};
	function order() {
		sock.send("주문: 햄버거 1개");
	}

	sock.onerror = function(error) {
		alert([ error ]);
	};
</script>
<style>
.body {
	margin: 0px;
	margin-bottom: 0px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
}

.main {
	width: 100vw;
	height: 100vh;
	background-color: #f5f5f5;
}

.header {
	position: relative;
	height: 5%;
	background-color: #333333;
	margin: 0px;
	color: white;
	display: flex;
	align-items: center;
}

.mainContents {
	width: 80%;
	float: left;
	position: relative;
}

.menuCard {
	position: relative;
	top: 20%;
	margin-bottom: 3%;
}

.subContents {
	width: 20%;
	background-color: #ffffff;
	float: right;
}

.orderButton {
	height: 5%;
	text-align: center;
	padding: 10px 0;
	cursor: pointer;
	z-index: 1;
}

.orderButton:hover {
	background-color: #AFAFAF !important;
}

.orderButton1 {
	height: 5%;
	text-align: center;
	padding: 10px 0;
	cursor: pointer;
}

.orderButton1:hover {
	height: 5%;
	text-align: center;
	padding: 10px 0;
	background-color: #71F9A2 !important;
}
</style>


</html>