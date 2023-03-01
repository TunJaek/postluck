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
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
    <!-- 시간 -->

</head>

<body class="vsc-initialized" onload="pageInit('${param.message}')">
   
    <div class="header"><span class="px-3"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                <path fill-rule="evenodd"
                    d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
            </svg></span>
        <span><img src="/resources/image/mainLogo-dark.png"></span>
    </div>
    <div id="content" style="position: fixed; top: 5%; left: 0%; right: 0%;">
        <!-- 주문번호 -->
        <div class="contentHeader">
            <div class="menu border p-2"
                style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: 30px;">
                <span style="margin-left: 5%;"> # 12 </span> 
                    <span style="position: absolute; top: 0.5%; left: 70%;">  <div style="text-align: center;">
                        <span id="apm" style="color:gray; font-size: 15px;">ampm</span>
                        <span id="clock" style="color:gray; font-size: 15px;">clock</span>
                    </div>
                </span>
            </div>
        </div>
        <!-- 주문번호 -->
        <!-- 주문내역 -->
        <div class="orderZone" style="overflow-y: auto; width: 100%; height: 95%">
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>

            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>

            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>

            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>

            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>

            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>
            <div class="menu border p-2" style="font-family: 'Noto Sans KR', sans-serif;">
                <span style="margin-left: 5%;">치킨햄버거</span> <span style="color: green; margin-left: 20%;">x2</span>
                <span style="margin-left: 25%;">20,000원</span>
            </div>

        </div>
        <div class="orderZoneFooter"
            style="width: 20%; position: fixed; bottom: 0%; left: 0%; background-color: #ffffff; ">
            <div class="menu border p-2"
                style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: 20px; ">
                <span style="margin-left: 5%;">총 4건</span> <span
                    style="margin-left: 40%; font-size: 30px;">80,000원</span>
            </div>
        </div>
    </div>

    </div>
    <div id="mainContent" style="overflow: hidden;">
        <div class="menu border p-3" style="text-align: center; height: 60%; background-color: #ffffff;">
            <span class="paymentText" style="margin-right: 5%;">결제금액</span>
            <span class="paymentPrice" style="margin-right: 3%;">80,000</span>
            <span class="paymentText">원</span><br>
            <span style="font-size: 30px; position: relative; top:20%">
                <br>주문 내역 확인 후 결제 방법을 선택 해주세요.<br>
                결제는 음식 수령과 함께 해주세요.</span>
        </div>
        <div class="paymentChoice" style="width: 100%; height: 40%; text-align: center; margin-top: 5%;">
            <div class="card">
                <div class="menu p-3">
                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
                        class="bi bi-credit-card" viewBox="0 0 16 16">
                        <path
                            d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z" />
                        <path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z" />
                    </svg>
                    카드결제 >
                </div>
            </div>
            <div class="card">
                <div class="menu p-3">
                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
                        class="bi bi-cash-coin" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                            d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z" />
                        <path
                            d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z" />
                        <path
                            d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z" />
                        <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z" />
                    </svg> 현금결제 >
                </div>
            </div>
        </div>
    </div>
    <div class="pageBody" style="width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.3); position: absolute; top: 0%; display: none;">
        <div class="modal" tabindex="-1" >
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
    <script>
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
    </script>
</body>
<!-- <style media="screen">
    #divClock{
      font-size: 15px;
      color: green;
    } -->
</style>
<style>
    body {
        width: 100vw;
        height: 100vh;
        margin: 0px;
        margin-bottom: 0px;
    }

    /* #Time{
        margin-left: 30%;
    } */

    .header {
        position: relative;
        height: 5%;
        background-color: #333333;
        margin: 0px;
        color: white;
        display: flex;
        align-items: center;
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