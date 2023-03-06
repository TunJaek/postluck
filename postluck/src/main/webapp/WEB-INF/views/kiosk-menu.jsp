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
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
</head>

<body class="vsc-initialized" onload="pageInit('${param.message}')">

    <div class="main">
        <div class="header"><span class="px-3"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                    fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                        d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
                </svg></span>
            <span><img src="/resources/image/mainLogo-dark.png"></span>
        </div>
        <div class="mainContents">
                <div class="border p-3 " style="text-align: center; margin-bottom: 5%;
                background-color: white; position: fixed; width: 80%; z-index: 1;">
                    핫도그라운드KIOSK
                </div>
                <!-- 메뉴리스트 -->
                <div class="mainContentsMenuList" style="
                        display: grid;
                        justify-content: center;
                        grid-template-columns: 25% 25% 25%;
                        /*grid-template-rows: 35% 35% 35%;*/
                        overflow-y: scroll;">
                    <div class="menuCard" style="text-align: center;">
                        <div class="card" style="width: 18rem;">
                            <img src="/resources/image/hotdog2.jpg" class="card-img-top" alt="..." style="width: 100%;">
                            <div class="card-body">
                                <h5 class="card-title">핫도그</h5>
                                <p class="card-text">1,500원</p>
                                <a href="#" class="btn btn-primary">주문레쓰고</a>
                            </div>
                        </div>
                    </div>
                    <div class="menuCard" style="text-align: center;">
                        <div class="card" style="width: 18rem;">
                            <img src="/resources/image/hotdog2.jpg" class="card-img-top" alt="..." style="width: 100%;">
                            <div class="card-body">
                                <h5 class="card-title">핫도그</h5>
                                <p class="card-text">1,500원</p>
                                <a href="#" class="btn btn-primary">주문레쓰고</a>
                            </div>
                        </div>
                    </div>
                    <div class="menuCard" style="text-align: center;">
                        <div class="card" style="width: 18rem;">
                            <img src="/resources/image/hotdog2.jpg" class="card-img-top" alt="..." style="width: 100%;">
                            <div class="card-body">
                                <h5 class="card-title">핫도그</h5>
                                <p class="card-text">1,500원</p>
                                <a href="#" class="btn btn-primary">주문레쓰고</a>
                            </div>
                        </div>
                    </div>
                    <div class="menuCard" style="text-align: center;">
                        <div class="card" style="width: 18rem;">
                            <img src="/resources/image/hotdog2.jpg" class="card-img-top" alt="..." style="width: 100%;">
                            <div class="card-body">
                                <h5 class="card-title">핫도그</h5>
                                <p class="card-text">1,500원</p>
                                <a href="#" class="btn btn-primary">주문레쓰고</a>
                            </div>
                        </div>
                    </div>
                    <div class="menuCard" style="text-align: center;">
                        <div class="card" style="width: 18rem;">
                            <img src="/resources/image/hotdog2.jpg" class="card-img-top" alt="..." style="width: 100%;">
                            <div class="card-body">
                                <h5 class="card-title">핫도그</h5>
                                <p class="card-text">1,500원</p>
                                <a href="#" class="btn btn-primary">주문레쓰고</a>
                            </div>
                        </div>
                    </div>
                    <div class="menuCard" style="text-align: center;">
                        <div class="card" style="width: 18rem;">
                            <img src="/resources/image/hotdog2.jpg" class="card-img-top" alt="..." style="width: 100%;">
                            <div class="card-body">
                                <h5 class="card-title">핫도그</h5>
                                <p class="card-text">1,500원</p>
                                <a href="#" class="btn btn-primary">주문레쓰고</a>
                            </div>
                        </div>
                    </div>
                    <div class="menuCard" style="text-align: center;">
                        <div class="card" style="width: 18rem;">
                            <img src="/resources/image/hotdog2.jpg" class="card-img-top" alt="..." style="width: 100%;">
                            <div class="card-body">
                                <h5 class="card-title">핫도그</h5>
                                <p class="card-text">1,500원</p>
                                <a href="#" class="btn btn-primary">주문레쓰고</a>
                            </div>
                        </div>
                    </div>
                    <div class="menuCard" style="text-align: center;">
                        <div class="card" style="width: 18rem;">
                            <img src="/resources/image/hotdog2.jpg" class="card-img-top" alt="..." style="width: 100%;">
                            <div class="card-body">
                                <h5 class="card-title">핫도그</h5>
                                <p class="card-text">1,500원</p>
                                <a href="#" class="btn btn-primary">주문레쓰고</a>
                            </div>
                        </div>
                    </div>
                    <div class="menuCard" style="text-align: center;">
                        <div class="card" style="width: 18rem;">
                            <img src="/resources/image/hotdog2.jpg" class="card-img-top" alt="..." style="width: 100%;">
                            <div class="card-body">
                                <h5 class="card-title">핫도그</h5>
                                <p class="card-text">1,500원</p>
                                <a href="#" class="btn btn-primary">주문레쓰고</a>
                            </div>
                        </div>
                    </div>
                    <div class="menuCard" style="text-align: center;">
                        <div class="card" style="width: 18rem;">
                            <img src="/resources/image/hotdog2.jpg" class="card-img-top" alt="..." style="width: 100%;">
                            <div class="card-body">
                                <h5 class="card-title">핫도그</h5>
                                <p class="card-text">1,500원</p>
                                <a href="#" class="btn btn-primary">주문레쓰고</a>
                            </div>
                        </div>
                    </div>
                    <div class="menuCard" style="text-align: center;">
                        <div class="card" style="width: 18rem;">
                            <img src="/resources/image/hotdog2.jpg" class="card-img-top" alt="..." style="width: 100%;">
                            <div class="card-body">
                                <h5 class="card-title">핫도그</h5>
                                <p class="card-text">1,500원</p>
                                <a href="#" class="btn btn-primary">주문레쓰고</a>
                            </div>
                        </div>
                    </div>
                    <div class="menuCard" style="text-align: center;">
                        <div class="card" style="width: 18rem;">
                            <img src="/resources/image/hotdog2.jpg" class="card-img-top" alt="..." style="width: 100%;">
                            <div class="card-body">
                                <h5 class="card-title">핫도그</h5>
                                <p class="card-text">1,500원</p>
                                <a href="#" class="btn btn-primary">주문레쓰고</a>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- 메뉴리스트 -->
        </div>
        <div class="subContents" style="overflow-y: auto;">
            <div class="subContentsHeader" style="text-align: center;">
                <div class="border p-3 "
                    style=" position: absolute; top: 5%; background-color: white; width: 20%; z-index: 1; ">
                    목록
                </div>
            </div>

            <!-- 주문확인구역 -->
            <div class="subContentsMiddle">
                <div class="subContentsOrderList" style="margin-top: 15%; overflow-y: auto;">
                    <div class="border p-3 " style="background-color: white; width: 100%; float: right; ">
                        <span style="position: relative; left: 5%;">핫도그</span>
                        <!-- 수량줄이는 -버튼 -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-dash-circle" viewBox="0 0 16 16"
                            style="position: relative; left: 13%; cursor: pointer;">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                            <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z" />
                        </svg>
                        <!-- 수량줄이는 -버튼 -->

                        <!-- 수량표시 -->
                        <div class="menuCount"
                            style="float: right; position: relative; right: 50%; 
                        border: solid 2px rgba(0, 0, 0, 0.2); width: 15%; height: 0%; text-align: center; color: #1ED760;">5</div>
                        <!-- 수량표시 -->

                        <!-- 수량 늘리는 + 버튼 -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-plus-circle" viewBox="0 0 16 16"
                            style="position: relative; left: 35%; cursor: pointer;">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                            <path
                                d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                        </svg>
                        <!-- 수량 늘리는 + 버튼 -->

                        <!-- 가격 -->
                        <span class="orderPrice" style="position: relative; left: 40%;">155,500원</span>
                        <!-- 가격 -->

                        <!-- 주문지우는 X 버튼 -->
                        <button type="button" class="btn-close btn-close-white" aria-label="Close"
                            style="position: relative; right: -45%;"></button>
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
        </div>
</body>
<script>

let sock;
if (sock != ''){
sock = new WebSocket("ws://localhost:80/my-websocket");
}
sock.onopen = function(event) {
	alert(event.code);
	console.log('open');
	sock.send(sock);

sock.onmessage = function(e) {
	alert(e.code);
	console.log('message', e.data);
};

};
sock.onclose = function(event) {
	if (event.wasClean) {
		console.log('웹 소켓이 정상적으로 닫혔습니다.');
	} else {
		console.error('웹 소켓이 예기치 않게 닫혔습니다. 이유: ' + event.reason + ', 코드: '
				+ event.code);
	}
};
sock.onerror = function(error) {
	alert([ error ]);
};

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
        height: 5%;
        text-align: center;
        padding: 10px 0;
        background-color: #71F9A2 !important;
    }
</style>

</html>