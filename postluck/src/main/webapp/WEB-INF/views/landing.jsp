<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POS.TLUCK</title>
<link rel="icon" href="../../resources/image/fabicon.png">
<script src="resources/js/common.js"></script>
</head>
<body onload="landing()">

</body>
<script>
function landing(){
	if ('${AccessInfo}'!=''){
		const accessToken=getJWT();
		serverCallByRequest('/View/AccessCtl', 'post', accessToken);
	}else{
		serverCallByRequest("/Index",'get','');
	}
}
</script>
</html>