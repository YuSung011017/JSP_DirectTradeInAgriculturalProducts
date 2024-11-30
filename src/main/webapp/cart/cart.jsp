<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<title>장바구니</title>
<style>
.cart-header {
    background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('../resources/images/cart-bg.jpg');
    background-size: cover;
    background-position: center;
    color: white;
    padding: 60px 0;
}
.product-img {
    width: 80px;
    height: 80px;
    object-fit: cover;
    border-radius: 8px;
}
</style>
</head>
<body>
<div class="cart-header mb-5">
    <div class="container text-center">
        <h1 class="display-4 fw-bold">장바구니</h1>
        <p class="lead">신선한 농산물을 담아보세요</p>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3><i class="bi bi-cart3"></i> 장바구니 목록</h3>
                <a href="deleteCart.jsp?cartId=<%=session.getId()%>" class="btn btn-danger">
                    <i class="bi bi-trash"></i> 장바구니 비우기
                </a>
            </div>

            <div class="card shadow-sm">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>상품</th>
                                    <th>판매자</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>소계</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                int sum = 0;
                                ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
                                if (cartList == null) cartList = new ArrayList<Product>();
                                
                                for (int i = 0; i < cartList.size(); i++) {
                                    Product product = cartList.get(i);
                                    int total = Integer.parseInt(product.getPrice()) * product.getQuantity();
                                    sum += total;
                            %>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img src="../resources/images/<%=product.getFileName()%>" class="product-img me-3">
                                            <span><%=product.getName()%></span>
                                        </div>
                                    </td>
                                    <td><%=product.getSellerId()%></td>
                                    <td><%=product.getPrice()%>원</td>
                                    <td><%=product.getQuantity()%></td>
                                    <td><%=total%>원</td>
                                    <td>
                                        <a href="removeCart.jsp?id=<%=product.getProductId()%>&seller_id=<%=product.getSellerId()%>" 
                                           class="btn btn-sm btn-outline-danger">
                                            <i class="bi bi-trash"></i> 삭제
                                        </a>
                                    </td>
                                </tr>
                            <%
                                }
                            %>
                            </tbody>
                            <tfoot class="table-light">
                                <tr>
                                    <td colspan="4" class="text-end"><strong>총액</strong></td>
                                    <td><strong><%=sum%>원</strong></td>
                                    <td></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-between mt-4">
                <a href="../login/login_welcome.jsp" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> 계속 쇼핑하기
                </a>
                <a href="shippingInfo.jsp?cartId=<%=session.getId()%>" class="btn btn-success btn-lg">
                    <i class="bi bi-check-circle"></i> 주문하기
                </a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>