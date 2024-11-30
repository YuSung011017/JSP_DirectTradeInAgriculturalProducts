<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../DataBase/dbconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

// 폼에서 전송된 데이터 받기
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String fileName = request.getParameter("m_fileName");
String activityType = request.getParameter("ActivityType");

PreparedStatement pstmt = null;
Statement stmt = null;

String sql = "INSERT INTO member (m_loginId, m_password, m_name, m_phone1, m_phone2, m_phone3, m_fileName, m_activityType) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

try {
   System.out.println("회원가입 시작 - ID: " + id + ", ActivityType: " + activityType);

   // member 테이블에 사용자 정보 삽입
   pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, id);
   pstmt.setString(2, pw);
   pstmt.setString(3, name);
   pstmt.setString(4, phone1);
   pstmt.setString(5, phone2);
   pstmt.setString(6, phone3);
   pstmt.setString(7, fileName);
   pstmt.setString(8, activityType);

   int result = pstmt.executeUpdate();
   System.out.println("회원 정보 삽입 결과: " + result);

   if(result == 1 && activityType.equals("seller")) {
       System.out.println("판매자 테이블 생성 시작");
       
       try {
           String dropSQL = "DROP TABLE IF EXISTS product_" + id;
           stmt = conn.createStatement();
           stmt.executeUpdate(dropSQL);
       } catch(Exception ex) {
           System.out.println("기존 테이블 삭제 중 예외: " + ex.getMessage());
       }

       String createTableSQL = "CREATE TABLE product_" + id + "("
           + "p_id VARCHAR(10) NOT NULL,"
           + "p_name VARCHAR(20),"
           + "p_price VARCHAR(20),"
           + "p_description VARCHAR(50),"
           + "p_startDate VARCHAR(20),"
           + "p_endDate VARCHAR(20),"
           + "p_stock INTEGER,"
           + "p_fileName VARCHAR(20),"
           + "PRIMARY KEY (p_id)"
           + ")";

       System.out.println("생성할 테이블 SQL: " + createTableSQL);
       
       stmt = conn.createStatement();
       stmt.executeUpdate(createTableSQL);
       System.out.println("판매자 테이블 생성 완료");

       response.sendRedirect("join_success.jsp");
   } else if(result == 1) {
       System.out.println("일반 회원가입 완료");
       response.sendRedirect("join_success.jsp");
   } else {
       System.out.println("회원가입 실패");
       response.sendRedirect("join_fail.jsp");
   }

} catch(Exception e) {
   System.out.println("예외 발생: " + e.getMessage());
   e.printStackTrace();
   response.sendRedirect("join_fail.jsp");
} finally {
   if(stmt != null) stmt.close();
   if(pstmt != null) pstmt.close();
   if(conn != null) conn.close();
}
%>