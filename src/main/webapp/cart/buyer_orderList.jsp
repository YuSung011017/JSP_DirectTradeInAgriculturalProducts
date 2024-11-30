<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../DataBase/dbconn.jsp" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>구매 내역</title>
</head>
<body>
<div class="container py-4">
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">구매 내역</h1>
        </div>
    </div>

    <div class="row">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>주문번호</th>
                    <th>상품명</th>
                    <th>판매자</th>
                    <th>수량</th>
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
                <tr>
                    <td><%=rs.getString("order_id")%></td>
                    <td><%=rs.getString("product_name")%></td>
                    <td><%=rs.getString("seller_id")%></td>
                    <td><%=rs.getInt("quantity")%></td>
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
    
    <div class="text-end mb-3">
        <a href="../mainpage/buyer/buyer_main.jsp" class="btn btn-secondary">메인으로</a>
    </div>
</div>
</body>
</html>