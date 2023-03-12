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
						<select class="form-select" aria-label="Default select example">
							<option selected="">광역시도</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div>
					<div class="col-4 m-2">
						<select class="form-select" aria-label="Default select example">
							<option selected="">시/군/구</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div>
					<div class="col-2 m-3 ps-4">
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault1"> <label
								class="form-check-label" for="flexRadioDefault1">영업중</label>
						</div>
					</div>
				</div>
			</div>
			<div class="searchResult w-50 rounded p-5"
				style="background-color: white;">
				<h5 class="">검색 결과</h5>

				<div class="card pointer my-4">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="/resources/image/1234123412/1234123412M00.jpg"
								class="img-fluid rounded-start ratio ratio-4x3" alt="...">
						</div>
						<div class="col-md-8">
							<div class="ps-4 d-flex" style="flex-direction: column;">
								<div class="row fs-4 mb-3">
									<div class="col-9">핫도그라운드</div>
									<div class="col fs-5">
										<i class="bi bi-circle-fill text-danger me-3"
											style="font-size: small;"></i>영업전
									</div>
								</div>
								<h6 class="col mb-3">핫도그</h6>
								<h6 class="mb-3">"무슨무슨 핫도그와 무슨무슨 소스의 만남!"</h6>

								<p>
									<i class="bi bi-telephone text-muted me-1"></i><small
										class="text-muted">010-2345-2325</small>
								</p>
								<p>
									<i class="bi bi-geo-alt text-muted col-1"></i><small
										class="text-muted">인천시 연수구 학익동</small>
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="card pointer my-4">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="/resources/image/1234123412/1234123412M00.jpg"
								class="img-fluid rounded-start ratio ratio-4x3" alt="...">
						</div>
						<div class="col-md-8">
							<div class="ps-4 d-flex" style="flex-direction: column;">
								<div class="row fs-4 mb-3">
									<div class="col-9">핫도그라운드</div>
									<div class="col fs-5">
										<i class="bi bi-circle-fill me-3"
											style="color: #00FF00; font-size: small;"></i>영업중
									</div>
								</div>
								<h6 class="col mb-3">핫도그</h6>
								<h6 class="mb-3">"무슨무슨 핫도그와 무슨무슨 소스의 만남!"</h6>

								<p>
									<i class="bi bi-telephone text-muted me-1"></i><small
										class="text-muted">010-2345-2325</small>
								</p>
								<p>
									<i class="bi bi-geo-alt text-muted col-1"></i><small
										class="text-muted">인천시 연수구 학익동</small>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="card pointer my-4">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="/resources/image/1234123412/1234123412M00.jpg"
								class="img-fluid rounded-start ratio ratio-4x3" alt="...">
						</div>
						<div class="col-md-8">
							<div class="ps-4 d-flex" style="flex-direction: column;">
								<div class="row fs-4 mb-3">
									<div class="col-9">핫도그라운드</div>
									<div class="col fs-5">
										<i class="bi bi-circle-fill me-3"
											style="color: #00FF00; font-size: small;"></i>영업중
									</div>
								</div>
								<h6 class="col mb-3">핫도그</h6>
								<h6 class="mb-3">"무슨무슨 핫도그와 무슨무슨 소스의 만남!"</h6>

								<p>
									<i class="bi bi-telephone text-muted me-1"></i><small
										class="text-muted">010-2345-2325</small>
								</p>
								<p>
									<i class="bi bi-geo-alt text-muted col-1"></i><small
										class="text-muted">인천시 연수구 학익동</small>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="card pointer my-4">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="/resources/image/1234123412/1234123412M00.jpg"
								class="img-fluid rounded-start ratio ratio-4x3" alt="...">
						</div>
						<div class="col-md-8">
							<div class="ps-4 d-flex" style="flex-direction: column;">
								<div class="row fs-4 mb-3">
									<div class="col-9">핫도그라운드</div>
									<div class="col fs-5">
										<i class="bi bi-circle-fill me-3"
											style="color: #00FF00; font-size: small;"></i>영업중
									</div>
								</div>
								<h6 class="col mb-3">핫도그</h6>
								<h6 class="mb-3">"무슨무슨 핫도그와 무슨무슨 소스의 만남!"</h6>

								<p>
									<i class="bi bi-telephone text-muted me-1"></i><small
										class="text-muted">010-2345-2325</small>
								</p>
								<p>
									<i class="bi bi-geo-alt text-muted col-1"></i><small
										class="text-muted">인천시 연수구 학익동</small>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="card pointer my-4">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="/resources/image/1234123412/1234123412M00.jpg"
								class="img-fluid rounded-start ratio ratio-4x3" alt="...">
						</div>
						<div class="col-md-8">
							<div class="ps-4 d-flex" style="flex-direction: column;">
								<div class="row fs-4 mb-3">
									<div class="col-9">핫도그라운드</div>
									<div class="col fs-5">
										<i class="bi bi-circle-fill me-3"
											style="color: #00FF00; font-size: small;"></i>영업중
									</div>
								</div>
								<h6 class="col mb-3">핫도그</h6>
								<h6 class="mb-3">"무슨무슨 핫도그와 무슨무슨 소스의 만남!"</h6>

								<p>
									<i class="bi bi-telephone text-muted me-1"></i><small
										class="text-muted">010-2345-2325</small>
								</p>
								<p>
									<i class="bi bi-geo-alt text-muted col-1"></i><small
										class="text-muted">인천시 연수구 학익동</small>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="card pointer my-4">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="/resources/image/1234123412/1234123412M00.jpg"
								class="img-fluid rounded-start ratio ratio-4x3" alt="...">
						</div>
						<div class="col-md-8">
							<div class="ps-4 d-flex" style="flex-direction: column;">
								<div class="row fs-4 mb-3">
									<div class="col-9">핫도그라운드</div>
									<div class="col fs-5">
										<i class="bi bi-circle-fill me-3"
											style="color: #00FF00; font-size: small;"></i>영업중
									</div>
								</div>
								<h6 class="col mb-3">핫도그</h6>
								<h6 class="mb-3">"무슨무슨 핫도그와 무슨무슨 소스의 만남!"</h6>

								<p>
									<i class="bi bi-telephone text-muted me-1"></i><small
										class="text-muted">010-2345-2325</small>
								</p>
								<p>
									<i class="bi bi-geo-alt text-muted col-1"></i><small
										class="text-muted">인천시 연수구 학익동</small>
								</p>
							</div>
						</div>
					</div>
				</div>
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


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>


</body>
</html>