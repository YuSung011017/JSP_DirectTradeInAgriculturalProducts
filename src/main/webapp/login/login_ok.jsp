<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../DataBase/dbconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");

PreparedStatement pstmt = null;
ResultSet rs = null;

// member 테이블에서 로그인 체크
String sql = "SELECT * FROM member WHERE m_loginId = ? AND m_password = ?";

try {
    // pstmt 생성
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, pw);

    // sql실행
    rs = pstmt.executeQuery();

    if(rs.next()) { // 로그인 성공
        id = rs.getString("m_loginId");
        String name = rs.getString("m_name");

        // 세션에 사용자 정보 저장
        session.setAttribute("user_id", id);
        session.setAttribute("user_name", name);

        response.sendRedirect("login_welcome.jsp");
    } else { // 로그인 실패
        response.sendRedirect("login_fail.jsp");
    }
} catch(Exception e) {
    e.printStackTrace();
    response.sendRedirect("login.jsp");
} finally {
    try {
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
}
%>