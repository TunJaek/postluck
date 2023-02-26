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
<link rel="stylesheet" href="/resources/css/mainBootstrap.css">
<script src="resources/js/common.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap" rel="stylesheet">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<body>
	<div id="naver_id_login" style="display: none"></div>
</body>
<script>
window.onpageshow= function(event){
	if (sessionStorage.JWT!=null){
		const accessToken=getJWT();
		serverCallByRequest('/View/AccessCtl', 'post', accessToken);
	}
}
	var naver_id_login = new naver_id_login("9mtn5PALlynAVoBKSbrl",
			"http://localhost/index-callBack");
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
		serverCallByFetchAjax(formData, 'IssuanceJWT', 'post', 'afterIssuance');

	}


</script>

</html>