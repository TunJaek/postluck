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
<script src="../../resources/js/common.js"></script>

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
			<div class="searchContainer w-50  mb-3 rounded"
				style="background-color: white;">
				<h5 class="pt-4 ps-4">우리 동네 푸드트럭 찾기</h5>
				<div class="row p-3">
					<div class="col-4 m-2">
						<select class="form-select" aria-label="Default select example">
							<option selected="">광역시도</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div>
					<div class="col-4 m-2">
						<select class="form-select" aria-label="Default select example">
							<option selected="">시/군/구</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div>
					<div class="col-2 m-2 px-3">
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								name="flexRadioDefault" id="isOpenCheckBox"
								onclick="makeStoreList()"> <label
								class="form-check-label" for="flexRadioDefault1">영업중</label>
						</div>
					</div>
					<div class="col-1">
						<button class="btn btn-primary">검색</button>
					</div>
				</div>
			</div>
			<div class="searchResult w-50 rounded p-5"
				style="background-color: white;">
				<h5 id="storeListZone">푸드트럭 목록</h5>


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


</body>
<script>
let storeList ='${storeList}';
const storeJson = JSON.parse(storeList);

makeStoreList()
function makeStoreList(){
let storeListZone = document.getElementById("storeListZone");
storeListZone.innerHTML ='';
	storeJson.forEach(store => {
		if(document.getElementById("isOpenCheckBox").checked==true && store.isOpen !='O')
			return;
		else{
			 let isopen;
			  if (store.isOpen == 'O') {
			    isopen = "영업중"
			  } else {
			    isopen = "영업전"
			  }
			  storeListZone.innerHTML += `<div class="card pointer my-4" id="\${store.storeCode}" onclick="storeInfo('\${store.storeCode}')">
			    <div class="row g-0">
			      <div class="col-md-4">
			        <img src="/resources/image/\${store.storeCode}/\${store.storeCode}S00.jpg"
			          class="img-fluid rounded-start ratio ratio-4x3" onerror="this.onerror=null; this.src='/resources/image/alt.jpg';">
			      </div>
			      <div class="col-md-8">
			        <div class="ps-4 d-flex" style="flex-direction: column;">
			          <div class="row fs-4 mb-3">
			            <div class="col-9">\${store.storeName}</div>
			            <div class="col fs-5"><i class="bi bi-circle-fill me-3"
			            style="color:\${isopen=='영업중'?'#00FF00':'red' } ;font-size: small;"></i>\${isopen}
			          </div>
			        </div><h6 class="col mb-3">\${store.storeCategory}</h6>
			          <h6 class="mb-3">\${store.storeInfo == null ? " 푸드트럭 한 줄 소개가 없습니다." : store.storeInfo}</h6>
			          <p>
			            <i class="bi bi-telephone text-muted me-1"></i><small
			              class="text-muted">\${store.storePhone == null ? ' 전화 번호 정보가 없습니다.' : store.storePhone}</small>
			          </p>
			          <p>
			            <i class="bi bi-geo-alt text-muted col-1"></i><small
			              class="text-muted">\${store.locationList[0] != null ? store.locationList[0].locationAddr : ' 최근 주소 정보가 없습니다.'} \${store.locationList[0] != null ? store.locationList[0].locationDetail : ''}</small>
			          </p>
			        </div>
			      </div>
			    </div>
			  </div>`
		}
		 
		})
}
function storeInfo(storeCode){
	let storeInfo = [["storeCode",storeCode]];
	serverCallByRequest("/Home/StoreInfo","get",storeInfo);
}

</script>
<style>
.card .card img {
	flex-grow: 1;
	background-size: cover;
	background-position: center;
	width: 100%;
	height: 0;
	padding-bottom: 75%; /* 이미지 비율에 맞게 높이를 조절함 */
}

.card img {
	object-fit: cover;
}
</style>
</html>