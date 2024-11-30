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

int size = 10*1024*1024; // 10MB
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
    String sql = "INSERT INTO product_" + seller_id + " (p_id, p_name, p_price, p_description, p_startDate, p_endDate, p_stock, p_fileName) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, p_id);
    pstmt.setString(2, p_name);
    pstmt.setString(3, p_price);
    pstmt.setString(4, p_description);
    pstmt.setString(5, p_startDate);
    pstmt.setString(6, p_endDate);
    pstmt.setInt(7, Integer.parseInt(p_stock));
    pstmt.setString(8, filename);

    pstmt.executeUpdate();

    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();

    response.sendRedirect("seller_myPage.jsp");

} catch(Exception e) {
    e.printStackTrace();
    response.sendRedirect("seller_myPage.jsp");
}
%>