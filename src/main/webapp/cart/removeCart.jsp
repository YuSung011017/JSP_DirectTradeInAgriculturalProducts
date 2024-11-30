<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%
    String productId = request.getParameter("id");
    String sellerId = request.getParameter("seller_id");
    
    if (productId == null || productId.trim().equals("")) {
        response.sendRedirect("cart.jsp");
        return;
    }

    ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
    Product goodsQnt = new Product();
    
    for (int i = 0; i < cartList.size(); i++) {
        goodsQnt = cartList.get(i);
        if (goodsQnt.getProductId().equals(productId) && 
            goodsQnt.getSellerId().equals(sellerId)) {
            cartList.remove(goodsQnt);
        }
    }

    response.sendRedirect("cart.jsp");
%>