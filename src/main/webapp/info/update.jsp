<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

// null 체크와 함께 기본값 설정
String id = (String)request.getAttribute("id");
String name = (String)request.getAttribute("name");
String phone1 = (String)request.getAttribute("phone1");
String phone2 = (String)request.getAttribute("phone2");
String phone3 = (String)request.getAttribute("phone3");
String fileName = (String)request.getAttribute("fileName");
String activityType = (String)request.getAttribute("activityType");

// 각 값이 null일 경우 기본값 설정
id = (id == null) ? "" : id;
name = (name == null) ? "" : name;
phone1 = (phone1 == null) ? "010" : phone1;
phone2 = (phone2 == null) ? "" : phone2;
phone3 = (phone3 == null) ? "" : phone3;
fileName = (fileName == null) ? "" : fileName;
activityType = (activityType == null) ? "" : activityType;

System.out.println("update.jsp - 받은 값들:");
System.out.println("id: " + id);
System.out.println("name: " + name);
System.out.println("phone1: " + phone1);
System.out.println("phone2: " + phone2);
System.out.println("phone3: " + phone3);
System.out.println("fileName: " + fileName);
System.out.println("activityType: " + activityType);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<style>
.update-header {
    background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('../resources/images/update-bg.jpg');
    background-size: cover;
    background-position: center;
    padding: 60px 0;
    color: white;
}
.update-form {
    background: white;
    border-radius: 15px;
    padding: 30px;
    box-shadow: 0 0 20px rgba(0,0,0,0.1);
}
.form-control:focus {
    box-shadow: none;
    border-color: #198754;
}
</style>
</head>
<body>
<div class="update-header mb-5">
    <div class="container text-center">
        <h1 class="display-4 fw-bold">회원 정보 수정</h1>
        <p class="lead">회원 정보를 안전하게 수정하실 수 있습니다</p>
    </div>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="update-form">
                <form action="update_ok.jsp" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label class="form-label">아이디</label>
                        <input type="text" class="form-control" name="id" value="<%=id%>" readonly>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">현재 비밀번호</label>
                        <input type="password" class="form-control" name="current_pw" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">새 비밀번호</label>
                        <input type="password" class="form-control" name="new_pw" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">이름</label>
                        <input type="text" class="form-control" name="name" value="<%=name%>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">전화번호</label>
                        <div class="row">
                            <div class="col-3">
                                <select name="phone1" class="form-select">
                                    <option value="010" <%=(phone1.equals("010")) ? "selected" : ""%>>010</option>
                                    <option value="02" <%=(phone1.equals("02")) ? "selected" : ""%>>02</option>
                                    <option value="031" <%=(phone1.equals("031")) ? "selected" : ""%>>031</option>
                                    <option value="051" <%=(phone1.equals("051")) ? "selected" : ""%>>051</option>
                                </select>
                            </div>
                            <div class="col-4">
                                <input type="text" class="form-control" name="phone2" value="<%=phone2%>" required>
                            </div>
                            <div class="col-4">
                                <input type="text" class="form-control" name="phone3" value="<%=phone3%>" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label">대표 사진 (농장 사진)</label>
                        <input type="file" class="form-control" name="m_fileName">
                    </div>
                    
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="bi bi-check-circle"></i> 정보 수정
                        </button>
                        <a href="javascript:history.back()" class="btn btn-secondary">
                            <i class="bi bi-arrow-left"></i> 돌아가기
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