<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<title>상품 상세 정보</title>
<style>
.product-img {
    max-height: 400px;
    object-fit: contain;
}
.detail-section {
    background: #f8f9fa;
    border-radius: 15px;
    padding: 30px;
}
</style>
<script>
    function addToCart() {
        if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
            document.addForm.submit();
        }
    }
</script>
</head>
<body>
<div class="container py-5">
    <%
    String cartMessage = (String) session.getAttribute("cartMessage");
    if (cartMessage != null) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <i class="bi bi-check-circle"></i> <%= cartMessage %>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <%
        session.removeAttribute("cartMessage");
    }
    %>

    <%@ include file="../../DataBase/dbconn.jsp" %>
    <%
    String productId = request.getParameter("id");
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // 모든 테이블에서 상품 ID로 검색
        String findSellerSql = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES " +
                               "WHERE TABLE_SCHEMA = 'agriculturalproductsdb' " +
                               "AND TABLE_NAME LIKE 'product_%'";
        pstmt = conn.prepareStatement(findSellerSql);
        rs = pstmt.executeQuery();
        
        String seller_id = null;
        while (rs.next()) {
            String tableName = rs.getString("TABLE_NAME");
            String checkProductSql = "SELECT * FROM " + tableName + " WHERE p_id = ?";
            PreparedStatement checkPstmt = conn.prepareStatement(checkProductSql);
            checkPstmt.setString(1, productId);
            ResultSet checkRs = checkPstmt.executeQuery();
            
            if (checkRs.next()) {
                seller_id = tableName.replace("product_", "");
                break;
            }
            
            checkRs.close();
            checkPstmt.close();
        }
        
        if (seller_id == null) {
            %>
            <div class="container">
                <div class="alert alert-danger">
                    해당 상품을 찾을 수 없습니다.
                </div>
            </div>
            <%
            return;
        }

        String currentUserId = (String)session.getAttribute("user_id");
        boolean isOwner = seller_id != null && seller_id.equals(currentUserId);
        
        // 해당 판매자의 상품 테이블에서 상품 정보 조회
        String sql = "SELECT * FROM product_" + seller_id + " WHERE p_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productId);
        rs = pstmt.executeQuery();
        
        if (!rs.next()) {
            %>
            <div class="container">
                <div class="alert alert-warning">
                    해당 상품에 대한 상세 정보를 찾을 수 없습니다.
                </div>
            </div>
            <%
            return;
        }
    %>
    <div class="row">
        <div class="col-md-6">
            <img src="../../resources/images/<%=rs.getString("p_fileName")%>" 
                 class="img-fluid product-img rounded shadow">
        </div>
        <div class="col-md-6">
            <div class="detail-section h-100">
                <h2 class="mb-4"><%=rs.getString("p_name")%></h2>
                <div class="mb-4">
                    <h4 class="text-primary"><%=rs.getString("p_price")%>원</h4>
                    <span class="badge bg-success">재고: <%=rs.getInt("p_stock")%>개</span>
                </div>
                
                <p class="lead mb-4"><%=rs.getString("p_description")%></p>
                
                <div class="mb-4">
                    <p><i class="bi bi-calendar3"></i> 재배일: <%=rs.getString("p_startDate")%></p>
                    <p><i class="bi bi-clock"></i> 유통기한: <%=rs.getString("p_endDate")%></p>
                </div>

                <% if (!isOwner) { %>
                    <form name="addForm" action="../../cart/addCart.jsp?id=<%=rs.getString("p_id")%>&seller_id=<%=seller_id%>" 
                          method="post" class="d-grid gap-2">
                        <button type="button" onclick="addToCart()" class="btn btn-primary btn-lg">
                            <i class="bi bi-cart-plus"></i> 장바구니 담기
                        </button>
                        <a href="../../cart/cart.jsp" class="btn btn-warning btn-lg">
                            <i class="bi bi-cart"></i> 장바구니 보기
                        </a>
                    </form>
                <% } %>
                
                <a href="<%= isOwner ? "seller_myPage.jsp" : ("view_products.jsp?seller_id=" + seller_id) %>" 
                   class="btn btn-secondary btn-lg w-100 mt-3">
                    <i class="bi bi-arrow-left"></i> 목록으로 돌아가기
                </a>
            </div>
        </div>
    </div>
    <%
    } catch (Exception e) {
        e.printStackTrace();
        %>
        <div class="container">
            <div class="alert alert-danger">
                오류가 발생했습니다. 다시 시도해주세요.
                <br>오류 메시지: <%= e.getMessage() %>
            </div>
        </div>
        <%
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>