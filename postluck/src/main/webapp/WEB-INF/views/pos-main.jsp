<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="page-exit" content="blendTrans(duration=0.3)">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>POS - POS.TLUCK</title>
<link rel="icon" href="/resources/image/fabicon.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/mainBootstrap.css">
<link rel="stylesheet" href="/resources/css/main.css">
<script src="/resources/js/common.js"></script>
<style>
.posMenu {
	background-color: white;
	border: 0px;
	padding: 0px;
	transition: all 0.5s;
	font-family: 'Noto Sans KR';
	margin: 0px;
	color: #333333;
}

.posMenu:hover {
	background-color: #ecfbf2;
}

.row {
	-bs-gutter-x: 0px;
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

.contents {
	position: relative;
	height: 95%;
}

.subContent {
	position: relative;
	float: right;
	background-color: white;
	width: 20%;
	height: 100%;
}

.mainContent {
	padding: 3%;
	float: left;
	position: absolute;
	background-color: #ecf0f1;
	width: 100vw;
	height: 100%;
}

.order {
	float: left;
	background-color: white;
	width: 100%;
	height: 100%;
	border-radius: 10px;
	position: relative;
	padding: 2%;
	display: flex;
	gap: 10px;
	flex-direction: column
}

.orderInfo1 {
	display: flex;
	justify-content: space-between;
	align-items: center;
}
</style>
</head>


<body class="vsc-initialized">
	<div aria-live="polite" aria-atomic="true" class="position-absolute"
		style="width: 100%; height: 100%;">
		<!-- Position it: -->
		<!-- - `.toast-container` for spacing between toasts -->
		<!-- - `top-0` & `end-0` to position the toasts in the upper right corner -->
		<!-- - `.p-3` to prevent the toasts from sticking to the edge of the container  -->
		<div class="toast-container bottom-0 start-0 " id="toastZone"></div>
		<div class="offcanvas offcanvas-end" data-bs-scroll="true"
			data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling"
			aria-labelledby="offcanvasScrollingLabel">
			<div class="offcanvas-header border-bottom align-baseline">
				<h2 class="offcanvas-title" id="offcanvasWithBothOptionsLabel"></h2>
				<h6 id="orderDateInOffCanvas" class="col-4"></h6>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
					aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<div class="row"
					style="height: 70%; overflow-y: auto; align-content: flex-start;">
				</div>
				<div class="row border-top text-center fs-3" style="height: 10%;">
					<div class="col-4 fs-5">총 결제금액</div>
					<div class="col-6 text-end" id="priceTotal"></div>
					<div class="col-1">원</div>
				</div>
				<div class="row border-top text-center fs-3" style="height: 10%;">
					<div class="col-4 fs-5">결제수단</div>
					<div class="col-7 text-end fs-5">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio1" value="option1">
							<label class="form-check-label" for="inlineRadio1">현금</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio2" value="option2">
							<label class="form-check-label" for="inlineRadio2">카드</label>
						</div>
					</div>
				</div>
				<div class="row text-center fs-5 pointer" style="height: 10%;">
					<div class="h-100 col-4 bg-light row justify-content-center"
						id="cancelOrder" onclick="cancelOrder(this)">주문취소</div>
					<div
						class="h-100 justify-content-center col bg-success bg-opacity-10 row pointer"
						id="completeOrder" onclick="completeOrder(this)">결제</div>
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
							d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"></path>
                </svg></span> <span><img
					src="/resources/image/mainLogo-dark.png"></span>
			</div>


			<div class="contents">
				<div class="mainContent border row " id="orderListZone"
					style="display: flex; flex-direction: row; flex-wrap: nowrap; overflow-x: auto">


				</div>
			</div>

		</div>


		<script>
		
			// 	if('' == ''){
			// 		showModal('error::등록된 메뉴가 없습니다. 메뉴 등록 페이지로 이동합니다.:movePosManage');
			// 	}
			jsonString = '${store}'
				getOrderListOnLoad();
			let sock;
			let storeCode;
			let orderNum = '000';
			if (JSON.parse(jsonString).storeCode) {
				storeCode = JSON.parse(jsonString).storeCode;
				sock = new WebSocket("ws://192.168.0.5:80/postluck/"
						+ storeCode);
				// WebSocket 처리 코드
			} else {

				showModal("error:세션 오류:세션이 만료되었습니다. 다시 로그인해주세요.:moveIndex:")
			}
			function getOrderListOnLoad(){
				formData = new FormData()
				formData.append("storeCode",JSON.parse(jsonString).storeCode)
			serverCallByFetch(formData,"/Api/GetOrderList","post","getOrderList",header);
				
			}
			sock.onopen = function(event) {
				showModal("plain:연결 성공!:서버와 연결되었습니다!::")
				// 			sock.send(storeCode);
			};
			sock.onmessage = function(e) {
				// 			showModal("plain:알림:새로운 주문이 들어왔습니다." + e.data + "::");
				// 			storeCode=6913651651&orderDate=20230309225656&orderNum=049
				newOrder(e.data);
			};
			sock.onclose = function(event) {
				if (event.wasClean) {
					showModal('error:연결 오류:Kiosk와 통신이 불안정합니다. Kiosk 서비스를 실행해주세요.::')
				}
			};
			sock.onerror = function(error) {
				alert([ error ]);
			};
			
			
			function newOrder(orderMessage) {
				let storeNum = orderMessage.split("&")[0].split("=")[1];
				let orderDate = orderMessage.split("&")[1].split("=")[1];
				orderNum = orderMessage.split("&")[2].split("=")[1];
				const formData = new FormData;
				formData.append("storeCode", storeNum);
				formData.append("orderNum", orderNum);
				formData.append("orderDate", orderDate)
				serverCallByFetch(formData, '/Api/getOrderInfo', 'post',
						'alertOrder', header);
			}
			function alertOrder(jsonData) {
				console.log(jsonData)
				createToast(jsonData.orderDate);
				createOrderDiv(jsonData);
			}
			let isEmpty;
			
			function createOrderDiv(jsonData){
				const orderListZone = document.getElementById("orderListZone");
				if(isEmpty==true){
					orderListZone.innerHTML = "";
				}
				const menuList = jsonData.orderMenuList;
				const orderDiv = document.createElement('div');
				orderDiv.classList.add('col-3', 'p-5', 'mx-3', 'h-100', 'rounded');
				orderDiv.style.display = 'flex';
				orderDiv.style.overflowY = 'auto';
				orderDiv.style.background = 'white';
				orderDiv.style.flexDirection = 'column';
				orderDiv.setAttribute('data-bs-toggle', 'offcanvas');
				orderDiv.setAttribute('data-bs-target', '#offcanvasScrolling');
				orderDiv.setAttribute('aria-controls', 'offcanvasScrolling');
				orderDiv.setAttribute('id',"div"+jsonData.orderDate);
				orderDiv.setAttribute('onclick',"getOrderDetail(\'"+jsonData.orderDate+"',\'"+orderNum+"\')")
				
			const orderContent = "<div class=\"row\" style=\"align-items: baseline; height: 10%\">"+
						"<h1 class=\"col\">#"+orderNum+"</h1><h6 class=\"col\">"+
						jsonData.orderDate+"</h6></div><hr>";
						
				orderDiv.innerHTML=orderContent;
			const menuListZone = document.createElement("div");
			menuListZone.setAttribute("style","overflow-y: auto; height: 100%;");
			orderDiv.appendChild(menuListZone)
			
				menuList.forEach(menuItem => {
					let menuContent = "<div class=\"row mb-3 border-bottom\" style=\"height:10%\"><h4 class=\"col-9\">"+
					menuItem.menuName+"</h4><h4 class=\"col-1\">x</h4><h4 class=\"col-2\">"+
					menuItem.quantity+"</h4></div>"
					menuListZone.innerHTML+=menuContent;
				})
				orderDiv.innerHTML += "<div class=\"row\"><button class= \"btn btn-outline-primary w-100\" type=\"button\" onclick =\"changeState(this)\">주문</button></div>";
				orderListZone.appendChild(orderDiv);
				isEmpty = false;
			}
			// 상태가 주문인 
			function changeState(btn){
				
if(btn.innerText == '주문'){
	btn.classList.replace('btn-outline-primary', 'btn-primary');
	btn.innerText ='접수'
}				else{
	btn.classList.replace('btn-primary','btn-outline-primary' );
	btn.innerText ='주문'
}
			}
			function getOrderList(jsonData){
				document.getElementById("orderListZone").innerHTML = '';
				const orderList = jsonData.orderList;
				jsonData.forEach(order => {
					createOrderDiv(order);
				})
				alertEmpty();
				console.log(jsonData)
			}
			function alertEmpty(){
				if(!document.getElementById("orderListZone").children.length>0){
					isEmpty = true;
					document.getElementById("orderListZone").style.textAlign="center";
					document.getElementById("orderListZone").innerHTML ="<h5><div class=\"m11\"><i class=\"bi bi-exclamation-circle \" style=\"font-size:2rem\"></i></div><br>주문 내역이 없습니다.</div>"
				}
			}
			function createToast(orderDate) {
				const toastZone = document.getElementById("toastZone");
				const toastDiv = document.createElement('div');
				toastDiv.className = 'toast m-2';
				toastDiv.setAttribute('data-bs-autohide', 'false');
				toastDiv.setAttribute('role', 'alert');
				toastDiv.setAttribute('aria-live', 'assertive');
				toastDiv.setAttribute('aria-atomic', 'true');
				toastDiv.setAttribute("id", orderDate);
				let toastHTML = "<div class=\"toast-header\">"
						+ "<img src=\"/resources/image/fabicon.png\" class=\"rounded me-2\">"
						+ "<strong class=\"me-auto\">"
						+ JSON.parse(jsonString).storeName
						+ "</strong> <small " +
			        "class=\"text-muted\">"
						+ orderDate
						+ "</small>"
						+ "<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"toast\"" +
			            "aria-label=\"Close\"></button>"
						+ "</div>"
						+ "<div class=\"toast-body\"><strong>주문 번호 : #"+orderNum+"</strong><br>새로운 주문이 들어왔습니다!</div>"
						+ "<div>"
						+ "<button type=\"button\" class=\"btn btn-primary btn-sm m-2\""
						+ " data-bs-dismiss=\"toast\""
						+ "aria-label=\"Close\"data-bs-toggle=\"offcanvas\" data-bs-target=\"#offcanvasScrolling\""
						+ "aria-controls=\"offcanvasScrolling\" onclick=\"getOrderDetail(\'"
						+ orderDate + "\')\">" + "주문내역 확인" + "</button>"
						+ "</div>";
				toastDiv.innerHTML = toastHTML;
				toastZone.appendChild(toastDiv);
				const toast = new bootstrap.Toast(document
						.getElementById(orderDate));
				toast.show();
			}
			
			function getOrderDetail(orderDate,orderNo) {
				if(orderNo === undefined){
					orderNo = orderNum; 
				}
				orderNumForOffCanvas=orderNo;
				formData = new FormData;
				formData.append("storeCode",storeCode);
				formData.append("orderDate",orderDate);
				console.log(orderDate)
				serverCallByFetch(formData,"/Api/getOrderInfo","post","changeOffCanvas",header);
			}
			let orderNumForOffCanvas;
			
			function changeOffCanvas(jsonData){
				console.log(jsonData)
				let orderNo = orderNumForOffCanvas;
				document.getElementById("offcanvasWithBothOptionsLabel").innerText = "#"+orderNo
				document.getElementById("orderDateInOffCanvas").innerText = jsonData.orderDate;
				const menuListZone = document.getElementsByClassName("offcanvas-body")[0].children[0];
				const menuList = jsonData.orderMenuList;
				menuListZone.innerHTML =""
				let total =0;
				menuList.forEach(menu=>{
					const menuItem = document.createElement("div");
					menuItem.style="height: 10%; align-items: center;";
					menuItem.classList.add("row" ,"border-bottom", "text-center");
					
					menuItem.innerHTML = `<div class="col">\${menu.menuName}</div>
						<div class="col-1">X</div>
						<div class="col-1">\${menu.quantity}</div>
						<div class="col-3 text-end">\${menu.quantity * menu.menuPrice}</div>
						<div class="col-1">원</div>`
						menuListZone.appendChild(menuItem);
						total += menu.quantity * menu.menuPrice
				})
				document.getElementById("priceTotal").innerText = total;
				if(jsonData.orderPaymentType=='현금'){
					document.getElementById("inlineRadio1").checked ="true"
				}else{
					document.getElementById("inlineRadio2").checked ="true"
				}
				console.log(jsonData.orderDate)
				document.getElementById("cancelOrder").setAttribute("data-orderDate",jsonData.orderDate);
				document.getElementById("completeOrder").setAttribute("data-orderDate",jsonData.orderDate);
				
			}
			
			function cancelOrder(div){
				 const formData = new FormData();
				    formData.append("storeCode", storeCode);
				    formData.append("orderDate",div.getAttribute("data-orderDate"));
				    serverCallByFetch(formData, "/Api/CancelOrder", "post", "afterCancelOrder", header);
			}
			function completeOrder(div){
				 const formData = new FormData();
				    formData.append("storeCode", storeCode);
				    formData.append("orderDate", div.getAttribute("data-orderDate"));
				    serverCallByFetch(formData, "/Api/CompleteOrder", "post", "afterCompleteOrder", header);
			}
			
			function afterCancelOrder(jsonData){
				console.log("afcancel")
				console.log("div"+jsonData.orderDate)
				document.getElementById("div"+jsonData.orderDate).remove();
				alertEmpty();
				showModal("plain::주문이 취소되었습니다.::")
			}
			function afterCompleteOrder(jsonData){
				console.log("afcomplete")
				console.log("div"+jsonData.orderDate)
				document.getElementById("div"+jsonData.orderDate).remove();
				alertEmpty();
				showModal("plain::결제 처리되었습니다.::")
			}
			
		</script>
</body>

</html>