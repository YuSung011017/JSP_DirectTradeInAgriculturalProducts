<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../DataBase/dbconn.jsp" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<title>판매자 상품 목록</title>
<style>
.products-header {
    background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('../../resources/images/fresh-produce-bg.jpg');
    background-size: cover;
    background-position: center;
    color: white;
    padding: 60px 0;
}
.product-card {
    transition: transform 0.3s;
    border: none;
    border-radius: 15px;
    overflow: hidden;
}
.product-card:hover {
    transform: translateY(-5px);
}
.product-img {
    height: 250px;
    object-fit: cover;
}
</style>
</head>
<body>
<div class="products-header mb-5">
    <div class="container text-center">
        <%
        String seller_id = request.getParameter("seller_id");
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sellerSql = "SELECT m_name FROM member WHERE m_loginId = ?";
            pstmt = conn.prepareStatement(sellerSql);
            pstmt.setString(1, seller_id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                String sellerName = rs.getString("m_name");
        %>
        <h1 class="display-4 fw-bold"><%=sellerName%>님의 신선 농산물</h1>
        <p class="lead">정성껏 재배한 농산물을 만나보세요</p>
        <%
            }
        %>
    </div>
</div>

<div class="container">
    <div class="row g-4">
        <%
            String productSql = "SELECT * FROM product_" + seller_id;
            pstmt = conn.prepareStatement(productSql);
            rs = pstmt.executeQuery();

            while(rs.next()) {
        %>
        <div class="col-md-4">
            <div class="card product-card shadow">
                <img src="../../resources/images/<%=rs.getString("p_fileName")%>" 
                     class="product-img" alt="상품 이미지">
                <div class="card-body">
                    <h5 class="card-title"><%=rs.getString("p_name")%></h5>
                    <p class="card-text"><%=rs.getString("p_description")%></p>
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <span class="text-muted small">재배일: <%=rs.getString("p_startDate")%></span><br>
                            <span class="text-muted small">유통기한: <%=rs.getString("p_endDate")%></span>
                        </div>
                        <h4 class="text-primary mb-0"><%=rs.getString("p_price")%>원</h4>
                    </div>
                    <hr>
                    <div class="d-grid">
                        <a href="product_detail.jsp?id=<%=rs.getString("p_id")%>&seller_id=<%=seller_id%>" 
                           class="btn btn-primary">
                            <i class="bi bi-cart-plus"></i> 상품 상세보기
                        </a>
                    </div>
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
    
    <div class="text-center mt-5">
        <a href="seller_main.jsp" class="btn btn-secondary btn-lg">
            <i class="bi bi-house"></i> 메인으로 돌아가기
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>