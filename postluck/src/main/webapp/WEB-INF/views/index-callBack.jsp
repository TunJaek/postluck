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
<body class="vsc-initialized" >
	<div id="naver_id_login" style="display: none"></div>
	<div class="modal fade " id="messageModal" >
			
		</div>
</body>
<script>
// 	window.onpageshow = function(event) {
// 		if (sessionStorage.JWT != null) {
// 			const accessToken = getJWT();
// 			serverCallByRequest('/View/AccessCtl', 'post', accessToken);
// 		}
// 	}
		var naver_id_login = new naver_id_login("Y_j7t1EE1fX_0Xi6Qr5y", "http://localhost/index-callBack");
// 		var naver_id_login = new naver_id_login("9mtn5PALlynAVoBKSbrl", "http://localhost/index-callBack");
	naver_id_login.init_naver_id_login();
	naver_id_login.get_naver_userprofile("getStoreInfo()");
	
	
	function getStoreInfo() {
		const email = naver_id_login.getProfileData('email');
		const id = naver_id_login.getProfileData('id');
		const name = naver_id_login.getProfileData('name');
		formData = new FormData();
		console.log(email)
		console.log(id)
		console.log(name)
		formData.append('ceoEmail', email);
		formData.append('snsID', id);
		formData.append('ceoName', name);
		formData.append('snsType', 'NA');
		formData.append('accessLogList[0].accessIP','106.243.194.229');
		serverCallByFetchAjax(formData, 'IssuanceJWT', 'post', 'afterIssuance');

	}
</script>

</html>