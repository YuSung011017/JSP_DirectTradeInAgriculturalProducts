<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 장바구니 비우기
    session.invalidate();
    response.sendRedirect("cart.jsp");
%>