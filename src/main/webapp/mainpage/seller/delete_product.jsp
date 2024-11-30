<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../DataBase/dbconn.jsp" %>
<%
String seller_id = (String)session.getAttribute("user_id");
String productId = request.getParameter("id");

PreparedStatement pstmt = null;

try {
    String sql = "DELETE FROM product_" + seller_id + " WHERE p_id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, productId);
    pstmt.executeUpdate();
    
    response.sendRedirect("seller_myPage.jsp");
} catch(Exception e) {
    e.printStackTrace();
    response.sendRedirect("seller_myPage.jsp");
} finally {
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
}
%>