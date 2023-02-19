<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/dashboard/layout/meta_head.jsp"></jsp:include>
</head>

<body class="bg-theme bg-theme1">
<%--<body>--%>
<!-- Start wrapper-->
<div id="wrapper">
    <jsp:include page="/WEB-INF/dashboard/layout/left_bar_and_header_bar.jsp"></jsp:include>
    <!--Start Dashboard Content-->

    <%--      Toast--%>

    <%--     End Toast--%>


    <%--  Form Create --%>

        <div class="row mt-3">
            <div class="col-lg-5" >
                <div class="card">
                    <div class="card-body">
                        <form action="/cart?action=checkout" id="frmCheckout" method="post">
                            <div class="card-title">CHI TIẾT HOÁ ĐƠN</div>
                            <%--          Book(long id, String image, String name, String author, long price, long avaiable, long quantity, Date dateAdd, long idBookType)--%>
                            <div class="form-group">
                                <label for="input-6">Tên khách hàng</label>
                                <input type="text" class="form-control form-control-rounded" id="input-6" placeholder="Nhập tên"
                                       name="name"
                                       value="${requestScope.book.getName()}">
                            </div>
                            <div class="form-group">
                                <label for="input-7">Số điện thoại</label>
                                <input type="text" class="form-control form-control-rounded" id="input-7" placeholder="Nhập số điện thoại"
                                       name="phone"
                                       value="${requestScope.book.getAuthor()}">
                            </div>
                            <div class="form-group">
                                <label for="input-8">Địa chỉ</label>
                                <input type="number" class="form-control form-control-rounded" id="input-8" placeholder="Nhập địa chỉ"
                                       name="address"
                                       value="${requestScope.book.getPrice()}">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="card">
                    <div class="card-body">
                    <div class="card-title">ĐƠN HÀNG CỦA BẠN</div>
                        <div class="table-responsive">
                            <table class="table align-items-center table-flush table-borderless">
                                <thead>
                                <tr class="text-center">
                                    <th>Tên sách</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Tổng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requestScope.orderDTO.getOderItemDTOS()}" var="oderItemDTO">
                                    <tr class="text-center">
                                        <td>${oderItemDTO.getBook().getName()}</td>
                                        <td>${oderItemDTO.getBook().getPrice()}</td>
                                        <td>${oderItemDTO.getQuantity()}</td>
                                        <td>${oderItemDTO.getBook().getPrice()*oderItemDTO.getQuantity()}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <table class="table align-items-center table-flush table-borderless">
                                <tbody>
                                    <tr class="text-center">
                                        <td></td>
                                        <td></td>
                                        <td>TỔNG HOÁ ĐƠN</td>
                                        <td>${requestScope.orderDTO.getTotal()}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-lg-6">
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <button type="button" class="btn btn-light btn-round px-5" onclick="handleBtnCheckout()">Tiến hành thành toán</button>
                    <a href="/cart" class="btn btn-light btn-round px-5">Quay lại giỏ hàng</a>
                </div>
            </div>
        </div>


    <%-- End Form Create --%>

    <!--End Dashboard Content-->

    <jsp:include page="/WEB-INF/dashboard/layout/js_footer.jsp">
        <jsp:param name="page" value="customer"/>
    </jsp:include>

    <%-- My script--%>

        <script>
            function handleBtnCheckout() {
                document.getElementById("frmCheckout").submit();
            }
        </script>
</body>
</html>
