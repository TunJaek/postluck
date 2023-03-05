<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KIOSK - POS.TLUCK</title>
<link rel="icon" href="/resources/image/fabicon.png">
<link rel="stylesheet" href="/resources/css/mainBootstrap.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap"
	rel="stylesheet">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KIOSK - POS.TLUCK</title>
     <link rel="icon" href="/resources/image/fabicon.png">
    <link rel="stylesheet" href="/resources/css/mainBootstrap.css">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
</head>

<body class="vsc-initialized" onload="pageInit('${param.message}')">
	<div class="main">
		<div class="orderPage" style="display: none;">
			<div class="header">
				<span class="px-3"><svg xmlns="http://www.w3.org/2000/svg"
						width="30" height="30" fill="currentColor"
						class="bi bi-arrow-left" viewBox="0 0 16 16">

    <div class="main">
        <div class="header"><span class="px-3"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                    fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
							d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
                </svg></span> <span><img
					src="/resources/image/mainLogo-dark.png"></span>
			</div>

			<div class="mainContents  ">
				<div class="border p-3"
					style="text-align: center; margin-bottom: 5%; background-color: white; position: fixed; width: 80%; z-index: 1;">
					핫도그라운드KIOSK</div>
				<!-- 메뉴리스트 -->
				<div class="mainContentsMenuList  "
					style="display: grid; justify-content: center; grid-template-columns: 25% 25% 25%;
	/*grid-template-rows: 35% 35% 35%;*/ overflow-y: scroll;">
					<div class="menuCard" style="text-align: center;">
						<div class="card" style="width: 18rem;">
							<img src="/resources/image/hotdog2.jpg" class="card-img-top"
								alt="..." style="width: 100%;">
							<div class="card-body">
								<h4 class="card-title">핫도그</h4>
								<p class="card-text">1,500원</p>
								<a href="#" class="btn btn-primary">주문하기</a>
							</div>
						</div>
					</div>
					<div class="menuCard" style="text-align: center;">
						<div class="card" style="width: 18rem;">
							<img src="/resources/image/hotdog2.jpg" class="card-img-top"
								alt="..." style="width: 100%;">
							<div class="card-body">
								<h4 class="card-title">핫도그</h4>
								<p class="card-text">1,500원</p>
								<a href="#" class="btn btn-primary">주문하기</a>
							</div>
						</div>
					</div>
					<div class="menuCard" style="text-align: center;">
						<div class="card" style="width: 18rem;">
							<img src="/resources/image/hotdog2.jpg" class="card-img-top"
								alt="..." style="width: 100%;">
							<div class="card-body">
								<h4 class="card-title">핫도그</h4>
								<p class="card-text">1,500원</p>
								<a href="#" class="btn btn-primary">주문하기</a>
							</div>
						</div>
					</div>
					<div class="menuCard" style="text-align: center;">
						<div class="card" style="width: 18rem;">
							<img src="/resources/image/hotdog2.jpg" class="card-img-top"
								alt="..." style="width: 100%;">
							<div class="card-body">
								<h4 class="card-title">핫도그</h4>
								<p class="card-text">1,500원</p>
								<a href="#" class="btn btn-primary">주문하기</a>
							</div>
						</div>
					</div>
					<div class="menuCard" style="text-align: center;">
						<div class="card" style="width: 18rem;">
							<img src="/resources/image/hotdog2.jpg" class="card-img-top"
								alt="..." style="width: 100%;">
							<div class="card-body">
								<h4 class="card-title">핫도그</h4>
								<p class="card-text">1,500원</p>
								<a href="#" class="btn btn-primary">주문하기</a>
							</div>
						</div>
					</div>
					<div class="menuCard" style="text-align: center;">
						<div class="card" style="width: 18rem;">
							<img src="/resources/image/hotdog2.jpg" class="card-img-top"
								alt="..." style="width: 100%;">
							<div class="card-body">
								<h4 class="card-title">핫도그</h4>
								<p class="card-text">1,500원</p>
								<a href="#" class="btn btn-primary">주문하기</a>
							</div>
						</div>
					</div>
					<div class="menuCard" style="text-align: center;">
						<div class="card" style="width: 18rem;">
							<img src="/resources/image/hotdog2.jpg" class="card-img-top"
								alt="..." style="width: 100%;">
							<div class="card-body">
								<h4 class="card-title">핫도그</h4>
								<p class="card-text">1,500원</p>
								<a href="#" class="btn btn-primary">주문하기</a>
							</div>
						</div>
					</div>
					<div class="menuCard" style="text-align: center;">
						<div class="card" style="width: 18rem;">
							<img src="/resources/image/hotdog2.jpg" class="card-img-top"
								alt="..." style="width: 100%;">
							<div class="card-body">
								<h4 class="card-title">핫도그</h4>
								<p class="card-text">1,500원</p>
								<a href="#" class="btn btn-primary">주문하기</a>
							</div>
						</div>
					</div>
					<div class="menuCard" style="text-align: center;">
						<div class="card" style="width: 18rem;">
							<img src="/resources/image/hotdog2.jpg" class="card-img-top"
								alt="..." style="width: 100%;">
							<div class="card-body">
								<h4 class="card-title">핫도그</h4>
								<p class="card-text">1,500원</p>
								<a href="#" class="btn btn-primary">주문하기</a>
							</div>
						</div>
					</div>
					<div class="menuCard" style="text-align: center;">
						<div class="card" style="width: 18rem;">
							<img src="/resources/image/hotdog2.jpg" class="card-img-top"
								alt="..." style="width: 100%;">
							<div class="card-body">
								<h4 class="card-title">핫도그</h4>
								<p class="card-text">1,500원</p>
								<a href="#" class="btn btn-primary">주문하기</a>
							</div>
						</div>
					</div>
					<div class="menuCard" style="text-align: center;">
						<div class="card" style="width: 18rem;">
							<img src="/resources/image/hotdog2.jpg" class="card-img-top"
								alt="..." style="width: 100%;">
							<div class="card-body">
								<h4 class="card-title">핫도그</h4>
								<p class="card-text">1,500원</p>
								<a href="#" class="btn btn-primary">주문하기</a>
							</div>
						</div>
					</div>
					<div class="menuCard" style="text-align: center;">
						<div class="card" style="width: 18rem;">
							<img src="/resources/image/hotdog2.jpg" class="card-img-top"
								alt="..." style="width: 100%;">
							<div class="card-body">
								<h4 class="card-title">핫도그</h4>
								<p class="card-text">1,500원</p>
								<a href="#" class="btn btn-primary">주문하기</a>
							</div>
						</div>
					</div>

				</div>
				<!-- 메뉴리스트 -->
			</div>
			<div class="subContents" style="overflow-y: auto;">

				<div class="subContentsHeader" style="text-align: center;">
					<div class="border p-3 "
						style="position: absolute; top: 5%; background-color: white; width: 20%; z-index: 1;">
						목록</div>
				</div>

				<!-- 주문확인구역 -->
				<div class="subContentsMiddle">
					<div class="subContentsOrderList"
						style="margin-top: 15%; overflow-y: auto;">
						<div class="border p-3 "
							style="background-color: white; width: 100%; float: right;">
							<span style="position: relative; left: 5%;">핫도그</span>
							<!-- 수량줄이는 -버튼 -->
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-dash-circle"
								viewBox="0 0 16 16"
								style="position: relative; left: 13%; cursor: pointer;">
                            <path
									d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                            <path
									d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z" />
                        </svg>
							<!-- 수량줄이는 -버튼 -->

							<!-- 수량표시 -->
							<div class="menuCount"
								style="float: right; position: relative; right: 50%; border: solid 2px rgba(0, 0, 0, 0.2); width: 15%; height: 0%; text-align: center; color: #1ED760;">5</div>
							<!-- 수량표시 -->

							<!-- 수량 늘리는 + 버튼 -->
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-plus-circle"
								viewBox="0 0 16 16"
								style="position: relative; left: 35%; cursor: pointer;">
                            <path
									d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                            <path
									d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                        </svg>
							<!-- 수량 늘리는 + 버튼 -->

							<!-- 가격 -->
							<span class="orderPrice" style="position: relative; left: 40%;">155,500원</span>
							<!-- 가격 -->

							<!-- 주문지우는 X 버튼 -->
							<button type="button" class="btn-close btn-close-white"
								aria-label="Close" style="position: relative; right: -45%;"></button>
							<!-- 주문지우는 X 버튼 -->
						</div>

                </div>

            </div>
            <!-- 주문확인구역 -->

            <div class="orderButton"
                style="width:8%;  background-color:  rgb(220, 226, 222, 1);position: absolute; bottom:0%; right: 12%;">
                주문취소
            </div>
            <div class="orderButton1" onclick="connect()"
                style="width:12%; float: right; background-color: rgb(30, 215, 96,0.1); ;position: absolute; bottom:0%; right:0%;">
                주문확인
            </div>
            <div class="modal fade" id="messageModal" style="background-color: rgba(0, 0, 0, 0.2)">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title col-10">메세지 제목이 없습니다.</h5>
						<button type="button" id="modalClose" class="btn-close col-1" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>

				</div>
				<!-- 주문확인구역 -->

				<div class="orderButton"
					style="width: 8%; background-color: rgb(220, 226, 222, 1); position: absolute; bottom: 0%; right: 12%;">
					주문취소</div>
				<div class="orderButton1"
					style="width: 12%; float: right; background-color: rgb(30, 215, 96, 0.1);; position: absolute; bottom: 0%; right: 0%;">
					주문확인</div>
				<div class="modal fade" id="messageModal"
					style="background-color: rgba(0, 0, 0, 0.2)">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title col-10">메세지 제목이 없습니다.</h5>
								<button type="button" id="modalClose" class="btn-close col-1"
									data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body text-center">
								<div class="my-2 mx-5" id="svgZone"></div>
								<div id="alertContent">메세지 내용이 없습니다.</div>
							</div>
							<div class="modal-footer text-center">
								<button type="button" id="btnCancel" class="btn btn-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="button" id="btnOk" class="btn">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="header">
			<span class="px-3"><svg xmlns="http://www.w3.org/2000/svg"
					width="30" height="30" fill="currentColor" class="bi bi-arrow-left"
					viewBox="0 0 16 16">
                <path fill-rule="evenodd"
						d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
            </svg></span> <span><img src="/resources/image/mainLogo-dark.png"></span>
		</div>
		<div id="content"
			style="position: fixed; top: 5%; left: 0%; right: 0%;">
			<!-- 주문번호 -->
			<div class="contentHeader">
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: 30px;">
					<span style="margin-left: 5%;"> # 12 </span> <span
						style="position: absolute; top: 0.5%; left: 70%;">
						<div style="text-align: center;">
							<span id="apm" style="color: gray; font-size: 15px;">ampm</span>
							<span id="clock" style="color: gray; font-size: 15px;">clock</span>
						</div>
					</span>
				</div>
			</div>
			<!-- 주문번호 -->
			<!-- 주문내역 -->
			<div class="orderZone"
				style="overflow-y: auto; width: 100%; height: 95%">
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>

				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>

				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>

				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>

				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>

				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<span style="margin-left: 5%;">치킨햄버거</span> <span
						style="color: green; margin-left: 20%;">x2</span> <span
						style="margin-left: 25%;">20,000원</span>
				</div>

			</div>
			<div class="orderZoneFooter"
				style="width: 20%; position: fixed; bottom: 0%; left: 0%; background-color: #ffffff;">
				<div class="menu border p-2"
					style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: 20px;">
					<span style="margin-left: 5%;">총 4건</span> <span
						style="margin-left: 40%; font-size: 30px;">80,000원</span>
				</div>
			</div>
		</div>

	</div>
	<div id="mainContent" style="overflow: hidden;">
		<div class="menu border p-3"
			style="text-align: center; height: 60%; background-color: #ffffff;">
			<span class="paymentText" style="margin-right: 5%;">결제금액</span> <span
				class="paymentPrice" style="margin-right: 3%;">80,000</span> <span
				class="paymentText">원</span><br> <span
				style="font-size: 30px; position: relative; top: 20%"> <br>주문
				내역 확인 후 결제 방법을 선택 해주세요.<br> 결제는 음식 수령과 함께 해주세요.
			</span>
		</div>
		<div class="paymentChoice"
			style="width: 100%; height: 40%; text-align: center; margin-top: 5%;">
			<div class="card">
				<div class="menu p-3">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
						fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16">
                        <path
							d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z" />
                        <path
							d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z" />
                    </svg>
					카드결제 >
				</div>
			</div>
			<div class="card">
				<div class="menu p-3">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
						fill="currentColor" class="bi bi-cash-coin" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
							d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z" />
                        <path
							d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z" />
                        <path
							d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z" />
                        <path
							d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z" />
                    </svg>
					현금결제 >
				</div>
			</div>
		</div>
	</div>
	<div class="pageBody"
		style="width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.3); position: absolute; top: 0%; display: none;">
		<div class="modal" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Modal title</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>Modal body text goes here.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
<script>
function connect(){
var sock = new WebSocket("ws://localhost:9999/my-webSocket");
sock.onopen = function() {
    console.log('open');
    sock.send('test');
};

sock.onmessage = function(e) {
    console.log('message', e.data);
    sock.close([code], [reason]);
};

sock.onclose = function(event) {
	  if (event.wasClean) {
	    console.log('웹 소켓이 정상적으로 닫혔습니다.');
	  } else {
	    console.error('웹 소켓이 예기치 않게 닫혔습니다. 이유: ' + event.reason + ', 코드: ' + event.code);
	  }
	};
sock.onerror = function(error) {
	  alert([error]);
	};
}
</script>

<style>
body {
	margin: 0px;
	margin-bottom: 0px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
}

.main {
	width: 100vw;
	height: 100vh;
	background-color: #f5f5f5;
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

.mainContents {
	width: 80%;
	height: 95%;
	/* background-color: aqua; */
	float: left;
	position: relative;
}

.menuCard {
	position: relative;
	top: 20%;
	margin-bottom: 3%;
}

.subContents {
	width: 20%;
	height: 95%;
	background-color: #ffffff;
	float: right;
}

.orderButton {
	height: 5%;
	text-align: center;
	padding: 10px 0;
	cursor: pointer;
	z-index: 1;
}

.orderButton:hover {
	background-color: #AFAFAF !important;
}

.orderButton1 {
	height: 5%;
	text-align: center;
	padding: 10px 0;
	cursor: pointer;
}

.orderButton1:hover {
	background-color: #71F9A2 !important;
}

#content {
	width: 20%;
	height: 95%;
	float: left;
	background-color: #ffffff;
}

#mainContent {
	width: 80%;
	height: 95%;
	float: right;
	background-color: #F5F5F5;
}

.paymentText {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	font-size: 60px;
	position: relative;
	top: 15%
}

.paymentPrice {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	font-size: 100px;
	position: relative;
	top: 15%
}

.paymentChoice {
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
}

.card {
	width: 20%;
	height: 50%;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	font-size: 40px;
	line-height: 130px;
	cursor: pointer;
}

.card:hover {
	background-color: #F6F6F6;
}
</style>

</html>