<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko" style="overflow-x: hidden;">
<head>
<meta charset="UTF-8">
<title>HOME - POS.TLUCK</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="icon" href="/resources/image/fabicon.png">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/mainBootstrap.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap"
	rel="stylesheet">

</head>

<body>
	<div class="Content"
		style="background: #e9ecef; overflow-x: hidden; width: 100vw;">
		<div class="header text-center"
			style="z-index: 2000; position: sticky; top: 0; width: 100%; background: white; height: 5%;">
			<div class="row" style="height: 100%;">
				<div class="text-center w-50 " style="width: 100%;">
					<img class="logo" src="/resources/image/indexTextLogo.png"
						style="height: 100%;">
				</div>
			</div>
		</div>
		<div class="mainContent pt-3 pb-5"
			style="display: flex; box-sizing: border-box; flex-direction: column; /* max-width: 95%; */ align-items: center; overflow-y: auto; width: 100%;">
			<div class="searchContainer w-50 p-5 mb-3 rounded"
				style="background-color: white;">
				<div class="mx-5">
					<h5>푸드트럭 상세 정보</h5>
					<hr>
					<div class="row p-3 ">
						<div class="col-6 m-2">
							<img
								src="/resources/image/${store.storeCode}/${store.storeCode}S00.jpg"
								class="ratio ratio-4x3 rounded"
								onerror="this.onerror=null; this.src='/resources/image/alt.jpg';">
						</div>
						<div class="col m-2 p-4">
							<span
								class="p-1 px-2 border ${store.isOpen =='O'? 'border-success text-success' : 'border-danger text-danger'} rounded-pill small">${store.isOpen == 'O'? '영업중' : '영업전'}</span>
							<div class="fs-3">${store.storeName}</div>
							<div class="fs-6 mb-5">${store.storeInfo}</div>
							<hr>
							<div class="mt-3">카테고리 : ${store.storeCategory}</div>
							<div>최근위치 : ${store.locationList[0].locationAddr == null?'최근 위치 정보가 없습니다.':store.locationList[0].locationAddr}
								${store.locationList[0].locationDetail == null?'':store.locationList[0].locationDetail}</div>
							<div>전화번호 : ${store.storePhone == null?'전화번호 정보가 없습니다' : store.storePhone}</div>
						</div>
					</div>
				</div>

				<div class="my-5 mx-5">
					<h5 class="">푸드트럭 상세 소개</h5>
					<p class="mt-3">
					<hr>
					${store.storeInfoDetail == null? '푸드트럭 상세 소개가 없습니다.':store.storeInfoDetail}
				</div>
				<div class="my-5 mx-5">
					<h5 class="">푸드트럭 메뉴</h5>
					<hr>

					<div class="row row-cols-4" style="justify-content: center;"
						id="menuListZone"></div>
				</div>
			</div>

		</div>
	</div>

	<div class="text-center py-5" style="background: #e9ecef;">
		<p>Team : ODOD Project : Postluck</p>
		<p>Members: 김민규, 정영준, 이예림, 홍준택</p>
		<p>© 2023 Postluck. All rights reserved.</p>


	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>




</body>
<script>
const menuList = JSON.parse('${menuList}');


let menuListZone = document.getElementById("menuListZone");
menuListZone.innerHTML = '';
if(menuList.length>0){
	menuList.forEach((menu) => {
	    menuListZone.innerHTML += `
	        <div class="card col m-3" >
	            <img src="/resources/image/${store.storeCode}/${store.storeCode}\${menu.menuCode}.jpg"
	                class="card-img-top ratio ratio-4x3"
	                onerror="this.onerror=null; this.src='/resources/image/alt.jpg';">
	            <div class="text-center p-3" style="height: 100%;word-break:keep-all;display: flex;align-content: space-around;flex-direction: column;justify-content: space-around;">
	                <h4>\${menu.menuName}</h4>
	                <div>\${menu.menuPrice}원</div>
	            </div>
	        </div>`;
	});
}

	
</script>
<style>
.footer {
	background-color: #f9f9f9;
	padding: 40px 0;
}

.social-icons {
	margin-top: 20px;
}

.social-icons a {
	display: inline-block;
	margin: 0 10px;
	color: #555;
}

.social-icons a:hover {
	color: #aaa;
}

.contact-info {
	margin-top: 20px;
}

.contact-info p {
	margin-bottom: 10px;
}

.card {
	height: 300px
}

.card img {
min-height:150px;
	max-height: 150px;
	height:150px;
}
</style>
</html>
