<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../DataBase/dbconn.jsp" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<title>주문 내역</title>
<style>
.order-header {
  background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('../resources/images/order-bg.jpg');
  background-size: cover;
  background-position: center;
  color: white;
  padding: 60px 0;
  position: relative;
}
.back-btn {
  position: absolute;
  top: 20px;
  right: 20px;
}
.order-card {
  transition: transform 0.3s;
}
.order-card:hover {
  transform: translateY(-5px);
}
</style>
</head>
<body>
<div class="order-header mb-5">
  <div class="container text-center">
      <h1 class="display-4 fw-bold">주문 내역</h1>
      <p class="lead">신선한 농산물의 배송 현황을 확인하세요</p>
  </div>
  <div class="back-btn">
      <a href="javascript:history.back()" class="btn btn-outline-light btn-lg">
          <i class="bi bi-arrow-left"></i> 돌아가기
      </a>
  </div>
</div>

<div class="container">
  <div class="card shadow-sm">
      <div class="card-body">
          <div class="table-responsive">
              <table class="table table-hover align-middle">
                  <thead class="table-light">
                      <tr>
                          <th>주문번호</th>
                          <th>상품명</th>
                          <th>판매자</th>
                          <th>배송정보</th>
                          <th>가격</th>
                          <th>주문일자</th>
                          <th>배송일</th>
                      </tr>
                  </thead>
                  <tbody>
                  <%
                      String user_id = (String)session.getAttribute("user_id");
                      PreparedStatement pstmt = null;
                      ResultSet rs = null;
                      
                      try {
                          String sql = "SELECT * FROM orders WHERE customer_id = ? ORDER BY order_date DESC";
                          pstmt = conn.prepareStatement(sql);
                          pstmt.setString(1, user_id);
                          rs = pstmt.executeQuery();
                          
                          while(rs.next()) {
                  %>
                      <tr class="align-middle">
                          <td><%=rs.getString("order_id")%></td>
                          <td><%=rs.getString("product_name")%></td>
                          <td><%=rs.getString("seller_id")%></td>
                          <td>
                              <%=rs.getString("shipping_name")%><br>
                              <%=rs.getString("shipping_zipcode")%><br>
                              <%=rs.getString("shipping_address")%>
                          </td>
                          <td><%=rs.getString("price")%>원</td>
                          <td><%=rs.getTimestamp("order_date")%></td>
                          <td><%=rs.getString("shipping_date")%></td>
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
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>