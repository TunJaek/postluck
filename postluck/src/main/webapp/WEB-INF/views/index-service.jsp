<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Index</title>
<link rel="stylesheet" href="/resources/css/mainBootstrap.css">
<script src="../resources/js/common.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap" rel="stylesheet">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
</head>

<body class="vsc-initialized">
	<div class="main">
		<div id="left">
			<div id="foodTruckNews">
				푸드트럭 소식 보러가기 <img class="position-absolute start-0 bottom-0" src="/resources/image/arrow.png" style="width: 120%;">
			</div>
		</div>

		<div id="right" style="display: flex; justify-content: center; align-items: center;">
			<div class="loginArea" style="display: flex; flex-direction: column; width: 70%; display: flex; flex-direction: column; height: 50%;">
				<img src="/resources/image/indexTextLogo.png" style="margin-bottom: 3%;">
				<div class="loginLogo" style="width: 100%;">
					<div class="loginInputArea" style="display: flex; flex-direction: column; gap: 5px;">
						<div class="loginText" style="position: relative;">${AccessInfo.ceoName}사장님안녕하세요!</div>
						<div class="loginInput" style="display: flex; flex-direction: column; gap: 5px; width: 100%;">
							<div class="d-grid gap-2">
								<button class="btn btn-lg btn-primary" type="button" onclick="MovePos()" id="posService"></button>
								<!-- <button class="btn btn-lg btn-primary" type="button">Block button</button> -->
							</div>
							<div class="d-grid gap-2">
								<button class="btn btn-lg btn-primary" type="button" id="kioskService" onclick="moveKiosk()"></button>
								<!-- <button class="btn btn-lg btn-primary" type="button">Block button</button> -->
							</div>
						</div>
					</div>

				</div>


			</div>
		</div>
		<div class="modal" data-bs-backdrop="static" data-keyboard="false" tabindex="-1" style="display: none; justify-content: center; align-items: center; background-color: rgba(1, 1, 1, 0.3);">
			<div class="w-50 modal-dialog-centered modal-dialog-scrollable" id="regStoreInfo">
				<div class="modal-content w-100">
					<div class="modal-header">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="regCancel()"></button>
					</div>
					<div style="text-align: center;">
						<div class="mt-4">
							<h3>푸드트럭 등록</h3>
						</div>
						<p>(*)항목은 필수 입력 항목입니다.</p>
					</div>
					<div class="modal-body; px-5 my-4">
						<div class="row p-2">
							<div class="col-3 text-center">* 사업자번호</div>
							<div class="col-6" id="validCheck">
								<input type="text" class="form-control" id="storeCode" name="storeCode" placeholder="사업자번호를 입력해주세요." maxlength="10" onchange="isChecked=false;console.log(isChecked)">
								<div class="valid-feedback" style="display: none">사용 가능한 사업자 번호입니다!</div>
								<div class="invalid-feedback" style="display: none">이미 사용중인 사업자 번호입니다.</div>

							</div>
							<div class="col-3">
								<button type="button" class="btn btn-primary" onclick="checkSt()">중복 확인</button>
							</div>
						</div>
						<div class="row p-2">
							<div class="col-3 text-center">* 가게 이름</div>
							<div class="col-8">
								<input type="text" class="form-control" id="storeName" placeholder="가게 이름을 입력해주세요." name="storeName" maxlength="50">
							</div>
						</div>
						<div class="row  p-2">
							<div class="col-3 text-center">&nbsp;&nbsp;&nbsp;전화번호</div>
							<div class="col-8">
								<input type="text" class="form-control" id="storePhone" placeholder="전화번호를 입력해주세요." name="storePhone" maxlength="11">
							</div>
						</div>
						<div class="row p-2">
							<div class="col-3 text-center">* 카테고리</div>
							<div class=" col-8">
								<select class="form-select" id="category">
									<option value="" selected>카테고리</option>
									<option value="SN">분식</option>
									<option value="SW">샌드위치</option>
									<option value="DE">디저트</option>
									<option value="MS">멕시칸</option>
									<option value="AS">아시안</option>
									<option value="IT">이탈리안</option>
									<option value="DR">커피/음료</option>
									<option value="SE">씨푸드</option>
									<option value="FA">패스트푸드</option>
								</select>
							</div>
						</div>
						<div class="row p-2">
							<div class="col-3 p-2 text-center">가게 한줄소개</div>
							<div class="col-8">
								<input type="text" class="form-control" id="storeInfo" placeholder="가게 한 줄 소개를 입력해주세요." maxlength="30">
							</div>


						</div>
						<div class="row p-2">
							<div class="col-3 p-2 text-center">상세 소개</div>
							<div class="col-8">
								<textarea class="form-control" id="storeInfoDetail" rows="5" placeholder="가게 상세 소개를 입력해주세요." maxlength="2000"></textarea>
							</div>
						</div>
						<div class="row p-2">
							<div class="col-3 p-2 text-center">가게 사진</div>
							<div class="col-8">
								<input class="form-control" type="file" id="formFile">
							</div>
						</div>
					</div>
					<div class="modal-footer justify-content-center">
						<button type="button" class="btn btn-secondary" onclick="regCancel()">취소</button>
						<button type="button" class="btn btn-primary" onclick="regStInfo()">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		jsonString = '${store}';
		let isChecked = false;
		const jsonData = JSON.parse(jsonString);
		if ('${AccessInfo.storeCode}') {
			document.getElementsByClassName("modal")[0].style.display = "none"
		} else {
			document.getElementsByClassName("modal")[0].style.display = "flex"
		}

		function regCancel() {
			document.getElementsByClassName("modal")[0].style.display = "none"
		}
		function checkSt() {
			isChecked = true;
			let storeCode = document.getElementById('storeCode');
			if (lengthCheck(storeCode)) {
				formData = new FormData();
				formData.append('storeCode', storeCode.value);
				serverCallByFetch(formData, '/Api/DupCheckStCode', 'post',
						'dupCheckResult', new Headers(getJWT()));
			} else {
				storeCode.value = '';
				alert('사업자 코드 오류:사용할 사업자 코드를 숫자로 시작하는 10글자로 입력하세요');
			}
		}

		function dupCheckResult(jsonData) {
			if (jsonData.message == '사용 가능한 사업자번호 입니다.') {
				document.getElementById("storeCode").value = jsonData.storeCode;
				document.getElementById("storeCode").classList.add('is-valid');
				document.getElementById("storeCode").classList
						.remove('is-invalid');
				document.getElementsByClassName("invalid-feedback")[0].style.display = "none";
				document.getElementsByClassName("valid-feedback")[0].style.display = "block";
				isChecked = true;

			} else {
				document.getElementById("storeCode").value = '';
				document.getElementById("storeCode").classList
						.remove('is-valid');
				document.getElementById("storeCode").classList
						.add('is-invalid');
				document.getElementsByClassName("valid-feedback")[0].style.display = "none";
				document.getElementsByClassName("invalid-feedback")[0].style.display = "block";
			}

		}
		function regStInfo() {
			formData = new FormData();
			let storeCode = document.getElementById('storeCode');
			let storeName = document.getElementById('storeName');
			let storePhone = document.getElementById('storePhone');
			let storeInfo = document.getElementById('storeInfo');
			let storeInfoDetail = document.getElementById('storeInfoDetail');
			let storeCategory = document.getElementById('category');

			formData.append('snsID', '${AccessInfo.snsID}');
			formData.append('snsType', '${AccessInfo.snsType}');
			formData.append('ceoEmail', '${AccessInfo.ceoEmail}');
			formData.append('ceoName', '${AccessInfo.ceoName}');
			let serverCall = false;
			if (storeCode != '' && lengthCheck(storeCode)) {
				formData.append('storeCode', storeCode.value);
				if (storeName != '' && lengthCheck(storeName)) {
					formData.append('storeName', storeName.value);
					if (storePhone.value == ''
							|| (storePhone.value != '' && lengthCheck(storePhone))) {
						formData.append('storePhone', storePhone.value);
						if (storeCategory.value != '') {
							formData.append('storeCategory',
									storeCategory.value);
							formData.append('storeInfo', storeInfo.value);
							formData.append('storeInfoDetail',
									storeInfoDetail.value);
							console.log(isChecked)
							if (isChecked) {
								serverCallByFetch(formData,
										'/Api/RegStoreInfo', 'post',
										'modalClose', header);
							} else {
								alert('사업자 번호 중복체크를 해주세요.');
							}

						} else {
							alert("카테고리는 필수 입력사항입니다.")
						}

					} else {
						storePhone.value = '';
						alert('휴대폰 정보 오류:사용할 휴대전화 번호을 11글자 로 입력하세요');
					}

				} else {
					storeName.value = '';
					alert('사업자명 오류:사용할 사업자명을 2글자이상 50자이하로 입력하세요');
				}
			} else {
				storeCode.value = '';
				alert('사업자 코드 오류:사용할 사업자 코드를 숫자로 시작하는 10글자로 입력하세요');
			}
		}

		function modalClose(jsonData) {
			if (jsonData.message == 'true') {
				regCancel();
				document.getElementsByClassName('loginText')[0].innerText = jsonData.ceoName
						+ "사장님 안녕하세요!";
			}

		}
		function moveKiosk() {
			serverCallByRequest('/View/MoveKiosk', 'post',getJWT());
		}
		function MovePos() {
			serverCallByRequest('/View/MovePos', 'post', getJWT());
		}
	</script>

</body>
<style>
.loginArea {
	width: 60%;
	display: flex;
	flex-direction: column;
}

.main {
	display: flex;
	width: 100vw;
	height: 100vh;
}

body {
	width: 100vh;
	height: 100vh;
	margin: 0px;
	margin-bottom: 0px;
}

.icon {
	margin: 10px;
	position: relative;
	width: 10%;
	/* align-content: center; */
	text-align: center;
	float: left;
}

.icon2 {
	margin: 10px;
	position: relative;
	width: 10%;
	/* align-content: center; */
	text-align: center;
	float: right;
}

.icon span {
	position: absolute;
	/*어떤 요소에 absolute를 주면 블럭요소는 inline으로 변경됨.*/
	background-color: #FEE500;
	width: 200px;
	color: black;
	top: -50px;
	text-align: center;
	padding: 5px;
	border-radius: 5px;
	left: 50%;
	/*중앙배치 : 왼쪽에서 50%위치*/
	transform: translateX(-30%);
	/*중앙배치 : X크기값을 50%만큼 이동*/
	opacity: 0;
	/*이벤트설정 : 서서히 변하게 함*/
	transition: 0.5s;
	/*어떤 변화가 요청되면 0.5초뒤에 일어나자.*/
	visibility: hidden;
	/*특정 요소 접촉시 이벤트 발생*/
}

.icon2 span {
	position: absolute;
	/*어떤 요소에 absolute를 주면 블럭요소는 inline으로 변경됨.*/
	background-color: #1ED760;
	width: 200px;
	color: #fff;
	top: -50px;
	text-align: center;
	padding: 5px;
	border-radius: 5px;
	left: 50%;
	/*중앙배치 : 왼쪽에서 50%위치*/
	transform: translateX(-50%);
	/*중앙배치 : X크기값을 50%만큼 이동*/
	opacity: 0;
	/*이벤트설정 : 서서히 변하게 함*/
	transition: 0.5s;
	/*어떤 변화가 요청되면 0.5초뒤에 일어나자.*/
	visibility: hidden;
	/*특정 요소 접촉시 이벤트 발생*/
}

.icon:hover span {
	opacity: 1;
	visibility: visible;
	/*hover시 발생하는이벤트*/
}

.icon2:hover span {
	opacity: 1;
	visibility: visible;
	/*hover시 발생하는 이벤트*/
}

.container {
	width: 19%;
	align-items: center;
	position: relative;
	right: 4%;
	top: 50%;

	/*수직 중앙 -> container의 높이값이 있어야 적용됨*/
}

#foodTruckNews {
	position: absolute;
	top: 85%;
	left: 50%;
	/* background-color: black; */
	color: white;
	font-size: large;
	z-index: 5;
	font-size: 50px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	cursor: pointer;
}

#foodTruckNews:hover {
	text-decoration: underline
}

#foodTruckNewsArrow {
	/* content: ' ───────── \00A7'; */
	position: absolute;
	top: 88vh;
	left: 40vw;
	/* background-color: black; */
	color: white;
	/* font-size: large; */
	font-size: 50px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
}

#logo {
	position: relative;
	top: 20%;
	text-align: center;
}

#left {
	position: absolute;
	/* border:1px solid black; */
	width: 75%;
	height: 100%;
	float: left;
	background-image: url(/resources/image/indexBackground.png);
	background-size: cover;
}

#right {
	margin-left: 75%;
	position: absolute;
	/* border: 1px solid black; */
	width: 25%;
	height: 100%;
	float: left;
}

.loginInput {
	text-align: center;
	font-family: 'Noto Sans KR', sans-serif;
}

.loginText {
	font-weight: bold;
	font-family: 'Noto Sans KR', sans-serif /* background-color: bisque; */
}

#loginButton {
	background-color: #333333;
	border: 0px;
	font-family: 'Noto Sans KR', sans-serif
}

#loginButton::before {
	content: "Login";
}

#loginButton:hover {
	background-color: #1ED760;
}

#loginButton:hover::before {
	content: "반갑습니다";
}

#posService {
	background-color: #333333;
	border: 0px;
	font-family: 'Noto Sans KR', sans-serif;
	text-align: left;
}

#kioskService {
	background-color: #F5F5F5;
	color: black;
	border: solid 1px black;
	font-family: 'Noto Sans KR', sans-serif;
	text-align: left;
}

#posService::before {
	content: "POS서비스 바로가기 ➞";
}

#kioskService::before {
	content: "KIOSK서비스 바로가기 ➞";
}
</style>

<!-- Code injected by live-server -->

</html>