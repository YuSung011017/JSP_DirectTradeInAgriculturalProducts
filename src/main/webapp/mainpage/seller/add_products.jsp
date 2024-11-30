<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/add_products.css">
<title>새 상품 등록</title>
</head>
<body>
<div class="add-header mb-5">
    <div class="container text-center">
        <h1 class="display-4 fw-bold">새 상품 등록</h1>
        <p class="lead">신선한 농산물을 등록해주세요</p>
    </div>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="product-form">
                <form action="add_products_process.jsp" method="post" enctype="multipart/form-data" onsubmit="return validateProductForm()">
                    <div class="mb-3">
                        <label class="form-label">상품 ID</label>
                        <input type="text" name="p_id" class="form-control" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">상품명</label>
                        <input type="text" name="p_name" class="form-control" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">가격</label>
                        <div class="input-group">
                            <input type="number" name="p_price" class="form-control" required>
                            <span class="input-group-text">원</span>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">상품 설명</label>
                        <textarea name="p_description" class="form-control" rows="4" required></textarea>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">재배일</label>
                        <input type="date" name="p_startDate" class="form-control" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">유통기한</label>
                        <input type="date" name="p_endDate" class="form-control" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">재고수량</label>
                        <input type="number" name="p_stock" class="form-control" required>
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label">상품 이미지</label>
                        <input type="file" name="p_fileName" class="form-control" required>
                    </div>
                    
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="bi bi-plus-circle"></i> 상품 등록
                        </button>
                        <a href="seller_myPage.jsp" class="btn btn-secondary">
                            <i class="bi bi-arrow-left"></i> 돌아가기
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="../../resources/js/productValidation.js"></script>
</body>
</html>