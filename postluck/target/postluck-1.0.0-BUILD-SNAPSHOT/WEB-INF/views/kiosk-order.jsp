<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KIOSK - POS.TLUCK</title>
<link rel="icon" href="/resources/image/fabicon.png">
<link rel="stylesheet"
	href="C:\Users\user\git\postluck\postluck\src\main\webapp\resources\css\mainBootstrap.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="..\..\resources\css\kiosk.css">
</head>
<body>
	<div class="main" style="overflow:hidden;">
		<div class="header">
			<span class="px-3"><svg xmlns="http://www.w3.org/2000/svg"
					width="30" height="30" fill="currentColor" class="bi bi-arrow-left"
					viewBox="0 0 16 16">
                <path fill-rule="evenodd"
						d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
            </svg></span> <span><img src="/resources/image/mainLogo-dark.png"></span>
		</div>
		<!-- 주문내역확인 -->
		<div class="orderContents orderPage" style="display:none;">
			<div class="orderZoneHeader">
				<div class="menu border p-2">
					<span class="orderNumber"> # 12 </span> <span
						style="position: absolute; top: 0.5%; left: 70%;">
						<div style="text-align: center;">
							<span id="apm" class="time">ampm</span> <span id="clock"
								class="time">clock</span>
						</div>
					</span>
				</div>
			</div>
			<div class="orderZone">
				<div class="menu border p-2">
					<span class="menuName">치킨햄버거</span> <span class="menuCount">x2</span>
					<span class="menuPrice">20,000원</span>
				</div>


			</div>
			<div class="orderZoneFooter" >
				<div class="menu border p-2">
					<span class="allCount">총 4건</span> <span class="allPrice">80,000원</span>
				</div>
			</div>
		</div>
		<!-- 주문내역확인 -->

		<!-- 결제방식 결정 -->
		<div class="payMentContens orderPage" style="display:none;">
			<div class="menu border p-3 payment" >
				<span class="paymentText" style="">결제금액</span> <span
					class="paymentPrice" style="">80,000</span> <span
					class="paymentText">원</span><br> <span
					style="font-size: 30px; position: relative; top: 20%"> <br>주문
					내역 확인 후 결제 방법을 선택 해주세요.<br> 결제는 음식 수령과 함께 해주세요.
				</span>
			</div>
			<div class="paymentChoice">
				<div class="card paymentMethod">
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
				<div class="card paymentMethod">
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
		<!-- 결제방식 결정 -->
	</div>
	<!-- <script>
        var Target = document.getElementById("clock");
        var Target_apm = document.getElementById("apm");
        function clock() {
            var time = new Date();
            var hours = time.getHours();
            var minutes = time.getMinutes();
            var seconds = time.getSeconds();
            var AmPm = "AM";
            if (hours > 12) {
                var AmPm = "PM";
                hours %= 12;
            }

            Target.innerText =
                '${hours < 10 ? '0${hours}' : hours}:${minutes < 10 ? '0${minutes}' : minutes}:${seconds < 10 ? '0${seconds}' : seconds}';

            Target_apm.innerText = '${AmPm}';

        }
        clock();
        setInterval(clock, 1000); // 1초마다 실행
    </script> -->
</body>
<style>



</style>
</html>