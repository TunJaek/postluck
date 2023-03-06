<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta http-equiv="page-enter" content="blendTrans(duration=0.3)">
<meta http-equiv="page-exit" content="blendTrans(duration=0.3)">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>POS - POS.TLUCK</title>
<link rel="icon" href="/resources/image/fabicon.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
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
	height: 30%;
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
	width: 80vw;
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

<body class="vsc-initialized" onload="pageInit('${param.message}');showClock()">
	
		<div class="main">
			<div class="header">
	<span class="px-3 " style="cursor: pointer" onclick="movePage('Back')"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
                </svg></span> <span><img src="/resources/image/mainLogo-dark.png"></span>
			</div>

			<div class="contents">
				<span class="mainContent border" style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-template-rows: 1fr 1fr 1fr; gap: 5%;"> <!-- 					<div class="toast" role="alert" aria-live="assertive" aria-atomic="true" style="display: block; position: absolute; left: 70%; top: 3%; z-index: 1;"> --> <!-- 						<div class="toast-header"> --> <!-- 							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-gear-wide-connected" viewBox="0 0 16 16"> --> <!--                                 <path --> <!-- 									d="M7.068.727c.243-.97 1.62-.97 1.864 0l.071.286a.96.96 0 0 0 1.622.434l.205-.211c.695-.719 1.888-.03 1.613.931l-.08.284a.96.96 0 0 0 1.187 1.187l.283-.081c.96-.275 1.65.918.931 1.613l-.211.205a.96.96 0 0 0 .434 1.622l.286.071c.97.243.97 1.62 0 1.864l-.286.071a.96.96 0 0 0-.434 1.622l.211.205c.719.695.03 1.888-.931 1.613l-.284-.08a.96.96 0 0 0-1.187 1.187l.081.283c.275.96-.918 1.65-1.613.931l-.205-.211a.96.96 0 0 0-1.622.434l-.071.286c-.243.97-1.62.97-1.864 0l-.071-.286a.96.96 0 0 0-1.622-.434l-.205.211c-.695.719-1.888.03-1.613-.931l.08-.284a.96.96 0 0 0-1.186-1.187l-.284.081c-.96.275-1.65-.918-.931-1.613l.211-.205a.96.96 0 0 0-.434-1.622l-.286-.071c-.97-.243-.97-1.62 0-1.864l.286-.071a.96.96 0 0 0 .434-1.622l-.211-.205c-.719-.695-.03-1.888.931-1.613l.284.08a.96.96 0 0 0 1.187-1.186l-.081-.284c-.275-.96.918-1.65 1.613-.931l.205.211a.96.96 0 0 0 1.622-.434l.071-.286zM12.973 8.5H8.25l-2.834 3.779A4.998 4.998 0 0 0 12.973 8.5zm0-1a4.998 4.998 0 0 0-7.557-3.779l2.834 3.78h4.723zM5.048 3.967c-.03.021-.058.043-.087.065l.087-.065zm-.431.355A4.984 4.984 0 0 0 3.002 8c0 1.455.622 2.765 1.615 3.678L7.375 8 4.617 4.322zm.344 7.646.087.065-.087-.065z" -->
					<!-- 								/> --> <!--                             </svg> --> <!-- 							<strong class="me-auto">&nbsp POS<span style="color: #1ED760;">.</span>T<span style="color: #1ED760;">LUCK</span></strong> <small class="text-muted">5분전</small> --> <!-- 							<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button> --> <!-- 						</div> --> <!-- 						<div class="toast-body">새로운 주문이 들어왔습니다.</div> --> <!-- 					</div> --> <!-- 					<div class="card" style="width: 18rem; position: absolute; top: 20%; left: 50%; z-index: 1;"> --> <!-- 						<img src="..." class="card-img-top" alt="..."> --> <!-- 						<div class="card-body"> --> <!-- 							<span style="position: absolute; top: 0.5%; left: 70%;"> --> <!-- 								<div style="text-align: center;"> --> <!-- 									<span id="apm" style="color: gray; font-size: 15px;">ampm</span> <span id="clock" style="color: gray; font-size: 15px;">clock</span> --> <!-- 								</div> --> <!-- 							</span> --> <!-- 							<h5 class="card-title" style="">#주문번호</h5> -->
					<!-- 							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> --> <!-- 							<a href="#" class="btn btn-primary">Go somewhere</a> --> <!-- 						</div> --> <!-- 					</div> --> <!-- 					<div class="toast" role="alert" aria-live="assertive" aria-atomic="true" style="display: block; position: absolute; left: 70%; top: 3%; z-index: 1;"> --> <!-- 						<div class="toast-header"> --> <!-- 							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-gear-wide-connected" viewBox="0 0 16 16"> --> <!--                                 <path --> <!-- 									d="M7.068.727c.243-.97 1.62-.97 1.864 0l.071.286a.96.96 0 0 0 1.622.434l.205-.211c.695-.719 1.888-.03 1.613.931l-.08.284a.96.96 0 0 0 1.187 1.187l.283-.081c.96-.275 1.65.918.931 1.613l-.211.205a.96.96 0 0 0 .434 1.622l.286.071c.97.243.97 1.62 0 1.864l-.286.071a.96.96 0 0 0-.434 1.622l.211.205c.719.695.03 1.888-.931 1.613l-.284-.08a.96.96 0 0 0-1.187 1.187l.081.283c.275.96-.918 1.65-1.613.931l-.205-.211a.96.96 0 0 0-1.622.434l-.071.286c-.243.97-1.62.97-1.864 0l-.071-.286a.96.96 0 0 0-1.622-.434l-.205.211c-.695.719-1.888.03-1.613-.931l.08-.284a.96.96 0 0 0-1.186-1.187l-.284.081c-.96.275-1.65-.918-.931-1.613l.211-.205a.96.96 0 0 0-.434-1.622l-.286-.071c-.97-.243-.97-1.62 0-1.864l.286-.071a.96.96 0 0 0 .434-1.622l-.211-.205c-.719-.695-.03-1.888.931-1.613l.284.08a.96.96 0 0 0 1.187-1.186l-.081-.284c-.275-.96.918-1.65 1.613-.931l.205.211a.96.96 0 0 0 1.622-.434l.071-.286zM12.973 8.5H8.25l-2.834 3.779A4.998 4.998 0 0 0 12.973 8.5zm0-1a4.998 4.998 0 0 0-7.557-3.779l2.834 3.78h4.723zM5.048 3.967c-.03.021-.058.043-.087.065l.087-.065zm-.431.355A4.984 4.984 0 0 0 3.002 8c0 1.455.622 2.765 1.615 3.678L7.375 8 4.617 4.322zm.344 7.646.087.065-.087-.065z" -->
					<!-- 								/> --> <!--                             </svg> --> <!-- 							<strong class="me-auto">&nbsp POS<span style="color: #1ED760;">.</span>T<span style="color: #1ED760;">LUCK</span></strong> <small class="text-muted">5분전</small> --> <!-- 							<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button> --> <!-- 						</div> --> <!-- 						<div class="toast-body">새로운 주문이 들어왔습니다.</div> --> <!-- 					</div> --> <!-- 					<div class="card" style="width: 18rem; position: absolute; top: 20%; left: 50%; z-index: 1;"> --> <!-- 						<img src="..." class="card-img-top" alt="..."> --> <!-- 						<div class="card-body"> --> <!-- 							<span style="position: absolute; top: 0.5%; left: 70%;"> --> <!-- 								<div style="text-align: center;"> --> <!-- 									<span id="apm" style="color: gray; font-size: 15px;">ampm</span> <span id="clock" style="color: gray; font-size: 15px;">clock</span> --> <!-- 								</div> --> <!-- 							</span> --> <!-- 							<h5 class="card-title" style="">#주문번호</h5> -->
					<!-- 							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> --> <!-- 							<a href="#" class="btn btn-primary">Go somewhere</a> --> <!-- 						</div> --> <!-- 					</div> -->
					<input type="text" id="msg" class="form-control" aria-label="Recipient's username" readOnly >


				</span> <span class="subContent border position-relative">

					<div class="border align-middle p-4 position-relative" style="display: flex; align-items: center; justify-content: space-between; height: 7%;">
						<span class="fw-bold fs-4">#21</span> 2023.02.01.11:23
					</div>

					<div class="position-relative w-100" style="height: 72%; overflow: auto;">
						<div class="border p-3 d-flex " style="height: 10%; justify-content: space-around; justify-content: space-between;">
							<span>햄버거</span><span class="text-primary">x 23</span><span>8,000원</span>
						</div>
						<div class="border p-3 d-flex " style="height: 10%; justify-content: space-around; justify-content: space-between;">
							<span>햄버거</span><span class="text-primary">x 23</span><span>8,000원</span>
						</div>
						<div class="border p-3 d-flex " style="height: 10%; justify-content: space-around; justify-content: space-between;">
							<span>햄버거</span><span class="text-primary">x 23</span><span>8,000원</span>
						</div>
						<div class="border p-3 d-flex " style="height: 10%; justify-content: space-around; justify-content: space-between;">
							<span>햄버거</span><span class="text-primary">x 23</span><span>8,000원</span>
						</div>


					</div>
					<div class="position-absolute bottom-0 " style="width: 100%; height: 21%; display: flex; flex-direction: column;">
						<div class="border p-3 d-flex justify-content-between align-items-center " style="height: 35%;">
							<span>총 결제 금액</span>
							<h3>80,000원</h3>
						</div>
						<div class="border p-3 d-flex justify-content-between align-items-center ">
							<span>결제방식</span> <select class="form-select w-50" aria-label="Default select example">
								<option selected="">카드</option>
								<option value="1">현금</option>
							</select>
						</div>
						<div class="border d-flex justify-content-center align-items-center" style="height: 35%;">
							<div class=" col-4" style="text-align: center;">주문취소</div>
							<div class=" col-8" style="height: 100%; text-align: center;
	/* background: green; */ background-color: rgba(30, 215, 96, 0.1); display: flex; align-items: center; justify-content: center;">결제</div>

						</div>
					</div>
				</span>
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


	<script>
// 	if('${AccessInfo.menuList}' == ''){
// 		showModal('error::등록된 메뉴가 없습니다. 메뉴 등록 페이지로 이동합니다.:movePosManage');
// 	}
    		let sock = new WebSocket("ws://localhost:80/my-websocket");

    		  sock.onmessage = onMessage;
              sock.onopen = onOpen;
              sock.onclose = onClose;

              function send(){

                  let msg = document.getElementById("msg");

                  console.log(username + ":" + msg.value);
                  sock.send(username + ":" + msg.value);
                  msg.value = '';
              }
              
              //채팅창에서 나갔을 때
              function onClose(evt) {
                  var str = username + ": 님이 방을 나가셨습니다.";
                  sock.send(str);
              }
              
              //채팅창에 들어왔을 때
              function onOpen(evt) {
                  var str = username + ": 님이 입장하셨습니다.";
                 sock.send(str);
              }

              function onMessage(msg) {
                  var data = msg.data;
                  var sessionId = null;
                  //데이터를 보낸 사람
                  var message = null;
                  var arr = data.split(":");

                  for(var i=0; i<arr.length; i++){
                      console.log('arr[' + i + ']: ' + arr[i]);
                  }

                  var cur_session = username;

                  //현재 세션에 로그인 한 사람
                  console.log("cur_session : " + cur_session);
                  sessionId = arr[0];
                  message = arr[1];

                  console.log("sessionID : " + sessionId);
                  console.log("cur_session : " + cur_session);

                  //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
                  if(sessionId == cur_session){
                      var str = "<div class='col-6'>";
                      str += "<div class='alert alert-secondary'>";
                      str += "<b>" + sessionId + " : " + message + "</b>";
                      str += "</div></div>";
                      $("#msgArea").append(str);
                  }
                  else{
                      var str = "<div class='col-6'>";
                      str += "<div class='alert alert-warning'>";
                      str += "<b>" + sessionId + " : " + message + "</b>";
                      str += "</div></div>";
                      $("#msgArea").append(str);
                  }
              }
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
        function moveMenuReg(){
        	
       }
        function movePosManage() {
			serverCallByRequest('/View/MovePosManage', 'post',getJWT());
		}

    </script>



</body>

</html>