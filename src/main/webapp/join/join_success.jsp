<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("user_id");
String name = (String)session.getAttribute("user_name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<style>
.success-header {
    background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('../resources/images/success-bg.jpg');
    background-size: cover;
    background-position: center;
    height: 100vh;
    display: flex;
    align-items: center;
    color: white;
}
.success-card {
    background: rgba(255, 255, 255, 0.9);
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
                    <i class="bi bi-person-check text-success" style="font-size: 4rem;"></i>
                    <h2 class="mt-4 mb-4">환영합니다!</h2>
                    <p class="lead mb-4"><%=name%>(<%=id%>)님, 신선한 농산물과 함께하세요.</p>
                    <div class="d-grid gap-2">
                        <a href="../mainpage/check_main.jsp" class="btn btn-success btn-lg">
                            <i class="bi bi-house"></i> 메인페이지로
                        </a>
                        <a href="../info/getInfo.jsp" class="btn btn-primary">
                            <i class="bi bi-person-gear"></i> 정보수정
                        </a>
                        <a href="logout.jsp" class="btn btn-danger">
                            <i class="bi bi-box-arrow-right"></i> 로그아웃
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