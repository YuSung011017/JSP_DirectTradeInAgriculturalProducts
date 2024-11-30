<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../DataBase/dbconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String currentPw = request.getParameter("current_pw");
String newPw = request.getParameter("new_pw");
String name = request.getParameter("name");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String fileName = request.getParameter("fileName");
String activityType = request.getParameter("ActivityType");

ResultSet rs = null;
PreparedStatement pstmt = null;

try {
    // 먼저 해당 사용자의 정보를 확인
    String checkSql = "SELECT m_loginId, m_password FROM member WHERE m_loginId=?";
    pstmt = conn.prepareStatement(checkSql);
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();
    
    if(rs.next()) {
        String rId = rs.getString("m_loginId");
        String rPasswd = rs.getString("m_password");
        
        if(id.equals(rId) && currentPw.equals(rPasswd)) {
            // 비밀번호가 일치하면 정보 업데이트
            String updateSql = "UPDATE member SET m_password=?, m_name=?, m_phone1=?, " +
                             "m_phone2=?, m_phone3=?, m_fileName=? WHERE m_loginId=?";
            pstmt = conn.prepareStatement(updateSql);
            
            pstmt.setString(1, newPw);  // 새 비밀번호로 업데이트
            pstmt.setString(2, name);
            pstmt.setString(3, phone1);
            pstmt.setString(4, phone2);
            pstmt.setString(5, phone3);
            pstmt.setString(6, fileName);
            pstmt.setString(7, id);
            
            int result = pstmt.executeUpdate();
            
            if(result == 1) {
                session.setAttribute("m_name", name);
                response.sendRedirect("update_success.jsp");
            } else {
                response.sendRedirect("update_fail.jsp");
            }
        } else {
            response.sendRedirect("update_fail.jsp");
        }
    } else {
        response.sendRedirect("update_fail.jsp");
    }
} catch(SQLException ex) {
    ex.printStackTrace();
    response.sendRedirect("update_fail.jsp");
} finally {
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
}
%>