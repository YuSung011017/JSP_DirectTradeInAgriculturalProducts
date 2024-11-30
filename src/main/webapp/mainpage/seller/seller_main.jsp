<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../DataBase/dbconn.jsp" %>
<%
String id = (String)session.getAttribute("user_id");
String name = (String)session.getAttribute("user_name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<title>판매자 메인페이지</title>
<style>
.hero-banner {
    background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('../../resources/images/farm-fields.jpg');
    background-size: cover;
    background-position: center;
    color: white;
    padding: 100px 0;
}
.stats-card {
    border: none;
    border-radius: 15px;
    transition: transform 0.3s;
}
.stats-card:hover {
    transform: translateY(-5px);
}
</style>
</head>
<body>
<div class="container-fluid p-0">
    <div class="hero-banner mb-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <h1 class="display-4 fw-bold"><%=name%>님의 농장</h1>
                    <p class="lead fs-3">오늘도 신선한 농산물로 고객과 만나보세요</p>
                    <div class="mt-4">
                        <a href="../../cart/orderList.jsp" class="btn btn-warning btn-lg me-2">
                            <i class="bi bi-list-check"></i> 주문관리
                        </a>
                        <a href="seller_myPage.jsp" class="btn btn-success btn-lg me-2">
                            <i class="bi bi-box-seam"></i> 상품관리
                        </a>
                        <a href="../../login/logout.jsp" class="btn btn-danger btn-lg">
                            <i class="bi bi-door-open"></i> 로그아웃
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container mb-5">
        <div class="row g-4">
            <%
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                // 총 상품 수 조회
                String countSql = "SELECT COUNT(*) as total FROM product_" + id;
                pstmt = conn.prepareStatement(countSql);
                rs = pstmt.executeQuery();
                int totalProducts = 0;
                if(rs.next()) {
                    totalProducts = rs.getInt("total");
                }
            %>
            <div class="col-md-4">
                <div class="card stats-card bg-primary text-white">
                    <div class="card-body text-center">
                        <i class="bi bi-box-seam fs-1"></i>
                        <h3 class="mt-3">총 상품 수</h3>
                        <h2 class="display-4"><%=totalProducts%></h2>
                    </div>
                </div>
            </div>
            <%
                // 총 주문 수 조회
                String orderSql = "SELECT COUNT(*) as total FROM orders WHERE seller_id = ?";
                pstmt = conn.prepareStatement(orderSql);
                pstmt.setString(1, id);
                rs = pstmt.executeQuery();
                int totalOrders = 0;
                if(rs.next()) {
                    totalOrders = rs.getInt("total");
                }
            %>
            <div class="col-md-4">
                <div class="card stats-card bg-success text-white">
                    <div class="card-body text-center">
                        <i class="bi bi-cart-check fs-1"></i>
                        <h3 class="mt-3">총 주문 수</h3>
                        <h2 class="display-4"><%=totalOrders%></h2>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card stats-card bg-warning text-white">
                    <div class="card-body text-center">
                        <i class="bi bi-graph-up fs-1"></i>
                        <h3 class="mt-3">오늘의 할일</h3>
                        <h2 class="display-4"><%=totalOrders > 0 ? "배송준비" : "상품등록"%></h2>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="mt-5">
            <h3 class="mb-4">최근 주문 내역</h3>
            <table class="table table-hover">
                <thead class="table-light">
                    <tr>
                        <th>주문번호</th>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>주문일자</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    String recentOrdersSql = "SELECT * FROM orders WHERE seller_id = ? ORDER BY order_date DESC LIMIT 5";
                    pstmt = conn.prepareStatement(recentOrdersSql);
                    pstmt.setString(1, id);
                    rs = pstmt.executeQuery();
                    
                    while(rs.next()) {
                %>
                    <tr>
                        <td><%=rs.getString("order_id")%></td>
                        <td><%=rs.getString("product_name")%></td>
                        <td><%=rs.getInt("quantity")%></td>
                        <td><%=rs.getTimestamp("order_date")%></td>
                        <td><span class="badge bg-info">배송준비중</span></td>
                    </tr>
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
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>