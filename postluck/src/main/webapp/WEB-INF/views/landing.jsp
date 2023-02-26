<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="landing()">

</body>
<script>
function landing(){
	if (${AccessInfo}){
		const accessToken=getJWT();
		serverCallByRequest('/View/AccessCtl', 'post', accessToken);
	}else{
		serverCallByRequest("/Index",'get','');
	}
}
</script>
</html>