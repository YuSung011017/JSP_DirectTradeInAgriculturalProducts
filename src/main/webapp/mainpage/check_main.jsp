<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../DataBase/dbconn.jsp" %>
<%
String id = (String)session.getAttribute("user_id");
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    String sql = "SELECT m_activityType FROM member WHERE m_loginId = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();
    
    if(rs.next()) {
        String activityType = rs.getString("m_activityType");
        if(activityType.equals("seller")) {
            response.sendRedirect("seller/seller_main.jsp");
        } else {
            response.sendRedirect("buyer/buyer_main.jsp");
        }
    }
} catch(Exception e) {
    e.printStackTrace();
    response.sendRedirect("login.jsp");
} finally {
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
}
%>