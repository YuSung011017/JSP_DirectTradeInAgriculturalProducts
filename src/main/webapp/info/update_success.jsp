<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 완료</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<style>
.success-header {
    background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('../resources/images/success-bg.jpg');
    background-size: cover;
    background-position: center;
    min-height: 100vh;
    display: flex;
    align-items: center;
}
.success-card {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 15px;
    padding: 40px;
    box-shadow: 0 0 20px rgba(0,0,0,0.1);
}
</style>
</head>
<body>
<div class="success-header">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="success-card text-center">
                    <i class="bi bi-check-circle-fill text-success" style="font-size: 4rem;"></i>
                    <h2 class="mt-4 mb-4">정보가 성공적으로 업데이트되었습니다!</h2>
                    <p class="lead mb-4">변경된 정보가 적용되었습니다.</p>
                    <div class="d-grid gap-2">
                        <a href="../mainpage/check_main.jsp" class="btn btn-success btn-lg">
                            <i class="bi bi-house"></i> 메인페이지로
                        </a>
                        <a href="javascript:history.back()" class="btn btn-secondary">
                            <i class="bi bi-arrow-left"></i> 돌아가기
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