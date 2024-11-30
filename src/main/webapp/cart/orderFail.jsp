<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<title>주문 실패</title>
<style>
.fail-header {
    background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('../resources/images/fail-bg.jpg');
    background-size: cover;
    background-position: center;
    color: white;
    padding: 100px 0;
}
.fail-icon {
    font-size: 5rem;
    color: #dc3545;
}
</style>
</head>
<body>
<div class="fail-header mb-5">
    <div class="container text-center">
        <i class="bi bi-x-circle fail-icon mb-4"></i>
        <h1 class="display-4 fw-bold">주문 처리 중 오류가 발생했습니다</h1>
        <p class="lead fs-3">죄송합니다. 다시 시도해 주세요.</p>
    </div>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm">
                <div class="card-body text-center p-5">
                    <h2 class="mb-4">주문에 실패했습니다</h2>
                    <p class="lead mb-4">잠시 후 다시 시도해 주시기 바랍니다.</p>
                    <div class="d-grid gap-3 col-6 mx-auto">
                        <a href="cart.jsp" class="btn btn-primary btn-lg">
                            <i class="bi bi-cart"></i> 장바구니로 돌아가기
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