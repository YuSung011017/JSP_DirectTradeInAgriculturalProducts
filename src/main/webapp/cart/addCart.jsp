<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../DataBase/dbconn.jsp" %>
<%
    String productId = request.getParameter("id");
    String sellerId = request.getParameter("seller_id");
    
    if (productId == null || productId.trim().equals("")) {
        response.sendRedirect("../../seller/view_products.jsp?seller_id=" + sellerId);
        return;
    }

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from product_" + sellerId + " where p_id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, productId);
    rs = pstmt.executeQuery();

    if(rs.next()) {
        Product product = new Product();
        product.setProductId(rs.getString("p_id"));
        product.setName(rs.getString("p_name"));
        product.setPrice(rs.getString("p_price"));
        product.setDescription(rs.getString("p_description"));
        product.setStartDate(rs.getString("p_startDate"));
        product.setEndDate(rs.getString("p_endDate"));
        product.setStock(rs.getInt("p_stock"));
        product.setFileName(rs.getString("p_fileName"));
        product.setSellerId(sellerId);

        ArrayList<Product> cartlist = (ArrayList<Product>) session.getAttribute("cartlist");
        if (cartlist == null) {
            cartlist = new ArrayList<Product>();
            session.setAttribute("cartlist", cartlist);
        }

        int cnt = 0;
        Product productQnt = new Product();
        for (int i = 0; i < cartlist.size(); i++) {
            productQnt = cartlist.get(i);
            if (productQnt.getProductId().equals(productId) && 
                productQnt.getSellerId().equals(sellerId)) {
                cnt++;
                int orderQuantity = productQnt.getQuantity() + 1;
                productQnt.setQuantity(orderQuantity);
            }
        }

        if (cnt == 0) {
            product.setQuantity(1);
            cartlist.add(product);
        }
    }

    if (rs != null) rs.close();
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
    
 // 알림 메시지를 세션에 저장
    session.setAttribute("cartMessage", "상품이 장바구니에 담겼습니다.");

    response.sendRedirect("../mainpage/seller/product_detail.jsp?id=" + productId + "&seller_id=" + sellerId);
%>