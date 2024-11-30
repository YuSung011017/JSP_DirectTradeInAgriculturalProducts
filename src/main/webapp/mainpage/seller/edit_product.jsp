<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<title>상품 수정</title>
<style>
.edit-header {
    background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('../../resources/images/edit-product-bg.jpg');
    background-size: cover;
    background-position: center;
    color: white;
    padding: 60px 0;
}
.edit-form {
    background: #fff;
    border-radius: 15px;
    padding: 30px;
    box-shadow: 0 0 20px rgba(0,0,0,0.1);
}
.current-image {
    max-width: 200px;
    border-radius: 10px;
}
</style>
</head>
<body>
<div class="edit-header mb-5">
    <div class="container text-center">
        <h1 class="display-4 fw-bold">상품 정보 수정</h1>
        <p class="lead">상품 정보를 수정해주세요</p>
    </div>
</div>

<div class="container">
    <%@ include file="../../DataBase/dbconn.jsp" %>
    <%
    String productId = request.getParameter("id");
    String seller_id = (String)session.getAttribute("user_id");
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        String sql = "select * from product_" + seller_id + " where p_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productId);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
    %>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="edit-form">
                <form name="newProduct" action="edit_product_process.jsp" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="p_id" value="<%=rs.getString("p_id")%>">
                    
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <h5>현재 상품 이미지</h5>
                            <img src="../../resources/images/<%=rs.getString("p_fileName")%>" 
                                 class="current-image img-fluid mb-3">
                        </div>
                        <div class="col-md-6">
                            <h5>새 이미지 업로드</h5>
                            <input type="file" name="p_fileName" class="form-control">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">상품명</label>
                        <input type="text" name="p_name" class="form-control" 
                               value="<%=rs.getString("p_name")%>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">가격</label>
                        <div class="input-group">
                            <input type="number" name="p_price" class="form-control" 
                                   value="<%=rs.getString("p_price")%>" required>
                            <span class="input-group-text">원</span>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">상품 설명</label>
                        <textarea name="p_description" class="form-control" rows="4" required><%=rs.getString("p_description")%></textarea>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">재배일</label>
                        <input type="date" name="p_startDate" class="form-control" 
                               value="<%=rs.getString("p_startDate")%>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">유통기한</label>
                        <input type="date" name="p_endDate" class="form-control" 
                               value="<%=rs.getString("p_endDate")%>" required>
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label">재고수량</label>
                        <input type="number" name="p_stock" class="form-control" 
                               value="<%=rs.getInt("p_stock")%>" required>
                    </div>
                    
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="bi bi-check-circle"></i> 수정 완료
                        </button>
                        <a href="seller_myPage.jsp" class="btn btn-secondary">
                            <i class="bi bi-arrow-left"></i> 취소
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>