<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<title>주문 완료</title>
<style>
.success-header {
    background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('../resources/images/success-bg.jpg');
    background-size: cover;
    background-position: center;
    color: white;
    padding: 100px 0;
}
.success-icon {
    font-size: 5rem;
    color: #28a745;
}
</style>
</head>
<body>
<div class="success-header mb-5">
    <div class="container text-center">
        <i class="bi bi-check-circle success-icon mb-4"></i>
        <h1 class="display-4 fw-bold">주문이 완료되었습니다!</h1>
        <p class="lead fs-3">신선한 농산물이 곧 배송됩니다</p>
    </div>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm">
                <div class="card-body text-center p-5">
                    <h2 class="mb-4">주문해 주셔서 감사합니다</h2>
                    <p class="lead mb-4">주문하신 상품은 신선도 유지를 위해 최대한 빠르게 배송해 드리겠습니다.</p>
                    <div class="d-grid gap-3 col-6 mx-auto">
                        <a href="orderList.jsp" class="btn btn-primary btn-lg">
                            <i class="bi bi-list-check"></i> 주문 내역 확인
                        </a>
                        <a href="../login/login_welcome.jsp" class="btn btn-secondary btn-lg">
                            <i class="bi bi-house"></i> 메인으로
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>