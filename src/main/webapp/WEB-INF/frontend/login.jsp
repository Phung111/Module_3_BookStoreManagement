<%@ page import="model.Book" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/dashboard/layout/meta_head.jsp"></jsp:include>
</head>

<body class="bg-theme bg-theme1">

<!-- start loader -->
<div id="pageloader-overlay" class="visible incoming"><div class="loader-wrapper-outer"><div class="loader-wrapper-inner" ><div class="loader"></div></div></div></div>
<!-- end loader -->

<!-- Start wrapper-->
<div id="wrapper">

    <div class="loader-wrapper"><div class="lds-ring"><div></div><div></div><div></div><div></div></div></div>
    <div class="card card-authentication1 mx-auto my-5">
        <div class="card-body">
            <div class="card-content p-2">
                <div class="text-center">
                    <img src="assets/images/pngegg.png" alt="logo icon" style="width: 75px">
                </div>
                <div class="card-title text-uppercase text-center py-3">Sign In</div>
                <form method="post" action="login?action=login">
                    <div class="form-group">
                        <label for="exampleInputUsername" class="sr-only">Email</label>
                        <div class="position-relative has-icon-right">
                            <input name="email" type="text" id="exampleInputUsername" class="form-control input-shadow" placeholder="Enter Email" value="${requestScope.customer.getEmail()}">
                            <div class="form-control-position">
                                <i class="icon-user"></i>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword" class="sr-only">Password</label>
                        <div class="position-relative has-icon-right">
                            <input name="password" type="password" id="exampleInputPassword" class="form-control input-shadow" placeholder="Enter Password" value="${requestScope.customer.getPassword()}">
                            <div class="form-control-position">
                                <i class="icon-lock"></i>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-6">
                            <div class="icheck-material-white">
                                <input type="checkbox" id="user-checkbox" checked="" />
                                <label for="user-checkbox">Remember me</label>
                            </div>
                        </div>
                        <div class="form-group col-6 text-right">
                            <a href="/login?action=resetpassword">Reset Password</a>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-light btn-block">Sign In</button>
                </form>
            </div>
        </div>
        <div class="card-footer text-center py-3">
            <p class="text-warning mb-0">Do not have an account? <a href="/login?action=register"> Sign Up here</a></p>
        </div>
    </div>
    <div class="loader-wrapper" style=" padding: 10px 300px;">
        <%--Thông báo lỗi khi nhập--%>
        <c:if test="${requestScope.errors!=null && requestScope.errors.size()!=0}">
            <div class="alert alert-danger" style="height: auto; width: 100%;padding: 25px 10px;bottom: 40px;top: 5px; background-color: rgb(241,155,155);color: #933a3f">
                <ul>
                    <c:forEach var="e" items="${requestScope.errors}">
                        <li>${e}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        <%--End Thông báo lỗi khi nhập--%>
    </div>


</div><!--wrapper-->

<!-- Bootstrap core JavaScript-->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/popper.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>

<!-- simplebar js -->
<script src="/assets/plugins/simplebar/js/simplebar.js"></script>
<!-- sidebar-menu js -->
<script src="/assets/js/sidebar-menu.js"></script>
<!-- loader scripts -->
<script src="/assets/js/jquery.loading-indicator.js"></script>
<!-- Custom scripts -->
<script src="/assets/js/app-script.js"></script>
<!-- Chart js -->

<script src="/assets/plugins/Chart.js/Chart.min.js"></script>

<!-- Index js -->
<script src="/assets/js/index.js"></script>
<%--Scripte toast thêm thành công--%>
<script src="/assets\libs\toastr\toastr.min.js"></script>
<script src="/assets\libs\toastr\toastr.init.js"></script>


</body>
</html>

