<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html lang="ko">


<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <link rel="icon" href="/resources/image/fabicon.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>POS.TLUCK</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
  <link rel="stylesheet" href="/resources/css/mainBootstrap.css">
</head>

<body>
  <div class="main">
    <div class="header">
      <div
        style="width:70%;height: 100%;margin-left: 15%;display: flex;justify-content: space-between;flex-direction: row;">
        <div style="height: 100%;width: auto;"><img class="logo col" src="/resources/image/indexTextLogo.png"
            style="height: 100%;float: left; cursor: pointer;"></div>
        <span class="form-group" style="float: right; width: 50%; margin-top: 1%;">
          <input type="text" class="form-control" placeholder="지역, 메뉴를 검색하세요." id="inputSearch">
        </span>
        <span class="businessLogin">사업자로그인</span>
      </div>
    </div>
    <div class="content">
      <div class="contentHeader" style="width: 100%; height: 10%; background-color: white; border-radius: 20px; position: relative; top: 5%;  margin-bottom: 4%;
                                  display: flex; justify-content: space-evenly;">
        <select class="form-select" aria-label="Default select example"
          style="width: 30%; height: 50%; position: relative; top: 25%; font-weight: bold;">
          <option selected>지역</option>
          <option value="1">서울</option>
          <option value="2">인천</option>
          <option value="3">경기</option>
          <option value="4">강원</option>
          <option value="5">충북</option>
          <option value="6">충남</option>
          <option value="7">전북</option>
          <option value="8">전남</option>
          <option value="9">경북</option>
          <option value="10">경남</option>
          <option value="11">제주</option>
        </select>
        <select class="form-select" aria-label="Default select example"
          style="width: 30%; height: 50%; position: relative; top: 25%; font-weight: bold;">
          <option selected>카테고리</option>
          <option value="1">한식</option>
          <option value="2">일식</option>
          <option value="3">중식</option>
          <option value="4">양식</option>
        </select>
      </div>
      <div class="contentMiddle" style="width: 100%; height: 100%; background-color: white; border-radius: 20px; position: relative; top: 5%;  overflow-y: scroll;
                  display: flex; flex-direction: column;">
        <!-- 푸드트럭 카드 구역 -->
        <div class="foodTruckCardZone" style="width: 80%; height: 100%; margin-left: 10%; font-weight: bold;">
          <div class="card mb-3" id="foodTruckCard" style="" >
            <div class="row g-0">
              <div class="col-md-3">
                <img src="/resources/image/FoodTruck/fish&chips.webp" class="img-fluid rounded-start" style="height: 100%;" >
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                    additional content. This content is a little bit longer.</p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
              </div>
            </div>
          </div>
          <div class="card mb-3" id="foodTruckCard" style="" >
            <div class="row g-0">
              <div class="col-md-3">
                <img src="/resources/image/FoodTruck/fish&chips.webp" class="img-fluid rounded-start" style="height: 100%;" >
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                    additional content. This content is a little bit longer.</p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
              </div>
            </div>
          </div>
          <div class="card mb-3" id="foodTruckCard" style="" >
            <div class="row g-0">
              <div class="col-md-3">
                <img src="/resources/image/FoodTruck/fish&chips.webp" class="img-fluid rounded-start" style="height: 100%;" >
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                    additional content. This content is a little bit longer.</p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
              </div>
            </div>
          </div>
          <div class="card mb-3" id="foodTruckCard" style="" >
            <div class="row g-0">
              <div class="col-md-3">
                <img src="/resources/image/FoodTruck/fish&chips.webp" class="img-fluid rounded-start" style="height: 100%;" >
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                    additional content. This content is a little bit longer.</p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
              </div>
            </div>
          </div>
          <div class="card mb-3" id="foodTruckCard" style="" >
            <div class="row g-0">
              <div class="col-md-3">
                <img src="/resources/image/FoodTruck/fish&chips.webp" class="img-fluid rounded-start" style="height: 100%;" >
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                    additional content. This content is a little bit longer.</p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
              </div>
            </div>
          </div>
          <div class="card mb-3" id="foodTruckCard" style="" >
            <div class="row g-0">
              <div class="col-md-3">
                <img src="/resources/image/FoodTruck/fish&chips.webp" class="img-fluid rounded-start" style="height: 100%;" >
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                    additional content. This content is a little bit longer.</p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
              </div>
            </div>
          </div>
          <div class="card mb-3" id="foodTruckCard" style="" >
            <div class="row g-0">
              <div class="col-md-3">
                <img src="/resources/image/FoodTruck/fish&chips.webp" class="img-fluid rounded-start" style="height: 100%;" >
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                    additional content. This content is a little bit longer.</p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
              </div>
            </div>
          </div>
          <div class="card mb-3" id="foodTruckCard" style="" >
            <div class="row g-0">
              <div class="col-md-3">
                <img src="/resources/image/FoodTruck/fish&chips.webp" class="img-fluid rounded-start" style="height: 100%;" >
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                    additional content. This content is a little bit longer.</p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
              </div>
            </div>
          </div>

        </div>
        <!-- 푸드트럭 카드 구역 -->
      </div>
    </div>
    <!-- <div class="footer">
      footer
    </div> -->
  </div>


</body>

<style>
  body {
    margin: 0px;
    margin-bottom: 0px;
  }

  .main {
    width: 100vw;
    height: 100vh;
    background-color: #f5f5f5;
    overflow-y: hidden;
    font-family: 'Noto Sans KR', sans-serif;
  }

  .header {
    width: 100%;
    height: 7%;
    background-color: white;
  }

  #inputSearch {
    position: relative;
    right: 15%;
    font-weight: bold;
  }

  .businessLogin {
    font-weight: bold;
    text-align: center;
    margin: 1.5%;
    position: relative;
    right: 15%;
  }

  .businessLogin:hover {
    color: #1ED760;
    cursor: pointer;
  }

  .content {
    width: 50%;
    height: 93%;
    margin-left: 25%;
    /* background-color: aquamarine; */
  }

  #foodTruckCard {
    width: 100%;
    margin: 2%;
    position: relative;
  }

  /* .footer {
    width: 100%;
    height: 15%;
    background-color: cadetblue;
  } */
</style>

</html>