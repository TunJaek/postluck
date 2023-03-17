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
		    //[["JWTForPostluck", eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Nzg5NDk0MDAsImV4cCI6MTY3OTAzNTgwMCwiVG9rZW5Cb2R5Ijp7InN0b3JlQ29kZSI6IjEzNTIzNDUxNDMiLCJzbnNJRCI6Im5OdmpoUURnRjcyWWNfbVFCdElOVDc2NERYNnhBQlp3eFByelNRWWc3N28iLCJzbnNUeXBlIjpudWxsLCJjZW9FbWFpbCI6bnVsbCwiY2VvTmFtZSI6bnVsbH19.7AGs3zYpv_b-BD2UBPG_DEekhXoKrlAlCy6g0bvJVw4]]
			//null
		    const accessToken = getJWT();
			if (accessToken) {
				serverCallByRequest('/View/AccessCtl', 'post', accessToken);
			}
		}
		serverCallByRequest("/Index", 'get', '');
	}
</script>
</html>