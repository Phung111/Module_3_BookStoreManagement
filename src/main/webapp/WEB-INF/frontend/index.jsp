<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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

    <%-- Toast thông báo xoá thành công           --%>
    <c:if test="${requestScope.message == 'editsuccess'}">
    <script>
        window.onload = ()=>{
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-bottom-right",
                "preventDuplicates": false,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear"
                ,
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
            toastr["success"]("Sửa thông tin sách thành công", "Sửa thông tin sách")
        }
    </script>
    </c:if>

        <c:if test='${requestScope.message == "loginSuccess"}'>
        <script>
            window.onload = ()=>{
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass": "toast-bottom-right",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear"
                    ,
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr["success"]("Đăng nhập thành công", "Đăng nhập")
            }
        </script>
        </c:if>

        <c:if test="${requestScope.message == 'addCartSuccess'}">
        <script>
            window.onload = ()=>{
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass": "toast-bottom-right",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear"
                    ,
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr["success"]("Đã thêm vào giỏ hàng", "Giỏ hàng")
            }
        </script>
        </c:if>

        <c:if test="${requestScope.message == 'addCartFail'}">
        <script>
            window.onload = ()=>{
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass": "toast-bottom-right",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr["error"]("Không thể thêm vào giò hàng", "Số lượng không có sẵn")
            }
        </script>
        </c:if>
    <%-- End Toast thông báo xoá thành công           --%>

    <%-- Bảng danh sách light novel       --%>
    <div class="row">
        <div class="col-12 col-lg-12">
            <div class="card">
                <div class="book-bg1">

                    <c:forEach items="${requestScope['books']}" var="b">

                        <div class="book-bg2">
                            <div class="book-img">
                                <a href="/books?action=view&id=${b.getId()}">
                                    <img class="book-img" src="/images/${b.getImage()}">
                                </a>
                            </div>
                            <div class="book-text">
                                <div class="book-name">
                                    ${b.getName()}
                                </div>
                                <div class="book-price">
                                    <fmt:formatNumber type="number" maxFractionDigits = "3" value="${b.getPrice()}" /> đ
                                </div>
                                <div class="book-avaiable-quantity">
                                    <div class="book-avaiable">
                                        ${b.getAvaiable()}
                                    </div>
                                    <div class="book-type">
                                        <c:forEach var="bType" items="${requestScope.bookTypes}">
                                            <c:if test="${bType.getId()==b.getIdBookType()}">
                                                ${bType.getName()}
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <div class="book-quantity">
                                        <a href="/cart?action=add&id=${b.getId()}">
                                            <i class="fa-regular fa-square-plus"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <%-- End Bảng danh sách khách hàng       --%>

    <!--End Dashboard Content-->

    <jsp:include page="/WEB-INF/dashboard/layout/js_footer.jsp">
        <jsp:param name="page" value="customer"/>
    </jsp:include>

    <%-- My script--%>

</body>
</html>
