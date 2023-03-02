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
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/mainBootstrap.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0203ee3bafbf6d3fe50695090bc89516&libraries=services""></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		let calendarEl = document.getElementById('calendar');
		let calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth'
		});
		calendar.render();
	});
	function printTime() {
		let clock = document.getElementById("clock"); // 출력할 장소 선택
		let now = new Date(); // 현재시간
		let nowTime = now.getFullYear() + "년 " + (now.getMonth() + 1) + "월 "
				+ now.getDate() + "일 " + "- " + now.getHours() + "시 "
				+ now.getMinutes() + "분 " + now.getSeconds() + "초";
		clock.innerHTML = nowTime; // 현재시간을 출력
		setTimeout("printTime()", 1000); // setTimeout(“실행할함수”,시간) 시간은1초의 경우 1000
	}
	window.onload = function() { // 페이지가 로딩되면 실행
		printTime();
	}
	if('${store}'!=''){
		jsonString = '${store}'
	}
</script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.1/index.global.min.js'></script>

</head>
<!-- 헤더랑 옆 클릭바 고정을 고정. -->

<body class="vsc-initialized" onload="pageInit('${param.message}');">
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
			<div class="sidebar border-end d-flex ">
				<div class="border-bottom p-3 d-flex h-7" style="justify-content: space-between;">
					<div id="isOpenText">영업전</div>
					<div class="form-check form-switch">
						<input id="salesToggle" class="form-check-input" type="checkbox" onclick="updSalesLog()" style="cursor: pointer">
					</div>
				</div>

				<div class="dropdown menu border-bottom h-7">
					<button class="btn dropdown-toggle h-100 w-100" id="storeNameDropDown" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: black">${AccessInfo.storeName}</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item">Main Page</a></li>
						<li><a class="dropdown-item" href="#">로그아웃</a></li>
					</ul>
				</div>
				<div class="menu  p-3" onclick="sideMenu(0)">일정</div>
				<div class="menu  p-3" onclick="sideMenu(1)">매장관리</div>
				<div class="menu  p-3" onclick="sideMenu(2)">메뉴관리</div>
				<div class="menu  p-3" onclick="sideMenu(5)">결제내역</div>
				<div class="menu  p-3" onclick="sideMenu(6)">매출분석</div>
			</div>
			<!-- sideMenu(3) : 메뉴추가 / sideMenu(4) : 메뉴수정 -->
			<!-- 0. 일정 -->
			<div class="mainContent" id="menu0" style="display: block;">
				<div class="border-bottom p-3 h-7">
					<h5>일정</h5>
				</div>
				<div class="mt-5 d-flex" id='calendar-container' style="justify-content: center;">
					<div id='calendar' style="width: 50%;"></div>
				</div>
			</div>
			<!-- 0. 일정 -->

			<!-- 1. 매장관리 -->
			<div class="mainContent" id="menu1" style="display: none;">
				<div class="border-bottom p-3 h-7">
					<h5>매장 관리</h5>
				</div>
				<div class="inputZone p-5 d-flex gap-3" style="flex-direction: column;">
					<div class="row" style="align-items: center;">
						<div class="col-2">사업자 명</div>
						<input type="text" class="form-control w-25" disabled value="${AccessInfo.ceoName}">

						<div class="col-2 ms-4">사업자번호</div>
						<input type="text" id="storeCodeDisabled" class="form-control w-25" disabled>

					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">매장명</div>
						<input type="text" id="storeName" class="form-control w-25" placeholder="매장명을 입력해주세요." maxlength="50" value="${AccessInfo.storeName}">
					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">전화번호</div>
						<input type="text" id="storePhone" class="form-control w-25" placeholder="전화번호를 입력해주세요." value="${AccessInfo.storePhone}" maxlength="11">

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
								<select class="form-select col w-25" id="storeLocation">
								</select>
								<div class="btn btn-primary col-4 m-3" data-bs-toggle="modal" data-bs-target="#regLocationModal">편집</div>
							</div>
							<input type="text" class="form-control w-100 " disabled>
							<div class="mt-3" id="map" style="height: 40vh;"></div>
						</div>

					</div>

					<div class="row" style="align-items: center;">
						<div class="col-2">영업시간</div>
						<input type="text" class="form-control w-25" placeholder="영업시간을 입력해주세요.">
					</div>

					<div class="row" style="align-items: center;">
						<div class="col-2">매장 한 줄소개</div>

						<input type="text" class="form-control w-25" id="storeInfo" placeholder="매장 한 줄 소개를  입력해주세요." value="${AccessInfo.storeInfo}" maxlength="30">

					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2 mb-3">매장 상세정보</div>
						<div class="form-group w-50 p-0">
							<textarea class="form-control" id="storeInfoDetail" rows="3" maxlength="2000">${AccessInfo.storeInfoDetail}</textarea>

						</div>
					</div>
					<div class="row" style="align-items: center;">
						<div class="col-2">매장 사진 등록</div>
						<div class="form-group col-6 p-0">
							<input class="form-control" type="file" id="formFile">
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
					<h5>
						메뉴관리
						</h2>
				</div>

				<div class="text-end ">
					<button class="btn btn-outline-primary m-4" onClick="sideMenu(3)">+메뉴추가</button>
				</div>
				<div class="menuList text-center">
					<div class="m-2 text-center">
						<table class="table table-hover text-center ">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">키오스크</th>
									<th scope="col">메뉴 이름</th>
									<th scope="col">가격</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<tr class="align-middle">
									<td><span class="badge bg-success rounded-pill fs-6">대표</span></td>
									<td>X</td>
									<td>햄버거</td>
									<td>80,000원</td>
									<td>
										<div class="btn btn-outline-secondary">수정</div>
									</td>
								</tr>
								<tr class="align-middle">
									<td><span class="badge bg-success rounded-pill fs-6">대표</span></td>
									<td>X</td>
									<td>햄버거</td>
									<td>80,000원</td>
									<td>
										<div class="btn btn-outline-secondary">수정</div>
									</td>
								</tr>
								<tr class="align-middle">
									<td></td>
									<td>X</td>
									<td>햄버거</td>
									<td>80,000원</td>
									<td>
										<div class="btn btn-outline-secondary">수정</div>
									</td>
								</tr>
							</tbody>
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
				<div class="inputZone p-5 d-flex gap-3" style="flex-direction: column;">
					<div class="row" style="align-items: center;">
						<div class="col-2">메뉴명</div>
						<input type="text" class="form-control w-25" placeholder="메뉴명을 입력해주세요." id="inputDefault">
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
			<div class="mainContent" id="menu5" style="display: none;">
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
			<div class="mainContent" id="menu6" style="display: none;">
				<div class="border p-3 " style="height: 7%;">
					<h5>
						매출분석
						</h2>
				</div>
				<div class="inputZone p-5 d-flex gap-3" style="flex-direction: column;">
					<div class="salesPeriodButtonZone">
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

				<div class="mainContentFooter m-3">
					<div class="footerChoiceTab" style="position: relative;">
						<ul class="nav nav-tabs" role="tablist">
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



		</div>
		<!-- 헤더랑 옆 클릭바 고정을 고정. -->
		<div class="modal fade" id="messageModal" style="background-color: rgba(0, 0, 0, 0.2); z-index: 1080">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title col-10">메세지 제목이 없습니다.</h5>
						<button type="button" id="modalClose" class="btn-close col-1" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body text-center">
						<div class="my-2 mx-5" id="svgZone"></div>
						<div id="alertContent">메세지 내용이 없습니다.</div>
					</div>
					<div class="modal-footer text-center">
						<button type="button" id="btnCancel" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						<button type="button" id="btnOk" class="btn">확인</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade show" id="regLocationModal"  data-bs-keyboard="false" tabindex="-1" aria-modal="true" role="dialog" style="display: none; - -bs-modal-width: 50%;">
			<div class="modal-dialog modal-dialog-centered " style="max-width: 50%;">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">위치 등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body; px-5 my-4">
						<div class="row p-2">
							<div class="col-3 text-center">위치명</div>
							<div class="col-9">
								<input type="text" class="form-control" id="locationAlias" placeholder="위치명을 입력해주세요.">
							</div>
						</div>
						<div class="row p-2">
							<div class="col-3 text-center">주소</div>
							<div class="col-7">
								<input type="text" class="form-control " id="sample5_address" placeholder="주소">
							</div>
							<div class="col-2">
								<input type="button" class="btn btn-primary" onclick="sample5_execDaumPostcode()" value="주소 검색">
								<br>
							</div>
						</div>
						<div class="row p-2">
							<div class="col-3"></div>
							<div class="col-9">
								<input type="text" class="form-control" id="locationDetail" placeholder="상세주소를 입력해주세요." maxlength="200">
								<div id="map1" style="height: 30vh; margin-top: 10px; display: none"></div>
							</div>
						</div>
					</div>
					<div class="modal-footer justify-content-center">
						<button type="button" class="btn btn-primary" onclick="regLocation()">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>



<script>
const menuList = '${AccessInfo.menuList}';
console.log(menuList)
if('${AccessInfo.menuList}'!=null){
// 	<option value="">위치</option>
// 	<option value="L01"></option>
// 	<option value="L02"></option>
// 	<option value="L03"></option>
// 	<select class="form-select col w-25" id="storeLocation">
// 	</select>
}
	const storeNum = '${AccessInfo.storeCode}';
	document.getElementById("storeCodeDisabled").value = storeNum.substring(0,
			3)
			+ "-" + storeNum.substring(3, 5) + "-" + storeNum.substring(5, 10);
	let salesToggle = document.getElementById("salesToggle");
	if ('${isOpen}' == 'false') {
		salesToggle.setAttribute("checked", "false");
		document.getElementById("isOpenText").innerText = "영업중"
	} else {
		salesToggle.setAttribute("checked", "true");
		document.getElementById("isOpenText").innerText = "영업전"
	}

	let selectedIdx = 0;
	function sideMenu(newIdx) {
		document.getElementById("menu" + selectedIdx).style.display = "none";
		document.getElementById("menu" + newIdx).style.display = "block";
		selectedIdx = newIdx;

		// 모든 sideMenu의 display를 none으로 설정

		/* let allMenus = document.getElementById("menu" + selectedIdx);
		for (let i = 0; i < allMenus.length; i++) {
			allMenus[i].style.display = "none";
		} */

		// selectIdx에 해당하는 sideMenu의 display를 block으로 설정
		let selectedMenu = document.getElementById("menu" + selectedIdx);
		selectedMenu.style.display = "block";
		if (newIdx == 1) {
			let container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			let options = { //지도를 생성할 때 필요한 기본 옵션
				center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				level : 3
			//지도의 레벨(확대, 축소 정도)
			};

			let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			map.relayout();
			let geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder
					.addressSearch(
							'제주특별자치도 제주시 첨단로 242',
							function(result, status) {
								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									let coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									let marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});

									// 인포윈도우로 장소에 대한 설명을 표시합니다
									let infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
											});
									infowindow.open(map, marker);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
		}

	}
	const category = document.getElementById('storeCategory')
	const categoryOptions = category.options
	for (let i = 0; i < categoryOptions.length; i++) {
		if (categoryOptions[i].value == '${AccessInfo.storeCategory}') {
			categoryOptions[i].selected = "true";
		}
	}

	function updSalesLog() {
		let formData = new FormData();
		console.log(salesToggle.checked)
		if (salesToggle.checked) {
			console.log("false")
			showModal("plain::영업을 시작합니다.:")
			salesToggle.setAttribute("checked", "true");
			formData.append('salesLogList[0].salesState', 'O');
		} else {
			console.log("true")
			showModal("plain::영업을 종료합니다.:")
			formData.append('salesLogList[0].salesState', 'C');
		}
		formData.append('locationList[0].locationCode', 'L01');
		formData.append('storeCode', '${AccessInfo.storeCode}');
		serverCallByFetch(formData, '/Api/UpdSalesLog', 'post', '', header);
	}
	function regCancel() {
		document.getElementsByClassName("modal")[0].style.display = "none"
	}
	function modifyStoreInfo() {
		formData = new FormData();
		const storeCode = document.getElementById('storeCode');
		const storeName = document.getElementById('storeName');
		const storePhone = document.getElementById('storePhone');
		const storeInfo = document.getElementById('storeInfo');
		const storeInfoDetail = document.getElementById('storeInfoDetail');
		const storeCategory = document.getElementById('storeCategory');

		if (storeName.value != '' && lengthCheck(storeName)) {
			formData.append('storeName', storeName.value);
			if (storePhone.value == ''
					|| (storePhone.value != '' && lengthCheck(storePhone))) {
				formData.append('storePhone', storePhone.value);
				if (storeCategory.value != '') {
					formData.append('storeCategory', storeCategory.value);
					formData.append('storeInfo', storeInfo.value);
					formData.append('storeInfoDetail', storeInfoDetail.value);
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
	function afterModifyStoreInfo(jsonData) {
		showModal(jsonData.message);
		document.getElementById("storeNameDropDown").innerText = jsonData.storeName;

	}
	function sample5_execDaumPostcode() {
		let mapContainer = document.getElementById('map1'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};
		//지도를 미리 생성
		let map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		let geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		let marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
		});
		new daum.Postcode({
			oncomplete : function(data) {
				let addr = data.address; // 최종 주소 변수
				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("sample5_address").value = addr;
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
	function regLocation() {
		locationName = document.getElementById("sample5_address").value;
		locationAlias = document.getElementById("locationAlias").value;
		locationDetail = document.getElementById("locationDetail").value;
		if (locationName != '') {
			if (locationAlias != '') {
				var geocoder = new kakao.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(locationName,
						function(result, status) {
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);
								formData = new FormData;
								formData.append("storeCode", storeNum);
								formData.append("locationList[0].locationDetail",
										locationDetail);
								formData.append("locationList[0].latitude",
										result[0].x);
								formData.append("locationList[0].longitude",
										result[0].y);
								formData.append("locationList[0].locationName",
										locationAlias);
								serverCallByFetch(formData, "/Api/RegLocation",
										"post", "afterRegLocation", header);
							}
						});
			} else {
				showModal('error::위치명을 입력해주세요.:');
			}
		} else {
			showModal('error::주소를 입력해주세요.:');
		}
	}
	function afterRegLocation(jsonData){
		showModal(jsonData);
		document.getElementById("sample5_address").value ='';
		document.getElementById("locationAlias").value='';
		document.getElementById("locationDetail").value='';
		document.getElementById("regLocationModal").setAttribute("class","modal fade");
		document.getElementById("regLocationModal").style.display ="none";
		document.getElementsByClassName("modal-backdrop fade show")[0].setAttribute("class","modal-backdrop fade hide");
	}
	/* function addSave(newIdx) { 

		const addMenuPage = document.getElementById("addMenuPage");
		const menu2 = document.getElementById("menu2");

		if (addMenuPage.style.display = "block") {

		} else {
			 addMenuPage none else 
		}

	} */

	// 	function addMenu() {
	// 		// menuList 요소 찾기
	// 		const menuList = document.getElementsByClassName("menuList")[0];
	// 		// align-middle 클래스를 가진 div 요소 생성
	// 		const alignMiddleDiv = document.createElement("div");
	// 		alignMiddleDiv.classList.add("align-middle");
	// 		// btn btn-outline-secondary 클래스를 가진 버튼 요소 생성
	// 		const button = document.createElement("button");
	// 		button.classList.add("btn", "btn-outline-secondary");
	// 		// 버튼 요소에 텍스트 추가
	// 		button.textContent = "수정";
	// 		// align-middle div 요소의 자식으로 버튼 요소 추가
	// 		alignMiddleDiv.appendChild(button);
	// 		// menuList 요소의 자식으로 align-middle div 요소 추가
	// 		menuList.appendChild(alignMiddleDiv);
	// 	}
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