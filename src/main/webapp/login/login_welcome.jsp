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
.welcome-header {
   background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), 
                    url('../resources/images/welcome-bg.jpg');
   background-size: cover;
   background-position: center;
   min-height: 100vh;
   display: flex;
   align-items: center;
}

.welcome-card {
   background: rgba(255, 255, 255, 0.95);
   border: none;
   border-radius: 15px;
   box-shadow: 0 10px 30px rgba(0,0,0,0.1);
   padding: 2rem;
   transition: transform 0.3s ease;
}

.welcome-card:hover {
   transform: translateY(-5px);
}

.btn {
   padding: 12px;
   font-size: 1.1rem;
   margin-bottom: 10px;
   transition: all 0.3s ease;
}

.btn:hover {
   transform: translateY(-2px);
}

.welcome-icon {
   font-size: 3rem;
   color: #198754;
   margin-bottom: 1rem;
}

.user-info {
   background: #f8f9fa;
   padding: 15px;
   border-radius: 10px;
   margin-bottom: 20px;
}
</style>
</head>
<body>
<div class="welcome-header">
   <div class="container">
       <div class="row justify-content-center">
           <div class="col-md-6">
               <div class="welcome-card">
                   <div class="text-center">
                       <i class="bi bi-check-circle-fill welcome-icon"></i>
                       <h2 class="display-6 mb-4">환영합니다</h2>
                       
                       <div class="user-info">
                           <i class="bi bi-person-circle"></i>
                           <p class="h5"><%=name%>(<%=id%>)님 안녕하세요</p>
                       </div>
                       
                       <div class="d-grid gap-3">
                           <a href="../mainpage/check_main.jsp" class="btn btn-primary">
                               <i class="bi bi-house-door"></i> 메인페이지
                           </a>
                           <a href="../info/getInfo.jsp" class="btn btn-success">
                               <i class="bi bi-gear"></i> 정보수정
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
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>