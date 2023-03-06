<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POS.TLUCK</title>
<link rel="icon" href="../../resources/image/fabicon.png">
<script src="resources/js/common.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
</head>
<body onload="landing()">

</body>
<script>
	function landing() {
		if (getJWT() != '') {
			const accessToken = getJWT();
			if (accessToken) {
				serverCallByRequest('/View/AccessCtl', 'post', accessToken);
			}
		}
		serverCallByRequest("/Index", 'get', '');
	}
</script>
</html>