<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/image/fabicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SETTING - POS.TLUCK</title>
<script src="/resources/js/common.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/mainBootstrap.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap"
	rel="stylesheet">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0203ee3bafbf6d3fe50695090bc89516&libraries=services"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>

if('${store}'!=''){
	jsonString = '${store}'
}
</script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.1/index.global.min.js'></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<!-- 헤더랑 옆 클릭바 고정을 고정. -->

<body class="vsc-initialized">
	<!-- 위치 리스트 Modal -->
	<div class="modal fade show" id="locationListModal"
		style="display: none; z-index: 1060;">
		<div class="modal-dialog modal-dialog-centered"
			style="max-width: 40%;">
			<div class="modal-content ">
				<div class="modal-header">
					<h5 class="modal-title" id="modifyModalTitle">위치 편집</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" style="max-height: 60vh; overflow-y: auto"
					id="locations"></div>
			</div>
		</div>
	</div>
	<!-- 위치 등록 Modal -->
	<div class="modal fade " id="regLocationModal"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-modal="true" role="dialog"
		style="display: none; - -bs-modal-width: 50%; z-index: 1070">
		<div class="modal-dialog modal-dialog-centered "
			style="max-width: 50%;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="regModalTitle"></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" id="regCancel"></button>
				</div>
				<div class="modal-body; px-5 my-4">
					<div class="row p-2">
						<div class="col-3 text-center">위치명</div>
						<div class="col-9">
							<input type="text" class="form-control" id="reglocationName">
						</div>
					</div>
					<div class="row p-2">
						<div class="col-3 text-center">주소</div>
						<div class="col-7">
							<input type="text" class="form-control " id="locationAddr"
								placeholder="주소">
						</div>
						<div class="col-2">
							<input type="button" class="btn btn-primary"
								onclick="sample5_execDaumPostcode()" value="주소 검색"> <br>
						</div>
					</div>
					<div class="row p-2">
						<div class="col-3"></div>
						<div class="col-9">
							<input type="text" class="form-control" id="locationDetail"
								placeholder="상세주소를 입력해주세요." maxlength="200">
							<div id="map1"
								style="height: 30vh; margin-top: 10px; display: none"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-primary"
						id="locationServerCall"></button>
				</div>
			</div>
		</div>
	</div>

	<div class="main">
		<div class="header">
			<span class="px-3 " style="cursor: pointer"
				onclick="movePage('Back')"><svg
					xmlns="http://www.w3.org/2000/svg" width="30" height="30"
					fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
						d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
                </svg></span> <span><img
				src="/resources/image/mainLogo-dark.png"></span>
			<!-- 시간표시 연월일시분초 -->
			<span id="clock" style="position: absolute; right: 5%;"></span><br />
		</div>
		<div class="content">
			<div class="sidebar border-end d-flex ">
				<div class="border-bottom p-3 d-flex h-7"
					style="justify-content: space-between;">
					<div id="isOpenText">영업전</div>
					<div class="form-check form-switch">
						<input id="salesToggle" class="form-check-input" type="checkbox"
							onclick="updSalesLog()" style="cursor: pointer">
					</div>
				</div>

				<div class="dropdown menu border-bottom h-7">
					<button class="btn dropdown-toggle h-100 w-100"
						id="storeNameDropDown" type="button" data-bs-toggle="dropdown"
						aria-expanded="false" style="color: black">${storeName}</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item">Main Page</a></li>
						<li><a class="dropdown-item" href="#">로그아웃</a></li>
					</ul>
				</div>
				<div class="menu  p-3 sideMenu" onclick="sideMenu(1)">매장관리</div>
				<div class="menu  p-3 sideMenu" onclick="sideMenu(2)">메뉴관리</div>
				<div class="menu  p-3 sideMenu" onclick="sideMenu(5)">결제내역</div>
				<div class="menu  p-3 sideMenu" onclick="sideMenu(6)">매출분석</div>
			</div>
			<!-- sideMenu(3) : 메뉴추가 / sideMenu(4) : 메뉴수정 -->


			<!-- 1. 매장관리 -->
			<div class="mainContent" id="menu1" style="display: block;">
				<div class="border-bottom p-3 h-7">
					<h5>매장 관리</h5>
				</div>
				<div class="inputZone p-5 d-flex gap-3 "
					style="flex-direction: column; overflow-y: auto; height: 88%;"">
					<div class="row" style="align-items: center;">
						<div class="col-2">사업자 명</div>
						<input type="text" class="form-control w-25" disabled id="ceoName">
						<div class="col-2 ms-4">사업자번호</div>
						<input type="text" id="storeCodeDisabled"
							class="form-control w-25" disabled>
					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">매장명</div>
						<input type="text" id="storeName" class="form-control w-25"
							placeholder="매장명을 입력해주세요." maxlength="50">
					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">전화번호</div>
						<input type="text" id="storePhone" class="form-control w-25"
							placeholder="전화번호를 입력해주세요." maxlength="11">
					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">카테고리</div>
						<select class="form-select  w-25" id="storeCategory">
							<option value="">카테고리</option>
							<option value="SN">분식</option>
							<option value="SW">샌드위치</option>
							<option value="DE">디저트</option>
							<option value="MS">멕시칸</option>
							<option value="AS">아시안</option>
							<option value="IT">이탈리안</option>
							<option value="DR">커피/음료</option>
							<option value="SE">씨푸드</option>
							<option value="FA">패스트푸드</option>
						</select>
					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">영업위치</div>
						<div class="col-5 p-0 ">
							<div class="row ms-0">
								<select class="form-select col w-25" id="storeLocation"
									onchange="showLocationName()">
								</select>
								<div class="btn btn-primary col-4 m-3" data-bs-toggle="modal"
									data-bs-target="#locationListModal"
									onclick="showLocationList()">편집</div>
							</div>
							<input type="text" class="form-control w-100 " id="locationName"
								disabled>
							<div class="mt-3" id="map" style="height: 40vh; display: none"></div>
						</div>
					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">매장 한 줄소개</div>
						<input type="text" class="form-control w-25" id="storeInfo"
							placeholder="매장 한 줄 소개를  입력해주세요." maxlength="30">
					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2 mb-3">매장 상세정보</div>
						<div class="form-group w-50 p-0">
							<textarea class="form-control" id="storeInfoDetail" rows="3"
								maxlength="2000"></textarea>
						</div>
					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">매장 사진 등록</div>
						<div class="form-group col-6 p-0">
							<input class="form-control" type="file" id="storePicture">
						</div>
					</div>
					<div class="d-flex gap-4 mt-5 " style="justify-content: center;">
						<div class="btn btn-primary col-1" onclick="modifyStoreInfo()">저장</div>
					</div>
				</div>
			</div>
			<!-- 1. 매장관리 -->
			<!-- 2. 메뉴관리 -->
			<div class="mainContent" id="menu2" style="display: none;">
				<div class="border p-3 " style="height: 7%;">
					<h5>메뉴관리</h5>
				</div>
				<div class="text-end ">
					<button class="btn btn-outline-primary m-4 " onClick="sideMenu(3)">+메뉴추가</button>
				</div>
				<div class="menuList text-center"
					style="overflow-y: auto; overflow-y: auto; height: 80%">
					<div class="m-2 text-center">
						<table class="table table-hover text-center " id="menuList">
						</table>
					</div>
				</div>
			</div>
			<!-- 2. 메뉴관리 -->
			<!-- 2-1. 메뉴추가 -->
			<div class="mainContent" id="menu3" style="display: none;">
				<div class="border p-3 " style="height: 7%;">
					<h5>메뉴등록</h5>
				</div>
				<div class="inputZone p-5 d-flex gap-3"
					style="flex-direction: column;" id="menuInputZone"></div>
			</div>
			<!-- 3. 결제내역 -->
			<div class="mainContent" id="menu5" style="display: none;">
				<div class="border p-3 " style="height: 7%;">
					<h5>
						결제내역
						</h2>
				</div>
				<div class="d-flex w-100 " style="height: 93%;">
					<div class="paymentList border-end position-relative">
						<div class="border row position-relative m-0 gap-4 "
							style="align-items: center;">
							<div class="form-group col-5 p-3">
								<input type="date">
							</div>
							<div class="form-group col-6">
								<select class="form-select" id="paymentCategory"
									onchange="changePayment()">
									<option value="결제수단">결제수단</option>
									<option value="카드">카드</option>
									<option value="현금">현금</option>
								</select>
							</div>
						</div>
						<div class="overflow-auto" id="salesList">
							<!-- 결제내역 들어감 '카드'or현금 -->
						</div>
					</div>
					<div class="paymentDetail" style="width: 60%">
						<div class="w-100 p-4">
							<h5 class="fw-bold">결제 상세</h5>
							<hr>
							<div>
								<div id="orderDate"></div>
								<div id="address"></div>
							</div>
						</div>
						<div id="paymentInfo" class="p-4 d-flex flex-column gap-3">
							<div>
								<h5 class="fw-bold">결제내역</h5>
								<hr>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- 3. 결제내역 -->
			<!-- 4. 매출분석 -->
			<div class="mainContent" id="menu6" style="display: none;">
				<div class="border p-3 " style="height: 7%;">
					<h5>
						매출분석
						</h2>
				</div>
				<div class="inputZone p-5 d-flex gap-3"
					style="flex-direction: column;">
					<div class="salesPeriodButtonZone">
						<button type="button" class="btn btn-outline-primary"
							style="font-weight: bold;" id="today">&nbsp 오늘 &nbsp</button>
						<button type="button" class="btn btn-outline-primary"
							style="font-weight: bold;" id="oneWeek">&nbsp &nbsp 1주
							&nbsp &nbsp</button>
						<button type="button" class="btn btn-outline-primary"
							style="font-weight: bold;" id="oneMonth">&nbsp 1개월 &nbsp</button>
						<button type="button" class="btn btn-outline-primary"
							style="font-weight: bold;" id="threeMonth">&nbsp 3개월
							&nbsp</button>
					</div>
				</div>
				<div class="mainContentMidlle" style="max-width: 100%; height: 20%;">
					<div class="salesTextZone">
						<div class="textBox">
							실매출<br> <span style="font-size: 30px;">201,800원</span>
						</div>
						<div class="textBox">
							결제건수<br> <span style="font-size: 30px;">6건</span>
						</div>
						<div class="textBox">
							주문건단가<br> <span style="font-size: 30px;">33,633원</span>
						</div>
					</div>
				</div>
				<div class="mainContentFooter m-3">
					<div class="footerChoiceTab" style="position: relative;">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item" role="presentation"><a class="nav-link"
								data-bs-toggle="tab" href="#home" aria-selected="false"
								role="tab" tabindex="-1">결제수단별</a></li>
							<li class="nav-item" role="presentation"><a
								class="nav-link active" data-bs-toggle="tab" href="#profile"
								aria-selected="true" role="tab">메뉴별</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link"
								data-bs-toggle="tab" href="#locate" aria-selected="false"
								role="tab" tabindex="-1">지역별</a></li>
						</ul>
						<!-- 채팅창 내부에 차트가 위치할 div -->
						<div id="chart-container">
							<canvas id="chart"></canvas>
						</div>
						<div id="myTabContent" class="tab-content"
							style="width: 100%; text-align: center;">
							<div class="tab-pane fade" id="home" role="tabpanel">
								<div class="paymentTab"
									style="width: 80%; display: flex; flex-direction: row; font-size: 20px;">
									<br> <br>
									<div class="textBox1">
										<h4>결제수단</h4>
										<hr style="border: 1px color= silver;">
										카드<br> <br> 현금
										<hr style="border: 1px color= silver;">
									</div>
									<div class="textBox1">
										<h4>건수</h4>
										<hr style="border: 1px color= silver;">
										6건<br> <br> 18건
										<hr style="border: 1px color= silver;">
									</div>
									<div class="textBox1">
										<h4>결제금액</h4>
										<hr style="border: 1px color= silver; width: 100%;">
										197,000원<br> <br> 218,000원
										<hr style="border: 1px color= silver; width: 100%;">
									</div>
								</div>
								<div class="actualSales"
									style="display: flex; position: relative; left: 51.3%;">
									<h4 style="">실매출 &nbsp&nbsp&nbsp</h4>
									<span style="font-size: 20px;">415,000원</span>
								</div>
								<!-- <p> 결제수단별 </p> -->
							</div>
							<div class="tab-pane fade active show" id="profile"
								role="tabpanel">
								<div class="menuTab"
									style="width: 80%; display: flex; flex-direction: row; font-size: 20px;">
									<div class="textBox1">
										<h4>순위</h4>
										<hr style="border: 1px color= silver;">
										1<br> <br> 2<br> <br> 3<br> <br>
										4<br> <br> 5
									</div>
									<div class="textBox1">
										<h4>메뉴명</h4>
										<hr style="border: 1px color= silver;">
										1<br> <br> 2<br> <br> 3<br> <br>
										4<br> <br> 5
									</div>
									<div class="textBox1">
										<h4>건수</h4>
										<hr style="border: 1px color= silver;">
										1<br> <br> 2<br> <br> 3<br> <br>
										4<br> <br> 5
									</div>
									<div class="textBox1"
										style="text-align: right; position: relative; left: -10%;">
										<h4>결제금액</h4>
										<hr style="border: 1px color= silver; width: 135%;">
										1,197,000원<br> <br> 197,000원<br> <br>
										197,000원<br> <br> 97,000원<br> <br> 7,000원
									</div>
								</div>
							</div>
							<div class="tab-pane fade active show" id="locate"
								role="tabpanel">
								<div class="menuTab"
									style="width: 80%; display: flex; flex-direction: row; font-size: 20px;">
									<div class="textBox1">
										<h4>지역</h4>
										<hr style="border: 1px color= silver;">
										서울<br> <br> 경기<br> <br> 인천<br> <br>
										강릉<br> <br> 5
									</div>
									<div class="textBox1">
										<h4>메뉴명</h4>
										<hr style="border: 1px color= silver;">
										1<br> <br> 2<br> <br> 3<br> <br>
										4<br> <br> 5
									</div>
									<div class="textBox1">
										<h4>건수</h4>
										<hr style="border: 1px color= silver;">
										1<br> <br> 2<br> <br> 3<br> <br>
										4<br> <br> 5
									</div>
									<div class="textBox1"
										style="text-align: right; position: relative; left: -10%;">
										<h4>결제금액</h4>
										<hr style="border: 1px color= silver; width: 135%;">
										1,197,000원<br> <br> 197,000원<br> <br>
										197,000원<br> <br> 97,000원<br> <br> 7,000원
									</div>
								</div>
							</div>
						</div>
						<!-- <p>  </p> -->
					</div>
				</div>
			</div>
			<!-- 4. 매출분석 -->
		</div>
		<!-- 헤더랑 옆 클릭바 고정을 고정. -->
		<!--  메세지 모달 -->
	</div>



	<script>
	if (${store} != '') {
		jsonString = '${store}';
	}
	if (jsonString != '') {
		document.getElementById("storeNameDropDown").innerText = JSON
				.parse(jsonString).storeName;
	}
	let jsonData ;
	const storeNum = JSON.parse(jsonString).storeCode;
	
	let salesToggle = document.getElementById("salesToggle");
	if ('${isOpen}' == 'false') {
		salesToggle.setAttribute("checked", "false");
		document.getElementById("isOpenText").innerText = "영업중"
	} else {
		salesToggle.setAttribute("checked", "true");
		document.getElementById("isOpenText").innerText = "영업전"
	}

	let selectedIdx = 1;
	
	
	function setStoreInfo(JsonData){
		jsonData = JsonData;
	}
	sideMenu(1);
	//메뉴 탭을 누를때 
	function sideMenu(newIdx) {
		 const formData = new FormData;
		 formData.append("storeCode",storeNum);
		 serverCallByFetch(formData, '/Api/GetStoreInfo', 'post','setStoreInfo', header);
		document.getElementById("menu" + selectedIdx).style.display = "none";
		document.getElementById("menu" + newIdx).style.display = "block";
		selectedIdx = newIdx;
		let selectedMenu = document.getElementById("menu" + selectedIdx);
		selectedMenu.style.display = "block";

		if (newIdx == 1) { //매장관리 선택시
			jsonData = JSON.parse(jsonString);
			document.getElementById("storeCodeDisabled").value = storeNum.substring(0,
				3)
				+ "-" + storeNum.substring(3, 5) + "-" + storeNum.substring(5, 10);
			document.getElementById("ceoName").value = jsonData.ceoName;
			document.getElementById("storeName").value = jsonData.storeName;
			document.getElementById("storePhone").value = jsonData.storePhone;
			document.getElementById("storeInfo").value = jsonData.storeInfo;
			document.getElementById("storeCategory").value = jsonData.storeCategory;
			document.getElementById("storeInfoDetail").value = jsonData.storeInfoDetail;
			let locationList = jsonData.locationList;
			if(locationList.length>0){
			document.getElementById("map").style.display ="block";
	
			const storeLocation = document.getElementById("storeLocation");
			const optionEmpty = document.createElement("option");
			let container = document.getElementById('map');
			const selectTag = document.getElementById("storeLocation");
			const location = locationList[0]; //바꿔야함!!!!!!!!!!!!!!!!!!
			const locationName = location.locationName;
			let locationDetail =location.locationDetail;
			optionEmpty.innerText = "위치";
			storeLocation.appendChild(optionEmpty);
			while (storeLocation.firstChild) {
				storeLocation.removeChild(storeLocation.firstChild);
			}
			for (let i = 0; i < jsonData.locationList.length; i++) {
				const option = document.createElement("option");
				option.setAttribute("value",
						jsonData.locationList[i].locationCode);
				option.setAttribute("idx", i);
				option.innerText = jsonData.locationList[i].locationName;
				storeLocation.appendChild(option);
			}
			//지도를 담을 영역의 DOM 레퍼런스
			let options = { //지도를 생성할 때 필요한 기본 옵션
				center : new kakao.maps.LatLng(location.latitude,
						location.longitude), //지도의 중심좌표.
				level : 3
			//지도의 레벨(확대, 축소 정도)
			};

			let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			map.relayout();
			let geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch( location.locationAddr,
							function(result, status) {
								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {
									let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
									// 결과값으로 받은 위치를 마커로 표시합니다
									let marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});
									// 인포윈도우로 장소에 대한 설명을 표시합니다
									let infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">'
														+ locationName + '</div>'
											});
									infowindow.open(map, marker);
									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
			showLocationName()
			}
		}else if(newIdx == 2){ //메뉴관리 선택시
			jsonData = JSON.parse(jsonString);
			console.log("newIdx == 2")
			
			const menuList = jsonData.menuList;
			if(menuList!=null&&menuList.length>0){
			const menuListDiv = document.getElementById("menuList");
			const tbody = document.createElement("tbody");
			menuList.forEach(item => {
			  const tr = document.createElement("tr");
			  tr.className = "align-middle";
			  tr.value = item.menuCode;
			  
			  const td1 = document.createElement("td");
			  if(item.isMain=='Y'){
				  const badge = document.createElement("span");
				  badge.className = "badge bg-success rounded-pill fs-6";
				  badge.textContent ='대표';
				  td1.appendChild(badge);
			  }
			  tr.appendChild(td1);

			  const td2 = document.createElement("td");
			  if(item.isKiosk=='Y'){
				  td2.textContent ='노출';
			  }else{
				  td2.textContent='미노출';
			  }
			  tr.appendChild(td2);

			  const td3 = document.createElement("td");
			  td3.textContent = item.menuName;
			  tr.appendChild(td3);

			  const td4 = document.createElement("td");
			  td4.textContent = item.menuPrice;
			  tr.appendChild(td4);

			  const td5 = document.createElement("td");
			  const btn = document.createElement("div");
			  btn.className = "btn btn-outline-secondary";
			  btn.setAttribute("onclick", "modifyMenuPage('" + item.menuCode + "')");
			  btn.textContent = "수정";
			  td5.appendChild(btn);
			  tr.appendChild(td5);

			  tbody.appendChild(tr);
			 
			});
			menuListDiv.innerHTML = "";
			menuListDiv.innerHTML+=
				`<thead>
				   <tr>
				      <th scope="col"></th>
				      <th scope="col">키오스크</th>
				      <th scope="col">메뉴 이름</th>
				      <th scope="col">가격</th>
				      <th scope="col"></th>
				   </tr>
				</thead>`;
			menuListDiv.appendChild(tbody);
			}
		}else if(newIdx == 3){
		    showMenuInput('');
		}else if(newIdx == 5){
			serverCallByFetch(formData,'/Api/SelPayment','post','selSalesInfo',header);
		}
		

	}
	
	//매장 분류 
	const category = document.getElementById('storeCategory')
	const categoryOptions = category.options
	for (let i = 0; i < categoryOptions.length; i++) {
		if (categoryOptions[i].value == '${storeCategory}') {
			categoryOptions[i].selected = "true";
		}
	}
	//onchange로 지역 선택할때마다 지도 보여주는 func
	function showLocationName() {
		let jsonData = JSON.parse(jsonString);
		let locationList = jsonData.locationList;
		let container = document.getElementById('map');
		const selectTag = document.getElementById("storeLocation");
		const location = locationList[selectTag.selectedIndex];
		const locationName = location.locationName;
		let locationDetail =location.locationDetail;
		if(location.locationDetail == null){
			locationDetail ='';
		}
		document.getElementById("locationName").value = location.locationAddr+" " + locationDetail;
		//지도를 담을 영역의 DOM 레퍼런스
		let options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(location.latitude,
					location.longitude), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		map.relayout();
		let geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(
						location.locationAddr,
						function(result, status) {
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								let coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);
								// 결과값으로 받은 위치를 마커로 표시합니다
								let marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});
								// 인포윈도우로 장소에 대한 설명을 표시합니다
								let infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">'
													+ locationName + '</div>'
										});
								infowindow.open(map, marker);
								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	}
	//영업기록 남기는 func 
	function updSalesLog() {
		let formData = new FormData();
		console.log(salesToggle.checked)
		if (salesToggle.checked) {
			console.log("false")
			showModal("plain::영업을 시작합니다.:")
			formData.append('salesLogList[0].salesState', 'O');
		} else {
			console.log("true")
			showModal("plain::영업을 종료합니다.:")
			formData.append('salesLogList[0].salesState', 'C');
		}
		formData.append('locationList[0].locationCode', 'L01');
		formData.append('storeCode', storeNum);
		serverCallByFetch(formData, '/Api/UpdSalesLog', 'post', 'afterUpdSalesLog', header);
	}
	//영업기록 callback
	function afterUpdSalesLog(jsonData){
		if ('${isOpen}' == 'true'){
			salesToggle.setAttribute("checked", "true");
			document.getElementById("isOpenText").innerText = "영업중";
			showModal(jsonData.message);
		}else{
			salesToggle.setAttribute("checked", "false");
			document.getElementById("isOpenText").innerText = "영업전";
			showModal(jsonData.message);
		}
	}
	//모달창 숨기는 func
	function regCancel() {
		document.getElementsByClassName("modal")[0].style.display = "none"
	}
	//매장 정보 수정 func
	function modifyStoreInfo() {
		console.log("modifyStoreInfo")
		formData = new FormData();
		const storeName = document.getElementById('storeName');
		const storePhone = document.getElementById('storePhone');
		const storeInfo = document.getElementById('storeInfo');
		const storeInfoDetail = document.getElementById('storeInfoDetail');
		const storeCategory = document.getElementById('storeCategory');
		const storeLocation = document.getElementById("storeLocation").options[selectedIdx].value;
		const storeImage = doucment.getElementById("storePicture");

		if (storeName.value != '' && lengthCheck(storeName)) {
			formData.append('storeName', storeName.value);
			if (storePhone.value == ''
					|| (storePhone.value != '' && lengthCheck(storePhone))) {
				formData.append('storePhone', storePhone.value);
				if (storeCategory.value != '') {
					formData.append('storeCategory', storeCategory.value);
					formData.append('storeInfo', storeInfo.value);
					formData.append('storeInfoDetail', storeInfoDetail.value);
					formData.append('storeCode', storeNum);
					formData.append('storeLocationCode',storeLocation)
					formData.append('file',storeImage.files[0]);
					serverCallByFetch(formData, '/Api/ModifyStoreInfo', 'post',
							'afterModifyStoreInfo', header);
				} else {
					showModal('error:카테고리 오류:카테고리는 필수 입력사항입니다.:');
				}

			} else {
				storePhone.value = '';
				showModal('error:전화번호 오류:전화번호는 11글자로 입력하세요.:');
			}

		} else {
			storeName.value = '';
			showModal('error:매장명 오류:매장명은 2글자에서 50글자 이내로 입력하세요.:');
		}
	}
	//매장 정보 수정 callback
	function afterModifyStoreInfo(jsonData) {
		console.log("afterModifyStoreInfo")
		showModal(jsonData.message+"sideMenu:1");
		document.getElementById("storeNameDropDown").innerText = jsonData.storeName;
	}
	//지도 보여주는 func
	function sample5_execDaumPostcode() {
		let mapContainer = document.getElementById('map1'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 126.599243), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};
		//지도를 미리 생성
		let map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		let geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		let marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 126.599243),
			map : map
		});
		new daum.Postcode({
			oncomplete : function(data) {
				let addr = data.address; // 최종 주소 변수
				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("locationAddr").value = addr;
				// 주소로 상세 정보를 검색
				geocoder.addressSearch(data.address, function(results, status) {
					// 정상적으로 검색이 완료됐으면
					if (status === daum.maps.services.Status.OK) {
						let result = results[0]; //첫번째 결과의 값을 활용
						// 해당 주소에 대한 좌표를 받아서
						let coords = new daum.maps.LatLng(result.y, result.x);
						// 지도를 보여준다.
						mapContainer.style.display = "block";
						map.relayout();
						// 지도 중심을 변경한다.
						map.setCenter(coords);
						// 마커를 결과값으로 받은 위치로 옮긴다.
						marker.setPosition(coords)
						map.relayout();
					}
				});
			}
		}).open();

	}
	//위치 등록 func(serverCall)
	function regLocation(locationCode) {
		console.log("regLocation")
		const locationAddr = document.getElementById("locationAddr").value;
		const locationName = document.getElementById("reglocationName").value;
		const locationDetail = document.getElementById("locationDetail").value;
		if (locationAddr != '') {
			if (locationName != '') {
				var geocoder = new kakao.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(locationAddr,
						function(result, status) {
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);
								formData = new FormData;
								formData.append("storeCode", storeNum);
								formData.append(
										"locationList[0].locationDetail",
										locationDetail);
								formData.append("locationList[0].latitude",
										result[0].x);
								formData.append("locationList[0].longitude",
										result[0].y);
								formData.append("locationList[0].locationName",
										locationName);
								formData.append("locationList[0].locationAddr",
										locationAddr);
								if(document.getElementById("regModalTitle").innerText == '위치 수정'){
									formData.append("locationList[0].locationCode",locationCode)
									serverCallByFetch(formData, "/Api/ModifyLocation","post", "afterRegLocation", header);
								}
								else{
									serverCallByFetch(formData, "/Api/RegLocation","post", "afterRegLocation", header);
								}
										
							}
						});
			} else {
				showModal('error::위치명을 입력해주세요.:');
			}
		} else {
			showModal('error::주소를 입력해주세요.:');
		}
	}
	const regLocationModal = new bootstrap.Modal(document.getElementById('regLocationModal'))
	//위치 등록 후 callback func
	function afterRegLocation(jsonData) {
		locationListModal.hide()
		regLocationModal.hide()
		document.getElementById("regLocationModal").display ="none"
		document.getElementById("locationAddr").value = '';
		document.getElementById("locationName").value = '';
		document.getElementById("locationDetail").value = '';
		showModal(jsonData.message+"reload:1");
	}
	//위치 리스트 모달 보여주기 
	function showLocationList() {
		  const locations = document.getElementById("locations");
		  let jsonData = JSON.parse(jsonString);
		  const locationList = jsonData.locationList;
		  let locationItem = '<div class="row p-5; text-end mb-4 me-3"><div class="col-12"><button type="button" class="btn btn-primary"  onclick="regLocationModalShow();">+등록</button></div></div>';
		  for (let i = 0; i < locationList.length; i++) {
		    if (locationList[i].locationDetail == null) {
		      locationList[i].locationDetail = '';
		    }
		    locationItem += '<div class="row border-bottom m-3" id="locationItem' + i + '"><div class="col-1"><i class="bi bi-geo-alt"></i></div><div class="col-7 fs-5">' + locationList[i].locationName + '</div><div class="col text-end"><button type="button" class="btn btn-outline-primary m-2" data-bs-toggle="modal" data-bs-target="#regLocationModal" onclick="modifyLocationModalShow(' + i + ')">수정</button><button type="button" class="btn btn-outline-danger" onclick="deleteIdx ='+ i +";showModal('warn:위치 삭제:위치가 삭제됩니다. 삭제하시겠습니까?:deleteLocation:')\">삭제</button></div><div class=\"row\"><div class=\"col-1\"></div><div class=\"col\">"+ locationList[i].locationAddr + locationList[i].locationDetail + '</div></div></div>';
		  }
		  locations.innerHTML = locationItem;
		}
	//위치 등록 modal 보여주기
	function regLocationModalShow(){
		regLocationModal.show();
		document.getElementById("locationServerCall").innerText ="등록";
		document.getElementById("regModalTitle").innerText = '위치 등록';
		document.getElementById("locationServerCall").setAttribute("onclick","regLocation('')");
		document.getElementById("locationAddr").value=  '';
		document.getElementById("reglocationName").value =  '';
		document.getElementById("locationDetail").value =  '';
	}
	
	//위치 수정 modal 보여주기
	function modifyLocationModalShow(index){
		regLocationModal.show();
		let jsonData = JSON.parse(jsonString);
		const location=jsonData.locationList[index];
		document.getElementById("locationServerCall").innerText ="저장";
		document.getElementById("regModalTitle").innerText = '위치 수정';
		document.getElementById("locationServerCall").setAttribute("onclick","regLocation('"+location.locationCode+"')");
		document.getElementById("locationAddr").value= location.locationAddr;
		document.getElementById("reglocationName").value =  location.locationName;
		document.getElementById("locationDetail").value = location.locationDetail;
	}
	let deleteIdx;
	//지역 삭제
	function deleteLocation(){
		let jsonData = JSON.parse(jsonString);
		const location=jsonData.locationList[deleteIdx];
		formData = new FormData;
		formData.append("storeCode", storeNum);
		formData.append("locationList[0].locationCode",location.locationCode)
		serverCallByFetch(formData, "/Api/DeleteLocation","post", "afterDelLocation", header);
	}
	
	//지역 리스트 모달(부트스트랩 객체)
	const locationListModal = new bootstrap.Modal(document.getElementById('locationListModal'));
	//지역 삭제 callback
	function afterDelLocation(jsonData) {
		deleteIdx ='';
		locationListModal.hide()
		showModal(jsonData.message+"sideMenu:1")	
	}
	//메뉴 입력 Zone 생성 
	function showMenuInput(menuCode){
	    const menuInputZone = document.getElementById("menuInputZone");
		menuInputZone.innerHTML ='';
	    // 메뉴명 입력란
	    const menuNameRow = document.createElement("div");
	    menuNameRow.classList.add("row");
	    menuNameRow.style.alignItems = "center";
	    menuNameRow.innerHTML = `
	    	<div class="col-2">메뉴명</div>
	    	<input type="text" class="form-control w-25" placeholder="메뉴명을 입력해주세요." id="menuName">
	    `;
	    menuInputZone.appendChild(menuNameRow);

	    // 가격 입력란
	    const menuPriceRow = document.createElement("div");
	    menuPriceRow.classList.add("row");
	    menuPriceRow.style.alignItems = "center";
	    menuPriceRow.innerHTML = `
	    	<div class="col-2">가격</div>
	    	<input type="text" class="form-control w-25" placeholder="가격을 입력해주세요." id="menuPrice">
	    `;
	    menuInputZone.appendChild(menuPriceRow);

	    // 매장 사진 등록
	    const menuImageRow = document.createElement("div");
	    menuImageRow.classList.add("row");
	    menuImageRow.style.alignItems = "center";
	    menuImageRow.innerHTML = `
	    	<div class="col-2">매장 사진 등록</div>
	    	<div class="form-group col-6 p-0">
	    		<input class="form-control" type="file" id="menuImage">
	    	</div>
	    `;
	    menuInputZone.appendChild(menuImageRow);

	    // 대표메뉴 여부
	    const isMainRow = document.createElement("div");
	    isMainRow.classList.add("row");
	    isMainRow.style.alignItems = "center";
	    isMainRow.innerHTML = `
	    	<div class="col-2">대표메뉴 여부</div>
	    	<div class="form-check form-switch col">
	    		<input class="form-check-input" type="checkbox" id="isMain">
	    	</div>
	    `;
	    menuInputZone.appendChild(isMainRow);

	    // KIOSK 노출 여부
	    const isKioskRow = document.createElement("div");
	    isKioskRow.classList.add("row");
	    isKioskRow.style.alignItems = "center";
	    isKioskRow.innerHTML = `
	    	<div class="col-2">KIOSK 노출 여부</div>
	    	<div class="form-check form-switch col">
	    		<input class="form-check-input" type="checkbox" id="isKiosk">
	    	</div>
	    `;
	    menuInputZone.appendChild(isKioskRow);

	    // 품절 여부
	    const isSoldOutRow = document.createElement("div");
	    isSoldOutRow.classList.add("row");
	    isSoldOutRow.style.alignItems = "center";
	    isSoldOutRow.innerHTML = `
	    	<div class="col-2">품절 여부</div>
	    	<div class="form-check form-switch col">
	    		<input class="form-check-input" type="checkbox" id="isSoldOut">
	    	</div>
	    `;
	    menuInputZone.appendChild(isSoldOutRow);

	    // 저장 및 취소 버튼, 메뉴 수정/등록 분기
	    const buttonRow = document.createElement("div");
	    buttonRow.classList.add("d-flex", "gap-4", "mt-5");
	    buttonRow.style.justifyContent = "center";
	    if(menuCode!=''){
		  buttonRow.innerHTML = '<div class="btn btn-outline-danger col-1" onclick="deleteMenu(\'' + menuCode + '\')">삭제</div>' +
	    '<div class="btn btn-primary col-1" onclick="modifyMenu(\'' + menuCode + '\')">저장</div>';
	    }else{
		 buttonRow.innerHTML = '<div class="btn btn-primary col-1" onclick="regMenu();">등록</div>';
	    }
	  
	    menuInputZone.appendChild(buttonRow);
	}
	
	function regMenu() {
		  // 입력값들을 추가
		const menuCode = document.getElementById("menuCode"); 
	  	const menuName = document.getElementById("menuName").value;
	  	const menuPrice = document.getElementById("menuPrice").value;
	  	const menuImage = document.getElementById("menuImage");
	  	//const menuImage = createFileBox("form-control");
	 	const isMain = document.getElementById("isMain").checked;
	 	const isKiosk = document.getElementById("isKiosk").checked;
		const isSoldOut = document.getElementById("isSoldOut").checked;
		  
		  
		  const formData = new FormData();
		  formData.append("storeCode", storeNum);
		  //formData.append("menuList[0].menuCode", menuCode); 
		  formData.append("menuList[0].menuName", menuName);
		  formData.append("menuList[0].menuPrice", menuPrice);
		   formData.append("file", menuImage.files[0]);
		  //formData.append("menuList[0].menuImageCode", menuImage);
		  if(isKiosk) {
				formData.append("menuList[0].isKiosk", "Y");
			} else {
				formData.append("menuList[0].isKiosk", "N");
			}

			if(isMain) {
				formData.append("menuList[0].isMain", "Y");
			} else{
				formData.append("menuList[0].isMain", "N");
			}
			
			if(isSoldOut) {
				formData.append("menuList[0].isSoldOut", "Y");
			} else{
				formData.append("menuList[0].isSoldOut", "N");
			}
		  
		  
		  serverCallByFetch(formData,"/Api/RegMenu","post","afterDeleteMenu",header);
	}
	
	//메뉴 수정 버튼 클릭시 나타나는 페이지
	function modifyMenuPage(menuCode){
		sideMenu(3); //메뉴관리 content header 띄우기
		showMenuInput(menuCode); // 해당 메뉴의 정보 value set
		jsonData = JSON.parse(jsonString);
		const menuList = jsonData.menuList;
		const menuItem = menuList.filter(item => item.menuCode === menuCode)[0];
		const menuName = document.getElementById("menuName");
		const menuPrice = document.getElementById("menuPrice");
		const isSoldOut =
		    document.getElementById("isSoldOut");
		const isKiosk =
		    document.getElementById("isKiosk");
		const isMain =
		    document.getElementById("isMain");
		
		menuName.value=menuItem.menuName;
		menuPrice.value = menuItem.menuPrice;
		if(menuItem.isSoldOut =='Y') isSoldOut.checked = true;
		if(menuItem.isKiosk =='Y') isKiosk.checked = true;
		if(menuItem.isMain =='Y') isMain.checked = true;
	}
	
	function deleteMenu(menuCode){
	    formData = new FormData();
	    formData.append("storeCode",storeNum);
	    formData.append("menuList[0].menuCode",menuCode);
	    formData.append("file", menuImage.files[0]);
	    serverCallByFetch(formData,"/Api/DeleteMenu","post","afterDeleteMenu",header);
	}
	
	function modifyMenu(menuCode){
		const menuName = document.getElementById("menuName").value;
		const menuPrice = document.getElementById("menuPrice").value;
		const menuImage = document.getElementById("menuImage");
	  	//const menuImage = createFileBox("form-control");
	 	const isMain = document.getElementById("isMain").checked;
	 	const isKiosk = document.getElementById("isKiosk").checked;
		const isSoldOut = document.getElementById("isSoldOut").checked;
		
	    formData = new FormData();
	    formData.append("storeCode",storeNum);
	    formData.append("menuList[0].menuCode",menuCode);
	    formData.append("menuList[0].menuName", menuName);
	    formData.append("menuList[0].menuPrice", menuPrice);
	    console.log(menuImage.files[0])
	    if(menuImage.files[0]!=null){
	    formData.append("file", menuImage.files[0]);
	    }
	    
	    if(isKiosk) {
			formData.append("menuList[0].isKiosk", "Y");
		} else {
			formData.append("menuList[0].isKiosk", "N");
		}

		if(isMain) {
			formData.append("menuList[0].isMain", "Y");
		} else{
			formData.append("menuList[0].isMain", "N");
		}
		
		if(isSoldOut) {
			formData.append("menuList[0].isSoldOut", "Y");
		} else{
			formData.append("menuList[0].isSoldOut", "N");
		}
	    
	    serverCallByFetch(formData,"/Api/ModifyMenu","post","afterDeleteMenu",header);
	}

	
	 function afterDeleteMenu(jsonData){
		 console.log("afterDeleteMenu"+jsonData);
		jsonString = JSON.stringify(jsonData)
	    showModal(jsonData.message+"sideMenu:2");
	}
	// 차트 생성
	var ctx = document.getElementById('chart').getContext('2d');
	var myChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: ['Red', 'Blue', 'Yellow'],
	    datasets: [{
	      label: '# of Votes',
	      data: [66.7, 11.1, 22.2],
	      backgroundColor: [
	        'rgb(255, 99, 132)',
	        'rgb(54, 162, 235)',
	        'rgb(255, 205, 86)'
	      ],
	      borderWidth: 0
	    }]
	  },
	  options: {
	    maintainAspectRatio: false
	  }
	});

	// 차트 컨테이너 크기 설정
	var chartContainer = document.getElementById('chart-container');
	chartContainer.style.width = '50vw';
	chartContainer.style.height = '30vh';
	
	//매출분석
	function changePayment(){
		let payment=document.getElementById("paymentCategory").value;
		 formData = new FormData();
		 if(payment == '결제수단') {sideMenu(5)}
		 else{
		formData.append('orderList[0].salespaymentType',payment);
		formData.append("storeCode",storeNum);
		serverCallByFetch(formData,'/Api/ChangePayment','post','selSalesInfo',header);
		 }
	}
	salesData = new FormData();
	function selSalesInfo(jsonData){
		const salesListZone= document.querySelector('#salesList');
		formData = new FormData();
		salesListZone.innerHTML='';
		let salesList= jsonData.orderList;
		
			// salesList 배열의 요소 수만큼 반복하며 HTML 요소를 동적으로 생성합니다.
			salesList.forEach((data) => {
			  // div 요소를 생성합니다.
			  const divElement = document.createElement("div");
			  divElement.classList.add("row", "border", "m-0", "align-items-center", "text-center", "p-3");
			  
			// div 요소에 onclick 이벤트를 추가합니다.
			  divElement.onclick = function() {
				  salesData.delete('storeCode'); // FormData 객체 초기화
				  salesData.delete('orderList[0].salesDate');
				  salesData.delete('orderList[0].salespaymentType');
			    // 클릭 시 실행될 함수를 작성합니다.
			    	salesData.append("storeCode",storeNum);
			    	salesData.append('orderList[0].salesDate',data.salesDate);
			    	salesData.append('orderList[0].salespaymentType',data.salespaymentType)
			    	console.log(data.salesDate)
				  serverCallByFetch(salesData,'/Api/selSalesDetail','post','selSalesDetail',header);
			  };

			  // span 요소를 생성합니다.
			  const spanElement = document.createElement("span");
			  if(data.salespaymentType=='카드'){
			  spanElement.classList.add("badge", "rounded-pill", "bg-secondary", "w-25");
			  }else{
			  spanElement.classList.add("badge", "rounded-pill", "bg-primary", "w-25");}
			  spanElement.textContent = data.salespaymentType;
		

			  // div 요소를 생성합니다.
			  const col5Element = document.createElement("div");
			  col5Element.classList.add("col-5");
			  col5Element.textContent = data.amount+"원";

			  // div 요소를 생성합니다.
			  const col3Element = document.createElement("div");
			  col3Element.classList.add("col-3");
			  col3Element.textContent = data.salesDate;

			  // 생성한 요소들을 부모 요소에 추가합니다.
			  divElement.appendChild(spanElement);
			  divElement.appendChild(col5Element);
			  divElement.appendChild(col3Element);
			  salesListZone.appendChild(divElement);
			});
	}
	
	function selSalesDetail(jsonData) {
		console.log(jsonData);
		  const orderDate = jsonData.orderList[0].salesDate;
		  const address = jsonData.locationList[0].locationAddr+jsonData.locationList[0].locationDetail;
		  const paymentList = jsonData.orderList[0].orderMenuList;
		  
		  const orderDateElement = document.getElementById('orderDate');
		  const addressElement = document.getElementById('address');
		const paymentInfoElement = document.getElementById('paymentInfo');
			  const paymentMethod = jsonData.orderList[0].salespaymentType;
		paymentInfoElement.innerText = '';
			  let paymentListHtml = '';
			  let totalPrice = 0;
				// 주문 날짜와 주소 정보를 출력합니다.
			  orderDateElement.innerHTML = orderDate;
			  addressElement.innerHTML = address;

			  for (let i = 0; i < paymentList.length; i++) {
			    const item = paymentList[i];
			    paymentListHtml += `\${paymentList[i].menuName} \${paymentList[i].menuPrice} x \${paymentList[i].quantity}<br>`;
			    totalPrice += item.menuPrice * item.quantity;
			  }

			  const paymentInfo = `
			    <hr>
			    <div class="align-items-end mt-3">
			      <div>
			        결제수단<br>
			        <h4>\${paymentMethod}</h4>
			        <h3 class="col text-end">총 \${totalPrice}원</h3>
			      </div>
			    </div>
			  `;

			  paymentInfoElement.innerHTML = `
			    <div>
			      <h5 class="fw-bold">결제내역</h5>
			      <hr>
			      \${paymentListHtml}
			    </div>
			  `;

			  paymentInfoElement.insertAdjacentHTML('beforeend', paymentInfo);
	}
</script>

	<style>
body {
	margin: 0px;
	margin-bottom: 0px;
	font-family: 'Noto Sans KR', sans-serif;
}

.header {
	position: relative;
	height: 5%;
	background-color: #333333;
	margin: 0px;
	color: white;
	display: flex;
	align-items: center;
}

.content {
	background-color: white;
	position: relative;
	display: flex;
	width: 100%;
	height: 95%;
}

.sidebar {
	width: 20%;
	height: 100%;
	position: relative;
	flex-direction: column
}

.mainContent {
	width: 80%;
	position: relative;
	background-color: white;
}

.salesPeriodButtonZone {
	width: 40%;
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
}

.salesTextZone {
	width: 50%;
	height: 50%;
	/* background-color: aqua; */
	position: relative;
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
	font-size: 20px;
	text-align: left;
}

.textBox1 {
	width: 30%;
	position: relative;
}

.paymentList {
	width: 40%;
}

.h-7 {
	height: 7%;
}

.menu {
	cursor: pointer;
}

.menu:hover {
	background-color: #ECFBF2;
	transition: background-color 0.3s ease;
}
</style>
</html>