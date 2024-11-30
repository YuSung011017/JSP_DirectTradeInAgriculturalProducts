<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../DataBase/dbconn.jsp" %>
<%
String id = (String)session.getAttribute("user_id");
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    // 디버깅을 위한 출력
    System.out.println("세션 ID 확인: " + id);
    
    String sql = "SELECT * FROM member WHERE m_loginId=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();
    
    if(rs.next()) {
        // DB에서 가져온 값들을 request에 저장
        request.setAttribute("id", rs.getString("m_loginId"));
        request.setAttribute("name", rs.getString("m_name"));
        request.setAttribute("phone1", rs.getString("m_phone1"));
        request.setAttribute("phone2", rs.getString("m_phone2"));
        request.setAttribute("phone3", rs.getString("m_phone3"));
        request.setAttribute("fileName", rs.getString("m_fileName"));
        request.setAttribute("activityType", rs.getString("m_activityType"));
        
        // 디버깅 출력
        System.out.println("데이터 조회 성공");
        
        request.getRequestDispatcher("update.jsp").forward(request, response);
    } else {
        System.out.println("해당 ID의 사용자 정보가 없음");
        response.sendRedirect("../login/login.jsp");
    }
} catch(Exception e) {
    System.out.println("에러 발생: " + e.getMessage());
    e.printStackTrace();
    response.sendRedirect("../login/login.jsp");
} finally {
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
}
%>