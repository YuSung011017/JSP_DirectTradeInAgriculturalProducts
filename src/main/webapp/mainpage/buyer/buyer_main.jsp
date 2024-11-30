<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../DataBase/dbconn.jsp" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<title>구매자 메인페이지</title>
<style>
.hero-section {
    background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('../../resources/images/marketplace-bg.jpg');
    background-size: cover;
    background-position: center;
    color: white;
    padding: 100px 0;
}
.seller-card {
    transition: transform 0.3s;
}
.seller-card:hover {
    transform: translateY(-5px);
}
.seller-image {
    height: 200px;
    object-fit: cover;
}
</style>
</head>
<body>
<div class="hero-section mb-5">
    <div class="container">
        <div class="text-center">
            <h1 class="display-4 fw-bold"><%=(String)session.getAttribute("user_name")%>님 환영합니다</h1>
            <p class="lead fs-3">오늘도 신선한 농산물과 함께하세요</p>
            <div class="mt-4">
                <a href="../../cart/cart.jsp" class="btn btn-warning btn-lg me-2">
                    <i class="bi bi-cart3"></i> 장바구니
                </a>
                <a href="../../cart/orderList.jsp" class="btn btn-info btn-lg me-2">
                    <i class="bi bi-list-check"></i> 주문내역
                </a>
                <a href="../../login/logout.jsp" class="btn btn-danger btn-lg">
                    <i class="bi bi-door-open"></i> 로그아웃
                </a>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row mb-4">
        <div class="col">
            <h2 class="text-center mb-4">신선한 농산물 판매자</h2>
        </div>
    </div>
    
    <div class="row g-4">
    <%
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM member WHERE m_activityType='seller'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
    %>
        <div class="col-md-4 mb-4">
            <div class="card seller-card h-100 shadow">
                <img src="../../resources/images/<%=rs.getString("m_fileName")%>"
                     class="card-img-top seller-image" 
                     alt="농장 이미지"
                     onerror="this.src='../../resources/images/default-farm.jpg'">
                <div class="card-body">
                    <h5 class="card-title"><%=rs.getString("m_name")%>님의 농장</h5>
                    <p class="card-text">
                        <i class="bi bi-person"></i> 판매자 ID: <%=rs.getString("m_loginId")%><br>
                        <i class="bi bi-telephone"></i> 연락처: <%=rs.getString("m_phone1")%>-<%=rs.getString("m_phone2")%>-<%=rs.getString("m_phone3")%>
                    </p>
                    <a href="../seller/view_products.jsp?seller_id=<%=rs.getString("m_loginId")%>" 
                       class="btn btn-primary w-100">
                        <i class="bi bi-shop"></i> 상품 보기
                    </a>
                </div>
            </div>
        </div>
    <%
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
    %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>