<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<title><fmt:message key="join" /></title>
<style>
.join-container {
    background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('../resources/images/farm-login-bg.jpg');
    background-size: cover;
    background-position: center;
    min-height: 100vh;
    padding: 50px 0;
}
.join-card {
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    border-radius: 15px;
    padding: 40px;
    box-shadow: 0 0 20px rgba(0,0,0,0.1);
}
</style>
</head>
<body>
<%
    String language = request.getParameter("language");
    if (language == null || language.isEmpty()) {
        language = (String)session.getAttribute("language");
        if (language == null || language.isEmpty()) {
            language = request.getLocale().getLanguage();
        }
    }
    session.setAttribute("language", language);
%>
<fmt:setLocale value="<%= language %>" />
<fmt:setBundle basename="bundle.message" var="msg" />

<div class="join-container">
    <div class="container">
        <div class="text-end mb-3">
            <a href="?language=ko" class="text-white">한국어</a> | <a href="?language=en" class="text-white">English</a>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="join-card">
                    <h2 class="text-center mb-4"><fmt:message key="join" bundle="${msg}" /></h2>
                    <form action="join_ok.jsp" method="post">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="user-id" class="form-label"><fmt:message key="Id" bundle="${msg}" /></label>
                                <input type="text" id="user-id" name="id" class="form-control" required autocomplete="username">
                            </div>
                            <div class="col-md-6">
                                <label for="user-pw" class="form-label"><fmt:message key="passWd" bundle="${msg}" /></label>
                                <input type="password" id="user-pw" name="pw" class="form-control" required autocomplete="current-password">
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="user-name" class="form-label"><fmt:message key="name" bundle="${msg}" /></label>
                                <input type="text" id="user-name" name="name" class="form-control" required autocomplete="name">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label"><fmt:message key="ActivateType" bundle="${msg}" /></label>
                                <div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="ActivityType" id="seller" value="seller" checked>
                                        <label class="form-check-label" for="seller"><fmt:message key="seller" bundle="${msg}" /></label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="ActivityType" id="buyer" value="buyer">
                                        <label class="form-check-label" for="buyer"><fmt:message key="buyer" bundle="${msg}" /></label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label"><fmt:message key="phoneNumber" bundle="${msg}" /></label>
                            <div class="row">
                                <div class="col-md-4">
                                    <select name="phone1" class="form-select" autocomplete="tel-area-code">
                                        <option value="010">010</option>
                                        <option value="02">02</option>
                                        <option value="031">031</option>
                                        <option value="051">051</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" name="phone2" class="form-control" required autocomplete="tel-local-prefix">
                                </div>
                                <div class="col-md-4">
                                    <input type="text" name="phone3" class="form-control" required autocomplete="tel-local-suffix">
                                </div>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="profile-image" class="form-label"><fmt:message key="profileImage" bundle="${msg}" /></label>
                            <input type="file" id="profile-image" name="m_fileName" class="form-control">
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-lg"><fmt:message key="join" bundle="${msg}" /></button>
                            <a href="../login/login.jsp" class="btn btn-success btn-lg"><fmt:message key="toLoginPage" bundle="${msg}" /></a>
                            <a href="../welcom/welcome.jsp" class="btn btn-secondary"><fmt:message key="toMainPage" bundle="${msg}" /></a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>