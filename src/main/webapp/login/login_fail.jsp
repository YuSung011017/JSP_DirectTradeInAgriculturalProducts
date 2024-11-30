<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<style>
.fail-header {
    background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('../resources/images/fail-bg.jpg');
    background-size: cover;
    background-position: center;
    height: 100vh;
    display: flex;
    align-items: center;
    color: white;
}
.fail-card {
    background: rgba(255, 255, 255, 0.9);
    border-radius: 15px;
    padding: 40px;
    box-shadow: 0 0 20px rgba(0,0,0,0.1);
}
</style>
</head>
<body>
<div class="fail-header">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="fail-card text-center">
                    <i class="bi bi-exclamation-circle text-warning" style="font-size: 4rem;"></i>
                    <h2 class="mt-4 mb-4">로그인에 실패했습니다</h2>
                    <p class="mb-4">아이디와 비밀번호를 다시 확인해주세요.</p>
                    <div class="d-grid gap-2">
                        <a href="login.jsp" class="btn btn-primary btn-lg">다시 로그인하기</a>
                        <a href="../welcome.jsp" class="btn btn-secondary">메인으로 돌아가기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>