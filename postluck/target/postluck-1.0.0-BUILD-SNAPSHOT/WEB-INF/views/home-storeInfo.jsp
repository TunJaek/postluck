<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
    <html lang="ko">


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POS.TLUCK</title>
     <link rel="icon" href="/resources/image/fabicon.png">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/mainBootstrap.css">
</head>

<body>
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
    <div id="contetns" style="padding: 2%; overflow-y: scroll; border-radius: 30px;">
        <!-- 가게상세정보 -->
        <div class="storeInfoDetail" style="width: 100%; height: 50%; /*background-color: aqua;*/ margin-bottom: 3%;">
            <div class="storeInfoDetailHeader">
                <h4 style="margin-bottom: 1%;"># 가게상세정보</h4>
                <hr style="border:1px color= silver;">
            </div>
            <div class="storeInfoMiddle" style="width: 40%; height: 80%; background-color: aquamarine;
                         margin-left: 10%; float: left;
                         background-image: url(/resources/image/gamBas.jpg);
                         background-size: cover; border-radius: 20px;">
            </div>
            <div class="storeInfoDetailFooter" style="width: 30%; height: 50%; /*background-color: bisque;*/
                        float: right; margin-top: 3%; margin-right: 13%;">
                <h4># 핫도그라운드</h4><br>
                <h6>카테고리 : 핫도그</h6><br>
                <h6>위치: 대한민국</h6><br>
                <h6>전화번호 : 010-1234-5678</h6><br>
                <h6>영업 일정보기 &nbsp;<svg style="cursor: pointer;" xmlns="http://www.w3.org/2000/svg" width="20"
                        height="20" fill="currentColor" class="bi bi-zoom-in" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                            d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
                        <path
                            d="M10.344 11.742c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1 6.538 6.538 0 0 1-1.398 1.4z" />
                        <path fill-rule="evenodd"
                            d="M6.5 3a.5.5 0 0 1 .5.5V6h2.5a.5.5 0 0 1 0 1H7v2.5a.5.5 0 0 1-1 0V7H3.5a.5.5 0 0 1 0-1H6V3.5a.5.5 0 0 1 .5-.5z" />
                    </svg></h6><br>
            </div>
        </div>
        <!-- 가게상세정보 -->

        <!-- 가게소개 -->
        <div class="storeIntroduction" style="width: 100%; height: 25%; /*background-color: aqua;*/
                    margin-bottom: 3%;">
            <div class="introductionHeader">
                <h4 style=""># 가게소개</h4>
                <hr style=" margin-bottom: 2%; border:1px color= silver;">
            </div>
            <div class="introductionMiddle" style="text-align: center;">
                <h6 style="line-height: 100%;">
                    <p style="line-height: 150%;"> 핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드  핫도그라운드 </p>
                </h6>
            </div>
        </div>
        <!-- 가게소개 -->

        <!-- 대표메뉴 -->
        <div class="storeSignature" style="width: 100%; height: 50%; ">
            <div class="signatureHeader" style="margin-bottom: 1%;">
                <h4 style="margin-bottom: 2%;"># 대표메뉴</h4>
                <hr style=" margin-bottom: 2%; border:1px color= silver;">
            </div>
            <div class="signatureMiddle" style="width: 100%; height: 70%; /*background-color: aqua;*/
                    display: flex;
                    justify-content: space-around;">
                <div class="signaturePictures" style="width: 20%; height: 50%;  
                     margin-top: 1%;    text-align: center;
                    background-image: url(/resources/image/hotdog2.jpg);
                    background-size: cover;">
                    <span style="position: relative; top: 110%;">
                        핫도그<br>
                        1,500원</span>
                </div>
                <div class="signaturePictures" style="width: 20%; height: 50%; margin-top: 1%;
                    text-align: center;
                    background-image: url(/resources/image/hotdog2.jpg);
                    background-size: cover;">
                    <span style="position: relative; top: 110%;">
                        핫도그<br>
                        1,500원</span>
                </div>
                <div class="signaturePictures" style="width: 20%; height: 50%; margin-top: 1%;
                    text-align: center;
                    background-image: url(/resources/image/hotdog2.jpg);
                    background-size: cover;">
                    <span style="position: relative; top: 110%;">
                        핫도그<br>
                        1,500원</span>
                </div>
            </div>

        </div>
        <!-- 대표메뉴 -->

        <!-- 오시는길 -->
        <div class="storeLocate" style="width: 100%; height: 50%; margin-top: -9%;">
            <div class="storeLocateHeader">
                <h4 style="margin-bottom: 2%;"># 오시는 길</h4>
                <hr style=" margin-bottom: 2%; border:1px color= silver;">
            </div>
            <div class="storeInfoMiddle" style="width: 40%; height: 80%; background-color: aquamarine;
                         margin-left: 5%; margin-right: 5%; float: left;
                         background-image: url(/resources/image/map.png);
                         background-size: cover; border-radius: 20px;">

            </div>
            <div class="storeLocateFooter" style="font-size: 20px;">
                <span><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                        class="bi bi-geo-alt" viewBox="0 0 16 16">
                        <path
                            d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
                        <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                    </svg> 서울특별시 성북구 삼선교로 16길 116 </span>
            </div>
        </div>
        <!-- 오시는길 -->
    </div>


    <hr style="border:1px color= silver;" width="20%">
    </div>



</body>
<style>
    body {
        width: 100vw;
        height: 100vh;
        margin: 0px;
        margin-bottom: 0px;
        background-color: #f5f5f5;
        overflow-y: hidden;
        font-family: 'Noto Sans KR', sans-serif;

    }


    .header {
        position: relative;
        height: 7%;
        background-color: #ffffff;
        display: flex;
        align-items: center;
        margin-bottom: 1%;
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

    #contetns {
        width: 50%;
        height: 93%;
        margin-left: 25%;
        margin-right: 25%;
        background-color: #ffffff;
    }
</style>

</html>