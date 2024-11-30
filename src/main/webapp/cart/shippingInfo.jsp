<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<title>배송 정보</title>
<style>
.shipping-header {
    background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('../resources/images/shipping-bg.jpg');
    background-size: cover;
    background-position: center;
    color: white;
    padding: 60px 0;
}
.shipping-form {
    background: #fff;
    border-radius: 15px;
    box-shadow: 0 0 20px rgba(0,0,0,0.1);
    padding: 30px;
}
</style>
</head>
<body>
<div class="shipping-header mb-5">
    <div class="container text-center">
        <h1 class="display-4 fw-bold">배송 정보 입력</h1>
        <p class="lead">신선한 농산물을 받으실 주소를 입력해주세요</p>
    </div>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="shipping-form">
                <form action="processOrder.jsp" method="post">
                    <input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>">
                    
                    <div class="mb-4">
                        <label class="form-label">우편번호</label>
                        <div class="input-group">
                            <input type="text" name="zipCode" class="form-control" required>
                            <button type="button" class="btn btn-secondary">우편번호 검색</button>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label">주소</label>
                        <input type="text" name="addressName" class="form-control" required>
                    </div>

                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="bi bi-check-circle"></i> 주문하기
                        </button>
                        <a href="cart.jsp" class="btn btn-secondary">
                            <i class="bi bi-arrow-left"></i> 장바구니로 돌아가기
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>