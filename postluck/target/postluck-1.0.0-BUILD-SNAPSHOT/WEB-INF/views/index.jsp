<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">


<head>
<script>
if('${param.message}'!=''){
	showModal(${param.message});
}
function isMem(){
	if (getJWT()!=null){
		console.log("true")
		const accessToken=getJWT();
		serverCallByRequest('/View/AccessCtl', 'post', accessToken);
	}else{
		console.log("false")
		sessionStorage.clear(); 

	}
}

</script>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>POS.TLUCK</title>
<link rel="icon" href="../../resources/image/fabicon.png">
<link rel="stylesheet" href="../../resources/css/main.css">
<link rel="stylesheet" href="../../resources/css/mainBootstrap.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap" rel="stylesheet">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="../../resources/js/common.js"></script>

</head>
<body class="vsc-initialized" onload="isMem()">
	<div class="main">
		<div id="left">
			<div id="foodTruckNews">
				푸드트럭 소식 보러가기 <img class="position-absolute start-0 bottom-0" src="/resources/image/arrow.png" style="width: 120%;">
			</div>
		</div>

		<div id="right" style="display: flex; justify-content: center; align-items: center;">
			<div class="loginArea" style="display: flex; flex-direction: column; width: 60%; display: flex; flex-direction: column; height: 50%;">
				<img src="../../resources/image/indexTextLogo.png" style="margin-bottom: 3%;">
				<div class="loginLogo" >
					<div class="loginInputArea" style="display: flex; flex-direction: column; gap: 5px;">
						<div class="loginText" style="position: relative;">사업자회원로그인</div>
						<div id="naver_id_login" style="display: none"></div>
						<div class="row" style="background-color: #03C75A; border-radius: 5px; align-items: center; cursor: pointer" id="naverLogin" onclick="naverLogin()">
							<img class="col-3" src="../../resources/image/naverLoginBtn.png">
							<div class="col-9" style="color: white">네이버로 로그인하기</div>
						</div>
						<div class="row" style="background-color: #F9E000; border-radius: 5px; align-items: center; cursor: pointer" id="kakaoLogin" onclick="kakaoLogin()">
							<img class="col-3" src="../../resources/image/kakaoLoginBtn.png">
							<div class="col-9">카카오로 로그인하기</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="modal fade" id="messageModal" style="background-color: rgba(0, 0, 0, 0.2)">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title col-10">메세지 제목이 없습니다.</h5>
						<button type="button" id="modalClose" class="btn-close col-1" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body text-center">
						<div class="my-2 mx-5" id="svgZone"></div>
						<div id="alertContent">메세지 내용이 없습니다.</div>
					</div>
					<div class="modal-footer text-center">
						<button type="button" id="btnCancel" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						<button type="button" id="btnOk" class="btn">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
   
		function naverLogin() {
			let btnNaverLogin = document.getElementById("naver_id_login").firstChild;
			console.log("click");
			btnNaverLogin.click();
		}
		
		var naver_id_login = new naver_id_login("9mtn5PALlynAVoBKSbrl", "http://localhost/index-callBack");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 3);
		naver_id_login.setDomain("YOUR_SERVICE_URL");
		naver_id_login.setState(state);
		naver_id_login.init_naver_id_login();
		
		function kakaoLogin() {
			console.log(Kakao.isInitialized()); // sdk초기화여부판단
			Kakao.init('614045788a0bd0ef49f36f3f24fa4035'); //발급받은 키 중 javascript키를 사용해준다.
				Kakao.Auth.login({
					success: function(response) {
						Kakao.API.request({
							url: '/v2/user/me',
							success: function(response) {
								formData = new FormData();
//								console.log(response.kakao_account.profile.nickname);
//								console.log(response.kakao_account.email);
//							console.log(response.properties.email);
								formData.append('ceoName', response.properties.nickname);
								formData.append('snsType', 'KA');
								formData.append('ceoEmail', response.kakao_account.email);
								formData.append('snsID', response.id);
								formData.append('accessLogList[0].accessIP','106.243.194.229');
								console.log(formData);
								serverCallByFetchAjax(formData, 'IssuanceJWT', 'post', 'afterIssuance');
							},
							fail: function(error) {
								console.log(error)
							},
						})
					},
					fail: function(error) {
						console.log(error)
					},
				})
			}

	
			// 카카오 로그인 콜백 함수
			function kakaoLoginCallback(response) {
				// 액세스 토큰을 가져옵니다.
				const accessToken = response.access_token;

				// 애플리케이션의 백엔드와 통신하여 사용자의 정보를 가져옵니다.
				axios
					.get("https://kapi.kakao.com/v2/user/me", {
						headers: {
							Authorization: `Bearer ${accessToken}`
						}
					})
					.then(function(response) {
						console.log(response.data);
					})
					.catch(function(error) {
						console.error(error);
					});
			}
	</script>

	<style>


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
    right: 15%;
    bottom: 5%;
	color: white;
	font-size: 50px;
	font-weight: bold;
	cursor: pointer;
}

#foodTruckNews:hover {
	text-decoration: underline
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


</style>

	<!-- Code injected by live-server -->
</html>