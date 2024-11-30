<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="dto.Product"%>
<%@ include file="../../DataBase/dbconn.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    String orderId = UUID.randomUUID().toString();
    String customerId = (String)session.getAttribute("user_id");
    String customerName = (String)session.getAttribute("user_name");
    String currentDate = LocalDate.now().toString();
    String shippingZipcode = request.getParameter("zipCode");
    String shippingAddress = request.getParameter("addressName");
    
    ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
    
    PreparedStatement pstmt = null;
    
    try {
        String sql = "INSERT INTO orders (order_id, customer_id, seller_id, product_id, product_name, " +
                    "quantity, price, order_date, shipping_name, shipping_date, shipping_zipcode, shipping_address) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?, ?, ?)";
        
        for(Product product : cartList) {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, orderId);
            pstmt.setString(2, customerId);
            pstmt.setString(3, product.getSellerId());
            pstmt.setString(4, product.getProductId());
            pstmt.setString(5, product.getName());
            pstmt.setInt(6, product.getQuantity());
            pstmt.setString(7, product.getPrice());
            pstmt.setString(8, customerName);
            pstmt.setString(9, currentDate);
            pstmt.setString(10, shippingZipcode);
            pstmt.setString(11, shippingAddress);
            
            pstmt.executeUpdate();
            
            // 재고 업데이트
            sql = "UPDATE product_" + product.getSellerId() + 
                  " SET p_stock = p_stock - ? WHERE p_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, product.getQuantity());
            pstmt.setString(2, product.getProductId());
            pstmt.executeUpdate();
        }
        
        session.removeAttribute("cartlist");
        response.sendRedirect("orderSuccess.jsp");
        
    } catch(Exception e) {
        System.out.println("주문 처리 중 오류 발생: " + e.getMessage());
        e.printStackTrace();
        response.sendRedirect("orderFail.jsp");
    } finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
%>