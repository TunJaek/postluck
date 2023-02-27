<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <html lang="ko">
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>HOME - POS.TLUCK</title>
     <link rel="icon" href="/resources/image/fabicon.png">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/mainBootstrap.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap" rel="stylesheet">

</head>

<body>

    <div class="header" style="position: fixed; top: 0%;left: 0%; right: 0%;">
        <div
            style="width:70%;height: 100%;margin-left: 15%;display: flex;justify-content: space-between;flex-direction: row;">
            <div style="height: 100%;width: auto;"><img class="logo col" src="/resources/image/indexTextLogo.png"
                    style="height: 100%;float: left;"></div>
            <span class="form-group" style="float: right; width: 50%; margin-top: 1%;">
                <input type="text" class="form-control" placeholder="지역, 메뉴를 검색하세요." id="inputSearch">
            </span>
            <span class="businessLogin">사업자로그인</span>
        </div>
    </div>
    <div class="content">
        <div class="content1">
            <div class="font">
                <div>당신을 위한 </div>
                <div>
                    <p id="location" style="margin: 0; display: inline-block; font-size: 2em">서울</p> 추천 푸드트럭
                </div>
            </div>
        </div>
        <div class="menu border p-3" id="tagText" style="width: 68.8%; height: 8%; border-top-left-radius: 30px;  border-top-right-radius: 30px ; background-color: white; margin-left: 15.6%;
               position: relative; top: 51%; margin-top: 1.5%;">
            <h3> # 현재 영업중인 트럭</h1>
        </div>
        <!-- 트럭리스트 캐러밸 -->
        <div class="container text-center" style="width:80%; background-color: white; border-color: #f5f5f5;">
            <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="10000">
                        <div class="row w-100" style="overflow: hidden; flex-wrap: nowrap; gap: 2%;">
                            <div class="card" style="width: 18rem; ">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text ">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                        <div class="row w-100" style="overflow: hidden; flex-wrap: nowrap; gap: 2%;">
                            <div class="card" style="width: 18rem; ">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text ">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <div class=""></div>
        </div>

        <div class="menu border p-3" id="tagText" style="width: 68.8%; height: 8%; border-top-left-radius: 30px;  border-top-right-radius: 30px ; background-color: white; margin-left: 15.6%;
               position: relative; top: 51%; margin-top: 1.5%;">
            <h3> # 현재 영업중인 트럭</h1>
        </div>
        <div class="container text-center" style="width:80%; background-color: white; border-color: #f5f5f5;">
            <div id="carouselExampleInterval1" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="10000">
                        <div class="row w-100" style="overflow: hidden; flex-wrap: nowrap; gap: 2%;">
                            <div class="card" style="width: 18rem; ">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text ">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                        <div class="row w-100" style="overflow: hidden; flex-wrap: nowrap; gap: 2%;">
                            <div class="card" style="width: 18rem; ">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text ">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img src="/resources/image/FoodTruck/foodtruck.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">핫도그라운드</h5>
                                    <p class="card-text">"핫도그지만 뜨겁지는 않습니다!!"</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval1"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval1"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <div class=""></div>
        </div>
        <div class="footer">footer
        </div>







</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
    integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
    crossorigin="anonymous"></script>

</html>