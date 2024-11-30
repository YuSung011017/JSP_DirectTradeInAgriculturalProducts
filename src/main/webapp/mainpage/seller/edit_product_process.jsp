<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.io.File"%>
<%@ include file="../../DataBase/dbconn.jsp" %>
<%
String seller_id = (String)session.getAttribute("user_id");
String uploadPath = request.getServletContext().getRealPath("/resources/images");
File uploadDir = new File(uploadPath);
if (!uploadDir.exists()) {
    uploadDir.mkdirs();
}

int size = 10*1024*1024;
String filename = "";

try {
    MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());

    String p_id = multi.getParameter("p_id");
    String p_name = multi.getParameter("p_name");
    String p_price = multi.getParameter("p_price");
    String p_description = multi.getParameter("p_description");
    String p_startDate = multi.getParameter("p_startDate");
    String p_endDate = multi.getParameter("p_endDate");
    String p_stock = multi.getParameter("p_stock");
    filename = multi.getFilesystemName("p_fileName");

    PreparedStatement pstmt = null;
    String sql = "UPDATE product_" + seller_id + " SET p_name=?, p_price=?, p_description=?, p_startDate=?, p_endDate=?, p_stock=?";
    
    if(filename != null) {
        sql += ", p_fileName=?";
    }
    sql += " WHERE p_id=?";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, p_name);
    pstmt.setString(2, p_price);
    pstmt.setString(3, p_description);
    pstmt.setString(4, p_startDate);
    pstmt.setString(5, p_endDate);
    pstmt.setInt(6, Integer.parseInt(p_stock));
    
    if(filename != null) {
        pstmt.setString(7, filename);
        pstmt.setString(8, p_id);
    } else {
        pstmt.setString(7, p_id);
    }

    pstmt.executeUpdate();

    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();

    response.sendRedirect("seller_myPage.jsp");

} catch(Exception e) {
    e.printStackTrace();
    response.sendRedirect("seller_myPage.jsp");
}
%>