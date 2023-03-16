/**
 * Smart POS - Common Function
 */
/* keyEvent 새로고침 
document.onkeydown = function(event){
	const key = event.keyCode;
	if(key == 116 || (event.ctrlKey && key == 82) || (event.altKey && key == 37)){
		event.preventDefault();
	}
};*/

let jsonString = '';
/* PUBLIC IP 수집 CallBackFunc */
let publicIp;
function getPublicIp(jsonData) {
	publicIp = jsonData.ip
}

let header;
if (getJWT()) {
	header = new Headers(getJWT());
}
//commit test 
/* HttpRequest를 이용한 서버 요청
		clientData format : [['name', 'value'], ...]
 */
function serverCallByRequest(jobCode, methodType, clientData) {
	const form = createForm("", jobCode, methodType);

	if (clientData != '' && clientData != null) {
		for (let idx = 0; idx < clientData.length; idx++) {
			form.appendChild(createInputBox('hidden', clientData[idx][0], clientData[idx][1], ''));
		}
	}
	document.body.appendChild(form);
	form.submit();
}

/* ajax.readyState 
	0  request not initialize << new XMLHttpRequest()
	1	 server Connection established  << ajax.open() ajax.send()
	2  request recieved <<  client --> data --> server
	3	 processing request << server request processing
	4	 response ready
	
	ajax.status << data flow status
	200 << 'OK'
	400 403 << 'Forbidden'
		404 << 'PageNotFound'
*/
function serverCallByXHRAjax(formData, jobCode, methodType, callBackFunc) {
	const ajax = new XMLHttpRequest();
	console.log(formData);
	ajax.onreadystatechange = function() {
		if (ajax.readyState == 4 && ajax.status == 200) {
			alert(ajax.responseText);
			window[callBackFunc](JSON.parse(ajax.responseText));
		} else {
			showModal('error:오류:오류가 발생했습니다:');
		}
	};

	ajax.open(methodType, jobCode);
	//ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	//ajax.setRequestHeader("Content-Type", "application/json");

	ajax.send(formData);
}

function serverCallByFetchAjax(formData, jobCode, methodType, callBackFunc) {
	fetch(jobCode, {
		method: methodType,
		/*
	headers: {
		'Content-Type': 'application/x-www-form-urlencoded'
	},
	body: new URLSearchParams(formData)
	*/
		body: formData
	}).then(res => {
		if (res.headers.get("JWTForPostluck") != null) {
			//				console.log(res.headers.get("JWTForPostluck"))
			const jwt = res.headers.get("JWTForPostluck");
			if (jwt != '') sessionStorage.setItem('JWT', jwt);
		}
		//		if (res.headers.get("AccessInfo") != null) {
		//			const AccessInfo = res.headers.get("AccessInfo");
		//			if (AccessInfo != '') sessionStorage.setItem('AccessInfo', AccessInfo);
		//		} 
		console.log(res);
		return res.json();
	})
		.then(jsonData => window[callBackFunc](jsonData))
		.catch(error => {
			console.log(error);
			showModal('error:오류:오류가 발생했습니다:moveIndex:');
		})
}
function moveIndex() {
	sessionStorage.clear();
	serverCallByRequest("/Index", "get", "");
}
/* JWT 사용한 서버 요청 */
function serverCallByFetch(formData, jobCode, methodType, callBackFunc, header) {
	fetch(jobCode, {
		method: methodType,
		headers: header,
		body: formData
	}).then(res => {
		if (res.headers.get("JWTForPostluck") != null) {
			const jwt = res.headers.get("JWTForPostluck");
			if (jwt != '') sessionStorage.setItem('JWT', jwt);
		}
		console.log(res);
		return res.json();
	})
		.then(jsonData => window[callBackFunc](jsonData))
		.catch(error => {
			console.log(error);
			showModal('error:오류:오류가 발생했습니다::');
		})
}

function serverCallByFetchAjaxUsingJson(jsonString, jobCode, methodType, callBackFunc, header) {

	fetch(jobCode, {
		method: methodType,
		headers: {
			'JWTForPostluck': sessionStorage.getItem('JWT'),
			'Content-Type': 'application/json;charset=UTF-8'
		},
		body: jsonString
	}).then(response => response.json())
		.then(jsonData => window[callBackFunc](jsonData))
		.catch(error => {
			console.log(error);
			showModal('error:오류:오류가 발생했습니다::');
		})
}

function serverCallByFetchAjaxUsingUrl(jobCode, methodType, callBackFunc) {
	fetch(jobCode, {
		method: methodType,
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded'
		},
	}).then(response => response.json())
		.then(jsonData => window[callBackFunc](jsonData))
		.catch(error => {
			console.log(error);
			showModal('error:오류:오류가 발생했습니다::');
		})
}

function pageInitJson() {
	serverCallByFetchAjaxUsingUrl("https://api64.ipify.org?format=json", "get", "getPublicIp");

	console.log(serverData);
	const messageString = serverData.message;
	const accessInfo = serverData.accessDate;

	if (messageString != '') messageController(true, messageString);
	if (accessInfo != '') document.getElementById("accessInfo").innerText = "로그아웃(Access Time : " + accessInfo.substr(11) + ")";
	pageAuthorization();
}


/* 문자열이 JSON 데이터 타입인지 여부 */
function isJsonString(str) {
	try {
		JSON.parse(str);
	} catch (e) {
		return false;
	}
	return true;
}

/* 서버로 전송할 데이터 길이의 유효성 판단 */
function lengthCheck(obj) {
	const dataLength = [["storeCode", 10, 10], ["storeName", 2, 50], ["storePhone", 11, 11], ["ceoName", 2, 20], ["storeInfo", 0, 30], ["storeInfoDetail", 0, 2000]];
	let result = false;

	for (let recordIdx = 0; recordIdx < dataLength.length; recordIdx++) {
		if (obj.getAttribute("id") == dataLength[recordIdx][0]) {
			if (dataLength[recordIdx][0] == 'storeCode' || dataLength[recordIdx][0] == 'storePhone') {
				if (obj.value.length >= dataLength[recordIdx][1]
					&& obj.value.length <= dataLength[recordIdx][2]) {
					if (!isNaN(obj.value)) result = true;
					/*isNaN : 문자면 true*/
				}
			} else if (obj.value.length >= dataLength[recordIdx][1] && obj.value.length <= dataLength[recordIdx][2]
				&& isNaN(obj.value.substr(0, 1))) result = true;
		}
	}

	return result;
}

/* Password Validation */
function isPasswordCheck(text) {

	const largeChar = /[A-Z]/;
	const smallChar = /[a-z]/;
	const num = /[0-9]/;
	const specialChar = /[!@#$%^&*]/;

	let typeCount = 0;

	if (largeChar.test(text)) typeCount++;
	if (smallChar.test(text)) typeCount++;
	if (num.test(text)) typeCount++;
	if (specialChar.test(text)) typeCount++;

	return typeCount >= 3 ? true : false;
}

/* FORM 생성 */
function createForm(name, action, method) {
	const form = document.createElement("form");
	if (name != "") form.setAttribute("name", name);
	form.setAttribute("action", action);
	form.setAttribute("method", method);
	return form;
}

/* DIV 생성 */
function createDIV(objId, className, funcName) {
	const div = document.createElement("div");
	if (objId != '') div.setAttribute("id", objId);
	if (className != '') div.setAttribute("class", className);
	if (funcName != '') div.setAttribute("onClick", funcName);

	return div;
}

function createDiv(objId, className, funcName, innerText) {
	const div = document.createElement("div");
	if (objId != '') div.setAttribute("id", objId);
	if (className != '') div.setAttribute("class", className);
	if (funcName != '') div.setAttribute("onClick", funcName);
	if (innerText != '') div.innerText = innerText;
	return div;
}


/* Input Box 생성*/
function createInputBox(type, name, value, placeholder) {
	const input = document.createElement("input");
	input.setAttribute("type", type);
	input.setAttribute("name", name);
	if (value != "") input.setAttribute("value", value);
	if (placeholder != "") input.setAttribute("placeholder", placeholder);
	return input;
}
/* DatePicker 생성 */
function createDatePicker(name, minDate, maxDate) {
	const date = document.createElement("input");
	date.setAttribute("type", "date");
	date.setAttribute("name", name);
	if (minDate != "") date.setAttribute("min", minDate);
	if (maxDate != "") date.setAttribute("max", maxDate);
	return date;
}

function createSelect(name, options, className, displayName) {
	const select = document.createElement("select");
	select.setAttribute("name", name);
	select.setAttribute("class", className);

	if (displayName != null && displayName != '') {
		const option = document.createElement("option");
		option.innerText = displayName;
		select.appendChild(option);
	}

	for (idx = 0; idx < options.length; idx++) {
		const option = document.createElement("option");
		option.setAttribute("value", options[idx].levCode);
		option.innerText = options[idx].levName;
		select.appendChild(option);
	}
	return select;
}

function createFileBox(name, className) {
	const fileBox = document.createElement("div");
	fileBox.setAttribute("class", className);
	const uploadName = document.createElement("input");
	uploadName.setAttribute("class", "uploadName");
	uploadName.setAttribute("readOnly", true);
	uploadName.setAttribute("placeholder", "NONE");
	uploadName.style.marginRight = "3%";
	const label = document.createElement("label");
	label.setAttribute("for", "file");
	label.innerText = "찾기";
	const file = document.createElement("input");
	file.setAttribute("type", "file");
	file.setAttribute("id", "file");
	file.setAttribute("name", name);
	file.addEventListener("change", function() {
		let fileName = document.getElementById("file").value;
		document.getElementsByClassName("uploadName")[0].value = fileName;
	});

	fileBox.appendChild(uploadName);
	fileBox.appendChild(label);
	fileBox.appendChild(file);

	return fileBox;
}

function createTextarea(name, placeholder, value, className) {
	const textarea = document.createElement('textarea');
	textarea.setAttribute('name', name);
	if (placeholder != '') textarea.setAttribute('placeholder', placeholder);
	if (value != '') textarea.setAttribute('value', value);
	textarea.setAttribute('class', className);
	return textarea;
}

function getJWT() {
	let accessToken = null;
	if (sessionStorage.JWT) {
		accessToken = [["JWTForPostluck", sessionStorage.JWT]];
	}
	return accessToken;
}



function afterIssuance(jsonData) {
	console.log(jsonData);
	const accessToken = getJWT();
	//[[JWTForPostluck,ehfedrfgaksfdjhgaleiru245235]]
	if (jsonData != null) {
		if (accessToken) {
			accessToken.push(['snsID', jsonData.snsID]);
			//JWT 유효성 검증과 사용자 정보 불러오는 serverCall(공통)
			serverCallByRequest('View/AccessCtl', 'post', accessToken);
		} else {
			console.log('accessToken is null')
		}
	} else {
		console.log(jsonData);
	}

}

function movePage(targetPage) {
	//페이지 이동 serverCall
	serverCallByRequest('/View/Move' + targetPage, 'post', getJWT());
}
function logout() {
	// 로그아웃 serverCall
	serverCallByRequest('/View/logOut', 'post', getJWT());
}
//카카오로그아웃  
function kakaoLogout() {
	if (Kakao.Auth.getAccessToken()) {
		Kakao.API.request({
			url: '/v1/user/unlink',
			success: function(response) {
			},
			fail: function(error) {
				console.log(error);
			},
		})
		Kakao.Auth.setAccessToken(undefined);
	}
}

function showModal(messageString) {
	if (typeof messageString === 'object') {
		try {
			if (messageString.message != null) {
				console.log(messageString.message)
				messageString = messageString.message;
			}
		} catch (e) {

		}

	} else {
		console.log("this is not JsonString");
	}
	if (messageString != null && messageString.includes(":")) {
		const messageModalString = `
    <div class="modal-dialog modal-dialog-centered" role="document" >
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
          <button type="button" id="btnCancel" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
          <button type="button" id="btnOk" class="btn" data-bs-dismiss="modal" aria-label="Close">확인</button>
        </div>
      </div>
    </div>
`;
		let messageModalDiv = document.createElement("div");
		messageModalDiv.setAttribute("class", "modal fade");
		messageModalDiv.setAttribute("id", "messageModal");
		messageModalDiv.setAttribute("data-bs-backdrop", "static");
		document.body.insertBefore(messageModalDiv, document.body.firstChild);

		messageModalDiv.innerHTML = messageModalString;

		const messageModal = new bootstrap.Modal(document.querySelector('#messageModal'));

		console.log(messageString);
		let message = messageString.split(':');
		console.log(message);
		const btnOk = document.getElementById("btnOk");
		const btnCancel = document.getElementById("btnCancel");
		messageModal.show();
		btnOk.addEventListener("click", function() {
			messageModal.hide();
			if (message[message.length - 2] != '') {
				window[message[message.length - 2]](message[message.length - 1]);
			}
		});
		if (message[0] == 'warn') {
			document.getElementById("svgZone").innerHTML = '<i class="bi bi-exclamation-circle fs-1" style="color: var(--bs-danger)"></i>';
			btnOk.setAttribute("class", "btn btn-danger");
			btnCancel.addEventListener("click", messageModal.hide);
		} else if (message[0] == 'plain') {
			document.getElementById("svgZone").innerHTML = '<i class="bi bi-check-circle fs-1" style="color: var(--bs-primary)"></i>';
			btnOk.setAttribute("class", "btn btn-primary");
			btnCancel.setAttribute("class", "btn btn-secondary d-none");
		} else if (message[0] == 'check') {
			btnOk.setAttribute("class", "btn btn-primary");
			btnCancel.addEventListener("click", messageModal.hide);
		} else if (message[0] == 'error') {
			document.getElementById("svgZone").innerHTML = '<i class="bi bi-x-circle fs-1" style="color: var(--bs-danger)"></i>';
			btnOk.setAttribute("class", "btn btn-danger");
			btnCancel.setAttribute("class", "btn btn-secondary d-none");
		}
		document.getElementsByClassName('modal-title col-10')[0].innerText = message[1];
		document.getElementById("alertContent").innerText = message[2];
		document.getElementById("messageModal").addEventListener('hidden.bs.modal', function() {
			document.getElementById("messageModal").remove();
		});
	}
}


