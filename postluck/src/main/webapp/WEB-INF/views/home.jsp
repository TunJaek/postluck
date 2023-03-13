<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko" style="overflow-x: hidden;">
<head>
<meta charset="UTF-8">
<title>HOME - POS.TLUCK</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="icon" href="/resources/image/fabicon.png">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/mainBootstrap.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap"
	rel="stylesheet">
<script src="../../resources/js/common.js"></script>

</head>

<body>
	<div class="Content"
		style="background: #e9ecef; overflow-x: hidden; width: 100vw;">
		<div class="header text-center"
			style="z-index: 2000; position: sticky; top: 0; width: 100%; background: white; height: 5%;">
			<div class="row" style="height: 100%;">
				<div class="text-center w-50 " style="width: 100%;">
					<img class="logo" src="/resources/image/indexTextLogo.png"
						style="height: 100%;">
				</div>
			</div>
		</div>
		<div class="mainContent pt-3 pb-5"
			style="display: flex; box-sizing: border-box; flex-direction: column; /* max-width: 95%; */ align-items: center; overflow-y: auto; width: 100%;">
			<div class="searchContainer w-50  mb-3 rounded"
				style="background-color: white;">
				<h5 class="pt-4 ps-4">우리 동네 푸드트럭 찾기</h5>
				<div class="row p-3">
					<div class="col-4 m-2">
						<select class="form-select" name ="city" onchange="change(this.selectedIndex);"
							aria-label="Default select example">
							<option value='전체'>전체</option>
							<option value='서울'>서울특별시</option>
							<option value='부산'>부산광역시</option>
							<option value='대구'>대구광역시</option>
							<option value='인천'>인천광역시</option>
							<option value='광주'>광주광역시</option>
							<option value='대전'>대전광역시</option>
							<option value='울산'>울산광역시</option>
							<option value='경기'>경기도</option>
							<option value='강원'>강원도</option>
							<option value='충북'>충청북도</option>
							<option value='충남'>충청남도</option>
							<option value='전북'>전라북도</option>
							<option value='전남'>전라남도</option>
							<option value='경북'>경상북도</option>
							<option value='경남'>경상남도</option>
							<option value='제주'>제주도</option>
						</select>
					</div>
					<div class="col-4 m-2">
						<select name='country' class="form-select"
							aria-label="Default select example">
							<option value=''>전체</option>
						</select>
					</div>
					<div class="col-2 m-2 px-3">
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								name="flexRadioDefault" id="isOpenCheckBox"
								onclick="makeStoreList()"> <label
								class="form-check-label" for="flexRadioDefault1">영업중</label>
						</div>
					</div>
					<div class="col-1">
						<button class="btn btn-primary">검색</button>
					</div>
				</div>
			</div>
			<div class="searchResult w-50 rounded p-5"
				style="background-color: white;">
				<h5 id="storeListZone">푸드트럭 목록</h5>


			</div>
		</div>
	</div>

	<div class="text-center py-5" style="background: #e9ecef;">
		<p>Team : ODOD Project : Postluck</p>
		<p>Members: 김민규, 정영준, 이예림, 홍준택</p>
		<p>© 2023 Postluck. All rights reserved.</p>


	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>


</body>
<script>
let storeList ='${storeList}';
const storeJson = JSON.parse(storeList);
<<<<<<< HEAD
let cnt = new Array();
cnt[0] = new Array('전체');
cnt[1] = new Array('전체','강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
cnt[2] = new Array('전체','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
cnt[3] = new Array('전체','남구','달서구','동구','북구','서구','수성구','중구','달성군');
cnt[4] = new Array('전체','계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
cnt[5] = new Array('전체','광산구','남구','동구','북구','서구');
cnt[6] = new Array('전체','대덕구','동구','서구','유성구','중구');
cnt[7] = new Array('전체','남구','동구','북구','중구','울주군');
cnt[8] = new Array('전체','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주군','양평군','여주군','연천군','용인시','이천군','파주시','포천시','화성시');
cnt[9] = new Array('전체','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','황성군');
cnt[10] = new Array('전체','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
cnt[11] = new Array('전체','공주시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
cnt[12] = new Array('전체','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
cnt[13] = new Array('전체','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
cnt[14] = new Array('전체','경산시','경주시','구미시','김천시','문겅시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
cnt[15] = new Array('전체','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군');
cnt[16] = new Array('전체','서귀포시','제주시','남제주군','북제주군');
function change(add) {
sel=document.getElementsByName("country")[0];
  /* 옵션메뉴삭제 */
  for (i=sel.length-1; i>=0; i--){
    sel.options[i] = null
    }
  /* 옵션박스추가 */
  for (i=0; i < cnt[add].length;i++){                     
                    sel.options[i] = new Option(cnt[add][i], cnt[add][i]);
    }         
}
makeStoreList()
function makeStoreList(){
let storeListZone = document.getElementById("storeListZone");
storeListZone.innerHTML ='';
	storeJson.forEach(store => {
		if(document.getElementById("isOpenCheckBox").checked==true && store.isOpen !='O')
			return;
		else{
			 let isopen;
			  if (store.isOpen == 'O') {
			    isopen = "영업중"
			  } else {
			    isopen = "영업전"
			  }
			  storeListZone.innerHTML += `<div class="card pointer my-4" id="\${store.storeCode}" onclick="storeInfo('\${store.storeCode}')">
			    <div class="row g-0">
			      <div class="col-md-4">
			        <img src="/resources/image/\${store.storeCode}/\${store.storeCode}S00.jpg"
			          class="img-fluid rounded-start ratio ratio-4x3" onerror="this.onerror=null; this.src='/resources/image/alt.jpg';">
			      </div>
			      <div class="col-md-8">
			        <div class="ps-4 d-flex" style="flex-direction: column;">
			          <div class="row fs-4 mb-3">
			            <div class="col-9">\${store.storeName}</div>
			            <div class="col fs-5"><i class="bi bi-circle-fill me-3"
			            style="color:\${isopen=='영업중'?'#00FF00':'red' } ;font-size: small;"></i>\${isopen}
			          </div>
			        </div><h6 class="col mb-3">\${store.storeCategory}</h6>
			          <h6 class="mb-3">\" \${store.storeInfo == null ? " 푸드트럭 한 줄 소개가 없습니다." : store.storeInfo} \"</h6>
			         
			          <p>
			            <i class="bi bi-telephone text-muted me-1"></i><small
			              class="text-muted">\${store.storePhone == null ? ' 전화 번호 정보가 없습니다.' : store.storePhone}</small>
			          </p>
			          <p>
			            <i class="bi bi-geo-alt text-muted col-1"></i><small
			              class="text-muted">\${store.locationList[0] != null ? store.locationList[0].locationAddr : ' 최근 주소 정보가 없습니다.'} \${store.locationList[0] != null ? store.locationList[0].locationDetail : ''}</small>
			          </p>
			        </div>
			      </div>
			    </div>
			  </div>`
		}
		 
		})
}
function storeInfo(storeCode){
	let storeInfo = [["storeCode",storeCode]];
	serverCallByRequest("/Home/StoreInfo","get",storeInfo);
}

</script>
<style>
.card .card img {
	flex-grow: 1;
	background-size: cover;
	background-position: center;
	width: 100%;
	height: 0;
	padding-bottom: 75%; /* 이미지 비율에 맞게 높이를 조절함 */
}

.card img {
	object-fit: cover;
}
</style>
</html>