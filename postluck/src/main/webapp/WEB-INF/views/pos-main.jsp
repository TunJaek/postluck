<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="page-exit" content="blendTrans(duration=0.3)">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>POS - POS.TLUCK</title>
<link rel="icon" href="/resources/image/fabicon.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/mainBootstrap.css">
<link rel="stylesheet" href="/resources/css/main.css">
<script src="/resources/js/common.js"></script>
<style>
.posMenu {
	background-color: white;
	border: 0px;
	padding: 0px;
	transition: all 0.5s;
	font-family: 'Noto Sans KR';
	margin: 0px;
	color: #333333;
}

.posMenu:hover {
	background-color: #ecfbf2;
}

.row {
	-bs-gutter-x: 0px;
	height: 30%;
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

.contents {
	position: relative;
	height: 95%;
}

.subContent {
	position: relative;
	float: right;
	background-color: white;
	width: 20%;
	height: 100%;
}

.mainContent {
	padding: 3%;
	float: left;
	position: absolute;
	background-color: #ecf0f1;
	width: 100vw;
	height: 100%;
}

.order {
	float: left;
	background-color: white;
	width: 100%;
	height: 100%;
	border-radius: 10px;
	position: relative;
	padding: 2%;
	display: flex;
	gap: 10px;
	flex-direction: column
}

.orderInfo1 {
	display: flex;
	justify-content: space-between;
	align-items: center;
}
</style>
</head>


<body class="vsc-initialized">
	<div class="offcanvas offcanvas-end" data-bs-scroll="true"
		data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling"
		aria-labelledby="offcanvasScrollingLabel">
		<div class="offcanvas-header border-bottom">
			<h2 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">#001</h2>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<div class="row"
				style="height: 70%; overflow-y: auto; align-content: flex-start;">
				<div style="height: 10%; align-items: center;"
					class="row border-bottom text-center">
					<div class="col-4">햄버거</div>
					<div class="col-1">X</div>
					<div class="col-1">12</div>
					<div class="col text-end">84000</div>
					<div class="col-1">원</div>
				</div>
			</div>
			<div class="row border-top text-center fs-3" style="height: 10%;">
				<div class="col-4 fs-5">총 결제금액</div>
				<div class="col-6 text-end">20000</div>
				<div class="col-1">원</div>
			</div>
			<div class="row border-top text-center fs-3" style="height: 10%;">
				<div class="col-4 fs-5">결제수단</div>
				<div class="col-7 text-end fs-5">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="inlineRadioOptions" id="inlineRadio1" value="option1">
						<label class="form-check-label" for="inlineRadio1">현금</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="inlineRadioOptions" id="inlineRadio2" value="option2">
						<label class="form-check-label" for="inlineRadio2">카드</label>
					</div>
				</div>
			</div>
			<div class="row text-center fs-5" style="height: 10%;">
				<div class="h-100 col-4 bg-light row justify-content-center">주문취소</div>
				<div
					class="h-100 justify-content-center col bg-success bg-opacity-10 row">결제
				</div>
			</div>
		</div>
	</div>
	<div class="main">
		<div class="header">
			<span class="px-3 " style="cursor: pointer"
				onclick="movePage('Back')"><svg
					xmlns="http://www.w3.org/2000/svg" width="30" height="30"
					fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
						d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"></path>
                </svg></span> <span><img
				src="/resources/image/mainLogo-dark.png"></span>
		</div>


		<div class="contents">
			<div class="mainContent border row "
				style="display: flex; flex-direction: row; flex-wrap: nowrap; overflow-x: auto">
				<div class="col-3 p-5 mx-3 h-100 rounded"
					style="display: flex; overflow-y: auto; background: white; /* width:40%; */ flex-direction: column;"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling"
					aria-controls="offcanvasScrolling">
					<div class="row mb-4" style="align-items: baseline; height: 10%">
						<h2 class="col">#001</h2>
						<h6 class="col">2023/03/23 08:23:21</h6>
					</div>
					<div style="overflow-y: auto; height: 90%;">
						<div class="row" style="align-items: baseline;">
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
						</div>
					</div>
					<div class="row">
						<button class="btn btn-outline-primary w-100" type="button"
							data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling"
							aria-controls="offcanvasScrolling">주문</button>
					</div>
				</div>


				<div class="col-3 p-5 mx-3 h-100 rounded"
					style="display: flex; overflow-y: auto; background: white; /* width:40%; */ flex-direction: column;">
					<div class="row mb-4" style="align-items: baseline; height: 10%">
						<h2 class="col">#001</h2>
						<h6 class="col">2023/03/23 08:23:21</h6>
					</div>
					<div style="overflow-y: auto; height: 90%;">
						<div class="row" style="align-items: baseline;">
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
						</div>
					</div>
					<div class="row">
						<button class="btn btn-outline-primary w-100" type="button">주문</button>
					</div>
				</div>
				<div class="col-3 p-5 mx-3 h-100 rounded"
					style="display: flex; overflow-y: auto; background: white; /* width:40%; */ flex-direction: column;">
					<div class="row mb-4" style="align-items: baseline; height: 10%">
						<h2 class="col">#001</h2>
						<h6 class="col">2023/03/23 08:23:21</h6>
					</div>
					<div style="overflow-y: auto; height: 90%;">
						<div class="row" style="align-items: baseline;">
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
						</div>
					</div>
					<div class="row">
						<button class="btn btn-outline-primary w-100" type="button"
							data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling"
							aria-controls="offcanvasScrolling">주문</button>
					</div>
				</div>
				<div class="col-3 p-5 mx-3 h-100 rounded"
					style="display: flex; overflow-y: auto; background: white; /* width:40%; */ flex-direction: column;">
					<div class="row mb-4" style="align-items: baseline; height: 10%">
						<h2 class="col">#001</h2>
						<h6 class="col">2023/03/23 08:23:21</h6>
					</div>
					<div style="overflow-y: auto; height: 90%;">
						<div class="row" style="align-items: baseline;">
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
							<div class="row mb-3">
								<h4 class="col-5">햄버거</h4>
								<h4 class="col-1">x</h4>
								<h4 class="col-5">6</h4>
							</div>
						</div>
					</div>
					<div class="row">
						<button class="btn btn-outline-primary w-100" type="button"
							data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling"
							aria-controls="offcanvasScrolling">주문</button>
					</div>
				</div>
			</div>
		</div>

	</div>


	<script>
		// 	if('' == ''){
		// 		showModal('error::등록된 메뉴가 없습니다. 메뉴 등록 페이지로 이동합니다.:movePosManage');
		// 	}
		jsonString = '{"storeName":"예림이다","storeCategory":"IT","storeCode":"6913651651","storeInfo":null,"storeInfoDetail":null,"storeImageCode":null,"storePhone":null,"snsType":"NA","snsID":"ouFssF-KDIYTlpLPSiW9MtX7eGY3iPO6JYZizYHGX4g","ceoEmail":"ozoone99@naver.com","ceoName":"이예림","locationList":[],"menuList":[{"menuCode":"M00","menuName":"ㅇㅇㅇ","menuPrice":"1234","menuImageCode":"6913651651M00","menuImageLocation":null,"isMain":"Y","isKiosk":"Y","isSoldOut":"N"},{"menuCode":"M01","menuName":"ㅇㅇㅇ","menuPrice":"1234","menuImageCode":"6913651651M01","menuImageLocation":null,"isMain":"Y","isKiosk":"Y","isSoldOut":"N"},{"menuCode":"M04","menuName":"ddd","menuPrice":"1234","menuImageCode":"6913651651M04","menuImageLocation":null,"isMain":"Y","isKiosk":"Y","isSoldOut":"N"},{"menuCode":"M03","menuName":"메뉴1","menuPrice":"1234","menuImageCode":"6913651651M03","menuImageLocation":null,"isMain":"Y","isKiosk":"Y","isSoldOut":"N"},{"menuCode":"M02","menuName":"메뉴1","menuPrice":"222","menuImageCode":"6913651651M02","menuImageLocation":null,"isMain":"Y","isKiosk":"Y","isSoldOut":"N"}],"accessLogList":null,"orderList":null,"salesLogList":null,"message":null}'
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
			showModal("plain:알림:새로운 주문이 들어왔습니다." + e.data + "::")
		};
		sock.onclose = function(event) {
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
		function order() {
			sock.send("주문: 햄버거 1개");
		}

		sock.onerror = function(error) {
			alert([ error ]);
		};
		function showOrder() {
		}
		function addOrderDiv() {
		}
		function getOrderDetail() {
		}
		function showOrderDetail() {
		}
		function acceptOrder() {
		}
		function changeStateBtn() {
		}
		function cancelOrder() {
		}
		function removeOrderDiv() {
		}
		function completeOrder() {
		}
	</script>




</body>

</html>