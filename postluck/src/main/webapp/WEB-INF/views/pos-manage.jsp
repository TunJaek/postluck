<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/image/fabicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SETTING - POS.TLUCK</title>
<script src="/resources/js/common.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />

<link rel="stylesheet" href="/resources/css/mainBootstrap.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap" rel="stylesheet">
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth'
		});
		calendar.render();
	});
	function printTime() {
		var clock = document.getElementById("clock"); // 출력할 장소 선택
		var now = new Date(); // 현재시간
		var nowTime = now.getFullYear() + "년 " + (now.getMonth() + 1) + "월 "
				+ now.getDate() + "일 " + "- " + now.getHours() + "시 "
				+ now.getMinutes() + "분 " + now.getSeconds() + "초";
		clock.innerHTML = nowTime; // 현재시간을 출력
		setTimeout("printTime()", 1000); // setTimeout(“실행할함수”,시간) 시간은1초의 경우 1000
	}
	window.onload = function() { // 페이지가 로딩되면 실행
		printTime();
	}
</script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.1/index.global.min.js'></script>

</head>
<!-- 헤더랑 옆 클릭바 고정을 고정. -->

<body class="vsc-initialized" onload="pageInit('${param.message}')">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<div class="main">
		<div class="header">
			<span class="px-3 " style="cursor: pointer" onclick="movePage('Pos')"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
                </svg></span> <span><img src="/resources/image/mainLogo-dark.png"></span>

			<!-- 시간표시 연월일시분초 -->
			<span id="clock" style="position: absolute; right: 5%;"></span><br />
		</div>
		<div class="content">
			<div class="sidebar border d-flex border">

				<div class="border p-3 d-flex" style="justify-content: space-between; height: 7%; background-color: white;">
					영업전

					<div class="form-check form-switch">
<<<<<<< HEAD
						<input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
=======
						<input id="salesToggle" class="form-check-input" type="checkbox" onclick="updSalesLog()" id="flexSwitchCheckDefault">
>>>>>>> refs/remotes/origin/main
					</div>

				</div>

				<div class="dropdown menu">
					<button class="btn dropdown-toggle  w-100" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: black">핫도그라운드</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Homepage</a></li>
						<li><a class="dropdown-item" href="#">로그아웃</a></li>
					</ul>
				</div>
				<div class="menu border p-3" onclick="sideMenu(0)">일정</div>
				<div class="menu border p-3" onclick="sideMenu(1)">매장관리</div>
				<div class="menu border p-3" onclick="sideMenu(2)">메뉴관리</div>
				<div class="menu border p-3" onclick="sideMenu(5)">결제내역</div>
				<div class="menu border p-3" onclick="sideMenu(6)">매출분석</div>
			</div>
			<!-- sideMenu(3) : 메뉴추가 / sideMenu(4) : 메뉴수정 -->
			<!-- 0. 일정 -->
			<div class="mainContent" id="menu0" style="display: block;">
				<div class="border p-3" style="height: 7%;">
					<h5>일정</h5>
				</div>
				<div class="mt-5 d-flex" id='calendar-container' style="width: 100%; justify-content: center;">
					<div id='calendar' style="width: 50%;"></div>
				</div>
			</div>
			<!-- 0. 일정 -->

			<!-- 1. 매장관리 -->
			<div class="mainContent" id="menu1" style="display: none;">

				<div class="inputZone p-5 d-flex gap-3" style="flex-direction: column;">
					<div class="row" style="align-items: center;">
						<div class="col-2">매장명</div>

						<input type="text" class="form-control w-25" placeholder="매장명을 입력해주세요." value="${AccessInfo.storeName}">
					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">전화번호</div>
						<input type="text" class="form-control w-25" placeholder="전화번호를 입력해주세요." value="${AccessInfo.storePhone}">

					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">카테고리</div>
						<select class="form-select  w-25" id="category">
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
						<div class="col-2">위치</div>
						<div class="col-5 p-0 ">
							<div class="d-flex">
								<input type="text" class="form-control w-100 my-3" placeholder="매장 주소를 입력해주세요." id="inputDefault">
								<div class="btn btn-primary col-4 m-3">주소 검색</div>
							</div>
							<input type="text" class="form-control w-100 " placeholder="상세 주소를 입력해주세요." id="inputDefault">
						</div>

					</div>

					<div class="row" style="align-items: center;">
						<div class="col-2">영업시간</div>
						<input type="text" class="form-control w-25" placeholder="매장명을 입력해주세요." id="inputDefault">
					</div>




					<div class="row" style="align-items: center;">
						<div class="col-2">매장 한 줄소개</div>

						<input type="text" class="form-control w-25"
							placeholder="매장명을 입력해주세요." value="${AccessInfo.storeInfo}">

					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2 mb-3">매장 상세정보</div>
						<div class="form-group w-50 p-0">

							<textarea class="form-control" id="exampleTextarea" rows="3"
								value="${AccessInfo.storeInfoDetail}"></textarea>

						</div>
					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">매장 사진 등록</div>
						<div class="form-group col-6 p-0">
							<input class="form-control" type="file" id="formFile">
						</div>
					</div>
					<div class="d-flex gap-4 mt-5 " style="justify-content: center;">
						<div class="btn btn-outline-secondary col-1">취소</div>
						<div class="btn btn-primary col-1">저장</div>
					</div>
				</div>
			</div>
			<!-- 1. 매장관리 -->

			<!-- 2. 메뉴관리 -->
			<div class="mainContent" id="menu2" style="display: none;">
				<div class="border p-3 " style="height: 7%;">
					<h5>
						메뉴관리
						</h2>
				</div>

				<div class="text-end ">
					<button class="btn btn-outline-primary m-4" onClick="sideMenu(3)">+메뉴추가</button>
				</div>
				<div class="menuList">
					<div class=" m-2">
						<table class="table table-hover text-center">
							<thead>
								<tr>
									<th scope="col">메뉴 이름</th>
									<th scope="col">가격</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<tr class="align-middle">
									<td>햄버거</td>
									<td>80,000원</td>
									<td>
										<div class="btn btn-outline-secondary">수정</div>
									</td>
								</tr>
								<tr class="align-middle">
									<td>햄버거</td>
									<td>80,000원</td>
									<td>
										<div class="btn btn-outline-secondary">수정</div>
									</td>
								</tr>
								<tr class="align-middle">
									<td>햄버거</td>
									<td>80,000원</td>
									<td>
										<div class="btn btn-outline-secondary">수정</div>
									</td>
								</tr>
								<tr class="align-middle">
									<td>햄버거</td>
									<td>80,000원</td>
									<td>
										<div class="btn btn-outline-secondary">수정</div>
									</td>
								</tr>
								<tr class="align-middle">
									<td>햄버거</td>
									<td>80,000원</td>
									<td>
										<div class="btn btn-outline-secondary" onclick="sideMenu(5)">수정</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- 2. 메뉴관리 -->

			<!-- 2-1. 메뉴추가 -->
			<div class="mainContent" id="addMenuPage" style="display: none;">
				<div class="border p-3 " style="height: 7%;">
					<h5>메뉴등록</h5>
				</div>
				<div \="93%;"></div>
				<div class="inputZone p-5 d-flex gap-3" style="flex-direction: column;">
					<div class="row" style="align-items: center;">
						<div class="col-2">메뉴명</div>
						<input type="text" class="form-control w-25" placeholder="매장명을 입력해주세요." id="inputDefault">
					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">가격</div>
						<input type="text" class="form-control w-25" placeholder="전화번호를 입력해주세요." id="inputDefault">
					</div>

					<div class="row" style="align-items: center;">
						<div class="col-2">매장 사진 등록</div>
						<div class="form-group col-6 p-0">
							<input class="form-control" type="file" id="formFile">
						</div>
					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">품절 여부</div>
						<div class="form-check form-switch col">
							<input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
						</div>
					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">KIOSK 노출 여부</div>
						<div class="form-check form-switch col">
							<input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
						</div>
					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">대표메뉴 여부</div>
						<div class="form-check form-switch col">
							<input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
						</div>
					</div>
					<div class="d-flex gap-4 mt-5 " style="justify-content: center;">
						<div class="btn btn-outline-secondary col-1">취소</div>
						<div class="btn btn-primary col-1" id="addSave" onclick="addSave()">저장</div>
					</div>
				</div>
			</div>
			<!-- 3. 결제내역 -->
			<div class="mainContent" id="menu3" style="display: none;">
				<div class="border p-3 " style="height: 7%;">
					<h5>
						결제내역
						</h2>
				</div>
				<div class="d-flex w-100 " style="height: 93%;">
					<div class="paymentList border-end position-relative">
						<div class="border row position-relative m-0 gap-4 " style="align-items: center;">
							<div class="form-group col-5 p-3">
								<input type="date">
							</div>
							<div class="form-group col-6">
								<select class="form-select">
									<option>결제수단</option>
									<option>카드</option>
									<option>현금</option>
								</select>
							</div>
						</div>

						<div class="overflow-auto">
							<div class="row border m-0 align-items-center text-center p-3">
								<span class="badge rounded-pill bg-primary w-25">카드</span>
								<div class="col-5">80,000원</div>
								<div class="col-3">2023.02.02.11:23</div>
							</div>
							<div class="row border m-0 align-items-center text-center p-3 ">
								<span class="badge rounded-pill bg-primary w-25">카드</span>
								<div class="col-5">80,000원</div>
								<div class="col-3">2023.02.02.11:23</div>
							</div>

							<div class="row border m-0 align-items-center text-center p-3">
								<span class="badge rounded-pill bg-secondary w-25">현금</span>
								<div class="col-5">80,000원</div>
								<div class="col-3">2023.02.02.11:23</div>
							</div>
						</div>
					</div>
					<div class="paymentDetail" style="width: 60%">
						<div class="w-100 p-4">

							<h5 class="fw-bold">결제 상세</h5>
							<hr>
							<div>
								<div>2023.02.02.10:17</div>
								<div>인천광역시 미추홀구 학익동</div>
							</div>



						</div>
						<div>
							<div class="p-4 d-flex flex-column gap-3">
								<div>
									<h5 class="fw-bold">결제내역</h5>
									<hr>
								</div>
								<div>감자햄버거 40,000원 x 2</div>
								<div>감자햄버거 40,000원 x 3</div>
								<div>감자햄버거 40,000원 x 4</div>
								<div>감자햄버거 40,000원 x 1</div>

								<hr>
								<div class="align-items-end mt-3">
									<div>
										결제수단<br>
										<h4>카드</h4>
										</span>
										<h3 class="col text-end">총 80,000원</h3>
									</div>
								</div>
								<div class="btn btn-outline-danger col-2">환불</div>
							</div>

						</div>
					</div>

				</div>
			</div>
			<!-- 3. 결제내역 -->

			<!-- 4. 매출분석 -->
			<div class="mainContent" id="menu4" style="display: none;">
				<div class="border p-3 " style="height: 7%;">
					<h5>
						매출분석
						</h2>
				</div>
				<div class="inputZone p-5 d-flex gap-3" style="flex-direction: column;">
					<div class="salesPeriodButtonZone" style="margin-left: 5%;">
						<button type="button" class="btn btn-outline-primary" style="font-weight: bold;">&nbsp 영업중 &nbsp</button>
						<button type="button" class="btn btn-outline-primary" style="font-weight: bold;">&nbsp &nbsp 1주 &nbsp &nbsp</button>
						<button type="button" class="btn btn-outline-primary" style="font-weight: bold;">&nbsp 1개월 &nbsp</button>
						<button type="button" class="btn btn-outline-primary" style="font-weight: bold;">&nbsp 3개월 &nbsp</button>
						<button type="button" class="btn btn-outline-primary" style="font-weight: bold;">기간선택</button>
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
					<div class="salesTextZone">
						<div class="textBox" style="">
							총 환불<br> <span style="font-size: 30px;">201,800원</span>
						</div>
						<div class="textBox" style="">
							환불건수<br> <span style="font-size: 30px;">6건</span>
						</div>
						<div class="textBox">
							환불건단가<br> <span style="font-size: 30px;">13,450원</span>
						</div>

					</div>
				</div>

				<div class="mainContentFooter">
					<div class="footerChoiceTab" style="margin: 2%; position: relative; left: 6%;">
						<ul class="nav nav-tabs" role="tablist" style="margin-bottom: 1.5%;">
							<li class="nav-item" role="presentation"><a class="nav-link" data-bs-toggle="tab" href="#home" aria-selected="false" role="tab" tabindex="-1">결제수단별</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link active" data-bs-toggle="tab" href="#profile" aria-selected="true" role="tab">메뉴별</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link" data-bs-toggle="tab" href="#locate" aria-selected="false" role="tab" tabindex="-1">지역별</a></li>

						</ul>
						<div id="myTabContent" class="tab-content" style="width: 100%; text-align: center;">
							<div class="tab-pane fade" id="home" role="tabpanel">
								<div class="paymentTab" style="width: 80%; display: flex; flex-direction: row; font-size: 20px;">
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
								<div class="actualSales" style="display: flex; position: relative; left: 51.3%;">
									<h4 style="">실매출 &nbsp&nbsp&nbsp</h4>
									<span style="font-size: 20px;">415,000원</span>
								</div>
								<!-- <p> 결제수단별 </p> -->

							</div>
							<div class="tab-pane fade active show" id="profile" role="tabpanel">
								<div class="menuTab" style="width: 80%; display: flex; flex-direction: row; font-size: 20px;">
									<div class="textBox1">
										<h4>순위</h4>
										<hr style="border: 1px color= silver;">
										1<br> <br> 2<br> <br> 3<br> <br> 4<br> <br> 5
									</div>
									<div class="textBox1">
										<h4>메뉴명</h4>
										<hr style="border: 1px color= silver;">
										1<br> <br> 2<br> <br> 3<br> <br> 4<br> <br> 5

									</div>
									<div class="textBox1">
										<h4>건수</h4>
										<hr style="border: 1px color= silver;">
										1<br> <br> 2<br> <br> 3<br> <br> 4<br> <br> 5
									</div>
									<div class="textBox1" style="text-align: right; position: relative; left: -10%;">
										<h4>결제금액</h4>
										<hr style="border: 1px color= silver; width: 135%;">
										1,197,000원<br> <br> 197,000원<br> <br> 197,000원<br> <br> 97,000원<br> <br> 7,000원
									</div>
								</div>
							</div>
							<div class="tab-pane fade active show" id="locate" role="tabpanel">
								<div class="menuTab" style="width: 80%; display: flex; flex-direction: row; font-size: 20px;">
									<div class="textBox1">
										<h4>지역</h4>
										<hr style="border: 1px color= silver;">
										서울<br> <br> 경기<br> <br> 인천<br> <br> 강릉<br> <br> 5
									</div>
									<div class="textBox1">
										<h4>메뉴명</h4>
										<hr style="border: 1px color= silver;">
										1<br> <br> 2<br> <br> 3<br> <br> 4<br> <br> 5

									</div>
									<div class="textBox1">
										<h4>건수</h4>
										<hr style="border: 1px color= silver;">
										1<br> <br> 2<br> <br> 3<br> <br> 4<br> <br> 5
									</div>
									<div class="textBox1" style="text-align: right; position: relative; left: -10%;">
										<h4>결제금액</h4>
										<hr style="border: 1px color= silver; width: 135%;">
										1,197,000원<br> <br> 197,000원<br> <br> 197,000원<br> <br> 97,000원<br> <br> 7,000원
									</div>
								</div>
							</div>
						</div>
						<!-- <p>  </p> -->
					</div>
				</div>
			</div>
			<!-- 4. 매출분석 -->


			<div class="pageBody" style="width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.3); position: absolute; top: 0%; display: none;">
				<div class="modal" tabindex="-1" style="display: block;">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Modal title</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<p>Modal body text goes here.</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 4-2. 메뉴수정 -->

		</div>
		<!-- 헤더랑 옆 클릭바 고정을 고정. -->

	</div>

</body>



<script>
	function sideMenu(newIdx) {
		document.getElementById("menu" + selectedIdx).style.display = "none";
		document.getElementById("menu" + newIdx).style.display = "block";
		selectedIdx = newIdx;

		// 모든 sideMenu의 display를 none으로 설정
		var allMenus = document.getElementById("menu" + selectedIdx);
		for (var i = 0; i < allMenus.length; i++) {
			allMenus[i].style.display = "none";
		}

		// menuNum에 해당하는 sideMenu의 display를 block으로 설정
		var selectedMenu = document.getElementById("sideMenu" + menuNum);
		selectedMenu.style.display = "block";

	}
	const category = document.getElementById('category')
	const categoryOptions = category.options
	for (let i = 0; i < categoryOptions.length; i++) {
		if (categoryOptions[i].value == '${AccessInfo.storeCategory}') {
			categoryOptions[i].selected = "true";
		}
	}

<<<<<<< HEAD
=======
	function updSalesLog() {
		let formData = new FormData();
		if (salesToggle.checked== 'true') {
			//salesToggle.checked = 'false';
			formData.append('salesLogList[0].salesState', 'O')
		} else {
			//salesToggle.checked = 'true';
			formData.append('salesLogList[0].salesState', 'C');
		}
		formData.append('locationList[0].locationCode', 'L01');
		formData.append('storeCode', '${AccessInfo.storeCode}');
		serverCallByFetch(formData, '/Api/UpdSalesLog', 'post', 'aaa', header);
	}
	function aaa() {
		alert("ins 성공")
	}
	function regCancel() {
		document.getElementsByClassName("modal")[0].style.display = "none"
	}

>>>>>>> refs/remotes/origin/main
	function addMenu(newIdx) {

		const addMenuPage = document.getElementById("addMenuPage");
		const menu2 = document.getElementById("menu2");
		if (addMenuPage.style.display == "none") {
			addMenuPage.style.display = "block";
			document.getElementById("menu" + selectedIdx).style.display = "block";
			selectedIdx = newIdx;
		} else {
			/* addMenuPage none else */
		}
		if (addMenuPage.style.display == "block") {
			menu2.style.display = "none";
			const sideMenuSt = document.getElementById("menu" + newIdx);
			sideMenuSt.style.display = "none"
			selectedIdx = newIdx;
		} else {
			/* addMenuPage block else */
		}

	}

	function addSave(newIdx) {

		const addMenuPage = document.getElementById("addMenuPage");
		const menu2 = document.getElementById("menu2");

		if (addMenuPage.style.display = "block") {

		} else {
			/* addMenuPage none else */
		}

	}

 document.getElementById("menu" + newIdx).style.display = "block"; 

	/* function addMenu() {
<<<<<<< HEAD

=======
	=======
>>>>>>> refs/remotes/origin/main
	
	function addMenu() {
	>>>>>>> branch 'main' of https://github.com/dPfal/postluck.git
		// menuList 요소 찾기
		const menuList = document.getElementsByClassName("menuList")[0];

		// align-middle 클래스를 가진 div 요소 생성
		const alignMiddleDiv = document.createElement("div");
		alignMiddleDiv.classList.add("align-middle");

		// btn btn-outline-secondary 클래스를 가진 버튼 요소 생성
		const button = document.createElement("button");
		button.classList.add("btn", "btn-outline-secondary");

		// 버튼 요소에 텍스트 추가
		button.textContent = "수정";

		// align-middle div 요소의 자식으로 버튼 요소 추가
		alignMiddleDiv.appendChild(button);

		// menuList 요소의 자식으로 align-middle div 요소 추가
		menuList.appendChild(alignMiddleDiv);
	<<<<<<< HEAD
	} */

	/* 	 위 코드를 addMenu 함수가 호출되는 이벤트 핸들러에 추가하면, 
	 해당 이벤트가 발생했을 때 menuList 클래스를 가진 요소에 align-middle 
	 클래스를 가진 div 요소와 그 안에 btn btn-outline-secondary 클래스를 
	 가진 버튼 요소가 추가됩니다. */

	const saleToggle = document.getElementById("salesToggle");
	if ('${isOpen}' == 'true') {
		saleToggle.checked=true;
	} else {
		saleToggle.checked=false;
	}
	let selectedIdx = 0;
</script>

<style>
body {
	margin: 0px;
	margin-bottom: 0px;
	font-family: 'Noto Sans KR', sans-serif;
}

.main {
	width: 100vw;
	height: 100vh;
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
	position: relative;
	display: flex;
	width: 100vw;
	height: 95vh;
}

.sidebar {
	width: 20%;
	height: 100%;
	position: relative;
	flex-direction: column
}

.mainContent {
	width: 80%;
	height: 95vh;
	position: relative;
	background-color: white;
}

.salesPeriodButtonZone {
	margin-left: 5%;
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
	left: 2.5%;
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
	font-size: 20px;
	text-align: left;
}

.textBox1 {
	width: 30%;
	position: relative;
	left: 2%;
}

.paymentList {
	width: 40%;
}

.menu {
	cursor: pointer;
}
</style>

</html>