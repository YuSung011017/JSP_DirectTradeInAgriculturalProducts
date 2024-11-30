<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>신선한 농산물 직거래 마켓</title>
<style>
.hero-section {
    background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('../resources/images/farm-background.jpg');
    background-size: cover;
    background-position: center;
    height: 600px;
    color: white;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
}
.feature-card {
    transition: transform 0.3s;
}
.feature-card:hover {
    transform: translateY(-10px);
}
</style>
</head>
<body>
<div class="hero-section d-flex align-items-center">
    <div class="container text-center">
        <h1 class="display-2 fw-bold mb-4">신선한 농산물을 직거래로</h1>
        <p class="lead fs-3 mb-4">농장에서 식탁까지, 신선한 농산물을 합리적인 가격으로</p>
        <div class="mt-5">
            <a href="../login/login.jsp" class="btn btn-primary btn-lg px-5 py-3 me-3">로그인</a>
            <a href="../join/join.jsp" class="btn btn-success btn-lg px-5 py-3">회원가입</a>
        </div>
    </div>
</div>

<div class="container py-5">
    <h2 class="text-center mb-5">우리 서비스의 특징</h2>
    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card h-100 feature-card border-0 shadow">
                <img src="../resources/images/fresh-vegetables.jpg" class="card-img-top" height="250" style="object-fit: cover;">
                <div class="card-body text-center">
                    <h3 class="card-title">신선한 농산물</h3>
                    <p class="card-text">농장에서 직접 수확한 신선한 농산물을 만나보세요</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card h-100 feature-card border-0 shadow">
                <img src="../resources/images/farmer.jpg" class="card-img-top" height="250" style="object-fit: cover;">
                <div class="card-body text-center">
                    <h3 class="card-title">믿을 수 있는 농부</h3>
                    <p class="card-text">검증된 농부님들이 정성껏 재배한 농산물</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card h-100 feature-card border-0 shadow">
                <img src="../resources/images/delivery.jpg" class="card-img-top" height="250" style="object-fit: cover;">
                <div class="card-body text-center">
                    <h3 class="card-title">빠른 배송</h3>
                    <p class="card-text">수확 즉시 배송으로 더욱 신선하게</p>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="bg-dark text-white py-4 mt-5">
    <div class="container text-center">
        <p class="mb-0">© 2024 농산물 직거래 마켓. All rights reserved.</p>
    </div>
</footer>
</body>
</html>