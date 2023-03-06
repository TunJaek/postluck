<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>POS.TLUCK</title>
<link rel="icon" href="/resources/image/fabicon.png">
<script src="resources/js/common.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../../resources/css/mainBootstrap.css">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="vsc-initialized" onload="showModal('${param.message}','')">
	<div id="naver_id_login" style="display: none"></div>
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
</body>
<script>
// 	window.onpageshow = function(event) {
// 		if (sessionStorage.JWT != null) {
// 			const accessToken = getJWT();
// 			serverCallByRequest('/View/AccessCtl', 'post', accessToken);
// 		}
// 	}
		var naver_id_login = new naver_id_login("Y_j7t1EE1fX_0Xi6Qr5y", "http://192.168.0.5/index-callBack");
// 		var naver_id_login = new naver_id_login("9mtn5PALlynAVoBKSbrl", "http://localhost/index-callBack");
	naver_id_login.init_naver_id_login();
	naver_id_login.get_naver_userprofile("getStoreInfo()");
	
	
	function getStoreInfo() {
		const email = naver_id_login.getProfileData('email');
		const id = naver_id_login.getProfileData('id');
		const name = naver_id_login.getProfileData('name');
		// 		naver_id_login.getUniqState(function(status) {
		// 			console.log(status)
		// 			if (status) {
		// 				console.log("status");
		/* console.log(naverLogin.user); */

		// 		let userData = [];
		// 		userData.push(['ceoEmail',email]);
		// 		userData.push(['snsID',id]);
		// 		userData.push(['ceoName',name]);
		// 		userData.push(['snsType','NA']);
		// 		console.log(userData);
		formData = new FormData();
		formData.append('ceoEmail', email);
		formData.append('snsID', id);
		formData.append('ceoName', name);
		formData.append('snsType', 'NA');
		formData.append('accessLogList[0].accessIP','106.243.194.229');
		serverCallByFetchAjax(formData, 'IssuanceJWT', 'post', 'afterIssuance');

	}
</script>

</html>