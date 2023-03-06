<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KIOSK - POS.TLUCK</title>
<link rel="icon" href="/resources/image/fabicon.png">
<link rel="stylesheet" href="/resources/css/mainBootstrap.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/css/kiosk.css">
</head>
<body>
	<div class="main">
		<div class="header">
			<span class="px-3"><svg xmlns="http://www.w3.org/2000/svg"
					width="30" height="30" fill="currentColor" class="bi bi-arrow-left"
					viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
						d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
                </svg></span> <span><img
				src="/resources/image/mainLogo-dark.png"></span>
		</div>

		<div class="mainContents border ">
			<div class="border p-3 menuListHeader">핫도그라운드KIOSK</div>
			<div class="menuList">
				<div class="menuCard">
					<div class="card">
						<img
							src="/resources/image/hotdog2.jpg"
							class="card-img-top cardTop" alt="...">
						<div class="card-body">
							<h4 class="card-title">핫도그</h4>
							<p class="card-text">1,500원</p>
							<a href="#" class="btn btn-primary">주문하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="subContents">
			<div class="subContentsHeader">
				<div class="border p-3">목록</div>
			</div>
			<div class="subContentsOrderList">
				<div class="p-3 orderList">
					<span class="menuName">핫도그</span>
					<!-- 수량줄이는 -버튼 -->
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-dash-circle mButton"
						viewBox="0 0 16 16">
                            <path
							d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                            <path
							d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z" />
                        </svg>
					<!-- 수량줄이는 -버튼 -->

					<!-- 수량표시 -->
					<div class="menuCount">5</div>
					<!-- 수량표시 -->

					<!-- 수량 늘리는 + 버튼 -->
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-plus-circle pButton"
						viewBox="0 0 16 16">
                            <path
							d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                            <path
							d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                        </svg>
					<!-- 수량 늘리는 + 버튼 -->

					<!-- 가격 -->
					<span class="orderPrice">155,500원</span>
					<!-- 가격 -->

					<!-- 주문지우는 X 버튼 -->
					<button type="button" class="btn-close btn-close-white xButton"
						aria-label="Close"></button>
					<!-- 주문지우는 X 버튼 -->
				</div>


			</div>
			<div class="subContentsBtnZone">
				<div class="cancleOrder">주문취소</div>
				<div class="moveOrderPage" onClick="kioskPage(0)">주문확인</div>
			</div>

		</div>
	</div>
</body>
<script>
	function connect() {
		let sock = new WebSocket("ws://localhost:80/my-websocket");

		sock.onopen = function(event) {
			alert(event.code);
			console.log('open');
			sock.send('test');

			sock.onmessage = function(e) {
				alert(e.code);
				console.log('message', e.data);
			};

		};
		sock.onclose = function(event) {
			alert(event.code);
			if (event.wasClean) {
				console.log('웹 소켓이 정상적으로 닫혔습니다.');
			} else {
				console.error('웹 소켓이 예기치 않게 닫혔습니다. 이유: ' + event.reason
						+ ', 코드: ' + event.code);
			}
		};
		sock.onerror = function(error) {
			alert([ error ]);
		};
	};
</script>


<style>
</style>
</html>