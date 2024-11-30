<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../DataBase/dbconn.jsp" %>
<%
String seller_id = (String)session.getAttribute("user_id");
String seller_name = (String)session.getAttribute("user_name");
PreparedStatement pstmt = null;
ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" />
<title>판매 상품 관리</title>
</head>
<body>
<div class="container py-4">
   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
       <div class="container-fluid py-5">
           <div class="d-flex justify-content-between align-items-center">
               <div>
                   <h1 class="display-5 fw-bold"><%=seller_name%>님의 판매 상품 관리</h1>
                   <p class="col-md-8 fs-4">등록된 상품 목록</p>
               </div>
               <div>
                   <a href="add_products.jsp" class="btn btn-primary">상품 추가하기</a>
                   <a href="../../cart/orderList.jsp" class="btn btn-info">주문내역 조회</a>
                   <a href="seller_main.jsp" class="btn btn-secondary">메인페이지</a>
               </div>
           </div>
       </div>
   </div>

   <div class="row align-items-md-stretch text-center">
       <%
       try {
           String sql = "SELECT * FROM product_" + seller_id;
           pstmt = conn.prepareStatement(sql);
           rs = pstmt.executeQuery();

           while(rs.next()) {
       %>
       <div class="col-md-4">
           <div class="h-100 p-2">
               <% if(rs.getString("p_fileName") != null) { %>
                   <img src="../../resources/images/<%=rs.getString("p_fileName")%>" 
                        style="width: 250; height:350" />
               <% } %>
               <h5><%=rs.getString("p_name")%></h5>
               <p><%=rs.getString("p_description").length() > 60 ? 
                    rs.getString("p_description").substring(0,60) + "..." : 
                    rs.getString("p_description")%>
               <br>재배일: <%=rs.getString("p_startDate")%> | 
                  유통기한: <%=rs.getString("p_endDate")%>
               <p><%=rs.getString("p_price")%> 원
               <p>재고: <%=rs.getInt("p_stock")%>개
               <p>
                   <a href="product_detail.jsp?id=<%=rs.getString("p_id")%>" 
                      class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
                   <a href="edit_product.jsp?id=<%=rs.getString("p_id")%>" 
                      class="btn btn-primary" role="button">수정 &raquo;</a>
               </p>
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

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>